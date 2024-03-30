import 'package:flutter/material.dart';


class SearchBox extends StatelessWidget {
  final Function(String) onSearchTextChanged;

  const SearchBox({Key? key, required this.onSearchTextChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          onChanged: onSearchTextChanged,
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(
                  fontSize: 16, color: Color.fromRGBO(174, 213, 210, 1)),
              contentPadding: EdgeInsets.all(16),
              suffixIcon: Icon(Icons.search_rounded)),
        ));
  }
}