// Generated from Cas.g4 by antlr4dart

part of cas.parser.antlr;

class CasParser extends Parser {
  static const int EOF = Token.EOF;

  static const int RULE_CONDITION = 0,
      RULE_SCALAR = 1,
      RULE_FUNCTIONID = 2,
      RULE_MULOP = 3,
      RULE_SUMOP = 4;

  static const int T__0 = 1,
      COND = 2,
      SIN = 3,
      COS = 4,
      TAN = 5,
      EXP = 6,
      LN = 7,
      LOG = 8,
      ID = 9,
      INT = 10,
      FLOAT = 11,
      NEWLINE = 12,
      WS = 13,
      MUL = 14,
      DIV = 15,
      ADD = 16,
      SUB = 17,
      POW = 18,
      BL = 19,
      BR = 20;

  static const String _serializedAtn = "\x03\u0430\ud6d1\u8206\uad2d\u4417"
      "\uaef1\u8d80\uaadd\x03\x16\x40\x04\x02\x09\x02\x04\x03\x09\x03\x04\x04"
      "\x09\x04\x04\x05\x09\x05\x04\x06\x09\x06\x03\x02\x03\x02\x03\x02\x03"
      "\x02\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03"
      "\x03\x03\x03\x03\x03\x03\x07\x03\x1c\x0a\x03\x0c\x03\x0e\x03\x1f\x0b"
      "\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x05\x03"
      "\x28\x0a\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03"
      "\x03\x03\x03\x03\x03\x03\x03\x03\x07\x03\x35\x0a\x03\x0c\x03\x0e\x03"
      "\x38\x0b\x03\x03\x04\x03\x04\x03\x05\x03\x05\x03\x06\x03\x06\x03\x06"
      "\x02\x03\x04\x07\x02\x04\x06\x08\x0a\x02\x05\x03\x02\x05\x0b\x03\x02"
      "\x10\x11\x03\x02\x12\x13\x43\x02\x0c\x03\x02\x02\x02\x04\x27\x03\x02"
      "\x02\x02\x06\x39\x03\x02\x02\x02\x08\x3b\x03\x02\x02\x02\x0a\x3d\x03"
      "\x02\x02\x02\x0c\x0d\x05\x04\x03\x02\x0d\x0e\x07\x04\x02\x02\x0e\x0f"
      "\x05\x04\x03\x02\x0f\x03\x03\x02\x02\x02\x10\x11\x08\x03\x01\x02\x11"
      "\x12\x05\x0a\x06\x02\x12\x13\x05\x04\x03\x0a\x13\x28\x03\x02\x02\x02"
      "\x14\x28\x07\x0d\x02\x02\x15\x28\x07\x0c\x02\x02\x16\x17\x05\x06\x04"
      "\x02\x17\x18\x07\x15\x02\x02\x18\x1d\x05\x04\x03\x02\x19\x1a\x07\x03"
      "\x02\x02\x1a\x1c\x05\x04\x03\x02\x1b\x19\x03\x02\x02\x02\x1c\x1f\x03"
      "\x02\x02\x02\x1d\x1b\x03\x02\x02\x02\x1d\x1e\x03\x02\x02\x02\x1e\x20"
      "\x03\x02\x02\x02\x1f\x1d\x03\x02\x02\x02\x20\x21\x07\x16\x02\x02\x21"
      "\x28\x03\x02\x02\x02\x22\x28\x07\x0b\x02\x02\x23\x24\x07\x15\x02\x02"
      "\x24\x25\x05\x04\x03\x02\x25\x26\x07\x16\x02\x02\x26\x28\x03\x02\x02"
      "\x02\x27\x10\x03\x02\x02\x02\x27\x14\x03\x02\x02\x02\x27\x15\x03\x02"
      "\x02\x02\x27\x16\x03\x02\x02\x02\x27\x22\x03\x02\x02\x02\x27\x23\x03"
      "\x02\x02\x02\x28\x36\x03\x02\x02\x02\x29\x2a\x0c\x0b\x02\x02\x2a\x2b"
      "\x07\x14\x02\x02\x2b\x35\x05\x04\x03\x0b\x2c\x2d\x0c\x09\x02\x02\x2d"
      "\x2e\x05\x08\x05\x02\x2e\x2f\x05\x04\x03\x0a\x2f\x35\x03\x02\x02\x02"
      "\x30\x31\x0c\x08\x02\x02\x31\x32\x05\x0a\x06\x02\x32\x33\x05\x04\x03"
      "\x09\x33\x35\x03\x02\x02\x02\x34\x29\x03\x02\x02\x02\x34\x2c\x03\x02"
      "\x02\x02\x34\x30\x03\x02\x02\x02\x35\x38\x03\x02\x02\x02\x36\x34\x03"
      "\x02\x02\x02\x36\x37\x03\x02\x02\x02\x37\x05\x03\x02\x02\x02\x38\x36"
      "\x03\x02\x02\x02\x39\x3a\x09\x02\x02\x02\x3a\x07\x03\x02\x02\x02\x3b"
      "\x3c\x09\x03\x02\x02\x3c\x09\x03\x02\x02\x02\x3d\x3e\x09\x04\x02\x02"
      "\x3e\x0b\x03\x02\x02\x02\x06\x1d\x27\x34\x36";

  final Atn atn = AtnSimulator.deserialize(_serializedAtn);

  final PredictionContextCache sharedContextCache =
      new PredictionContextCache();

  final List<String> tokenNames = [
    "<INVALID>",
    "','",
    "COND",
    "'sin'",
    "'cos'",
    "'tan'",
    "'exp'",
    "'ln'",
    "'log'",
    "ID",
    "INT",
    "FLOAT",
    "NEWLINE",
    "WS",
    "'*'",
    "'/'",
    "'+'",
    "'-'",
    "'^'",
    "'('",
    "')'"
  ];

  final List<String> ruleNames = [
    "condition",
    "scalar",
    "functionId",
    "mulOp",
    "sumOp"
  ];
  CasParser(TokenSource input) : super(input) {
    var _decisionToDfa = new List<Dfa>(atn.numberOfDecisions);
    for (int i = 0; i < atn.numberOfDecisions; i++) {
      _decisionToDfa[i] = new Dfa(atn.getDecisionState(i), i);
    }
    interpreter =
        new ParserAtnSimulator(this, atn, _decisionToDfa, sharedContextCache);
  }

  String get serializedAtn => _serializedAtn;

  String get grammarFileName => "Cas.g4";
  ConditionContext condition() {
    var localContext = new ConditionContext(context, state);
    enterRule(localContext, 0, RULE_CONDITION);
    try {
      enterOuterAlt(localContext, 1);
      state = 10;
      scalar(0);
      state = 11;
      match(COND);
      state = 12;
      scalar(0);
    } on RecognitionException catch (re) {
      localContext.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return localContext;
  }

  ScalarContext scalar([int _p = 0]) {
    var _parentctx = context;
    int _parentState = state;
    var localContext = new ScalarContext(context, _parentState);
    // var _prevctx = localContext;
    int _startState = 2;
    enterRecursionRule(localContext, 2, RULE_SCALAR, _p);
    int _la;
    try {
      int _alt;
      enterOuterAlt(localContext, 1);
      state = 37;
      switch (interpreter.adaptivePredict(inputSource, 1, context)) {
        case 1:
          localContext = new ScalarUnaryPlusMinusContext(localContext);
          context = localContext;
          // _prevctx = localContext;

          state = 15;
          sumOp();
          state = 16;
          scalar(8);
          break;
        case 2:
          localContext = new FloatLiteralContext(localContext);
          context = localContext;
          // _prevctx = localContext;
          state = 18;
          match(FLOAT);
          break;
        case 3:
          localContext = new IntLiteralContext(localContext);
          context = localContext;
          // _prevctx = localContext;
          state = 19;
          match(INT);
          break;
        case 4:
          localContext = new ScalarFunctionContext(localContext);
          context = localContext;
          // _prevctx = localContext;
          state = 20;
          functionId();
          state = 21;
          match(BL);
          state = 22;
          scalar(0);
          state = 27;
          errorHandler.sync(this);
          _la = inputSource.lookAhead(1);
          while (_la == T__0) {
            state = 23;
            match(T__0);
            state = 24;
            scalar(0);
            state = 29;
            errorHandler.sync(this);
            _la = inputSource.lookAhead(1);
          }
          state = 30;
          match(BR);
          break;
        case 5:
          localContext = new SymbolLiteralContext(localContext);
          context = localContext;
          // _prevctx = localContext;
          state = 32;
          match(ID);
          break;
        case 6:
          localContext = new BracketedScalarContext(localContext);
          context = localContext;
          // _prevctx = localContext;
          state = 33;
          match(BL);
          state = 34;
          scalar(0);
          state = 35;
          match(BR);
          break;
      }
      context.stop = inputSource.lookToken(-1);
      state = 52;
      errorHandler.sync(this);
      _alt = interpreter.adaptivePredict(inputSource, 3, context);
      while (_alt != 2 && _alt != Atn.INVALID_ALT_NUMBER) {
        if (_alt == 1) {
          if (parseListeners != null) triggerExitRuleEvent();
          // _prevctx = localContext;
          state = 50;
          switch (interpreter.adaptivePredict(inputSource, 2, context)) {
            case 1:
              localContext = new ScalarPowerContext(
                  new ScalarContext(_parentctx, _parentState));
              pushNewRecursionContext(localContext, _startState, RULE_SCALAR);
              state = 39;
              if (!(precedencePredicate(context, 9)))
                throw new FailedPredicateException(
                    this, "precedencePredicate(context, 9)");
              state = 40;
              match(POW);
              state = 41;
              scalar(9);
              break;
            case 2:
              localContext = new ScalarProductContext(
                  new ScalarContext(_parentctx, _parentState));
              pushNewRecursionContext(localContext, _startState, RULE_SCALAR);
              state = 42;
              if (!(precedencePredicate(context, 7)))
                throw new FailedPredicateException(
                    this, "precedencePredicate(context, 7)");
              state = 43;
              mulOp();
              state = 44;
              scalar(8);
              break;
            case 3:
              localContext = new ScalarSumContext(
                  new ScalarContext(_parentctx, _parentState));
              pushNewRecursionContext(localContext, _startState, RULE_SCALAR);
              state = 46;
              if (!(precedencePredicate(context, 6)))
                throw new FailedPredicateException(
                    this, "precedencePredicate(context, 6)");
              state = 47;
              sumOp();
              state = 48;
              scalar(7);
              break;
          }
        }
        state = 54;
        errorHandler.sync(this);
        _alt = interpreter.adaptivePredict(inputSource, 3, context);
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

  FunctionIdContext functionId() {
    var localContext = new FunctionIdContext(context, state);
    enterRule(localContext, 4, RULE_FUNCTIONID);
    int _la;
    try {
      enterOuterAlt(localContext, 1);
      state = 55;
      _la = inputSource.lookAhead(1);
      if (!((((_la) & ~0x3f) == 0 &&
          ((BIG_ONE << _la) &
                  ((BIG_ONE << SIN) |
                      (BIG_ONE << COS) |
                      (BIG_ONE << TAN) |
                      (BIG_ONE << EXP) |
                      (BIG_ONE << LN) |
                      (BIG_ONE << LOG) |
                      (BIG_ONE << ID))) !=
              BIG_ZERO))) {
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

  MulOpContext mulOp() {
    var localContext = new MulOpContext(context, state);
    enterRule(localContext, 6, RULE_MULOP);
    int _la;
    try {
      enterOuterAlt(localContext, 1);
      state = 57;
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
    enterRule(localContext, 8, RULE_SUMOP);
    int _la;
    try {
      enterOuterAlt(localContext, 1);
      state = 59;
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

  bool semanticPredicate(
      RuleContext localContext, int ruleIndex, int predIndex) {
    switch (ruleIndex) {
      case 1:
        return _scalarSemanticPredicate(localContext, predIndex);
    }
    return true;
  }

  bool _scalarSemanticPredicate(ScalarContext localContext, int predIndex) {
    switch (predIndex) {
      case 0:
        return precedencePredicate(context, 9);
      case 1:
        return precedencePredicate(context, 7);
      case 2:
        return precedencePredicate(context, 6);
    }
    return true;
  }
}

class ConditionContext extends ParserRuleContext {
  ConditionContext(ParserRuleContext parent, int invokingState)
      : super(parent, invokingState);

  int get ruleIndex => CasParser.RULE_CONDITION;

  ScalarContext getScalar(int i) =>
      getRuleContext((c) => c is ScalarContext, i);

  List<ScalarContext> getScalars() =>
      getRuleContexts((c) => c is ScalarContext);

  TerminalNode getCOND() => getToken(CasParser.COND, 0);

  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.enterCondition(this);
  }

  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.exitCondition(this);
  }

  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor)
      return visitor.visitCondition(this);
    else
      return visitor.visitChildren(this);
  }
}

class ScalarContext extends ParserRuleContext {
  ScalarContext(ParserRuleContext parent, int invokingState)
      : super(parent, invokingState);

  int get ruleIndex => CasParser.RULE_SCALAR;

  ScalarContext.from(ScalarContext context) : super.from(context) {}
}

class FunctionIdContext extends ParserRuleContext {
  FunctionIdContext(ParserRuleContext parent, int invokingState)
      : super(parent, invokingState);

  int get ruleIndex => CasParser.RULE_FUNCTIONID;

  TerminalNode getLOG() => getToken(CasParser.LOG, 0);

  TerminalNode getID() => getToken(CasParser.ID, 0);

  TerminalNode getSIN() => getToken(CasParser.SIN, 0);

  TerminalNode getEXP() => getToken(CasParser.EXP, 0);

  TerminalNode getTAN() => getToken(CasParser.TAN, 0);

  TerminalNode getLN() => getToken(CasParser.LN, 0);

  TerminalNode getCOS() => getToken(CasParser.COS, 0);

  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.enterFunctionId(this);
  }

  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.exitFunctionId(this);
  }

  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor)
      return visitor.visitFunctionId(this);
    else
      return visitor.visitChildren(this);
  }
}

class MulOpContext extends ParserRuleContext {
  MulOpContext(ParserRuleContext parent, int invokingState)
      : super(parent, invokingState);

  int get ruleIndex => CasParser.RULE_MULOP;

  TerminalNode getDIV() => getToken(CasParser.DIV, 0);

  TerminalNode getMUL() => getToken(CasParser.MUL, 0);

  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.enterMulOp(this);
  }

  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.exitMulOp(this);
  }

  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor)
      return visitor.visitMulOp(this);
    else
      return visitor.visitChildren(this);
  }
}

class SumOpContext extends ParserRuleContext {
  SumOpContext(ParserRuleContext parent, int invokingState)
      : super(parent, invokingState);

  int get ruleIndex => CasParser.RULE_SUMOP;

  TerminalNode getSUB() => getToken(CasParser.SUB, 0);

  TerminalNode getADD() => getToken(CasParser.ADD, 0);

  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.enterSumOp(this);
  }

  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.exitSumOp(this);
  }

  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor)
      return visitor.visitSumOp(this);
    else
      return visitor.visitChildren(this);
  }
}

class SymbolLiteralContext extends ScalarContext {
  TerminalNode getID() => getToken(CasParser.ID, 0);
  SymbolLiteralContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.enterSymbolLiteral(this);
  }

  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.exitSymbolLiteral(this);
  }

  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor)
      return visitor.visitSymbolLiteral(this);
    else
      return visitor.visitChildren(this);
  }
}

class ScalarUnaryPlusMinusContext extends ScalarContext {
  SumOpContext getSumOp() => getRuleContext((c) => c is SumOpContext, 0);
  ScalarContext getScalar() => getRuleContext((c) => c is ScalarContext, 0);
  ScalarUnaryPlusMinusContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.enterScalarUnaryPlusMinus(this);
  }

  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.exitScalarUnaryPlusMinus(this);
  }

  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor)
      return visitor.visitScalarUnaryPlusMinus(this);
    else
      return visitor.visitChildren(this);
  }
}

class BracketedScalarContext extends ScalarContext {
  TerminalNode getBR() => getToken(CasParser.BR, 0);
  TerminalNode getBL() => getToken(CasParser.BL, 0);
  ScalarContext getScalar() => getRuleContext((c) => c is ScalarContext, 0);
  BracketedScalarContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.enterBracketedScalar(this);
  }

  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.exitBracketedScalar(this);
  }

  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor)
      return visitor.visitBracketedScalar(this);
    else
      return visitor.visitChildren(this);
  }
}

class IntLiteralContext extends ScalarContext {
  TerminalNode getINT() => getToken(CasParser.INT, 0);
  IntLiteralContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.enterIntLiteral(this);
  }

  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.exitIntLiteral(this);
  }

  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor)
      return visitor.visitIntLiteral(this);
    else
      return visitor.visitChildren(this);
  }
}

class FloatLiteralContext extends ScalarContext {
  TerminalNode getFLOAT() => getToken(CasParser.FLOAT, 0);
  FloatLiteralContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.enterFloatLiteral(this);
  }

  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.exitFloatLiteral(this);
  }

  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor)
      return visitor.visitFloatLiteral(this);
    else
      return visitor.visitChildren(this);
  }
}

class ScalarPowerContext extends ScalarContext {
  ScalarContext getScalar(int i) =>
      getRuleContext((c) => c is ScalarContext, i);
  List<ScalarContext> getScalars() =>
      getRuleContexts((c) => c is ScalarContext);
  TerminalNode getPOW() => getToken(CasParser.POW, 0);
  ScalarPowerContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.enterScalarPower(this);
  }

  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.exitScalarPower(this);
  }

  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor)
      return visitor.visitScalarPower(this);
    else
      return visitor.visitChildren(this);
  }
}

class ScalarSumContext extends ScalarContext {
  ScalarContext getScalar(int i) =>
      getRuleContext((c) => c is ScalarContext, i);
  SumOpContext getSumOp() => getRuleContext((c) => c is SumOpContext, 0);
  List<ScalarContext> getScalars() =>
      getRuleContexts((c) => c is ScalarContext);
  ScalarSumContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.enterScalarSum(this);
  }

  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.exitScalarSum(this);
  }

  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor)
      return visitor.visitScalarSum(this);
    else
      return visitor.visitChildren(this);
  }
}

class ScalarFunctionContext extends ScalarContext {
  FunctionIdContext getFunctionId() =>
      getRuleContext((c) => c is FunctionIdContext, 0);
  ScalarContext getScalar(int i) =>
      getRuleContext((c) => c is ScalarContext, i);
  TerminalNode getBR() => getToken(CasParser.BR, 0);
  TerminalNode getBL() => getToken(CasParser.BL, 0);
  List<ScalarContext> getScalars() =>
      getRuleContexts((c) => c is ScalarContext);
  ScalarFunctionContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.enterScalarFunction(this);
  }

  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.exitScalarFunction(this);
  }

  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor)
      return visitor.visitScalarFunction(this);
    else
      return visitor.visitChildren(this);
  }
}

class ScalarProductContext extends ScalarContext {
  MulOpContext getMulOp() => getRuleContext((c) => c is MulOpContext, 0);
  ScalarContext getScalar(int i) =>
      getRuleContext((c) => c is ScalarContext, i);
  List<ScalarContext> getScalars() =>
      getRuleContexts((c) => c is ScalarContext);
  ScalarProductContext(ScalarContext context) : super.from(context);
  void enterRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.enterScalarProduct(this);
  }

  void exitRule(ParseTreeListener listener) {
    if (listener is CasListener) listener.exitScalarProduct(this);
  }

  dynamic accept(ParseTreeVisitor visitor) {
    if (visitor is CasVisitor)
      return visitor.visitScalarProduct(this);
    else
      return visitor.visitChildren(this);
  }
}
