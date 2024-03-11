import 'package:flutter/material.dart';

class HomeHead extends StatelessWidget {
  const HomeHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image.asset(
            "assets/images/user.png",
            width: 72,
            height: 72,
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
                  "Hi",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Welcome",
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