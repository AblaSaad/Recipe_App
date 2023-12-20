void main() {
  List<int> a = [1, 4, 9, 16, 25, 36, 49, 64, 100];
  List<int> evenList = a.where((element) => element % 2 == 0).toList();
  print(evenList);
}
