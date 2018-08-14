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

  // @override
  Parser start() => ref(statement).end();
  // Parser start() => ref(statement);
  Parser statement() => ref(assignment) | ref(expression);

  Parser powOp() => char('^').trim();
  Parser mulOp() => pattern('*/').trim();
  Parser unaryNegative() => char('-');
  Parser sumOp() => pattern('+-').trim();
  Parser leftParen() => char('(').trim();
  Parser rightParen() => char(')').trim();
  Parser<String> id() => (letter() & word().star()).flatten().trim();
  Parser assignOp() => char('=').trim();
  Parser comma() => char(',').trim();

  Parser assignment() => ref(scalarAssignment) | ref(functionAssignment);

  Parser scalarAssignment() => id() & assignOp() & ref(expression);

  Parser functionAssignment() =>
      id() &
      leftParen() &
      ref(symbolList) &
      rightParen() &
      assignOp() &
      ref(expression);

  Parser symbolList() => id() & (comma() & id()).star() & comma().optional();

  Parser argList() =>
      ref(expression) & (comma() & ref(expression)).star() & comma().optional();

  Parser expression() => additiveExpression();

  Parser additiveExpression() =>
      ref(multiplicativeExpression) &
      (sumOp() & ref(multiplicativeExpression)).star();

  Parser multiplicativeExpression() =>
      ref(unaryExpression) & (mulOp() & ref(unaryExpression)).star();

  Parser unaryExpression() => ref(powerExpression) | ref(unaryPrimary);

  Parser powerExpression() =>
      unaryNegative().optional() &
      ref(primary) &
      powOp() &
      (ref(powerExpression) | ref(unaryPrimary));

  Parser unaryPrimary() => unaryNegative().optional() & ref(primary);
  Parser primary() => ref(functionCall) | ref(literal) | ref(parenExpression);

  Parser functionCall() => id() & leftParen() & argList() & rightParen();
  Parser parenExpression() => leftParen() & ref(expression) & rightParen();
  Parser literal() => floatLiteral() | intLiteral() | symbolLiteral();

  Parser symbolLiteral() => ref(id);
  Parser intLiteral() => digit().plus();
  Parser floatLiteral() =>
      digit().optional() & char('.') & digit().plus() & exponent().optional();

  Parser exponent() =>
      pattern('eE') & pattern('+-').optional() & digit().plus();
}
