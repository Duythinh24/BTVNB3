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
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Nhân viên OneShip",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
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
                        content: _infocus(),
                        actions: [
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  print("Button");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                ),
                                child: Text("Gửi",
                                    style:
                                        TextStyle(color: Colors.cyanAccent))),
                          )
                        ],
                      );
                    });
              },
              child: Text("Nhân Viên"),
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              Expanded(
                                  child: Center(
                                child: Text("Lưu ý",style: TextStyle(fontWeight: FontWeight.bold),),
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
                          content: _gift(),
                          actions: [
                            Container(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () {
                                    print("Button");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                  ),
                                  child: Text("Quay về ví",
                                      style:
                                          TextStyle(color: Colors.cyanAccent))),
                            )
                          ],
                        );
                      });
                },
                child: Text("Thưởng"))
          ],
        ),
      ),
    );
  }
}

Widget _gift() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset("assets/Success.png"),
      Text(
              "Hệ thống OneShip đang duyệt. Bạn chờ"),
      Text("duyệt 30p hệ thống sẽ xử lý")
    ],
  );
}

Widget _infocus() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Họ tên*"),
      TextFormField(
          decoration: InputDecoration(
              hintText: 'Nhập thông tin',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
      Text("Số điện thoại*"),
      TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: '090...',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
      Text("Telegram"),
      TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: '090...',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
      Text("Email"),
      TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'abcd.123@gmail.com',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
      Text("Bộ phận làm việc (VD: Sale, CSKH, Driver...)"),
      TextFormField(
          decoration: InputDecoration(
              hintText: 'Nhập bộ phận',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
      Text("Mã nhân viên"),
      TextFormField(
          decoration: InputDecoration(
              hintText: 'Nhập mã',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
    ],
  );
}
