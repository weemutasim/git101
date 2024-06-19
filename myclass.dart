/*

  static List<Listroom> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => Listroom.fromJson(item)).toList();
  }

  */

class Listcctv {
  String? idcctvList;
  String? idCamera;
  String? ipAddress;
  String? address;
  String? model;
  String? assetCode;
  String? pic;
  String? nvr;

  Listcctv(
      {this.idcctvList,
      this.idCamera,
      this.ipAddress,
      this.address,
      this.model,
      this.assetCode,
      this.pic,
      this.nvr});

  Listcctv.fromJson(Map<String, dynamic> json) {
    idcctvList = json['idcctv_list'];
    idCamera = json['id_camera'];
    ipAddress = json['ip_address'];
    address = json['address'];
    model = json['model'];
    assetCode = json['asset_code'];
    pic = json['pic'];
    nvr = json['nvr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idcctv_list'] = idcctvList;
    data['id_camera'] = idCamera;
    data['ip_address'] = ipAddress;
    data['address'] = address;
    data['model'] = model;
    data['asset_code'] = assetCode;
    data['pic'] = pic;
    data['nvr'] = nvr;
    return data;
  }

  static List<Listcctv>? fromJsonList(List list) {
    // ignore: unnecessary_null_comparison
    if (list == null) return null;
    return list.map((item) => Listcctv.fromJson(item)).toList();
  }
}
