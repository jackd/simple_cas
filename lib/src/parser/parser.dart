library cas.parser;

import 'dart:collection' show UnmodifiableMapView;

import 'package:built_collection/built_collection.dart';

import 'package:antlr4dart/antlr4dart.dart';
import 'package:simple_cas/base.dart';

import 'antlr4/antlr.dart';
export 'antlr4/antlr.dart';

Num _simplifiedNegative(Num real) {
  if (real is Int) {
    return new Int(-(real.value));
  } else if (real is Float) {
    return new Float(-real.value);
  } else {
    throw new StateError('Real type not recognized.');
  }
}

class CasExpressionVisitor extends CasBaseVisitor<Scalar> {
  CasExpressionVisitor._create(this._assignments, this.assignments);
  factory CasExpressionVisitor() {
    var _assignments = <ScalarSymbol, Scalar>{};
    return CasExpressionVisitor._create(
        _assignments, UnmodifiableMapView(_assignments));
  }

  @override
  Scalar visitBracketedScalar(BracketedScalarContext context) {
    return context.getScalar().accept(this);
  }

  @override
  Float visitFloatLiteral(FloatLiteralContext context) {
    return new Float(double.parse(context.text));
  }

  @override
  Int visitIntLiteral(IntLiteralContext context) {
    return new Int(int.parse(context.text));
  }

  @override
  Scalar visitMulOp(MulOpContext context) =>
      throw StateError('Cannot visit mulOp directly');

  @override
  Scalar visitScalarProduct(ScalarProductContext context) {
    var ops = <Scalar>[];
    var opContexts = context.getScalars();
    var ca = opContexts[0];
    Scalar a = ca.accept(this);
    Scalar b = opContexts[1].accept(this);
    if (context.getMulOp().text == '/') {
      return a / b;
    } else {
      if (ca is ScalarProductContext ||
          ca is ScalarUnaryPlusMinusContext && a is Product) {
        ops.addAll((a as Product).args);
      } else {
        ops.add(a);
      }
      ops.add(b);
      return product(ops);
    }
  }

  @override
  Sum visitScalarSum(ScalarSumContext context) {
    var ops = <Scalar>[];
    var opContexts = context.getScalars();
    var ca = opContexts[0];
    Scalar a = ca.accept(this);
    if (ca is ScalarSumContext) {
      ops.addAll((a as Sum).args);
    } else {
      ops.add(a);
    }
    Scalar b = opContexts[1].accept(this);
    if (context.getSumOp().text == '-') {
      if (opContexts[1] is BracketedScalarContext) {
        b = -b;
      } else if (b is Num) {
        b = _simplifiedNegative(b);
      } else if (b is Product) {
        var ops = (b as Product).args.toList();
        var op0 = ops[0];
        if (op0 is Num) {
          ops[0] = _simplifiedNegative(op0);
        } else {
          ops.insert(0, negativeOne);
        }
        b = product(ops);
      } else {
        b = -b;
      }
      // } else if ((b is Product || b is ScalarQuotient) && b.operands[0] is Real) {
      //   var ops = b.operands.toList();
      //   Real op0 = ops[0];
      //   if (op0 is Fraction) {
      //     ops[0] = new Fraction(new Int(-(op0.numerator.value)), op0.denominator);
      //   } else {
      //     ops[0] = new Real(-((ops[0] as Real).value));
      //   }
      //   if (b is ScalarProduct) {
      //     b = product(ops);
      //   } else {
      //     b = ops[0] / ops[1];
      //   }
      // } else {
      //   b = -b;
      // }
    }
    ops.add(b);
    return sum(ops);
  }

  @override
  Scalar visitScalarUnaryPlusMinus(ScalarUnaryPlusMinusContext context) {
    var scalarContext = context.getScalar();
    Scalar s = scalarContext.accept(this);
    if (scalarContext is! BracketedScalarContext && s is Num) {
      return _simplifiedNegative(s);
    } else {
      return -s;
    }
  }

  @override
  ScalarSymbol visitSymbolLiteral(SymbolLiteralContext context) {
    return new ScalarSymbol(context.text);
  }

  @override
  AnonymousScalarFunction visitFunctionAssignment(
      FunctionAssignmentContext context) {
    var ids = context.getIDs().map((i) => i.text);
    var iter = ids.iterator;
    iter.moveNext();
    var symbol = ScalarSymbol(iter.current);
    var args = ListBuilder<Scalar>();
    while (iter.moveNext()) {
      args.add(ScalarSymbol(iter.current));
    }
    var definition = context.getScalar().accept(this) as Scalar;
    var fn = AnonymousScalarFunction(args.build(), definition);
    assign(symbol, fn);
    return fn;
  }

  final Map<ScalarSymbol, Scalar> _assignments;
  final UnmodifiableMapView<ScalarSymbol, Scalar> assignments;

  void assign(ScalarSymbol symbol, Scalar definition) {
    _assignments[symbol] = definition;
  }

  @override
  Scalar visitScalarAssignment(ScalarAssignmentContext context) {
    var lhs = ScalarSymbol(context.getID().text);
    var rhs = context.getScalar().accept(this);
    assign(lhs, rhs);
    return rhs;
  }

  @override
  ScalarFunctionCall visitFunctionCall(FunctionCallContext context) {
    var symbol = ScalarSymbol(context.getID().text);
    var scalars = context.getScalars().map((s) => s.accept(this));
    return ScalarFunctionCall(symbol, BuiltList(scalars));
  }
}

CasParser _getParser(String input) {
  var source = new StringSource(input);
  var lexer = new CasLexer(source);
  var tokens = new CommonTokenSource(lexer);
  return new CasParser(tokens);
}

ScalarContext getScalarContext(String input) => _getParser(input).scalar();

Scalar contextToScalar(ScalarContext context, [CasExpressionVisitor visitor]) =>
    context.accept(visitor ?? CasExpressionVisitor());

Scalar stringToScalar(String input) => contextToScalar(getScalarContext(input));
