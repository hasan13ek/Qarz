import 'package:first_lesson/data/local/local_database.dart';
import 'package:first_lesson/data/models/cached_user.dart';
import 'package:first_lesson/ui/screens/main_screen/qarz_add.dart';
import 'package:first_lesson/ui/screens/main_screen/qarz_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<CachedUser> cachedUsers = [];

  int _selectedIndex = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    _pages = [
      QarzAddScreen(
        cachedUserListener: (cachedUsersFromAddScreen) {
          setState(() {
            _pages[1] = QarzViewScreen(cachedUsers: cachedUsersFromAddScreen);
          });
        },
      ),
      QarzViewScreen(cachedUsers: cachedUsers)
    ];

    _init();

    super.initState();
  }

  _init() async {
    var d = await LocalDatabase.getAllCachedUsers();
    setState(() {
      _pages[1] = QarzViewScreen(cachedUsers: d);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Qarz Daftar"),
        backgroundColor: Colors.lightBlueAccent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.lightBlueAccent,
        ),
      ),
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.136,
        child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            elevation: 0,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.lightBlueAccent,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.view_array), label: ""),
            ]),
      ),
    );
  }
}
