lexer grammar CasLexer;

ID  :   [a-zA-Z]+ ;
INT :   [0-9]+ ;
NEWLINE:'\r'? '\n' ;
WS  :   [ \t]+ -> skip ;
MUL_OP: [*/];
SUM_OP: [+-];
POW: '^';
BL: '(';
BR: ')';