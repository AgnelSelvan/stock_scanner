extension GetSameLetters on String? {
  List<int> getAllSameLettersList(String letter) {
    List<int> allOcc = [];
    final word = (this ?? "").split("");
    for (var i = 0; i < word.length; i++) {
      allOcc.add(i);
    }
    return allOcc;
  }
}
