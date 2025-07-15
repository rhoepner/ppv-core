import 'package:uuid/uuid.dart';

class Commit {
  final String id = Uuid().v7();
  DateTime timestamp = DateTime.now();
  String sub = "";
  String author = "";
}