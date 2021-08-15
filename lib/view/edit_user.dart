part of 'view.dart';

class EditUser extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  void _editUser(int id) {
    userController.editUser(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                'Edit Data',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: userController.usernameController,
                decoration: InputDecoration(hintText: 'Username'),
              ),
              TextField(
                controller: userController.passwordController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              TextField(
                controller: userController.namaController,
                decoration: InputDecoration(hintText: 'Nama'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.green,
                  minimumSize: Size(88, 36),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                onPressed: ()=> _editUser(userController.id.value),
                child: Text('Edit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
