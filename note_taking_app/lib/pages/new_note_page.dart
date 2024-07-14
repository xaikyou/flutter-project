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
  String color = "default";
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Color 1 - Default Color
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color = 'default';
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        radius: 15,
                      ),
                    ),
                  ),

                  // Color 2
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color = 'red';
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2.0,
                        ),
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 15,
                      ),
                    ),
                  ),

                  // Color 3
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color = 'orange';
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2.0,
                        ),
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.orangeAccent,
                        radius: 15,
                      ),
                    ),
                  ),

                  // Color 4
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color = 'green';
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2.0,
                        ),
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.greenAccent,
                        radius: 15,
                      ),
                    ),
                  ),

                  // Color 5
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color = 'blue';
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2.0,
                        ),
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 15,
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
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
                            titleController.text,
                            contentController.text,
                            color);
                      } else {
                        context.read<NoteDatabase>().updateNote(
                            widget.note!.id,
                            titleController.text,
                            contentController.text,
                            color);
                      }
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
