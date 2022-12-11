extension RemoveTrailingZero on double {
  String get removeTrailingZeros {
    return toString().replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
  }
}
