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
  late TextEditingController colorController = TextEditingController();
  bool isTitleFocused = false;
  int isSelected = 1;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note?.title ?? '');
    contentController = TextEditingController(text: widget.note?.text ?? '');
    colorController =
        TextEditingController(text: widget.note?.color ?? 'default');

    switch (colorController.text) {
      case 'red':
        isSelected = 2;
        break;
      case 'orange':
        isSelected = 3;
        break;
      case 'green':
        isSelected = 4;
        break;
      case 'blue':
        isSelected = 5;
        break;
    }
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
                        colorController.text = 'default';
                        isSelected = 1;
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
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            radius: 15,
                          ),
                          if (isSelected == 1)
                            Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.primary,
                              size: 18,
                            ),
                        ],
                      ),
                    ),
                  ),

                  // Color 2 - red
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        colorController.text = 'red';
                        isSelected = 2;
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
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.redAccent,
                            radius: 15,
                          ),
                          if (isSelected == 2)
                            Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.primary,
                              size: 18,
                            ),
                        ],
                      ),
                    ),
                  ),

                  // Color 3 - orange
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        colorController.text = 'orange';
                        isSelected = 3;
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
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.orangeAccent,
                            radius: 15,
                          ),
                          if (isSelected == 3)
                            Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.primary,
                              size: 18,
                            ),
                        ],
                      ),
                    ),
                  ),

                  // Color 4 - green
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        colorController.text = 'green';
                        isSelected = 4;
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
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            radius: 15,
                          ),
                          if (isSelected == 4)
                            Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.primary,
                              size: 18,
                            ),
                        ],
                      ),
                    ),
                  ),

                  // Color 5 - blue
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        colorController.text = 'blue';
                        isSelected = 5;
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
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 15,
                          ),
                          if (isSelected == 5)
                            Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.primary,
                              size: 18,
                            ),
                        ],
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
                            colorController.text);
                      } else {
                        context.read<NoteDatabase>().updateNote(
                            widget.note!.id,
                            titleController.text,
                            contentController.text,
                            colorController.text);
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
