import 'package:string_calculator_kata/string_calculator_kata.dart';
import 'package:test/test.dart';

void main() {
  late StringCalculator calculator;
  setUp(() => calculator = StringCalculator());

  group('String Calculator', () {
    test('should return 0 for an empty string', () {
      expect(calculator.add(""), 0);
    });
  });
}
