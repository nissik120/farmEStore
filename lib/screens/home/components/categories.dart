import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget{

  const Categories({
    Key key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> categories = ["Fish","Beef", "Chicken", "Dairy", "Cereals"];

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RichText(
                text: TextSpan(
                  text: 'See More',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  recognizer: TapGestureRecognizer()..onTap =(){
                    print('Launch Detailed Page');
                  },
                ),),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Wrap(
              spacing: 10.0,
              runSpacing: 6.0,
              children: List.generate(categories.length,
                    (index) => _buildChip(categories[index]),
              ),
            )],
          ),
        ],
      ),

    );
  }
  
  Widget _buildChip(String label){
    return Chip(
      backgroundColor: Colors.white,
      labelPadding: EdgeInsets.all(2.0),
      label: Text(
        label
      ),
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }

}