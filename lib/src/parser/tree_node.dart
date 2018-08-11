// part of cas.parser;
//
// class _ContainingExpressionVisitor extends CasBaseVisitor<ScalarContext> {
// // class Ab extends ParseTreeVisitor<ScalarContext> implements CasVisitor<ScalarContext> {
//   @override
//   ScalarContext visitBracketedScalar(BracketedScalarContext context) => context;
//
//   @override
//   ScalarContext visitCondition(ConditionContext context) {
//     throw new UnimplementedError();
//   }
//
//   @override
//   ScalarContext visitFloatLiteral(FloatLiteralContext context) =>
//       context.parent is ScalarUnaryPlusMinusContext ? context.parent : context;
//
//   @override
//   ScalarContext visitFunctionId(FunctionIdContext context) => context.parent;
//
//   @override
//   ScalarContext visitIntLiteral(IntLiteralContext context) =>
//       context.parent is ScalarUnaryPlusMinusContext ? context.parent : context;
//
//   @override
//   ScalarContext visitMulOp(MulOpContext context) => visit(context.parent);
//
//   @override
//   ScalarContext visitScalarFunction(ScalarFunctionContext context) => context;
//
//   @override
//   ScalarContext visitScalarPower(ScalarPowerContext context) => context;
//
//   @override
//   ScalarContext visitScalarProduct(ScalarProductContext context) {
//     var parent = context.parent;
//     if (parent is ScalarProductContext) {
//       var op = context.getMulOp().text;
//       if (op == '*' && op == parent.getMulOp().text) {
//         return visit(context.parent);
//       }
//     }
//     return context;
//   }
//
//   @override
//   ScalarContext visitScalarSum(ScalarSumContext context) =>
//       context.parent is ScalarSumContext ? visit(context.parent) : context;
//
//   @override
//   ScalarContext visitScalarUnaryPlusMinus(
//           ScalarUnaryPlusMinusContext context) =>
//       context;
//
//   @override
//   ScalarContext visitSumOp(SumOpContext context) => visit(context.parent);
//
//   @override
//   ScalarContext visitSymbolLiteral(SymbolLiteralContext context) => context;
// }
//
// // final _containingExpressionVisitor = new _ContainingExpressionVisitor();
//
// // ScalarContext scalarContext(ParseTree tree) => _containingExpressionVisitor
// //     .visit(tree is TerminalNode ? tree.parent : tree);
//
// // bool shouldIgnoreBracketsInExponent(BracketedScalarContext context) {
// //   var subcontext = context.getScalar();
// //   return subcontext is ScalarSumContext ||
// //       subcontext is ScalarProductContext ||
// //       subcontext is ScalarUnaryPlusMinusContext;
// // }
//
// // bool shouldFlattenProduct(ScalarProductContext context) =>
// //     context.getMulOp().text == '*';
//
// class _ExpressionChildrenVisitor extends CasBaseVisitor<List<ScalarContext>> {
//   @override
//   List<ScalarContext> visitBracketedScalar(BracketedScalarContext context) =>
//       visit(context.getScalar());
//
//   @override
//   List<ScalarContext> visitCondition(ConditionContext context) =>
//       context.getScalars();
//
//   @override
//   List<ScalarContext> visitFloatLiteral(FloatLiteralContext context) =>
//       <ScalarContext>[];
//
//   @override
//   List<ScalarContext> visitFunctionId(FunctionIdContext context) {
//     throw new StateError('Cannot visit FunctionIdContext');
//   }
//
//   @override
//   List<ScalarContext> visitIntLiteral(IntLiteralContext context) =>
//       <ScalarContext>[];
//
//   @override
//   List<ScalarContext> visitMulOp(MulOpContext context) {
//     throw new StateError('Cannot visit FunctionIdContext');
//   }
//
//   @override
//   List<ScalarContext> visitScalarFunction(ScalarFunctionContext context) =>
//       context.getScalars();
//
//   @override
//   List<ScalarContext> visitScalarPower(ScalarPowerContext context) {
//     var contexts = context.getScalars();
//     var expContext = contexts[1];
//     if (expContext is BracketedScalarContext) {
//       contexts[1] = expContext.getScalar();
//     }
//     return contexts;
//   }
//
//   @override
//   List<ScalarContext> visitScalarProduct(ScalarProductContext context) {
//     var contexts = context.getScalars();
//     var leftContext = contexts[0];
//     var op = context.getMulOp().text;
//     if (leftContext is ScalarProductContext &&
//         op == '*' &&
//         leftContext.getMulOp().text == '*') {
//       return visitScalarProduct(leftContext)..add(contexts[1]);
//     } else {
//       return contexts;
//     }
//   }
//
//   @override
//   List<ScalarContext> visitScalarSum(ScalarSumContext context) {
//     var contexts = context.getScalars();
//     var leftContext = contexts[0];
//     if (leftContext is ScalarSumContext) {
//       return visitScalarSum(leftContext)..add(contexts[1]);
//     } else {
//       return contexts;
//     }
//   }
//
//   @override
//   List<ScalarContext> visitScalarUnaryPlusMinus(
//           ScalarUnaryPlusMinusContext context) =>
//       <ScalarContext>[context.getScalar()];
//
//   @override
//   List<ScalarContext> visitSumOp(SumOpContext context) {
//     throw new StateError('Cannot visit FunctionIdContext');
//   }
//
//   @override
//   List<ScalarContext> visitSymbolLiteral(SymbolLiteralContext context) =>
//       <ScalarContext>[];
// }
//
// final _expressionChildrenVisitor = new _ExpressionChildrenVisitor();
//
// // Range tokenRange(ParserRuleContext context) =>
// //     new Range(context.start.tokenIndex, context.stop.tokenIndex + 1);
//
// void _addOperands(
//     ScalarContext parent,
//     MapBuilder<ScalarContext, TreeNode> nodes,
//     MapBuilder<TreeNode, ScalarContext> contexts) {
//   var children = contextOperands(parent);
//   var parentNode = nodes[parent];
//   var n = children.length;
//   for (var i = 0; i < n; ++i) {
//     var child = children[i];
//     var node = parentNode.child(i);
//     nodes[child] = node;
//     contexts[node] = child;
//     _addOperands(child, nodes, contexts);
//   }
// }
//
// class ContextNodeTranslator {
//   final BuiltMap<TreeNode, ScalarContext> contexts;
//   final BuiltMap<ScalarContext, TreeNode> nodes;
//
//   ContextNodeTranslator.built(this.contexts, this.nodes);
//
//   factory ContextNodeTranslator(ScalarContext rootContext) {
//     var nodes = new MapBuilder<ScalarContext, TreeNode>();
//     var contexts = new MapBuilder<TreeNode, ScalarContext>();
//     nodes[rootContext] = TreeNode.root;
//     contexts[TreeNode.root] = rootContext;
//     _addOperands(rootContext, nodes, contexts);
//     return new ContextNodeTranslator.built(contexts.build(), nodes.build());
//   }
//
//   ScalarContext closestScalarContext(ParseTree tree) {
//     return lineage(tree).firstWhere(nodes.keys.contains);
//   }
// }
//
// List<ScalarContext> contextOperands(ParserRuleContext parentContext) =>
//     _expressionChildrenVisitor.visit(parentContext);
//
// ParserRuleContext contextOperand(
//         ParserRuleContext parentContext, int operandIndex) =>
//     contextOperands(parentContext)[operandIndex];
//
// // TODO: Make NodeContextTranslator
