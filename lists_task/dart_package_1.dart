void main(List<String> arguments) {
  var myList = [1, 2, 3, 4, 5, 6, 88, 55, 47, 53];

  myList.retainWhere((element) => element < 5);
  print(myList);
}
