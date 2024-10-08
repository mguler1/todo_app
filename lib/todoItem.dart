import 'package:flutter/material.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key, required this.title});
  final String title;
  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.notes_outlined,
              size: 50,
            ),
            Text(
              widget.title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) {
                setState(() {
                  isChecked = val!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
