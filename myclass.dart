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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idcctv_list'] = this.idcctvList;
    data['id_camera'] = this.idCamera;
    data['ip_address'] = this.ipAddress;
    data['address'] = this.address;
    data['model'] = this.model;
    data['asset_code'] = this.assetCode;
    data['pic'] = this.pic;
    data['nvr'] = this.nvr;
    return data;
  }

  static List<Listcctv>? fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => Listcctv.fromJson(item)).toList();
  }
}
