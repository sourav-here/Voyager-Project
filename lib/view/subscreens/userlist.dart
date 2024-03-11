import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onpressed,
  });
  final Icon icon;
  final String text;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: ListTile(
          leading: icon,
          title: Text(
            text,
            style: const TextStyle(fontSize: 15),
          )),
    );
  }
}