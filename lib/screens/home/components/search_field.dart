import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget{

  const SearchField({
    Key key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: TextField(
          onChanged: (value)=> print(value),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Search product...",
              prefixIcon: Icon(Icons.search)),
      ),
    );
  }

}