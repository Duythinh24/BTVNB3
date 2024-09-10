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
      body: SafeArea(
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
                          const Text(
                            "Chọn Ngôn ngữ",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          _listLanguage(),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.red,
                child: Text("Chọn Ngôn ngữ"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget _listLanguage() {
  final List<Widget> items = [_icon1(), _icon2(), _icon3(), _icon4(), _icon5()];
  return Expanded(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return items[index];
          }));
}

Widget _icon1() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMF-Ly3Re3LxcOi4Bz61Rqj9iR2_DAX4EanQ&s",
              width: 30,
              height: 30,
              fit: BoxFit.cover),
        ),
        const SizedBox(width: 15),
        const Text(
          "VietNam",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget _icon2() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/1920px-Flag_of_the_United_States.svg.png",
              width: 30,
              height: 30,
              fit: BoxFit.cover),
        ),
        const SizedBox(width: 15),
        const Text(
          "English (US)",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget _icon3() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1920px-Flag_of_the_United_Kingdom_%281-2%29.svg.png",
              width: 30,
              height: 30,
              fit: BoxFit.cover),
        ),
        const SizedBox(width: 15),
        const Text(
          "English (UK)",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget _icon4() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl302L3TqkRA1DQqu3zeoD8m38a7fGYeKp0A&s",
              width: 30,
              height: 30,
              fit: BoxFit.cover),
        ),
        const SizedBox(width: 15),
        const Text(
          "Korean",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget _icon5() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/225px-Flag_of_Japan.svg.png",
              width: 30,
              height: 30,
              fit: BoxFit.cover),
        ),
        const SizedBox(width: 15),
        const Text(
          "Japanses",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
