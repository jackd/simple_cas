library simple_cas.base;

import 'dart:math' as math;
import 'package:quiver/core.dart';

abstract class Expression {
  Iterable<Scalar> get _children;

  Iterable<Scalar> subExpressions() sync* {
    yield this;
    yield* _children.expand((c) => c.subExpressions());
  }

  const Expression();
}

enum CondType { less, equal, greater }

abstract class Condition extends Expression {
  const Condition();
}

abstract class Comparison extends Condition {
  final Scalar left;
  final Scalar right;
  const Comparison(this.left, this.right);

  bool _numOp(num left, num right);
  Iterable<Scalar> get _children => [left, right];
}

class LessThan extends Comparison {
  const LessThan(Scalar left, Scalar right) : super(left, right);
  bool _numOp(num left, num right) => left < right;
}

class GreaterThan extends Comparison {
  const GreaterThan(Scalar left, Scalar right) : super(left, right);
  bool _numOp(num left, num right) => left > right;
}

class Equal extends Comparison {
  const Equal(Scalar left, Scalar right) : super(left, right);
  bool _numOp(num left, num right) => left == right;
}

abstract class Scalar extends Expression {
  const Scalar();

  Scalar operator -() => Product(negativeOne, this);
  Scalar operator -(Scalar other) => this + (-other);
  Scalar operator +(Scalar other) => Sum(this, other);
  Scalar operator *(Scalar other) => Product(this, other);
  Scalar operator /(Scalar other) => Product(this, other.reciprocal());
  Scalar reciprocal() => pow(negativeOne);

  /// Dart [^] precedence is lower than [*] so to avoid confusion we use [pow].
  Scalar pow(Scalar other) => Power(this, other);

  Scalar simplify();
  Scalar substitute(Map<ScalarSymbol, Scalar> map);
  Scalar diff(ScalarSymbol x);
}

enum BinaryOp { sum, product, power }

abstract class BinaryOperator extends Scalar {
  final Scalar left;
  final Scalar right;
  BinaryOp get _op;

  const BinaryOperator(this.left, this.right);

  num _numOp(num x, num y);

  BinaryOperator _constructor(Scalar left, Scalar right);

  int get hashCode => hash3(left, right, _op);
  bool operator ==(Object other) =>
      other is BinaryOperator &&
      other._op == _op &&
      other.left == left &&
      other.right == right;

  Iterable<Scalar> get _children => [left, right];
  Iterable<Scalar> get args => _children;

  Scalar simplify() {
    var leftOp = left.simplify();
    var rightOp = right.simplify();
    if (leftOp is Num && rightOp is Num) {
      return Num(_numOp(leftOp.value, rightOp.value));
    } else {
      return _constructor(leftOp, rightOp);
    }
  }

  Scalar substitute(Map<ScalarSymbol, Scalar> map) =>
      _constructor(left.substitute(map), right.substitute(map));
}

class Sum extends BinaryOperator {
  Sum(Scalar left, Scalar right) : super(left, right);
  BinaryOp get _op => BinaryOp.sum;

  num _numOp(num x, num y) => x + y;
  Sum _constructor(Scalar left, Scalar right) => Sum(left, right);

  String toString() => '$left + $right';
  Scalar diff(ScalarSymbol x) => left.diff(x) + right.diff(x);
}

class Product extends BinaryOperator {
  Product(Scalar left, Scalar right) : super(left, right);
  BinaryOp get _op => BinaryOp.product;

  num _numOp(num x, num y) => x * y;
  Product _constructor(Scalar left, Scalar right) => Product(left, right);

  String _bracketed(Scalar x) => x is Sum ? '($x)' : x.toString();

  String toString() => '${_bracketed(left)} * ${_bracketed(right)}';
  Scalar diff(ScalarSymbol x) => left.diff(x) * right + left * right.diff(x);
}

class Power extends BinaryOperator {
  Power(Scalar left, Scalar right) : super(left, right);
  BinaryOp get _op => BinaryOp.power;

  num _numOp(num x, num y) => math.pow(x, y);
  Power _constructor(Scalar left, Scalar right) => Power(left, right);

  String _bracketed(Scalar x) =>
      x is Sum || x is Product ? '($x)' : x.toString();

  String toString() => '${_bracketed(left)} ^ ${_bracketed(right)}';

  Scalar diff(ScalarSymbol x) => asExp().diff(x);
  Exp asExp() => exp(ln(left)*right);
}

class Num<T extends num> extends Scalar {
  final T value;
  const Num._create(this.value);

  factory Num(num value) => value is int ? Int(value) : Float(value);

  int get hashCode => value.hashCode;
  bool operator ==(Object x) => x is Num && x.value == value;
  Num<T> simplify() => this;
  Num<T> substitute(Map<ScalarSymbol, Scalar> map) => this;
  Iterable<Null> get _children => const [];
  String toString() => value.toString();

  Int diff(ScalarSymbol x) => zero;
}

class Float extends Num<double> {
  const Float(double value) : super._create(value);
}

class Int extends Num<int> {
  const Int(int value) : super._create(value);
}

class ScalarSymbol extends Scalar {
  final String symbol;
  const ScalarSymbol(this.symbol);
  ScalarSymbol simplify() => this;
  Scalar substitute(Map<ScalarSymbol, Scalar> map) =>
      map.containsKey(this) ? map[this] : this;

  Iterable<Null> get _children => const [];
  int get hashCode => symbol.hashCode;
  bool operator ==(Object other) =>
      other is ScalarSymbol && other.symbol == symbol;

  String toString() => symbol;
  Int diff(ScalarSymbol x) => x == this? one: zero;
}

const negativeOne = Int(-1);
const zero = Int(0);
const one = Int(1);
const two = Int(2);

enum FunctionId { sin, cos, tan, exp, ln }

abstract class ScalarFunction extends Scalar {
  final Scalar arg;
  const ScalarFunction(this.arg);
  FunctionId get _fId;
  int get hashCode => hash2(arg, _fId);
  bool operator ==(Object other) =>
      other is ScalarFunction && other._fId == _fId && other.arg == arg;
  num _numOp(num value);
  ScalarFunction _constructor(Scalar arg);

  @override
  Iterable<Scalar> get _children => [arg];

  @override
  Scalar simplify() {
    var argVal = arg.simplify();
    if (argVal is Num) {
      return Num(_numOp(argVal.value));
    } else {
      return _constructor(argVal);
    }
  }

  @override
  Scalar substitute(Map<ScalarSymbol, Scalar> map) =>
      _constructor(arg.substitute(map));
}

class Sin extends ScalarFunction {
  FunctionId get _fId => FunctionId.sin;
  const Sin(Scalar arg) : super(arg);
  num _numOp(num value) => math.sin(value);

  Sin _constructor(Scalar arg) => Sin(arg);
  Scalar diff(ScalarSymbol x) => cos(x);
}

class Cos extends ScalarFunction {
  FunctionId get _fId => FunctionId.cos;
  const Cos(Scalar arg) : super(arg);
  num _numOp(num value) => math.cos(value);

  Cos _constructor(Scalar arg) => Cos(arg);
  Scalar diff(ScalarSymbol x) => -sin(arg);
}

class Tan extends ScalarFunction {
  FunctionId get _fId => FunctionId.tan;
  const Tan(Scalar arg) : super(arg);
  num _numOp(num value) => math.tan(value);

  Tan _constructor(Scalar arg) => Tan(arg);
  Scalar diff(ScalarSymbol x) => one + this.pow(two);
}

class Exp extends ScalarFunction {
  FunctionId get _fId => FunctionId.exp;
  const Exp(Scalar arg) : super(arg);
  num _numOp(num value) => math.exp(value);

  Exp _constructor(Scalar arg) => Exp(arg);
  Scalar diff(ScalarSymbol x) => arg.diff(x) * this;
}

class Ln extends ScalarFunction {
  FunctionId get _fId => FunctionId.ln;
  const Ln(Scalar arg) : super(arg);
  num _numOp(num value) => math.log(value);

  Ln _constructor(Scalar arg) => Ln(arg);
  Scalar diff(ScalarSymbol x) => arg.diff(x) / arg;
}

Sum sum(Iterable<Scalar> args) => args.reduce((a, b) => Sum(a, b));
Product product(Iterable<Scalar> args) => args.reduce((a, b) => Product(a, b));
Sin sin(Scalar x) => Sin(x);
Cos cos(Scalar x) => Cos(x);
Tan tan(Scalar x) => Tan(x);
Exp exp(Scalar x) => Exp(x);
Ln ln(Scalar x) => Ln(x);
