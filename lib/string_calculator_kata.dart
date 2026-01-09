class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String content = numbers;

    // Check for custom delimiters
    if (numbers.startsWith("//")) {
      final parts = numbers.split('\n');
      
      delimiter = parts[0].substring(2);
      
      content = parts.sublist(1).join('\n');
    }

    content = content.replaceAll('\n', delimiter);

    return content.split(delimiter).map(int.parse).reduce((a, b) => a + b);
  }
}
