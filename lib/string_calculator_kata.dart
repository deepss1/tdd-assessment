class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    List<int> numberList = _parse(numbers);

    _checkNegatives(numberList);

    return numberList.reduce((a, b) => a + b);
  }

  void _checkNegatives(List<int> numbers) {
    final negatives = numbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception("negative numbers not allowed ${negatives.join(', ')}");
    }
  }

  List<int> _parse(String numbers) {
    String content = numbers;
    String delimiter = ',';

    if (numbers.startsWith("//")) {
      final parts = numbers.split('\n');
      String definition = parts[0].substring(2);

      if (definition.startsWith('[') && definition.endsWith(']')) {
        delimiter = definition.substring(1, definition.length - 1);
      } else {
        delimiter = definition;
      }

      content = parts.sublist(1).join('\n');
    }

    final pattern = RegExp('${RegExp.escape(delimiter)}|\n');

    return content
        .split(pattern)
        .where((s) => s.isNotEmpty)
        .map(int.parse)
        .toList();
  }
}
