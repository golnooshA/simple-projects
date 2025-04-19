import 'package:calculator/component/todo_card.dart';
import 'package:calculator/design/design_color.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'component/round_button.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  _TodoListViewState createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){}, backgroundColor: Colors.pink,child: Icon(Icons.add, color: Colors.white,)),
      // backgroundColor: DesignColor.background,
      appBar: AppBar(
        title: const Text('To-do List', style: TextStyle(fontFamily: 'Roboto',)),
        backgroundColor: Colors.yellow,
      ),

      body: SingleChildScrollView(
        child: TodoCard(
          cardColor: DesignColor.green,
          cardNumber: 1,
          title: 'Helloooo',
          timestamp: "1045:4050",
          checkImage: 'assets/images/nocheck.png',
          onTap: (){},
        ),
      ),
    );
  }
}
