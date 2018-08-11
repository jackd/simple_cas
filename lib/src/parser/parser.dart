library cas.parser;

// import 'package:built_collection/built_collection.dart';
import 'package:antlr4dart/antlr4dart.dart';
import 'package:simple_cas/base.dart';
// import 'package:cas/range.dart';
import 'antlr4/antlr.dart';

export 'antlr4/antlr.dart';

// part 'tree_node.dart';
// part 'text.dart';

Num _simplifiedNegative(Num real) {
  if (real is Int) {
    return new Int(-(real.value));
  } else if (real is Float) {
    return new Float(-real.value);
  } else {
    throw new StateError('Real type not recognized.');
  }
}

abstract class ScalarFunction implements Scalar {
  Scalar callWithArgs(List<Scalar> args,
      [Map<String, Scalar> kwargs = const {}]);
}

class CasExpressionVisitor extends CasBaseVisitor<Expression> {
  final Map<String, ScalarFunction> functionMap = Map<String, ScalarFunction>();

  @override
  Scalar visitBracketedScalar(BracketedScalarContext context) {
    return visit(context.getScalar());
  }

  @override
  Condition visitCondition(ConditionContext context) {
    throw new UnimplementedError();
  }

  @override
  Float visitFloatLiteral(FloatLiteralContext context) {
    return new Float(double.parse(context.text));
  }

  @override
  Expression visitFunctionId(FunctionIdContext context) {
    throw new UnimplementedError();
  }

  @override
  Expression visitIntLiteral(IntLiteralContext context) {
    return new Int(int.parse(context.text));
  }

  @override
  Expression visitMulOp(MulOpContext context) {
    throw new UnimplementedError();
  }

  @override
  Expression visitScalarFunction(ScalarFunctionContext context) {
    var fName = context.getFunctionId().text;
    var args = context.getScalars().map((c) => visit(c)).toList();
    return functionMap[fName].callWithArgs(args);
  }

  @override
  Expression visitScalarPower(ScalarPowerContext context) {
    var scalars = context.getScalars();
    return (visit(scalars[0]) as Scalar).pow(visit(scalars[1]) as Scalar);
  }

  @override
  Scalar visitScalarProduct(ScalarProductContext context) {
    var ops = <Scalar>[];
    var opContexts = context.getScalars();
    var ca = opContexts[0];
    Scalar a = visit(ca);
    Scalar b = visit(opContexts[1]);
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
    Scalar a = visit(ca);
    if (ca is ScalarSumContext) {
      ops.addAll((a as Sum).args);
    } else {
      ops.add(a);
    }
    Scalar b = visit(opContexts[1]);
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
    Scalar s = visit(scalarContext);
    if (scalarContext is! BracketedScalarContext && s is Num) {
      return _simplifiedNegative(s);
    } else {
      return -s;
    }
  }

  @override
  Expression visitSumOp(SumOpContext context) {
    throw new StateError('Cannot visit SumOpContext');
  }

  @override
  ScalarSymbol visitSymbolLiteral(SymbolLiteralContext context) {
    return new ScalarSymbol(context.text);
  }
}

CasParser _getParser(String input) {
  var source = new StringSource(input);
  var lexer = new CasLexer(source);
  var tokens = new CommonTokenSource(lexer);
  return new CasParser(tokens);
}

ScalarContext stringToContext(String input) => _getParser(input).scalar();

Scalar contextToScalar(ScalarContext context, [CasExpressionVisitor visitor]) {
  visitor = visitor ?? new CasExpressionVisitor();
  return visitor.visit(context) as Scalar;
  // var walker = new ParseTreeWalker();
  // var listener = new TreeToExpressionListener();
  // walker.walk(listener, context);
  // return listener._scalars[context];
}

Scalar stringToScalar(String input) => contextToScalar(stringToContext(input));
