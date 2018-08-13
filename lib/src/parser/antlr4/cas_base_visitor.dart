// Generated from Cas.g4 by antlr4dart

part of cas.parser.antlr;


/// This class provides an empty implementation of [CasVisitor],
/// which can be extended to create a visitor which only needs to handle 
/// a subset of the available methods.
///
/// [T] is the return type of the visit operation. Use `void` for
/// operations with no return type.
class CasBaseVisitor<T> extends ParseTreeVisitor<T> implements CasVisitor<T> {
  /// The default implementation returns the result of calling
  /// [visitChildren] on [context].
  T visitSymbolLiteral(SymbolLiteralContext context) => visitChildren(context);

  /// The default implementation returns the result of calling
  /// [visitChildren] on [context].
  T visitScalarUnaryPlusMinus(ScalarUnaryPlusMinusContext context) => visitChildren(context);

  /// The default implementation returns the result of calling
  /// [visitChildren] on [context].
  T visitBracketedScalar(BracketedScalarContext context) => visitChildren(context);

  /// The default implementation returns the result of calling
  /// [visitChildren] on [context].
  T visitSumOp(SumOpContext context) => visitChildren(context);

  /// The default implementation returns the result of calling
  /// [visitChildren] on [context].
  T visitIntLiteral(IntLiteralContext context) => visitChildren(context);

  /// The default implementation returns the result of calling
  /// [visitChildren] on [context].
  T visitScalarPower(ScalarPowerContext context) => visitChildren(context);

  /// The default implementation returns the result of calling
  /// [visitChildren] on [context].
  T visitFunctionAssignment(FunctionAssignmentContext context) => visitChildren(context);

  /// The default implementation returns the result of calling
  /// [visitChildren] on [context].
  T visitScalarAssignment(ScalarAssignmentContext context) => visitChildren(context);

  /// The default implementation returns the result of calling
  /// [visitChildren] on [context].
  T visitScalarProduct(ScalarProductContext context) => visitChildren(context);

  /// The default implementation returns the result of calling
  /// [visitChildren] on [context].
  T visitMulOp(MulOpContext context) => visitChildren(context);

  /// The default implementation returns the result of calling
  /// [visitChildren] on [context].
  T visitFunctionCall(FunctionCallContext context) => visitChildren(context);

  /// The default implementation returns the result of calling
  /// [visitChildren] on [context].
  T visitFloatLiteral(FloatLiteralContext context) => visitChildren(context);

  /// The default implementation returns the result of calling
  /// [visitChildren] on [context].
  T visitScalarSum(ScalarSumContext context) => visitChildren(context);
}