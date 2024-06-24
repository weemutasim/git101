// import 'dart:io';
// import 'dart:ffi';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test1/datamodule/myclass.dart';
import 'package:flutter_test1/datamodule/mydb.dart';
import 'package:flutter_test1/form_page.dart';
// import 'package:flutter_test1/update.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _imagePath;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ipAddress = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _model = TextEditingController();
  final TextEditingController _nvr = TextEditingController();
  final TextEditingController _assetCode = TextEditingController();

  List<Listcctv> listcctv = [];
  List<Listcctv> filteredList = [];
  // bool loadcctv = false;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();

    DbClass().listcctv().then((value) {
      setState(() {
        listcctv = value!;
        // print(listcctv);
        // loadcctv = true;
      });
    });
  }

  // @override
  // void filterList(String query) {
  //   setState(() {
  //     filteredList = listcctv
  //         .where((item) =>
  //             item.ipAddress!.contains(query) ||
  //             item.address!.contains(query))
  //         .toList();
  //   });
  //   print(query);
  // }

  Future<void> _getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    } else {
      print('No image selected.');
    }
  }

  // void filterList(String query) {
  //   List<Listcctv> filteredList = listcctv.where((item) {
  //     return item.address!.toLowerCase().contains(query.toLowerCase()) ||
  //         item.ipAddress!.toLowerCase().contains(query.toLowerCase());
  //   }).toList();
  //   print("test ${query}");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 300,
                    alignment: Alignment.topLeft,
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        // filterList(value);
                        // print('Searching for: $value');
                        // setState(() {
                        //   value = searchQuery;
                        // });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  SizedBox(
                    width: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Colors.grey), // กำหนดสีขอบเป็นสีเทา
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ListTile(
                            title: const Text(
                              'New',
                              textAlign: TextAlign.end,
                            ),
                            onTap: () {
                              update(context);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => formPage()),
                              // );
                              // print('New tapped');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              wraproom(),
            ],
          ),
        ),
      ),
    );
  }

  Container wraproom() {
    List<Widget> el = [];
    List.generate(listcctv.length, (index) {
      // print("test $el");
      el.add(
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              InkWell(
                child: Container(
                  width: 450,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.purple[300],
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 92, 88, 88)
                              .withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(3, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(
                        25.0,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        Positioned(
                          // padding: const EdgeInsets.all(20.0),
                          left: 30,
                          top: 80,
                          child:
                              Text("IP Address   ${listcctv[index].ipAddress}"),
                        ),
                        Positioned(
                          // padding: const EdgeInsets.only(top: 40.0),
                          left: 30,
                          top: 100,
                          child: Text("Model   ${listcctv[index].model}"),
                        ),
                        Positioned(
                          // padding: const EdgeInsets.only(top: 60.0),
                          left: 30,
                          top: 120,
                          child:
                              Text("Asset code  ${listcctv[index].assetCode}"),
                        ),
                        Positioned(
                          // padding: EdgeInsets.only(top: 80.0),
                          left: 30,
                          top: 140,
                          child: Text("NVR   ${listcctv[index].nvr}"),
                        ),
                        Positioned(
                          left: 20.0,
                          top: 20.0,
                          child: Text(
                            "${listcctv[index].address}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 95.0,
                          top: 190.0,
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const formPage()),
                                  );
                                },
                                child: const Text('Edit'),
                              ),
                              const SizedBox(
                                width: 70,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  DbClass()
                                      .deletecctv(
                                    ipAddress: listcctv[index].ipAddress,
                                  )
                                      .then((value) {
                                    initState();
                                  });
                                },
                                child: const Text('Delete'),
                              ),
                            ],
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

  /* Widget wraproom() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // จำนวนคอลัมน์
          crossAxisSpacing: 10.0, // ช่องว่างระหว่างคอลัมน์
          mainAxisSpacing: 10.0, // ช่องว่างระหว่างแถว
          childAspectRatio: 2 / 3, // อัตราส่วนของแต่ละไอเท็ม
        ),
        itemCount: 4,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            color: Colors.amberAccent.shade100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.network(
                  "gjhgjh",
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "gjhgjh",
                      style: Theme.of(context).textTheme.subtitle1!.merge(
                            const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "ghjghjghj}",
                      style: Theme.of(context).textTheme.subtitle2!.merge(
                            TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade500,
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.heart,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.cart,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      ),
    );
  } */

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
          Container(
            width: 400,
            padding: const EdgeInsets.only(
                top: 30.0, right: 80.0, bottom: 30.0, left: 80.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: _ipAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'IP Address',
                    ),
                    // obscureText: true,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอก IP Address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: _address,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'สถานที่',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกสถานที่';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: _model,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'ยี่ห้อ',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกยี่ห้อ';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: _assetCode,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'รหัสทรัพย์สิน',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกรหัสทรัพย์สิน';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: _nvr,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'รุ่น',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณาระบุชื่อรุ่น';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () => _getImageFromGallery(),
                      style: OutlinedButton.styleFrom(
                          shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      )),
                      child: const Text('รูปภาพ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
/*                             if (_formKey.currentState!.validate()) {
                              DbClass()
                                  .savecctv(
                                    ipAddress: _ipAddress.text,
                                    address: _address.text,
                                    model: _model.text,
                                    assetCode: _assetCode.text,
                                    pic: _imagePath,
                                    nvr: _nvr.text,
                                  )
                                  .then((value) {});

                              _ipAddress.clear();
                              _ipAddress.clear();
                              _address.clear();
                              _model.clear();
                              _assetCode.clear();
                              _nvr.clear();
                            } */
                            //  () => Navigator.of(context).pop(true);
                            // MaterialPageRoute(
                            //   builder: (context) => formPage(),
                            // );
                            // sendDataToDatabase("New Data from Submit");
                            // Navigator.pop(context);
                            Navigator.of(context).pop(true);
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'CLOSE',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              // fontFamily: 'DBHelvethaica',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
