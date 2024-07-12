import 'package:isar/isar.dart';

part 'note.g.dart';

@Collection()
class Note {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  late String title;
  late String text;
  late String color;
}
