part of 'model.dart';


SelectUser selectUserFromJson(String str) => SelectUser.fromJson(json.decode(str));

String selectUserToJson(SelectUser data) => json.encode(data.toJson());

class SelectUser {
  SelectUser({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<Datum> data;

  factory SelectUser.fromJson(Map<String, dynamic> json) => SelectUser(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.iduser,
    required this.username,
    required this.password,
    required this.karyawanid,
    required this.nama,
    required this.lev,
    required this.status,
    required this.tanggalubahpassword,

  });

  String iduser;
  String username;
  String password;
  String karyawanid;
  String nama;
  String lev;
  String status;
  String tanggalubahpassword;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    iduser: json["id_user"],
    username: json["username"],
    password: json["password"],
    karyawanid: json["karyawan_id"],
    nama: json["nama"],
    lev: json["lev"],
    status: json["status"],
    tanggalubahpassword: json["tanggal_ubah_password"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": iduser,
    "username": username,
    "password": password,
    "karyawan_id": karyawanid,
    "nama": nama,
    "lev": lev,
    "status": status,
    "tanggal_ubah_password": tanggalubahpassword,
  };
}
