import 'package:flutter/material.dart';
import 'package:note_taking_app/models/note.dart';
import 'package:note_taking_app/models/note_database.dart';
import 'package:note_taking_app/pages/new_note_page.dart';
import 'package:provider/provider.dart';

class AllNotesPage extends StatefulWidget {
  const AllNotesPage({super.key});

  @override
  State<AllNotesPage> createState() => _AllNotesPageState();
}

class _AllNotesPageState extends State<AllNotesPage> {
  // Text controller to access what the user typed
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readNotes();
  }

  // Create a note
  void createNote() {
    Navigator.pushNamed(context, '/newNote');
  }

  // Read notes
  void readNotes() {
    context.read<NoteDatabase>().fetchNote();
  }

  // update a note
  void updateNote(Note note) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NewNotePage(note: note)));
  }

  // delete a note
  void deleteNode(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: createNote,
            shape: const CircleBorder(),
            elevation: 5,
            child: const Icon(
              Icons.edit_note_rounded,
              color: Colors.black87,
            )),
        body: ListView.builder(
            itemCount: currentNotes.length,
            itemBuilder: (context, index) {
              final note = currentNotes[index];
              return Container(
                  margin: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white70,
                  ),
                  child: GestureDetector(
                    onTap: () => updateNote(note),
                    child: PhysicalModel(
                      color: Colors.white,
                      elevation: 5,
                      shadowColor: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
                        child: Text(
                          note.title == "" ? "No title" : note.title,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ));
            }));
  }
}
