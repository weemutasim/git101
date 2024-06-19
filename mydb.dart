import 'package:dio/dio.dart';
import 'package:flutter_test1/datamodule/myclass.dart';

class DbClass {
  // String domain = "http://172.2.200.14/clientele/electricquery.php";

  String systemid = "electric";
  String token = '';
  DbClass();

  Future<List<Listcctv>?> listcctv() async {
    // ignore: unnecessary_new
    FormData formData = new FormData.fromMap({
      "param": "listcctv",
    });
    String urlAPI = "http://172.2.200.14/clientele/electricquery.php";
    //print(urlAPI);
    Response response = await Dio().post(urlAPI, data: formData);
    //print(response.data);
    var listcoupon = Listcctv.fromJsonList(response.data);
    return listcoupon;
  }

  Future<String> savecctv(
      {String? idCamera,
      ipAddress,
      address,
      model,
      assetCode,
      pic,
      nvr}) async {
    //print("OK");
    // ignore: unnecessary_new
    print("idcamera ${idCamera}");
    print("_ipAddress ${ipAddress}");
    print("_address ${address}");
    print("_model ${model}");
    print("_nvr ${assetCode}");
    print("_assetCode ${pic}");
    print("_pic ${nvr}");

    FormData formData = FormData.fromMap({
      "param": "savecctv",
      "id_camera": "xos",
      "ip_address": "xos",
      "address": "xos",
      "model": "xos",
      "asset_code": "xos",
      "pic": "xos",
      "nvr": "xos",
    });
    String urlAPI = "http://172.2.200.14/clientele/electricquery.php";
    print(urlAPI);
    //print(room.newunit);
    //print(room.aroom);

    try {
      Response response = await Dio().post(urlAPI, data: formData);
      print("response.data ===> ${response.data}");
      return "Y";
      //print('Y');
    } catch (e) {
      return "N";
      //print('N');
    }
  }

  Future<String> deletecctv({String? idcctvList}) async {
    //print("OK");
    // ignore: unnecessary_new
    FormData formData = new FormData.fromMap({
      "param": "deletecctvlist",
      "idcctv_list": idcctvList,
    });
    String urlAPI = "http://172.2.200.14/clientele/electricquery.php";
    print(urlAPI);
    //print(room.newunit);
    //print(room.aroom);

    try {
      Response response = await Dio().delete(urlAPI, data: formData);
      print("response.data ===>${response.data}");
      return "Y";
      //print('Y');
    } catch (e) {
      return "N";
      //print('N');
    }
  }
}
