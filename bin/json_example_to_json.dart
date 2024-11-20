import 'dart:convert';

/// Beispielklasse mit verschiedenen Properties.
class TaskItem {
  final String id;
  final String todo;
  final bool isDone;

  TaskItem({
    required this.id,
    required this.todo,
    required this.isDone,
  });

  // Wird benötigt, dass bei "print" auch was gutes angezeigt wird.
  @override
  String toString() {
    return "($id, $todo, $isDone)";
  }
}

void main() {
  final taskItem1 = TaskItem(
    id: "j2389278fh92",
    todo: "JSON lernen",
    isDone: false,
  );

  // Map aus unserem Objekt machen.
  final Map<String, dynamic> jsonMap = {
    "id": taskItem1.id,
    "todo": taskItem1.todo,
    "isDone": taskItem1.isDone,
  };

  final jsonEncoded = jsonEncode(jsonMap);

  // Den JSON-String ausgeben.
  print(jsonEncoded);
}
