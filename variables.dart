void main() {
  final int a = 5;
  const String str = 'asd';
  double any = 4.567;
  bool any2 = true;
  List<int> arr = [2, 4, 5, 6];
  Map<String, dynamic> map = {"any": 1};

  final bool first = false;
  final bool second = false;

  if (first || second) {
    // Условие
    print('Первое условие');
    // Если условие истина
  } else if (second && !first) {
    print('Второе условие');
    //Если первое условие лож захидм сюда
  } else {
    print('Последнее условие');
    // Если все условия выше были ложью заходим сюда
  }

  for (int i = 0; i <= 10; i++) {
    print(i);
  }
  int i = 0;

  while (i <= 10) {
    i++;
    print(i);
  }

  List<String> intrArr = [
    "any",
    "any",
    "any",
    "any",
    "any",
    "any",
    "any",
    "any",
    "any",
    "any",
  ];

  intrArr.forEach((String elem) {
    print(elem);
  });

  List<String> newArray =
      intrArr.map((String elem) {
        return elem + '1';
      }).toList();

  print(newArray);

  switch (str) {
    case 'value':
      // где-то тут
      break;
    case 'any':
      break;
    case '123':
      break;
    case 'asd':
      break;
    default:
    // Условие по умолчанию
  }
}
