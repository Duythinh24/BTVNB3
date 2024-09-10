import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MyWidget> {
  int _selected = 0;

  void _onTapItem(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          onTap: _onTapItem,
          backgroundColor: Colors.yellow,
          currentIndex: _selected,
          selectedFontSize: 20,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map")
          ]),
      body:Center(
    child: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      height: 220,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Center(
                                  child: Text(
                                    "Chọn ảnh",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                                IconButton(
                                    onPressed: () {
                                     Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      size: 30,
                                    ))
                              ],
                            ),
                          ),
                          _listLanguage(),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.all(30),
                color: Colors.red,
                child: const Text("Chọn ảnh"),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

Widget _listLanguage() {
  final List<Widget> items = [_icon1(), _icon2()];
  return Expanded(
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return items[index];
          }));
}

Widget _icon1() {
  return Container(
    padding: const EdgeInsets.all(10),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.camera_alt_outlined),
            SizedBox(width: 15),
            Text(
              "Máy ảnh",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Icon(Icons.arrow_forward_ios)
      ],
    ),
  );
}

Widget _icon2() {
  return Container(
    padding: const EdgeInsets.all(10),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.photo_album),
            SizedBox(width: 15),
            Text(
              "Bộ sưu tập",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Icon(Icons.arrow_forward_ios)
      ],
    ),
  );
}
