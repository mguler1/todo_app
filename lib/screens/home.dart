import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/todoItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> todo = ["Study Lessons", "Go to party", "Run 5K"];
    List<String> completed = ["Game meetup", "Take out tash"];
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeight / 4,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/header.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "03 Ekim 2024",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "Yapılacaklar Listesi",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: todo.length,
                        itemBuilder: (context, index) {
                          return Todoitem(
                            title: todo[index],
                          );
                        }),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Completed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: completed.length,
                        itemBuilder: (context, index) {
                          return Todoitem(
                            title: completed[index],
                          );
                        }),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddNewTaskScreen(),
                    ));
                  },
                  child: const Text("Add New Task"))
            ],
          ),
        ),
      ),
    );
  }
}
