// Generated from Cas.g4 by antlr4dart

part of cas.parser.antlr;


class CasParser extends Parser {

  static const int EOF = Token.EOF;

  static const int RULE_SCALAR = 0, RULE_MULOP = 1, RULE_SUMOP = 2;

  static const int ID = 1, INT = 2, FLOAT = 3, NEWLINE = 4, WS = 5, MUL = 6, 
                   DIV = 7, ADD = 8, SUB = 9, POW = 10, PL = 11, PR = 12, 
                   ASSIGN = 13, COMMA = 14;

  static const String _serializedAtn =  "\x03\u0430\ud6d1\u8206\uad2d\u4417"
  	"\uaef1\u8d80\uaadd\x03\x10\x46\x04\x02\x09\x02\x04\x03\x09\x03\x04\x04"
  	"\x09\x04\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03"
  	"\x02\x03\x02\x07\x02\x12\x0a\x02\x0c\x02\x0e\x02\x15\x0b\x02\x03\x02"
  	"\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03"
  	"\x02\x03\x02\x03\x02\x03\x02\x07\x02\x24\x0a\x02\x0c\x02\x0e\x02\x27"
  	"\x0b\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x05"
  	"\x02\x30\x0a\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03\x02\x03"
  	"\x02\x03\x02\x03\x02\x03\x02\x03\x02\x07\x02\x3d\x0a\x02\x0c\x02\x0e"
  	"\x02\x40\x0b\x02\x03\x03\x03\x03\x03\x04\x03\x04\x03\x04\x02\x03\x02"
  	"\x05\x02\x04\x06\x02\x04\x03\x02\x08\x09\x03\x02\x0a\x0b\x4e\x02\x2f"
  	"\x03\x02\x02\x02\x04\x41\x03\x02\x02\x02\x06\x43\x03\x02\x02\x02\x08"
  	"\x09\x08\x02\x01\x02\x09\x0a\x05\x06\x04\x02\x0a\x0b\x05\x02\x02\x0c"
  	"\x0b\x30\x03\x02\x02\x02\x0c\x0d\x07\x03\x02\x02\x0d\x0e\x07\x0d\x02"
  	"\x02\x0e\x13\x07\x03\x02\x02\x0f\x10\x07\x10\x02\x02\x10\x12\x07\x03"
  	"\x02\x02\x11\x0f\x03\x02\x02\x02\x12\x15\x03\x02\x02\x02\x13\x11\x03"
  	"\x02\x02\x02\x13\x14\x03\x02\x02\x02\x14\x16\x03\x02\x02\x02\x15\x13"
  	"\x03\x02\x02\x02\x16\x17\x07\x0e\x02\x02\x17\x18\x07\x0f\x02\x02\x18"
  	"\x30\x05\x02\x02\x07\x19\x1a\x07\x03\x02\x02\x1a\x1b\x07\x0f\x02\x02"
  	"\x1b\x30\x05\x02\x02\x06\x1c\x30\x07\x05\x02\x02\x1d\x30\x07\x04\x02"
  	"\x02\x1e\x1f\x07\x03\x02\x02\x1f\x20\x07\x0d\x02\x02\x20\x25\x05\x02"
  	"\x02\x02\x21\x22\x07\x10\x02\x02\x22\x24\x05\x02\x02\x02\x23\x21\x03"
  	"\x02\x02\x02\x24\x27\x03\x02\x02\x02\x25\x23\x03\x02\x02\x02\x25\x26"
  	"\x03\x02\x02\x02\x26\x28\x03\x02\x02\x02\x27\x25\x03\x02\x02\x02\x28"
  	"\x29\x07\x0e\x02\x02\x29\x30\x03\x02\x02\x02\x2a\x30\x07\x03\x02\x02"
  	"\x2b\x2c\x07\x0d\x02\x02\x2c\x2d\x05\x02\x02\x02\x2d\x2e\x07\x0e\x02"
  	"\x02\x2e\x30\x03\x02\x02\x02\x2f\x08\x03\x02\x02\x02\x2f\x0c\x03\x02"
  	"\x02\x02\x2f\x19\x03\x02\x02\x02\x2f\x1c\x03\x02\x02\x02\x2f\x1d\x03"
  	"\x02\x02\x02\x2f\x1e\x03\x02\x02\x02\x2f\x2a\x03\x02\x02\x02\x2f\x2b"
  	"\x03\x02\x02\x02\x30\x3e\x03\x02\x02\x02\x31\x32\x0c\x0d\x02\x02\x32"
  	"\x33\x07\x0c\x02\x02\x33\x3d\x05\x02\x02\x0d\x34\x35\x0c\x0b\x02\x02"
  	"\x35\x36\x05\x04\x03\x02\x36\x37\x05\x02\x02\x0c\x37\x3d\x03\x02\x02"
  	"\x02\x38\x39\x0c\x0a\x02\x02\x39\x3a\x05\x06\x04\x02\x3a\x3b\x05\x02"
  	"\x02\x0b\x3b\x3d\x03\x02\x02\x02\x3c\x31\x03\x02\x02\x02\x3c\x34\x03"
  	"\x02\x02\x02\x3c\x38\x03\x02\x02\x02\x3d\x40\x03\x02\x02\x02\x3e\x3c"
  	"\x03\x02\x02\x02\x3e\x3f\x03\x02\x02\x02\x3f\x03\x03\x02\x02\x02\x40"
  	"\x3e\x03\x02\x02\x02\x41\x42\x09\x02\x02\x02\x42\x05\x03\x02\x02\x02"
  	"\x43\x44\x09\x03\x02\x02\x44\x07\x03\x02\x02\x02\x07\x13\x25\x2f\x3c"
  	"\x3e";

  final Atn atn = AtnSimulator.deserialize(_serializedAtn);

  final PredictionContextCache sharedContextCache = new PredictionContextCache();

  final List<String> tokenNames = [
    "<INVALID>", "ID", "INT", "FLOAT", "NEWLINE", "WS", "'*'", "'/'", "'+'", 
    "'-'", "'^'", "'('", "')'", "'='", "','"
  ];

  final List<String> ruleNames = [
    "scalar", "mulOp", "sumOp"
  ];
  CasParser(TokenSource input) : super(input) {
    var _decisionToDfa = new List<Dfa>(atn.numberOfDecisions);
    for (int i = 0; i < atn.numberOfDecisions; i++) {
      _decisionToDfa[i] = new Dfa(atn.getDecisionState(i), i);
    }
    interpreter = new ParserAtnSimulator(this, atn, _decisionToDfa, sharedContextCache);
  }

  String get serializedAtn => _serializedAtn;

  String get grammarFileName => "Cas.g4";
  ScalarContext scalar([int _p = 0]) {
    var _parentctx = context;
    int _parentState = state;
    var localContext = new ScalarContext(context, _parentState);
    var _prevctx = localContext;
    int _startState = 0;
    enterRecursionRule(localContext, 0, RULE_SCALAR, _p);
    int _la;
    try {
      int _alt;
      enterOuterAlt(localContext, 1);
      state = 45;
      switch (interpreter.adaptivePredict(inputSource, 2, context)) {
        case 1:
          localContext = new ScalarUnaryPlusMinusContext(localContext);
          context = localContext;
          _prevctx = localContext;

          state = 7; 
          sumOp();
          state = 8; 
          scalar(10);
          break;
        case 2:
          localContext = new FunctionAssignmentContext(localContext);
          context = localContext;
          _prevctx = localContext;
          state = 10; 
          match(ID);
          state = 11; 
          match(PL);
          state = 12; 
          match(ID);
          state = 17;
          errorHandler.sync(this);
          _la = inputSource.lookAhead(1);
          while (_la == COMMA) {
            state = 13; 
            match(COMMA);
            state = 14; 
            match(ID);
            state = 19;
            errorHandler.sync(this);
            _la = inputSource.lookAhead(1);
          }
          state = 20; 
          match(PR);
          state = 21; 
          match(ASSIGN);
          state = 22; 
          scalar(5);
          break;
        case 3:
          localContext = new ScalarAssignmentContext(localContext);
          context = localContext;
          _prevctx = localContext;
          state = 23; 
          match(ID);
          state = 24; 
          match(ASSIGN);
          state = 25; 
          scalar(4);
          break;
        case 4:
          localContext = new FloatLiteralContext(localContext);
          context = localContext;
          _prevctx = localContext;
          state = 26; 
          match(FLOAT);
          break;
        case 5:
          localContext = new IntLiteralContext(localContext);
          context = localContext;
          _prevctx = localContext;
          state = 27; 
          match(INT);
          break;
        case 6:
          localContext = new FunctionCallContext(localContext);
          context = localContext;
          _prevctx = localContext;
          state = 28; 
          match(ID);
          state = 29; 
          match(PL);
          state = 30; 
          scalar(0);
          state = 35;
          errorHandler.sync(this);
          _la = inputSource.lookAhead(1);
          while (_la == COMMA) {
            state = 31; 
            match(COMMA);
            state = 32; 
            scalar(0);
            state = 37;
            errorHandler.sync(this);
            _la = inputSource.lookAhead(1);
          }
          state = 38; 
          match(PR);
          break;
        case 7:
          localContext = new SymbolLiteralContext(localContext);
          context = localContext;
          _prevctx = localContext;
          state = 40; 
          match(ID);
          break;
        case 8:
          localContext = new BracketedScalarContext(localContext);
          context = localContext;
          _prevctx = localContext;
          state = 41; 
          match(PL);
          state = 42; 
          scalar(0);
          state = 43; 
          match(PR);
          break;
      }
      context.stop = inputSource.lookToken(-1);
      state = 60;
      errorHandler.sync(this);
      _alt = interpreter.adaptivePredict(inputSource, 4, context);
      while (_alt != 2 && _alt != Atn.INVALID_ALT_NUMBER) {
        if (_alt == 1) {
          if (parseListeners != null) triggerExitRuleEvent();
          _prevctx = localContext;
          state = 58;
          switch (interpreter.adaptivePredict(inputSource, 3, context)) {
            case 1:
              localContext = new ScalarPowerContext(new ScalarContext(_parentctx, _parentState));
              pushNewRecursionContext(localContext, _startState, RULE_SCALAR);
              state = 47;
              if (!(precedencePredicate(context, 11))) 
                throw new FailedPredicateException(this, "precedencePredicate(context, 11)");
              state = 48; 
              match(POW);
              state = 49; 
              scalar(11);
              break;
            case 2:
              localContext = new ScalarProductContext(new ScalarContext(_parentctx, _parentState));
              pushNewRecursionContext(localContext, _startState, RULE_SCALAR);
              state = 50;
              if (!(precedencePredicate(context, 9))) 
                throw new FailedPredicateException(this, "precedencePredicate(context, 9)");
              state = 51; 
              mulOp();
              state = 52; 
              scalar(10);
              break;
            case 3:
              localContext = new ScalarSumContext(new ScalarContext(_parentctx, _parentState));
              pushNewRecursionContext(localContext, _startState, RULE_SCALAR);
              state = 54;
              if (!(precedencePredicate(context, 8))) 
                throw new FailedPredicateException(this, "precedencePredicate(context, 8)");
              state = 55; 
              sumOp();
              state = 56; 
              scalar(9);
              break;
          } 
        }
        state = 62;
        errorHandler.sync(this);
        _alt = interpreter.adaptivePredict(inputSource, 4, context);
      }
    } on RecognitionException catch (re) {
      localContext.exception = re;
      errorHandler.reportError(this, re);
  	errorHandler.recover(this, re);
    } finally {
      unrollRecursionContexts(_parentctx);
    }
    return localContext;
  }
  MulOpContext mulOp() {
    var localContext = new MulOpContext(context, state);
    enterRule(localContext, 2, RULE_MULOP);
    int _la;
    try {
      enterOuterAlt(localContext, 1);
      state = 63;
      _la = inputSource.lookAhead(1);
      if (!(_la == MUL || _la == DIV)) {
        errorHandler.recoverInline(this);
      }
      consume();
    } on RecognitionException catch (re) {
      localContext.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return localContext;
  }
  SumOpContext sumOp() {
    var localContext = new SumOpContext(context, state);
    enterRule(localContext, 4, RULE_SUMOP);
    int _la;
    try {
      enterOuterAlt(localContext, 1);
      state = 65;
      _la = inputSource.lookAhead(1);
      if (!(_la == ADD || _la == SUB)) {
        errorHandler.recoverInline(this);
      }
      consume();
    } on RecognitionException catch (re) {
      localContext.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return localContext;
  }

  bool semanticPredicate(RuleContext localContext, int ruleIndex, int predIndex) {
    switch (ruleIndex) {
      case 0: return _scalarSemanticPredicate(localContext, predIndex);
    }
    return true;
  }

  bool _scalarSemanticPredicate(ScalarContext localContext, int predIndex) {
    switch (predIndex) {
      case 0: return precedencePredicate(context, 11);
      case 1: return precedencePredicate(context, 9);
      case 2: return precedencePredicate(context, 8);
    }
    return true;
  }
}

class ScalarContext extends ParserRuleContext {

  ScalarContext(ParserRuleContext parent, int invokingState) : super(parent, invokingState);

  int get ruleIndex => CasParser.RULE_SCALAR;
 
  ScalarContext.from(ScalarContext context) : super.from(context) {
  }
}

class MulOpContext extends ParserRuleContext {

  MulOpContext(ParserRuleContext parent, int invokingState) : super(parent, invokingState);

  int get ruleIndex => CasParser.RULE_MULOP;

  TerminalNode getDIV() => getToken(CasParser.DIV, 0);

  TerminalNode getMUL() => getToken(CasParser.MUL, 0);

  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.enterMulOp(this);
  }

  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.exitMulOp(this);
  }

  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor) return visitor.visitMulOp(this);
    else return visitor.visitChildren(this);
  }
}

class SumOpContext extends ParserRuleContext {

  SumOpContext(ParserRuleContext parent, int invokingState) : super(parent, invokingState);

  int get ruleIndex => CasParser.RULE_SUMOP;

  TerminalNode getSUB() => getToken(CasParser.SUB, 0);

  TerminalNode getADD() => getToken(CasParser.ADD, 0);

  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.enterSumOp(this);
  }

  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.exitSumOp(this);
  }

  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor) return visitor.visitSumOp(this);
    else return visitor.visitChildren(this);
  }
}

class SymbolLiteralContext extends ScalarContext {
  TerminalNode getID() => getToken(CasParser.ID, 0);
  SymbolLiteralContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.enterSymbolLiteral(this);
  }
  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.exitSymbolLiteral(this);
  }
  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor) return visitor.visitSymbolLiteral(this);
    else return visitor.visitChildren(this);
  }
}

class ScalarUnaryPlusMinusContext extends ScalarContext {
  SumOpContext getSumOp() => getRuleContext((c) => c is SumOpContext, 0);
  ScalarContext getScalar() => getRuleContext((c) => c is ScalarContext, 0);
  ScalarUnaryPlusMinusContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.enterScalarUnaryPlusMinus(this);
  }
  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.exitScalarUnaryPlusMinus(this);
  }
  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor) return visitor.visitScalarUnaryPlusMinus(this);
    else return visitor.visitChildren(this);
  }
}

class BracketedScalarContext extends ScalarContext {
  TerminalNode getPR() => getToken(CasParser.PR, 0);
  TerminalNode getPL() => getToken(CasParser.PL, 0);
  ScalarContext getScalar() => getRuleContext((c) => c is ScalarContext, 0);
  BracketedScalarContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.enterBracketedScalar(this);
  }
  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.exitBracketedScalar(this);
  }
  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor) return visitor.visitBracketedScalar(this);
    else return visitor.visitChildren(this);
  }
}

class FunctionCallContext extends ScalarContext {
  TerminalNode getPR() => getToken(CasParser.PR, 0);
  TerminalNode getID() => getToken(CasParser.ID, 0);
  TerminalNode getPL() => getToken(CasParser.PL, 0);
  ScalarContext getScalar(int i) => getRuleContext((c) => c is ScalarContext, i);
  List<TerminalNode> getCOMMAs() => getTokens(CasParser.COMMA);
  List<ScalarContext> getScalars() => getRuleContexts((c) => c is ScalarContext);
  TerminalNode getCOMMA(int i) => getToken(CasParser.COMMA, i);
  FunctionCallContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.enterFunctionCall(this);
  }
  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.exitFunctionCall(this);
  }
  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor) return visitor.visitFunctionCall(this);
    else return visitor.visitChildren(this);
  }
}

class IntLiteralContext extends ScalarContext {
  TerminalNode getINT() => getToken(CasParser.INT, 0);
  IntLiteralContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.enterIntLiteral(this);
  }
  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.exitIntLiteral(this);
  }
  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor) return visitor.visitIntLiteral(this);
    else return visitor.visitChildren(this);
  }
}

class FloatLiteralContext extends ScalarContext {
  TerminalNode getFLOAT() => getToken(CasParser.FLOAT, 0);
  FloatLiteralContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.enterFloatLiteral(this);
  }
  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.exitFloatLiteral(this);
  }
  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor) return visitor.visitFloatLiteral(this);
    else return visitor.visitChildren(this);
  }
}

class ScalarPowerContext extends ScalarContext {
  ScalarContext getScalar(int i) => getRuleContext((c) => c is ScalarContext, i);
  List<ScalarContext> getScalars() => getRuleContexts((c) => c is ScalarContext);
  TerminalNode getPOW() => getToken(CasParser.POW, 0);
  ScalarPowerContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.enterScalarPower(this);
  }
  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.exitScalarPower(this);
  }
  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor) return visitor.visitScalarPower(this);
    else return visitor.visitChildren(this);
  }
}

class ScalarSumContext extends ScalarContext {
  ScalarContext getScalar(int i) => getRuleContext((c) => c is ScalarContext, i);
  SumOpContext getSumOp() => getRuleContext((c) => c is SumOpContext, 0);
  List<ScalarContext> getScalars() => getRuleContexts((c) => c is ScalarContext);
  ScalarSumContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.enterScalarSum(this);
  }
  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.exitScalarSum(this);
  }
  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor) return visitor.visitScalarSum(this);
    else return visitor.visitChildren(this);
  }
}

class FunctionAssignmentContext extends ScalarContext {
  TerminalNode getPR() => getToken(CasParser.PR, 0);
  List<TerminalNode> getIDs() => getTokens(CasParser.ID);
  TerminalNode getASSIGN() => getToken(CasParser.ASSIGN, 0);
  TerminalNode getPL() => getToken(CasParser.PL, 0);
  List<TerminalNode> getCOMMAs() => getTokens(CasParser.COMMA);
  TerminalNode getID(int i) => getToken(CasParser.ID, i);
  ScalarContext getScalar() => getRuleContext((c) => c is ScalarContext, 0);
  TerminalNode getCOMMA(int i) => getToken(CasParser.COMMA, i);
  FunctionAssignmentContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.enterFunctionAssignment(this);
  }
  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.exitFunctionAssignment(this);
  }
  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor) return visitor.visitFunctionAssignment(this);
    else return visitor.visitChildren(this);
  }
}

class ScalarAssignmentContext extends ScalarContext {
  TerminalNode getID() => getToken(CasParser.ID, 0);
  TerminalNode getASSIGN() => getToken(CasParser.ASSIGN, 0);
  ScalarContext getScalar() => getRuleContext((c) => c is ScalarContext, 0);
  ScalarAssignmentContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.enterScalarAssignment(this);
  }
  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.exitScalarAssignment(this);
  }
  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor) return visitor.visitScalarAssignment(this);
    else return visitor.visitChildren(this);
  }
}

class ScalarProductContext extends ScalarContext {
  MulOpContext getMulOp() => getRuleContext((c) => c is MulOpContext, 0);
  ScalarContext getScalar(int i) => getRuleContext((c) => c is ScalarContext, i);
  List<ScalarContext> getScalars() => getRuleContexts((c) => c is ScalarContext);
  ScalarProductContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.enterScalarProduct(this);
  }
  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) 
      listener.exitScalarProduct(this);
  }
  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor) return visitor.visitScalarProduct(this);
    else return visitor.visitChildren(this);
  }
}