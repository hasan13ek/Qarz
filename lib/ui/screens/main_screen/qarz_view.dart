import 'package:first_lesson/data/local/local_database.dart';
import 'package:first_lesson/data/models/cached_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QarzViewScreen extends StatefulWidget {
  QarzViewScreen({Key? key, required this.cachedUsers}) : super(key: key);

  final List<CachedUser> cachedUsers;

  @override
  State<QarzViewScreen> createState() => _QarzViewScreenState();
}


class _QarzViewScreenState extends State<QarzViewScreen> {
  List<CachedUser> cachedUsers = [];

  @override
  void initState() {
    cachedUsers = widget.cachedUsers;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Qarzdorlar"),
        backgroundColor: Colors.lightBlueAccent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.lightBlueAccent,
        ),
      ),
      body: ListView(
        children: List.generate(cachedUsers.length, (index) {

      var item = cachedUsers[index];
      return ListTile(
        title: Text(item.userName),
        subtitle: Text(item.id.toString()),
        trailing: IconButton(
          onPressed: () async {
           await LocalDatabase.deleteCachedUserById(item.id!);
            cachedUsers = await LocalDatabase.getAllCachedUsers();
            setState(() {});
          },
          icon: const Icon(Icons.delete),
        ),
      );
        }),
      ),
    );
  }
}
