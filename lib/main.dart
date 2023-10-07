import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'cart app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> store = [];
  int count = 1;
  // int price = 30;
  // int result = 0;
  // void resultCount(int c) {
  //   result = (c + 1) * 30;
  //   store.add(result);
  // }

  int showCount() {
    int totalCount = 0;
    store.forEach((element) {
      totalCount += element;
    });
    return totalCount;
  }

  void decrease() {
    for (int i = 0; i < store.length; i++) {
      i--;
    }
    print(store);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Center(
        child: ListView(shrinkWrap: true, children: [
          Center(
            child: Column(
              children: [
                Text(
                  "My Bag",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                ListTile(
                  leading: Container(
                    height: 100,
                    width: 30,
                    child: Image.network(
                        "https://cdn.ostad.app/user/avatar/2023-07-21T07-23-55.519Z-581503.jpg"),
                  ),
                  title: Text('Pullover'),
                  trailing: Text("30"),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          Text("Color:Black"),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Size: L")
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Card(
                            elevation: 10,
                            shape: CircleBorder(),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    count++;
                                    // resultCount(count++);
                                    store.add(30);
                                    showCount();
                                    print(store);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: CircleBorder(),
                                ),
                                child: Text('+',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ))),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${count}",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: CircleBorder(),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    count--;
                                    decrease();
                                    showCount();
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: CircleBorder(),
                                ),
                                child: Text('-',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ))),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("Total Ammount"),
                    SizedBox(
                      width: 320,
                    ),
                    Text("${showCount()}")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Congratulations')));
                    },
                    child: Text('Checkout'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 0, 64),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        )),
                  ),
                )
              ],
            ),
          )
        ]),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
