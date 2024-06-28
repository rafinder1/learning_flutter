Stream<int> countStream(int max) async* {
  for (int i = 0; i < max; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

void main() {
  Stream<int> myCountStream = countStream(2);

  myCountStream.listen((int myCount) {
    print('received: $myCount');
   });
}
