import 'package:flutter/material.dart';
import 'package:flutter_test1/datamodule/myclass.dart';
import 'package:flutter_test1/datamodule/mydb.dart';
import 'package:http/http.dart' as http;


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
    String idCamera = '';

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
                // Container(
                //     alignment: Alignment.center,
                //     color: Colors.blue[200]?.withOpacity(0.5),
                //     // Use ListView.builder
                //     child: wraproom()),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Text('New'),
                        onTap: () {
                          // ใส่โค้ดที่ต้องการให้ทำงานเมื่อกด New ตรงนี้
                          update(context);
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
            const SizedBox(height: 100.0),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: wraproom(),
                ),
              ],
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
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              InkWell(
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
                            "IP Address ${listcctv[index].idCamera}" /*//check Status ready// +
                                ": ${listrooms[index].rdy}"*/ //ลิสห้อง
                            ,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'DBHelvethaica',
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                      Text(
                        "${listcctv[index].address}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
    return Container(child: Wrap(children: el));
  }

  void update(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        backgroundColor: const Color.fromARGB(255, 197, 155, 204),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'DBHelvethaica',
          fontWeight: FontWeight.w400,
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: const InputDecoration(labelText: 'ชื่อกล้อง'),
              onChanged: (value) => {
                setState(() {
                  var idCamera = value;
                }),
                // print('ชื่อกล้อง: ${idCamera}'),
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'IP Address'),
              onChanged: (value) => print('IP Address entered: $value'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'สถานที่'),
              onChanged: (value) => print('สถานที่: $value'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'ยี่ห้อ'),
              onChanged: (value) => print('ยี่ห้อ: $value'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'รุ่น'),
              onChanged: (value) => print('รุ่น: $value'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'รหัสทรัพย์สิน'),
              onChanged: (value) => print('รหัสทรัพย์สิน: $value'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'รูปภาพ'),
              onChanged: (value) => print('รูปภาพ: $value'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: 
                      postData
                    ,
                    child: const Text(
                      'SAVE',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'DBHelvethaica',
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'CLOSE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'DBHelvethaica',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> postData() async {
  var url = Uri.parse('http://172.2.200.14/clientele/electricquery.php'); 

  var data = {'id_camera': 'example', 'ip_address': '123456', 'address': 'cat'}; 

  try {
    var response = await http.post(
      url,
      body: data,
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
 
    } else {

    }
  } catch (e) {
    print('Error: $e');

  }
}

}
