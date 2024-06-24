import 'dart:io';
// import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test1/datamodule/myclass.dart';
import 'package:flutter_test1/datamodule/mydb.dart';
import 'package:flutter_test1/form_page.dart';
import 'package:flutter_test1/update.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class formPage extends StatefulWidget {
  const formPage({super.key});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<formPage> {
  String? _imagePath;
  final _formKey = GlobalKey<FormState>();
  final _ipAddress = TextEditingController();
  final _address = TextEditingController();
  final _model = TextEditingController();
  final _nvr = TextEditingController();
  final _assetCode = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Page'),
      ),
      body: Center(
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(16.0),
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
                  width: 500,
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
                          if (_formKey.currentState!.validate()) {
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

                            
                          }
                          Navigator.pop(context);
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
      ),
    );
  }
}
