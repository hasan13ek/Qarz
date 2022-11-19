import 'package:first_lesson/data/local/local_database.dart';
import 'package:first_lesson/data/models/cached_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QarzAddScreen extends StatefulWidget {
  const QarzAddScreen({Key? key, required this.cachedUserListener})
      : super(key: key);

  final ValueChanged<List<CachedUser>> cachedUserListener;

  @override
  State<QarzAddScreen> createState() => _QarzAddScreenState();
}

String Name = "";
String Price = "";
int summ = 0; //
DateTime? taskDay;
TimeOfDay? taskTime;

//xato logika ,o'zgaruvchilarni global e'lon qilish xato,
// men malumotni narigi page ga qanday olib o'tay

class _QarzAddScreenState extends State<QarzAddScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Qarz Qo'shish"),
        backgroundColor: Colors.lightBlueAccent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.lightBlueAccent,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Isim",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.lightBlue),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                style: const TextStyle(color: Colors.white),
                onSaved: (val) {
                  Name = val ?? "";
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(16)),
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Isim Kiriting',
                  focusColor: const Color(0xff868686),
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.lightBlueAccent,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white12, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white12, width: 2),
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Summa",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.lightBlue),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                onSaved: (val) {
                  Price = val ?? "";
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(16)),
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Summa Kiriting',
                  focusColor: const Color(0xff868686),
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.lightBlueAccent,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white12, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white12, width: 2),
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          minimumSize: const Size(120, 50),
                          primary: Colors.lightBlueAccent,
                          elevation: 0),
                      onPressed: () async {
                        taskDay = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2300),
                        );
                        taskTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        taskDay = DateTime(
                          taskDay?.year ?? 0000,
                          taskDay?.month ?? 00,
                          taskDay?.day ?? 00,
                          taskTime?.hour ?? 00,
                          taskTime?.minute ?? 00,
                        );
                      },
                      child: const Text("Sana")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          minimumSize: const Size(120, 50),
                          primary: Colors.lightBlueAccent,
                          elevation: 0),
                      onPressed: () async {
                        LocalDatabase.insertCachedUser(CachedUser(
                            userName: Name,
                            date: (taskDay ?? DateTime.now()).toString(),
                            summ: Price));
                        var cachedUsers =
                            await LocalDatabase.getAllCachedUsers();
                        widget.cachedUserListener.call(cachedUsers);
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: const Text("Saqlash")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
