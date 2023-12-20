void main() {
  final lists = [
    [1, 2, 3, 55, 7, 99, 21],
    [1, 4, 7, 65, 99, 20, 21],
  ];

  final commonElements =
      lists.fold<Set>(lists.first.toSet(), (a, b) => a.intersection(b.toSet()));

  print(commonElements);
}
