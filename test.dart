import 'package:flutter/material.dart';
import 'package:flutter_test1/datamodule/myclass.dart';
import 'package:flutter_test1/datamodule/mydb.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Listcctv> listcctv = [];
  bool loadcctv = false;

  @override
  void initState() {
// ignore: todo
// TODO: implement initState
    super.initState();

    DbClass().listcctv().then((value) {
      setState(() {
        listcctv = value!;
        //print(listrooms);
        loadcctv = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300,
                  alignment: Alignment.topLeft,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search',
                    ),
                    onChanged: (value) {
                      // ตรงนี้สามารถเขียนโค้ดสำหรับการค้นหาได้
                      print('Searching for: $value');
                    },
                  ),
                ),
                SizedBox(width: 50.0),
                Container(
                    alignment: Alignment.center,
                    color: Colors.blue[200]?.withOpacity(0.5),
                    // Use ListView.builder
                    child: wraproom()),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Text('New'),
                        onTap: () {
                          // ใส่โค้ดที่ต้องการให้ทำงานเมื่อกด New ตรงนี้
                          print('New tapped');
                        },
                      ),
                      ListTile(
                        title: Text('Edit'),
                        onTap: () {
                          // ใส่โค้ดที่ต้องการให้ทำงานเมื่อกด Edit ตรงนี้
                          print('Edit tapped');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Table(
                border: TableBorder.all(),
                children: const [
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(child: Text('Header 1')),
                      ),
                      TableCell(
                        child: Center(child: Text('Header 2')),
                      ),
                      TableCell(
                        child: Center(child: Text('Header 3')),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(child: Text('Data 1')),
                      ),
                      TableCell(
                        child: Center(child: Text('Data 2')),
                      ),
                      TableCell(
                        child: Center(child: Text('Data 3')),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(child: Text('Data 4')),
                      ),
                      TableCell(
                        child: Center(child: Text('Data 5')),
                      ),
                      TableCell(
                        child: Center(child: Text('Data 6')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container wraproom() {
    List<Widget> el = [];
    List.generate(listcctv.length, (index) {
      el.add(
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.purple[300],
                  borderRadius: BorderRadius.circular(
                    3,
                  )),
              child: Stack(
                children: [
                  Positioned(
                      left: 5,
                      bottom: 5,
                      child: Text(
                        "${listcctv[index].ipAddress} " /*//check Status ready// +
                            ": ${listrooms[index].rdy}"*/ //ลิสห้อง
                        ,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'DBHelvethaica',
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      );
    });
    return Container(child: Wrap(children: el));
  }
}
