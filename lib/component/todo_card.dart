import 'package:calculator/data/todo_data.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {

  final TodoData todoData;
  final int cardNumber;
  final String checkImage;
  final VoidCallback onTap;
  final bool isHappy;

  const TodoCard({
    super.key,
    required this.onTap,
    required this.checkImage,
    this.isHappy = false,
    required this.cardNumber,
    required this.todoData
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        margin: EdgeInsets.only(top: 20, left: 30, right: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: todoData.color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              // color: Colors.grey,
              child: Text(
                cardNumber.toString(),
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todoData.title,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    todoData.timestamp,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Image.asset(
                checkImage, // your image path
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
