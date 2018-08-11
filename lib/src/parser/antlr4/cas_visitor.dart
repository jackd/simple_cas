// Generated from Cas.g4 by antlr4dart

part of cas.parser.antlr;

/// This abstract class defines a complete generic visitor for a parse tree
/// produced by [CasParser].
///
/// [T] is the eturn type of the visit operation. Use `void` for
/// operations with no return type.
abstract class CasVisitor<T> extends ParseTreeVisitor<T> {
  /// Visit a parse tree produced by [CasParser.symbolLiteral].
  /// [context] is the parse tree.
  /// Return the visitor result.
  T visitSymbolLiteral(SymbolLiteralContext context);

  /// Visit a parse tree produced by [CasParser.scalarUnaryPlusMinus].
  /// [context] is the parse tree.
  /// Return the visitor result.
  T visitScalarUnaryPlusMinus(ScalarUnaryPlusMinusContext context);

  /// Visit a parse tree produced by [CasParser.bracketedScalar].
  /// [context] is the parse tree.
  /// Return the visitor result.
  T visitBracketedScalar(BracketedScalarContext context);

  /// Visit a parse tree produced by [CasParser.sumOp].
  /// [context] is the parse tree.
  /// Return the visitor result.
  T visitSumOp(SumOpContext context);

  /// Visit a parse tree produced by [CasParser.intLiteral].
  /// [context] is the parse tree.
  /// Return the visitor result.
  T visitIntLiteral(IntLiteralContext context);

  /// Visit a parse tree produced by [CasParser.scalarPower].
  /// [context] is the parse tree.
  /// Return the visitor result.
  T visitScalarPower(ScalarPowerContext context);

  /// Visit a parse tree produced by [CasParser.scalarFunction].
  /// [context] is the parse tree.
  /// Return the visitor result.
  T visitScalarFunction(ScalarFunctionContext context);

  /// Visit a parse tree produced by [CasParser.scalarProduct].
  /// [context] is the parse tree.
  /// Return the visitor result.
  T visitScalarProduct(ScalarProductContext context);

  /// Visit a parse tree produced by [CasParser.condition].
  /// [context] is the parse tree.
  /// Return the visitor result.
  T visitCondition(ConditionContext context);

  /// Visit a parse tree produced by [CasParser.functionId].
  /// [context] is the parse tree.
  /// Return the visitor result.
  T visitFunctionId(FunctionIdContext context);

  /// Visit a parse tree produced by [CasParser.mulOp].
  /// [context] is the parse tree.
  /// Return the visitor result.
  T visitMulOp(MulOpContext context);

  /// Visit a parse tree produced by [CasParser.floatLiteral].
  /// [context] is the parse tree.
  /// Return the visitor result.
  T visitFloatLiteral(FloatLiteralContext context);

  /// Visit a parse tree produced by [CasParser.scalarSum].
  /// [context] is the parse tree.
  /// Return the visitor result.
  T visitScalarSum(ScalarSumContext context);
}
