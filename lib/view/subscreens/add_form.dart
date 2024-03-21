import 'package:flutter/material.dart';

class AddPageForm extends StatelessWidget {
  const AddPageForm({
    Key? key, 
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.validator,
    this.keyboardtype
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardtype;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 65,
        width: 310,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 5, 191, 171),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            keyboardType: keyboardtype,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(color: Color.fromARGB(206, 57, 15, 87)),
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: Icon(suffixIcon),
                      onPressed: () {
                        showDatePicker(context: context, firstDate: DateTime(2024), lastDate: DateTime(2100));
                      },
                    )
                  : null,
            ),
            controller: controller,
            validator: validator,
          ),
        ),
      ),
    );
  }
}
