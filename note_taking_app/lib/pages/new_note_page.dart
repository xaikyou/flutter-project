import 'package:flutter/material.dart';
import 'package:note_taking_app/models/note.dart';
import 'package:note_taking_app/models/note_database.dart';
import 'package:provider/provider.dart';

class NewNotePage extends StatefulWidget {
  final Note? note;
  const NewNotePage({super.key, this.note});

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  late TextEditingController titleController = TextEditingController();
  late TextEditingController contentController = TextEditingController();
  String color = "NA";

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note?.title ?? '');
    contentController = TextEditingController(text: widget.note?.text ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: TextField(
          controller: titleController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Title',
          ),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TextField(
              controller: contentController,
              maxLines: null, // Allows for unlimited lines
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: 'Write your note here...',
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all<double>(5.0),
                ),
                onPressed: () {
                  if (widget.note == null) {
                    context.read<NoteDatabase>().addNote(
                        titleController.text, contentController.text, color);
                  } else {
                    context.read<NoteDatabase>().updateNote(widget.note!.id,
                        titleController.text, contentController.text, color);
                  }
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
