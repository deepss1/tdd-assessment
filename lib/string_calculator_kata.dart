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
    String delimiterPatternString = ',';

    if (numbers.startsWith("//")) {
      final parts = numbers.split('\n');
      String definition = parts[0].substring(2);

      if (definition.startsWith('[')) {
        final buffer = StringBuffer();
        final matches = RegExp(r'\[(.*?)\]').allMatches(definition);

        for (final match in matches) {
          if (buffer.isNotEmpty) buffer.write('|');
          buffer.write(RegExp.escape(match.group(1)!));
        }
        delimiterPatternString = buffer.toString();
      } else {
        delimiterPatternString = RegExp.escape(definition);
      }

      content = parts.sublist(1).join('\n');
    }

    final fullPattern = RegExp('$delimiterPatternString|\n');

    return content
        .split(fullPattern)
        .where((s) => s.isNotEmpty)
        .map(int.parse)
        .where((n) => n <= 1000)
        .toList();
  }
}
