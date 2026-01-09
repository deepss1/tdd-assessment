class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    var clean = numbers.replaceAll('\n', ',');

    return clean.split(',').map(int.parse).reduce((a, b) => a + b);
  }
}
