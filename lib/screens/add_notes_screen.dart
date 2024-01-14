import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite_app/globals.dart';
import 'package:sqflite_app/models/notes.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});
  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  int priority = 1;
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, "ok");
          },
        ),
        title: const Text("Add Note"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text('Select Priority:'),
          DropdownButton<int>(
            value: priority,
            items: const [
              DropdownMenuItem<int>(
                value: 1,
                child: Text('High'),
              ),
              DropdownMenuItem<int>(
                value: 2,
                child: Text('Low'),
              ),
            ],
            onChanged: (int? value) {
              setState(() {
                priority = value ?? 1;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Enter title',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: descController,
            decoration: const InputDecoration(
              hintText: 'Enter description',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                if (!(nameController.text == "") ||
                    !(descController.text == "")) {
                  DateTime now = DateTime.now();

                  // Format the date using the intl package
                  String formattedDate = DateFormat('yyyy-MM-dd').format(now);
                  Notes note = Notes(formattedDate, nameController.text,
                      descController.text, priority);
                  notes.add(note);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Saved Sucessfully!'),
                    ),
                  );
                } else {
                  if (!(nameController.text == "") ||
                      !(descController.text == "")) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Enter title and Description first'),
                      ),
                    );
                  } else if (nameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Enter title first'),
                      ),
                    );
                  } else if (descController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Enter description first'),
                      ),
                    );
                  }
                }
              },
              child: const Text("Save"))
        ],
      ),
    );
  }
}
