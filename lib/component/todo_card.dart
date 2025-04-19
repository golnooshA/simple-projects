import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final int cardNumber;
  final String title;
  final String timestamp;
  final Color cardColor;

  final String checkImage;
  final VoidCallback onTap;

  const TodoCard({
    Key? key,
    required this.cardNumber,
    required this.title,
    required this.timestamp,
    required this.onTap,
    required this.checkImage, required this.cardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: cardColor,
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
                style: TextStyle(fontFamily: 'Roboto', fontSize: 30,
                  color: Colors.white),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
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
                    timestamp,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(fontFamily: 'Roboto', fontSize: 16, color: Colors.white),
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
