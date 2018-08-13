grammar Cas;

options {
  language = Dart;
}

@header {
part of cas.parser.antlr;
}

scalar
  : <assoc=right> scalar POW scalar            # scalarPower
  | sumOp scalar                               # scalarUnaryPlusMinus
  | scalar mulOp scalar                        # scalarProduct
  | scalar sumOp scalar                        # scalarSum
  | FLOAT                                      # floatLiteral
  | INT                                        # intLiteral
  | ID PL ID (COMMA ID)* PR ASSIGN scalar      # functionAssignment
  | ID ASSIGN scalar                           # scalarAssignment
  | ID PL scalar (COMMA scalar)* PR            # functionCall
  | ID                                         # symbolLiteral
  | PL scalar PR                               # bracketedScalar
  ;


mulOp
  : MUL
  | DIV
  ;

sumOp
  : ADD
  | SUB
  ;

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
PL: '(';
PR: ')';
ASSIGN: '=';
COMMA: ',';
