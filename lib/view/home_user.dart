part of 'view.dart';

class HomeUser extends StatelessWidget {

  final UserController userController = Get.put(UserController());

  Future<void> _showMyDialog(BuildContext context, int id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Would you like to remove data ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                overlayColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text('Remove'),
              onPressed: () => _onDeleteData(context, id),
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pullRefresh() async {
    userController.readUser();
  }

  Future<void> _onDeleteData(BuildContext context, int id) async {
    userController.deleteUser(id);
    Navigator.of(context).pop();
  }

  Future<void> _onEdit(int id) async {
    userController.id.value = id;
    userController.toEditUser();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Obx(
              () => RefreshIndicator(
            onRefresh: _pullRefresh,
            child: Stack(
              children: [
                Column(
                  children: [
                    Text(
                      'Data Game',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Expanded(
                        child: ListView(
                          children: userController.dataUser.map((e) {
                            var index = userController.dataUser.indexOf(e);
                            index++;
                            return Container(
                              height: 50,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(child: Text(index.toString())),
                                      SizedBox(width: 10),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [Text(e.username.toString())],
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                          onTap: () =>
                                              _onEdit(int.parse(e.iduser)),
                                          child: Icon(Icons.edit,
                                              color: Colors.green)),
                                      SizedBox(width: 5),
                                      GestureDetector(
                                          onTap: () => _showMyDialog(
                                              context, int.parse(e.iduser)),
                                          child: Icon(Icons.delete,
                                              color: Colors.red)),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add),
                      onPressed: () {
                        Get.to(() => AddUser());
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
