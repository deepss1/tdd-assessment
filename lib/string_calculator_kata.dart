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
    String delimiter = ',';
    String content = numbers;

    // Check for custom delimiters
    if (numbers.startsWith("//")) {
      final parts = numbers.split('\n');

      delimiter = parts[0].substring(2);

      content = parts.sublist(1).join('\n');
    }

    content = content.replaceAll('\n', delimiter);

    return content.split(delimiter).map(int.parse).toList();
  }
}
