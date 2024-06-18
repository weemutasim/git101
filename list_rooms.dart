import 'package:flutter/material.dart';

//import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

//import 'package:electric/datamodule/myclass.dart';

class Listrooms extends StatefulWidget {
  final String tuk;
  const Listrooms({Key? key, required this.tuk}) : super(key: key);

  @override
  _ListroomsState createState() => _ListroomsState();
}

class _ListroomsState extends State<Listrooms> {
  List<Listroom> listrooms = [];
  bool loadroom = false;
  late String xx;

  @override
  void initState() {
// ignore: todo
// TODO: implement initState
    super.initState();

    DbClass().listroom(room: widget.tuk).then((value) {
      setState(() {
        listrooms = value;
        //print(listrooms);
        loadroom = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room List',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.normal,
              fontFamily: 'DBHelvethaica',
            )),
        actions: <Widget>[
          Container(
            child: Row(
              children: [
                Container(
                  alignment: new FractionalOffset(0.0, 0.0),
                  decoration: new BoxDecoration(
                    border: new Border.all(
                      color: Colors.yellow,
                      width: 10,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  child: Text('ข้อมูลห้องที่ยังไม่บันทึก',
                      style: TextStyle(
                        height: 2.5,
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'DBHelvethaica',
                      )),
                ),
              ],
            ),
          ),
          SizedBox(width: 5),
          Container(
            alignment: new FractionalOffset(0.0, 0.0),
            decoration: new BoxDecoration(
              border: new Border.all(
                color: Colors.greenAccent,
                width: 15,
              ),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            child: Text('ข้อมูลห้องที่บันทึกแล้ว',
                style: TextStyle(
                  height: 2.5,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'DBHelvethaica',
                )),
          ),
          SizedBox(width: 10,
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(20),
            margin: EdgeInsets.only(12),
            decoration: BoxDecoration(
              border: Border(2),
              gradient: LinearGradient(
                [colors: Colors.accents,
                colors: Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
              ),
              gradientTransform: Matrix4.rotation(0.5),
            ),
          ),),
        ],
      ),
      body: !loadroom? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue[200]?.withOpacity(0.5),
                  // Use ListView.builder
                  child: wraproom()),
            ),
    );
  }

  Container wraproom() {
    List<Widget> el = [];
    List.generate(listrooms.length, (index) {
      el.add(
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: InkWell(
            onTap: () {
              Future<Null> normalDialog(String string) async {
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    backgroundColor: Colors.blue,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontFamily: 'DBHelvethaica',
                      fontWeight: FontWeight.w400,
                    ),
                    children: <Widget>[
                      TextButton(
// SELECT name FROM sqlite_master WHERE type='table' AND name='{table_name}'; 
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('CLOSE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'DBHelvethaica',
                            )),
                      ),
                    ],
                    title: Text(string),
                  ),
                );
              }
            },
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
                        "${listrooms[index].aroom} " /*//check Status ready// +
                            ": ${listrooms[index].rdy}"*/ //ลิสห้อง
                        ,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'DBHelvethaica',
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                  Positioned(
                    top: 3,
                    right: 3,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //เช็คเงื่อนไขว่า เรดดี้เป็น Y มั้ยแล้วให้เปลี่ยนสี สเตตัส
                          color: listrooms[index].rdy == 'Y'
                              ? Colors.greenAccent
                              : Colors.yellowAccent),
                      child: Text(""),
                      // string: num ? index in : 'Hello'
                    ),
                  )
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
