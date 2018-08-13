part of simple_cas.petit_parser;

class SimpleCasGrammar extends GrammarParser {
  SimpleCasGrammar() : super(const SimpleCasGrammarDefinition());
}

class SimpleCasGrammarDefinition extends GrammarDefinition {
  const SimpleCasGrammarDefinition();

  Parser token(input) {
    if (input is String) {
      input = input.length == 1 ? char(input) : string(input);
    } else if (input is Function) {
      input = ref(input);
    }
    if (input is! Parser || input is TrimmingParser || input is TokenParser) {
      throw ArgumentError('Invalid token parser: $input');
    }
    return input.token().trim(ref(hidden));
  }

  hidden() => whitespace();

  @override
  Parser start() => (expression() | assignment()).trim().end();

  Parser powOp() => char('^').trim();
  Parser mulOp() => pattern('*/').trim();
  Parser unaryNegative() => char('-');
  Parser sumOp() => pattern('+-').trim();
  Parser leftParen() => char('(').trim();
  Parser rightParen() => char(')').trim();
  Parser id() => (letter() & word().star()).trim();
  Parser assignOp() => char('=').trim();

  Parser intLiteral() => unaryNegative().optional() & digit().plus();
  Parser floatLiteral() =>
      unaryNegative().optional() &
      digit().optional() &
      char('.') &
      digit().plus() &
      exponent().optional();

  Parser exponent() =>
      pattern('eE') & pattern('+-').optional() & digit().plus();

  Parser parenExpression() => leftParen() & ref(expression) & rightParen();

  Parser assignment() => id() & assignOp() & ref(expression);

  Parser expression() => additiveExpression();

  Parser additiveExpression() =>
      ref(multiplicativeExpression) &
      (sumOp() & ref(multiplicativeExpression)).star();

  Parser multiplicativeExpression() =>
      ref(unaryExpression) & (mulOp() & ref(unaryExpression)).star();

  Parser unaryExpression() =>
      ref(powerExpression) | unaryNegative() & ref(powerExpression);

  Parser powerExpression() =>
      ref(primary) & (powOp() & ref(powerExpression)).star();

  Parser primary() => ref(parenExpression) | ref(literal);

  Parser symbolLiteral() => ref(id);

  Parser literal() => floatLiteral() | intLiteral() | symbolLiteral();
}
