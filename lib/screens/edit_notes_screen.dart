import 'package:flutter/material.dart';
import 'package:sqflite_app/globals.dart';
import 'package:sqflite_app/models/notes.dart';

// ignore: must_be_immutable
class EditNotesScreen extends StatefulWidget {
  EditNotesScreen(this.note, {super.key});
  Notes note;
  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  late int priority;
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    nameController.text = widget.note.title;
    descController.text = widget.note.description;
    priority = widget.note.priority;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, "ok");
          },
        ),
        title: const Text("Edit Note"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text('Select Priority:'),
          DropdownButton<int>(
            value: widget.note.priority,
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
                widget.note.priority = value ?? 0;
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
              onPressed: () async {
                if (!(nameController.text == "") ||
                    !(descController.text == "")) {
                  widget.note.priority = priority;
                  widget.note.title = nameController.text;
                  widget.note.description = descController.text;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Saved Sucessfully!'),
                    ),
                  );
                  await databaseHelper.updateNote(widget.note);
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
