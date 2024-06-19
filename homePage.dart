import 'package:flutter/material.dart';
import 'package:flutter_test1/datamodule/myclass.dart';
import 'package:flutter_test1/datamodule/mydb.dart';
// import 'package:dio/dio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _idCamera = TextEditingController();
  final TextEditingController _ipAddress = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _model = TextEditingController();
  final TextEditingController _nvr = TextEditingController();
  final TextEditingController _assetCode = TextEditingController();
  final TextEditingController _pic = TextEditingController();

  String responseString = '';

  List<Listcctv> listcctv = [];
  List<Listcctv> filteredList = [];
  String searchQuery = '';
  bool loadcctv = false;

  @override
  void initState() {
// ignore: todo
// TODO: implement initState
    super.initState();
    filteredList = listcctv;

    DbClass().listcctv().then((value) {
      setState(() {
        listcctv = value!;
        //print(listrooms);
        loadcctv = true;
      });
    });
  }

  // void filterList(String query) {
  //   setState(() {
  //     searchQuery = query;
  //     filteredList = listcctv
  //         .where((item) =>
  //             item.idCamera!.contains(query) ||
  //             item.ipAddress!.contains(query) ||
  //             item.address!.contains(query) ||
  //             item.model!.contains(query) ||
  //             item.assetCode!.contains(query) ||
  //             item.nvr!.contains(query))
  //         .toList();
  //   });
  // }

  // Future<void> sendData() async {
  //   DbClass()
  //       .savecctv(
  //         idCamera: _idCamera.text, //delete
  //         ipAddress: _address.text,
  //         address: _address.text,
  //         model: _model.text,
  //         assetCode: _assetCode.text,
  //         nvr: _nvr,
  //         pic: _pic
  //       )
  //       .then((value) {});
  // }

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
        padding: const EdgeInsets.all(10.0),
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
                      hintText: 'Search...',
                      border: OutlineInputBorder(),
                      // hintText: 'Search',
                    ),
                    onChanged: (value) {
                      // filterList(value);
                      // ตรงนี้สามารถเขียนโค้ดสำหรับการค้นหาได้
                      print('Searching for: $value');
                    },
                  ),
                ),
                Container(
                  width: 200,
                    child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        ListTile(
                          title: Text('New'),
                          onTap: () {
                            update(context);
                            print('New tapped');
                          },
                        ),
                        // ListTile(
                        //   title: Text('Edit'),
                        //   onTap: () {
                        //     // getData();
                        //     print('Edit tapped');
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(width: 50.0),
                // Container(
                //     alignment: Alignment.center,
                //     color: Colors.blue[200]?.withOpacity(0.5),
                //     // Use ListView.builder
                //     child: wraproom()),
                // Expanded(
                  // child: Padding(
                  //   padding: const EdgeInsets.all(50.0),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.end,
                  //     children: <Widget>[
                  //       ListTile(
                  //         title: Text('New'),
                  //         onTap: () {
                  //           update(context);
                  //           print('New tapped');
                  //         },
                  //       ),
                  //       // ListTile(
                  //       //   title: Text('Edit'),
                  //       //   onTap: () {
                  //       //     // getData();
                  //       //     print('Edit tapped');
                  //       //   },
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                // ),
              ],
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Column(
                children: [
                  Container(
                    // width: _width/2,
                    child: wraproom(),
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
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              InkWell(
                child: Container(
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.purple[300],
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(255, 92, 88, 88).withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(3, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(
                        3,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        Positioned(
                            left: 10,
                            bottom: 10,
                            child: Text(
                              "ID Camera   ${listcctv[index].pic}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'DBHelvethaica',
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                        Positioned(
                          // padding: const EdgeInsets.all(20.0),
                          left: 10,
                          top: 50,
                          child: Text("Address   ${listcctv[index].ipAddress}"),
                        ),
                        Positioned(
                          // padding: const EdgeInsets.only(top: 40.0),
                          left: 10,
                          top: 70,
                          child: Text("Model   ${listcctv[index].model}"),
                        ),
                        Positioned(
                          // padding: const EdgeInsets.only(top: 60.0),
                          left: 10,
                          top: 90,
                          child:
                              Text("Asset code  ${listcctv[index].assetCode}"),
                        ),
                        Positioned(
                          // padding: EdgeInsets.only(top: 80.0),
                          left: 10,
                          top: 110,
                          child: Text("VNR   ${listcctv[index].nvr}"),
                        ),
                        Text(
                          "${listcctv[index].address}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            DbClass()
                                .deletecctv(
                                  idcctvList: '15', //delete
                                )
                                .then((value) {});
                          },
                          child: const Text(
                            'DELETE',
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
        backgroundColor: const Color.fromARGB(255, 178, 193, 206),
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
              controller: _idCamera,
              decoration: const InputDecoration(labelText: 'ชื่อกล้อง'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _ipAddress,
              decoration: const InputDecoration(labelText: 'IP Address'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _address,
              decoration: const InputDecoration(labelText: 'สถานที่'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _nvr,
              decoration: const InputDecoration(labelText: 'ยี่ห้อ'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _model,
              decoration: const InputDecoration(labelText: 'รุ่น'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _assetCode,
              decoration: const InputDecoration(labelText: 'รหัสทรัพย์สิน'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _pic,
              decoration: const InputDecoration(labelText: 'รูปภาพ'),
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
                    onPressed: () {
                      if (_idCamera.text != '' &&
                          _ipAddress.text != '' &&
                          _address.text != '' &&
                          _model.text != '' &&
                          _nvr.text != '' &&
                          _assetCode.text != '' &&
                          _pic.text != '') {
                        // print("idcamera ${_idCamera.text}");
                        // print("_ipAddress ${_ipAddress.text}");
                        // print("_address ${_address.text}");
                        // print("_model ${_model.text}");
                        // print("_nvr ${_nvr.text}");
                        // print("_assetCode ${_assetCode.text}");
                        // print("_pic ${_pic.text}");

                        // sendData();
                        DbClass()
                            .savecctv(
                                idCamera: _idCamera.text,
                                ipAddress: _address.text,
                                address: _address.text,
                                model: _model.text,
                                assetCode: _assetCode.text,
                                nvr: _nvr,
                                pic: _pic,)
                            .then((value) {});

                        Navigator.pop(context, true);
                      } else {
                        print('Error: no data');
                      }
                    },
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
}
