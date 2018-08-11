// Generated from Cas.g4 by antlr4dart

part of cas.parser.antlr;

/// This abstract class defines a complete listener for a parse tree produced by
/// [CasParser].
abstract class CasListener extends ParseTreeListener {
  /// Enter a parse tree produced by [CasParser.symbolLiteral].
  /// [context] is the parse tree.
  void enterSymbolLiteral(SymbolLiteralContext context);

  /// Exit a parse tree produced by [CasParser.symbolLiteral].
  /// [context] is the parse tree.
  void exitSymbolLiteral(SymbolLiteralContext context);

  /// Enter a parse tree produced by [CasParser.scalarUnaryPlusMinus].
  /// [context] is the parse tree.
  void enterScalarUnaryPlusMinus(ScalarUnaryPlusMinusContext context);

  /// Exit a parse tree produced by [CasParser.scalarUnaryPlusMinus].
  /// [context] is the parse tree.
  void exitScalarUnaryPlusMinus(ScalarUnaryPlusMinusContext context);

  /// Enter a parse tree produced by [CasParser.bracketedScalar].
  /// [context] is the parse tree.
  void enterBracketedScalar(BracketedScalarContext context);

  /// Exit a parse tree produced by [CasParser.bracketedScalar].
  /// [context] is the parse tree.
  void exitBracketedScalar(BracketedScalarContext context);

  /// Enter a parse tree produced by [CasParser.sumOp].
  /// [context] is the parse tree.
  void enterSumOp(SumOpContext context);

  /// Exit a parse tree produced by [CasParser.sumOp].
  /// [context] is the parse tree.
  void exitSumOp(SumOpContext context);

  /// Enter a parse tree produced by [CasParser.intLiteral].
  /// [context] is the parse tree.
  void enterIntLiteral(IntLiteralContext context);

  /// Exit a parse tree produced by [CasParser.intLiteral].
  /// [context] is the parse tree.
  void exitIntLiteral(IntLiteralContext context);

  /// Enter a parse tree produced by [CasParser.scalarPower].
  /// [context] is the parse tree.
  void enterScalarPower(ScalarPowerContext context);

  /// Exit a parse tree produced by [CasParser.scalarPower].
  /// [context] is the parse tree.
  void exitScalarPower(ScalarPowerContext context);

  /// Enter a parse tree produced by [CasParser.scalarFunction].
  /// [context] is the parse tree.
  void enterScalarFunction(ScalarFunctionContext context);

  /// Exit a parse tree produced by [CasParser.scalarFunction].
  /// [context] is the parse tree.
  void exitScalarFunction(ScalarFunctionContext context);

  /// Enter a parse tree produced by [CasParser.scalarProduct].
  /// [context] is the parse tree.
  void enterScalarProduct(ScalarProductContext context);

  /// Exit a parse tree produced by [CasParser.scalarProduct].
  /// [context] is the parse tree.
  void exitScalarProduct(ScalarProductContext context);

  /// Enter a parse tree produced by [CasParser.condition].
  /// [context] is the parse tree.
  void enterCondition(ConditionContext context);

  /// Exit a parse tree produced by [CasParser.condition].
  /// [context] is the parse tree.
  void exitCondition(ConditionContext context);

  /// Enter a parse tree produced by [CasParser.functionId].
  /// [context] is the parse tree.
  void enterFunctionId(FunctionIdContext context);

  /// Exit a parse tree produced by [CasParser.functionId].
  /// [context] is the parse tree.
  void exitFunctionId(FunctionIdContext context);

  /// Enter a parse tree produced by [CasParser.mulOp].
  /// [context] is the parse tree.
  void enterMulOp(MulOpContext context);

  /// Exit a parse tree produced by [CasParser.mulOp].
  /// [context] is the parse tree.
  void exitMulOp(MulOpContext context);

  /// Enter a parse tree produced by [CasParser.floatLiteral].
  /// [context] is the parse tree.
  void enterFloatLiteral(FloatLiteralContext context);

  /// Exit a parse tree produced by [CasParser.floatLiteral].
  /// [context] is the parse tree.
  void exitFloatLiteral(FloatLiteralContext context);

  /// Enter a parse tree produced by [CasParser.scalarSum].
  /// [context] is the parse tree.
  void enterScalarSum(ScalarSumContext context);

  /// Exit a parse tree produced by [CasParser.scalarSum].
  /// [context] is the parse tree.
  void exitScalarSum(ScalarSumContext context);
}
