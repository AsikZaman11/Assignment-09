import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
void main() {
  runApp(DevicePreview(builder: (context) => MyApp(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class ClothingItem {
  final String name;
  final String imageUrl;
  final String color;
  final String size;
  final double price;

  ClothingItem({
    required this.name,
    required this.imageUrl,
    required this.color,
    required this.size,
    required this.price,
  });
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<int> itemCounts = List<int>.generate(3, (index) => 0);
  List<double> unitPrices = [51.0, 30.0, 43.0];
  double totalAmount = 0.0;

  void updateTotalAmount() {
    setState(() {
      totalAmount = itemCounts.fold(0.0, (prev, count) =>
      prev + (unitPrices[itemCounts.indexOf(count)] * count));
    });
  }

  void showCongratulatorySnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Congratulations! '),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final List<ClothingItem> items = [
      ClothingItem(
        name: 'Pullover',
        imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Bill_Gates_2017_%28cropped%29.jpg/330px-Bill_Gates_2017_%28cropped%29.jpg',

        color: 'Black',
        size: 'L',
        price: 51.0,
      ),
      ClothingItem(
        name: 'T-Shirt',
        imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Bill_Gates_2017_%28cropped%29.jpg/330px-Bill_Gates_2017_%28cropped%29.jpg',
        color: 'Gray',
        size: 'L',
        price: 30.0,
      ),
      ClothingItem(
        name: 'Sport Dress',
        imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Bill_Gates_2017_%28cropped%29.jpg/330px-Bill_Gates_2017_%28cropped%29.jpg',
        color: 'Black',
        size: 'M',
        price: 43.0,
      ),
    ];

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.search),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'My Bag',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      for (int index = 0; index < itemCounts.length; index++)
                        Card(
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.green,
                                    width: double.infinity,
                                    height: 150,
                                    child: Image.network(
                                      items[index].imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    width: double.infinity,
                                    height: 150,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text(items[index].name, style: TextStyle(fontSize:22,fontWeight: FontWeight.bold),),
                                            trailing: Icon(Icons.more_vert),
                                          ),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Color: ${items[index].color}   Size: ${items[index].size}',
                                                style: TextStyle(fontWeight:FontWeight.bold),)),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Card(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      if (itemCounts[index] >
                                                          0) {
                                                        setState(() {
                                                          itemCounts[index]--;
                                                          updateTotalAmount();
                                                        });
                                                      }
                                                    },
                                                    icon: Icon(Icons.remove),
                                                  ),
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                                ),
                                              ),
                                              Text('${itemCounts[index]}'),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Card(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        itemCounts[index]++;
                                                        updateTotalAmount();
                                                      });
                                                    },
                                                    icon: Icon(Icons.add),
                                                  ),
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                                ),
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child:
                                                Text("${items[index].price}\$"),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(height: 20.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total amount: ',style:
                                TextStyle(fontWeight:FontWeight.bold),),

                                Text('${totalAmount.toStringAsFixed(2)}\$',
                                  style: TextStyle(fontWeight:FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(150)),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {
                              showCongratulatorySnackbar();
                            },
                            child: Center(child: Text('CHECK OUT')),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
