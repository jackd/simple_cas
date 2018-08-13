part of simple_cas.petit_parser;

class SimpleCasParser extends GrammarParser {
  SimpleCasParser() : super(const SimpleCasParserDefinition());
}

class SimpleCasParserDefinition extends SimpleCasGrammarDefinition {
  const SimpleCasParserDefinition();
  @override
  Parser additiveExpression() => super.additiveExpression().map<Scalar>((x) {
        var left = x[0];
        var others = x[1];
        if (others.isEmpty) {
          return left;
        } else {
          var args = <Scalar>[left];
          for (var other in others) {
            var op = other[0];
            var operand = other[1];
            if (op == '-') {
              operand = -operand;
            }
            args.add(operand);
          }
          return sum(args);
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
  Parser multiplicativeExpression() =>
      super.multiplicativeExpression().map<Scalar>((x) {
        var left = x[0];
        var others = x[1];
        if (others.isEmpty) {
          return left;
        } else {
          var args = <Scalar>[left];
          for (var other in others) {
            var op = other[0];
            var operand = other[1];
            if (op == '/') {
              operand = operand.pow(negativeOne);
            }
            args.add(operand);
          }
          return product(args);
        }
      });

  @override
  Parser<Scalar> parenExpression() =>
      super.parenExpression().map<Scalar>((x) => x[1] as Scalar);

  @override
  Parser<String> id() => super.id().flatten();

  @override
  Parser<ScalarSymbol> symbolLiteral() =>
      super.symbolLiteral().map<ScalarSymbol>((value) {
        // trimRight necessary - trim().flatten() bug?
        return ScalarSymbol(value.trimRight());
      });

  //
  @override
  Parser powerExpression() => super.powerExpression().map((x) {
        var base = x[0];
        var exp = x[1];
        if (exp.isEmpty) {
          return base;
        } else {
          return base.pow(exp);
        }
      });
}
