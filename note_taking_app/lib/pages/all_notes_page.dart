import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.surface,
              title: Text(
                "Are you sure to delete this item?",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      context.read<NoteDatabase>().deleteNote(id);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'No',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.surface,
        onPressed: createNote,
        shape: CircleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
        elevation: 0,
        child: Icon(
          Icons.edit_note_rounded,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: ListView.builder(
        itemCount: currentNotes.length,
        itemBuilder: (context, index) {
          final note = currentNotes[index];
          return Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) => deleteNode(note.id),
                    icon: Icons.delete,
                    foregroundColor: Theme.of(context).colorScheme.surface,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () => updateNote(note),
                  child: PhysicalModel(
                    color: note.color == 'default'
                        ? Theme.of(context).colorScheme.surface
                        : note.color == 'red'
                            ? Colors.redAccent
                            : note.color == 'orange'
                                ? Colors.orangeAccent
                                : note.color == 'green'
                                    ? Colors.greenAccent
                                    : Colors.blueAccent,
                    elevation: 5,
                    shadowColor: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(5),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                        left: 15.0,
                        right: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            note.title.isEmpty
                                ? "No title"
                                : note.title.length > 50
                                    ? '${note.title.substring(0, 50)}...'
                                    : note.title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Text(
                            note.text.length > 100
                                ? '${note.text.substring(0, 100)}...'
                                : note.text,
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
