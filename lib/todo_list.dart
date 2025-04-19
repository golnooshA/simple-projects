import 'package:calculator/component/todo_card.dart';
import 'package:calculator/design/design_color.dart';
import 'package:calculator/data/todo_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  _TodoListViewState createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  final List<TodoData> todos = [];
  final List<Color> colorList = [
    DesignColor.red,
    DesignColor.strongOrange,
    DesignColor.yellow,
    DesignColor.strongBlue,
    DesignColor.green,
    DesignColor.strongViolet,
  ];

  int colorIndex = 0;

  void _addTodo() {
    final now = DateTime.now();
    final formatted =
    DateFormat('HH:mm').format(now);
    String newTitle = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add New Task',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Enter task title',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  newTitle = value;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (newTitle.trim().isEmpty) return;
                  setState(() {
                    todos.add(
                      TodoData(
                        title: newTitle.trim(),
                        timestamp: formatted,
                        color: colorList[colorIndex % colorList.length],
                      ),
                    );
                    colorIndex++;
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void _toggleMood(int index) {
    setState(() {
      todos[index].isHappy = !todos[index].isHappy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        shape: CircleBorder(),
        onPressed: _addTodo,
        backgroundColor: DesignColor.pink,
        child: Icon(Icons.add, color: Colors.white, size: 40),
      ),
      // backgroundColor: DesignColor.background,
      appBar: AppBar(
        elevation: 1,
        title: const Text('To-do List', style: TextStyle(fontFamily: 'Roboto', fontSize: 30,fontStyle: FontStyle.italic)),
        backgroundColor: DesignColor.lightBlue,
        titleSpacing: 30,
        foregroundColor: DesignColor.darkDarkBlue,

      ),

      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (_) => _deleteTodo(index),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: TodoCard(
              cardNumber: index + 1,
              todoData: todo,
              isHappy: todo.isHappy,
              checkImage:
                  todo.isHappy
                      ? 'assets/images/yescheck.png'
                      : 'assets/images/nocheck.png',
              onTap: () => _toggleMood(index),
            ),
          );
        },
      ),
    );
  }
}
