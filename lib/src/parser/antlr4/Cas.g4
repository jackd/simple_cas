grammar Cas;

options {
  language = Dart;
}

@header {
part of cas.parser.antlr;
}

condition
  : scalar COND scalar
  ;

scalar
  : <assoc=right> scalar POW scalar            # scalarPower
  | sumOp scalar                               # scalarUnaryPlusMinus
  | scalar mulOp scalar                        # scalarProduct
  | scalar sumOp scalar                        # scalarSum
  | FLOAT                                      # floatLiteral
  | INT                                        # intLiteral
  | functionId BL scalar (',' scalar)* BR      # scalarFunction
  | ID                                         # symbolLiteral
  | BL scalar BR                               # bracketedScalar
  ;


functionId
  : SIN
  | COS
  | TAN
  | EXP
  | LN
  | LOG
  | ID
  ;

mulOp
  : MUL
  | DIV
  ;

sumOp
  : ADD
  | SUB
  ;

COND
  : '='
  | '>='
  | '<='
  | '<'
  | '>'
  ;

SIN : 'sin';
COS : 'cos';
TAN : 'tan';
EXP : 'exp';
LN  : 'ln';
LOG : 'log';

ID  :   [a-zA-Z] ;
INT :   [0-9]+ ;
FLOAT:  [0-9]*'.'?[0-9]+([eE][-+]?[0-9]+)?;
NEWLINE:'\r'? '\n' ;
WS  :   [ \t]+ -> skip ;
MUL: '*';
DIV: '/';
ADD: '+';
SUB: '-';
POW: '^';
BL: '(';
BR: ')';
