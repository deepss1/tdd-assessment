import 'package:string_calculator_kata/string_calculator_kata.dart';
import 'package:test/test.dart';

void main() {
  late StringCalculator calculator;
  setUp(() => calculator = StringCalculator());

  group('String Calculator', () {
    test('should return 0 for an empty string', () {
      expect(calculator.add(""), 0);
    });

    test('should return the number itself for a single number', () {
      expect(calculator.add("1"), 1);
    });

    test('should return sum of two comma-separated numbers', () {
      expect(calculator.add("1,2"), 3);
    });

    test('should return sum of multiple numbers', () {
      expect(calculator.add("1,2,3,4"), 10);
    });

    test('should handle new lines between numbers', () {
      expect(calculator.add("1\n2,3"), 6);
    });
  });
}
