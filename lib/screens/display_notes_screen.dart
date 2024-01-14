import 'package:flutter/material.dart';
import 'package:sqflite_app/globals.dart';
import 'package:sqflite_app/screens/add_notes_screen.dart';
import 'package:sqflite_app/screens/edit_notes_screen.dart';

class DisplayNotesScreen extends StatefulWidget {
  const DisplayNotesScreen({super.key});
  @override
  State<DisplayNotesScreen> createState() => _DisplayNotesScreenState();
}

class _DisplayNotesScreenState extends State<DisplayNotesScreen> {
  @override
  Widget build(BuildContext context) {
    notes.sort((a, b) {
      return a.priority.compareTo(b.priority);
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddNotesScreen()));

          if (result == "ok") {
            setState(() {});
          }
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: notes[index].priority == 1
                  ? Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.grey[300],
                          size: 40.0,
                        ),
                      ),
                    )
                  : Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow[200],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.black,
                          size: 40.0,
                        ),
                      ),
                    ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                ),
                onPressed: () {
                  notes.removeAt(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Deleted Sucessfully!'),
                    ),
                  );
                  setState(() {});
                },
              ),
              title: Text(notes[index].title),
              subtitle: Text(notes[index].date),
              onTap: () async {
                var result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => EditNotesScreen(notes[index])));
                if (result == "ok") {
                  setState(() {});
                }
              },
            );
          }),
    );
  }
}
