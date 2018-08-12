# simple_cas

A minimal computer algebra system - an expression tree combined with a basic parser.

## Usage
See [examples](./example) and [tests](./test)

## Modifying the parser grammar
The parser contains a simple grammar. It is build using [antlr](http://www.antlr.org/). You will need to run antlr to update the generated files (`*.dart` in `lib/src/parser/antlr4` subdirecctory) to account for changes in the [lexer](./lib/src/parser/antlr4/CasLexer.g4) or [grammar](./lib/src/parser/antlr4/Cas.g4) files.

The easist way to do this is to get the prebuilt version from [this repository](https://github.com/tiagomazzutti/antlr4dart) under `bin/antlr-4.4-with-dart-support.jar`. There are more recent versions of antlr, but the language target has not been updated. The generated code has no analyzer errors, and only a few warnings about unused variables which can safely be ignored and are likely stripped out by the optimizer when building the dart code. You can fix these yourself, though you'll have to make the same fixes each time you change the grammar.

From there:
1. Create the following alias for conenience:
```
alias antlr4='java -jar /path/to/antlr4dart/bin/antlr-4.4-with-dart-support.jar'
```
2. Generate the relevant files:
```
cd simple_cas/lib/src/parser/antlr4
antlr4 Cas.g4
```
Note this will overwrite any changes made in the `antlr` subdirectory, so you are advised against changing those files directly.
