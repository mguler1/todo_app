import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/screens/home.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: deviceWidth,
                  height: deviceHeight / 10,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "lib/assets/images/add_new_task_header.png"))),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ));
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 40,
                            color: Colors.white,
                          )),
                      const Expanded(
                          child: Text(
                        "Add New Task",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                      ))
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("Task Title")),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    decoration:
                        InputDecoration(filled: true, fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Category"),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(milliseconds: 300),
                                  content: Text("Category Selected")));
                        },
                        child: Image.asset("lib/assets/images/category_1.png"),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("Date"),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      filled: true, fillColor: Colors.white),
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("Time"),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  decoration: InputDecoration(
                                      filled: true, fillColor: Colors.white),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 10), child: Text("Notes")),
                const SizedBox(
                  height: 300,
                  child: TextField(
                    expands: true,
                    maxLines: null,
                    decoration: InputDecoration(
                        filled: true, fillColor: Colors.white, isDense: true),
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Save"))
              ],
            ),
          )),
    );
  }
}
