Stream<int> getNumbers() async* {
  for (int i = 0; i < 5; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
    // if (i == 2) {
    //   throw Exception('An error occurred');
    // }
  }
}

void main(List<String> args) async {
  var myStream = getNumbers().asBroadcastStream();

  myStream.listen((event) {
    print('Stream1: $event');
  });

  myStream.listen((event) {
    print('Stream2: $event');
  });
//  print("first: ${await myStream.first}");
  // print("isBroadcast: ${await myStream.isBroadcast}");
  
  // print("last: ${await myStream.last}");

  // print("length: ${await myStream.length}");

// print("isContains 3: ${await myStream.contains(3)}");
// print("isContains 6: ${await myStream.contains(6)}");
// print("any: ${await myStream.any((element) => element==2)}");
// print("any: ${await myStream.any((element) => element==99)}");
print("join: ${await myStream.join(',')}");

 
}
