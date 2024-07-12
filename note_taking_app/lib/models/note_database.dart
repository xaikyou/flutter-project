import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:note_taking_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  // Initialize database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  // Lists of notes
  final List<Note> currentNotes = [];

  // Create - a note and save to db
  Future<void> addNote(String title, String text, String color) async {
    final newNote = Note()
      ..title = title
      ..text = text
      ..color = color;

    // Save to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    // Re-read from db
    fetchNote();
  }

  // Read - notes from db
  Future<void> fetchNote() async {
    List<Note> fetchNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchNotes);
    notifyListeners();
  }

  // Update - a note in db
  Future<void> updateNote(
      int id, String title, String text, String color) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote
        ..title = title
        ..text = text
        ..color = color;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNote();
    }
  }

  // Delete - a note from db
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNote();
  }
}
