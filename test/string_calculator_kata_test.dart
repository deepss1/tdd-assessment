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

    test('should support custom delimiters', () {
      expect(calculator.add("//;\n1;2"), 3);
    });

    test('should throw exception for a single negative number', () {
      expect(
        () => calculator.add("1,-2,3"),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString().contains("negative numbers not allowed -2"),
          ),
        ),
      );
    });

    test('should show all negative numbers in exception message', () {
      expect(
        () => calculator.add("-1,-2,3"),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString().contains("negative numbers not allowed -1, -2"),
          ),
        ),
      );
    });

    test('should support multi-character delimiters enclosed in brackets', () {
      expect(calculator.add("//[***]\n1***2***3"), 6);
    });

    test('should support multiple delimiters', () {
      expect(calculator.add("//[*][%]\n1*2%3"), 6);
    });

    test('should ignore numbers greater than 1000', () {
      expect(calculator.add("2,1001"), 2);
    });

    test('should include 1000 but ignore 1001 (Boundary Check)', () {
      expect(calculator.add("1000,1001,5"), 1005);
    });

    test('should support multiple multi-character delimiters', () {
      expect(calculator.add("//[foo][bar]\n1foo2bar3"), 6);
    });
  });
}
