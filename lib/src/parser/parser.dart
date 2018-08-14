part of simple_cas.petit_parser;

class SimpleCasParser extends GrammarParser {
  SimpleCasParser() : super(const SimpleCasParserDefinition());
}

class Assignment {
  final ScalarSymbol lhs;
  final Scalar rhs;

  const Assignment(this.lhs, this.rhs);

  bool operator ==(Object other) =>
      other is Assignment && other.lhs == lhs && other.rhs == rhs;

  int get hashCode => hash2(lhs, rhs);
  String toString() => '$lhs = $rhs';
}

class SimpleCasParserDefinition extends SimpleCasGrammarDefinition {
  const SimpleCasParserDefinition();
  @override
  Parser<Scalar> additiveExpression() =>
      super.additiveExpression().map<Scalar>((x) {
        var left = x[0];
        var others = x[1];
        if (others.isEmpty) {
          return left;
        } else {
          var args = ListBuilder<Scalar>()..add(left);
          for (var other in others) {
            var op = other[0];
            var operand = other[1];
            if (op == '-') {
              operand = -operand;
            }
            args.add(operand);
          }
          return sum(args.build());
        }
      });

  @override
  Parser<Float> floatLiteral() => super
      .floatLiteral()
      .flatten()
      .map<Float>((value) => Float(double.parse(value)));

  @override
  Parser<Int> intLiteral() =>
      super.intLiteral().flatten().map<Int>((value) => Int(int.parse(value)));

  @override
  Parser<Scalar> multiplicativeExpression() =>
      super.multiplicativeExpression().map<Scalar>((x) {
        var left = x[0];
        var others = x[1];
        if (others.isEmpty) {
          return left;
        } else {
          var args = ListBuilder<Scalar>()..add(left);
          for (var other in others) {
            var op = other[0];
            var operand = other[1];
            if (op == '/') {
              operand = operand.pow(negativeOne);
            }
            args.add(operand);
          }
          return product(args.build());
        }
      });

  @override
  Parser<Scalar> parenExpression() =>
      super.parenExpression().map<Scalar>((x) => x[1] as Scalar);

  @override
  Parser<ScalarSymbol> symbolLiteral() =>
      super.symbolLiteral().map<ScalarSymbol>((value) => ScalarSymbol(value));

  Parser<ScalarFunctionCall> functionCall() =>
      super.functionCall().map<ScalarFunctionCall>(
          (x) => ScalarFunctionCall(ScalarSymbol(x[0]), x[2]));

  @override
  Parser<Scalar> unaryPrimary() => super.unaryPrimary().map<Scalar>((x) {
        var val = x[1];
        if (x[0] == null) {
          return val;
        } else {
          if (val is Num) {
            return Num(-(val.value));
          } else {
            return -val;
          }
        }
      });

  @override
  Parser<Scalar> powerExpression() => super.powerExpression().map((x) {
        var out = x[1].pow(x[3]);
        if (x[0] != null) {
          out = -out;
        }
        return out;
      });

  @override
  Parser<Assignment> assignment() =>
      super.assignment().map<Assignment>((x) => x);

  @override
  Parser<Assignment> scalarAssignment() =>
      super.scalarAssignment().map((x) => Assignment(ScalarSymbol(x[0]), x[2]));

  @override
  Parser<Assignment> functionAssignment() {
    // id & leftParen & symbolList & rightParen & assignOp & expression
    return super.functionAssignment().map<Assignment>((x) {
      var lhs = ScalarSymbol(x[0]);
      var ops = x[2] as BuiltList<ScalarSymbol>;
      var exp = x[5];
      var rhs = AnonymousScalarFunction(ops, exp);
      return Assignment(lhs, rhs);
    });
  }

  Parser<BuiltList<Scalar>> argList() {
    return super.argList().map<BuiltList<Scalar>>((x) {
      var builder = ListBuilder<Scalar>()
        ..add(x[0])
        ..addAll(x[1].map<Scalar>((xi) => xi[1] as Scalar));
      return builder.build();
    });
  }

  @override
  Parser<BuiltList<ScalarSymbol>> symbolList() {
    // id() & (comma() & id()).star() & comma().optional();
    return super.symbolList().map<BuiltList<ScalarSymbol>>((x) {
      var builder = ListBuilder<ScalarSymbol>()
        ..add(ScalarSymbol(x[0]))
        ..addAll(x[1].map<ScalarSymbol>((xi) => ScalarSymbol(xi[1])));
      return builder.build();
    });
  }
}
