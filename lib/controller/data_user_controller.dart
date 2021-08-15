part of 'controller.dart';

class UserController extends GetxController{
  RxBool loading = false.obs;
  late Map<String, dynamic> body;
  RxList<DataUser> dataUser = <DataUser>[].obs;
  Rx<SelectUser> listSelectUser = SelectUser(status: 'true', message: 'done', data: []).obs;
  RxString titleUser = ''.obs;
  final List<IconData> iconData = <IconData>[Icons.call, Icons.school];
  final Random r = Random();
  Icon randomIcon2() => Icon(iconData[r.nextInt(iconData.length)]);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namaController = TextEditingController();

  TextEditingController addUsernameController = TextEditingController();
  TextEditingController addPasswordController = TextEditingController();
  TextEditingController addNamaController = TextEditingController();

  RxInt id = 0.obs;

  @override
  void onInit() {
    super.onInit();
    readUser();
  }

  void readUser() async {
    Request request = Request(url: 'get_data_user.php', body: null);
    request.get().then((value) {
      if(value.statusCode==200){
        List jsonResponse = jsonDecode(value.body);
        dataUser.value = jsonResponse.map((e) => DataUser.fromJson(e)).toList();
        print(dataUser.map((e) => e.username));
      }else{
        print('Backend error');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void addUser() async{
    Request request = Request(url: 'add_data_user.php', body: {
      'username': addUsernameController.text,
      'password': addPasswordController.text,
      'nama': addNamaController.text,
    });
    request.post().then((value) {
      body = jsonDecode(value.body);
      if(value.statusCode==200){
        if(body['status']=='Success'){
          readUser();
          addUsernameController.clear();
          addPasswordController.clear();
          addNamaController.clear();
        }else{
          Fluttertoast.showToast(
              msg: "Data sudah ada.!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      }else{
        print('Backend error');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void deleteUser(int id)async{
    Request request = Request(url: 'delete_data_user.php', body: {
      'id_user': id.toString(),
    });
    request.post().then((value) {
      body = jsonDecode(value.body);
      if(value.statusCode==200){
        if(body['status']=='Success'){
          readUser();
        }
      }else{
        print('Backend error');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void toEditUser()async{
    selectUser(id.value);
    Get.to(()=>EditUser());
  }

  void editUser(int id)async{
    Request request = Request(url: 'edit_data_user.php', body: {
      'id_user': id.toString(),
      'username':usernameController.text,
      'password':passwordController.text,
      'nama':namaController.text,
    });
    request.post().then((value) {
      body = jsonDecode(value.body);
      if(value.statusCode==200){
        if(body['status']=='Success'){
          print('success');
          readUser();
          Fluttertoast.showToast(
              msg: "Done",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0
          );
          Get.back();
        }
      }else{
        print('Backend error');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void selectUser(int id)async{
    Request request = Request(url: 'select_data_user.php', body: {
      'id_user': id.toString(),
    });
    request.post().then((value) {
      body = jsonDecode(value.body);
      print(body);
      if(value.statusCode==200){
        listSelectUser.value = SelectUser.fromJson(body);
        if(listSelectUser.value.data!=[]){
          listSelectUser.value.data.map((e) {
            usernameController.text = e.username;
            passwordController.text = e.password;
            namaController.text = e.nama;
          }).first;
        }
      }else{
        print('Backend error');
      }
    }).catchError((onError) {
      printError();
    });
  }
}