//https://www.codebrainer.com/blog/love-calculator-android (For algorithm used here)

int calculate({String firstName, String secondName}) {
  List<String> firstList = firstName.toLowerCase().split('');
  List<String> secondList = secondName.toLowerCase().split('');

  List<String> initial = firstList + "loves".split('') + secondList;

  Map freq = Map();

  initial.forEach((element) {
    if (freq.containsKey(element))
      freq[element]++;
    else
      freq[element] = 1;
  });

  List newFreqs = freq.values.toList();

  List score = List();
  while (newFreqs.length > 2) {
    score = _solve(newFreqs);
    newFreqs = score;
  }

  int finalScore = newFreqs[0] * 10 + newFreqs[1];
  return finalScore;
}

List _solve(List newFreqs) {
  List tempScore = List();
  do {
    int temp = newFreqs.first + newFreqs.last;
    if (temp >= 10) {
      temp -= 10;
    }
    newFreqs.remove(newFreqs[0]);
    newFreqs.remove(newFreqs.last);
    tempScore.add(temp);

  } while (newFreqs.length >= 2);

  if (newFreqs.length != 0) {
    tempScore.add(newFreqs.first);
  }

  return tempScore;
}
