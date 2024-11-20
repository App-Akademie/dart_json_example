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
  // String, der über mehrere Zeilen geht.
  // Hat beispielhaft den Inhalt unseres taskItem1.
  String taskItem1Json = """
  {
    "id": "j2389278fh92",
    "todo": "JSON lernen",
    "isDone": false
  }
  """;

  // Aus dem String eine Map machen, mit der wir arbeiten können.
  final jsonDecoded = jsonDecode(taskItem1Json);
  print(jsonDecoded["todo"]);

  // Objekt aus den Daten anlegen.
  final TaskItem taskItem = TaskItem(
    id: jsonDecoded["id"],
    todo: jsonDecoded["todo"],
    isDone: jsonDecoded["isDone"],
  );

  print(taskItem);
}
