part of 'view.dart';

class AddUser extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  void _addUser() {
    userController.addUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                'Tambah Data',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: userController.addUsernameController,
                decoration: InputDecoration(hintText: 'Username'),
              ),
              TextField(
                controller: userController.addPasswordController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              TextField(
                controller: userController.namaController,
                decoration: InputDecoration(hintText: 'Nama'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.blue,
                  minimumSize: Size(88, 36),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                onPressed: () => _addUser(),
                child: Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
