import 'package:flutter/material.dart';

class ConfirmHead extends StatelessWidget {
  const ConfirmHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClipOval(
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "assets/images/ok.jpg",
                width: 72,
                height: 72,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        const Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yay..",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Let's go...",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
        Expanded(
          child: Container(
            alignment: Alignment.topRight,
            child: Image.asset(
              "assets/images/menu.png",
              width: 28,
              height: 28,
            ),
          ),
        )
      ],
    );
  }
}