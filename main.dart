//Simple To-Do List App
import 'dart:io';

class Todo {
  String task;
  bool isDone;

  Todo(this.task, [this.isDone = false]);

  @override
  String toString() => '${isDone ? "[x]" : "[ ]"} $task';
}

void main() {
  List<Todo> todoList = [];

  while (true) {
    print('\n--- Simple To-Do List ---');
    print('1. View Tasks');
    print('2. Add Task');
    print('3. Mark Task as Done');
    print('4. Delete Task');
    print('5. Exit');
    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        viewTasks(todoList);
        break;
      case '2':
        addTask(todoList);
        break;
      case '3':
        markTaskDone(todoList);
        break;
      case '4':
        deleteTask(todoList);
        break;
      case '5':
        print('Goodbye!');
        return;
      default:
        print('Invalid option. Please try again.');
    }
  }
}

void viewTasks(List<Todo> todoList) {
  if (todoList.isEmpty) {
    print('No tasks found.');
  } else {
    print('\nYour Tasks:');
    for (int i = 0; i < todoList.length; i++) {
      print('${i + 1}. ${todoList[i]}');
    }
  }
}

void addTask(List<Todo> todoList) {
  stdout.write('Enter a new task: ');
  String? task = stdin.readLineSync();
  if (task != null && task.isNotEmpty) {
    todoList.add(Todo(task));
    print('Task added!');
  } else {
    print('Task cannot be empty.');
  }
}

void markTaskDone(List<Todo> todoList) {
  if (todoList.isEmpty) {
    print('No tasks to mark as done.');
    return;
  }

  viewTasks(todoList);
  stdout.write('Enter the task number to mark as done: ');
  String? input = stdin.readLineSync();
  int? taskNumber = int.tryParse(input ?? '');

  if (taskNumber != null && taskNumber > 0 && taskNumber <= todoList.length) {
    todoList[taskNumber - 1].isDone = true;
    print('Task marked as done!');
  } else {
    print('Invalid task number.');
  }
}

void deleteTask(List<Todo> todoList) {
  if (todoList.isEmpty) {
    print('No tasks to delete.');
    return;
  }

  viewTasks(todoList);
  stdout.write('Enter the task number to delete: ');
  String? input = stdin.readLineSync();
  int? taskNumber = int.tryParse(input ?? '');

  if (taskNumber != null && taskNumber > 0 && taskNumber <= todoList.length) {
    todoList.removeAt(taskNumber - 1);
    print('Task deleted!');
  } else {
    print('Invalid task number.');
  }
}
