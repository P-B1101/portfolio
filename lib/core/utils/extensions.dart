extension MinMax on List<int> {
  int get minValue {
    if (isEmpty) return 0;
    int min = this[0];
    if (length == 1) return min;
    for (int i = 1; i < length; i++) {
      if (this[i] < min) min = this[i];
    }
    return min;
  }

  int get maxValue {
    if (isEmpty) return 0;
    int max = this[0];
    if (length == 1) return max;
    for (int i = 1; i < length; i++) {
      if (this[i] > max) max = this[i];
    }
    return max;
  }
}

extension StringExt on String {
  bool get isValidEmail {
    return RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(this);
  }

  Map<String, String> get getParams {
    Map<String, String> result = {};
    final params = split('&');
    for (int i = 0; i < params.length; i++) {
      final temp = params[i].split('=');
      final key = temp[0];
      final value = temp[1];
      result.putIfAbsent(key, () => value);
    }
    return result;
  }

  DateTime get toDate => DateTime.parse(this);
}
