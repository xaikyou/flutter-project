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
  bool isTitleFocused = false;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note?.title ?? '');
    contentController = TextEditingController(text: widget.note?.text ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: TextField(
          controller: titleController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Title',
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TextField(
              controller: contentController,
              maxLines: null, // Allows for unlimited lines
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Write your note here...',
                hintStyle:
                    TextStyle(color: Theme.of(context).colorScheme.primary),
                contentPadding: const EdgeInsets.all(10),
                border: InputBorder.none,
              ),
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).colorScheme.primary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ButtonStyle(
                    elevation: WidgetStateProperty.all<double>(5.0),
                    shadowColor: WidgetStateProperty.all<Color>(
                        Theme.of(context).colorScheme.primary),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1.0),
                    ))),
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
                child: Text(
                  'Save',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
