part of 'model.dart';

List<DataUser> dataUserFromJson(String str) => List<DataUser>.from(json.decode(str).map((x) => DataUser.fromJson(x)));

String dataUserToJson(List<DataUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataUser {
  DataUser({
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


  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
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
