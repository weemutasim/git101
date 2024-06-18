import 'package:dio/dio.dart';
import 'package:flutter_test1/datamodule/myclass.dart';

class DbClass {
  String domain = "http://172.2.200.14/clientele/electricquery.php";

  String systemid = "electric";
  String token = '';
  DbClass();

  Future<List<Listcctv>?> listcctv() async {
    FormData formData = new FormData.fromMap({
      "param": "listcctv",

    });
    String urlAPI = "${this.domain}";
    //print(urlAPI);
    Response response = await Dio().post(urlAPI, data: formData);
    //print(response.data);
    var listcoupon = Listcctv.fromJsonList(response.data);
    return listcoupon;
  }

}
