import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:estore/screens/auth/authentication_service.dart';

class HomeHeader extends StatelessWidget{

  const HomeHeader({
    Key key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MaterialButton(
            color: Colors.grey[50],
            onPressed: (){
              _showMyDialog(context);
            },
            child: Icon(Icons.account_circle, color: Color(0xFF324D6B),),
          ),
          SizedBox(width: 10,),
          RichText(
            text: TextSpan(
              text: 'Hi, John',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold
              ),
              recognizer: TapGestureRecognizer()..onTap =(){
                print('View Profile of logout');
              },
          ),),
          SizedBox(width: 15),
          IconButton(
              padding: EdgeInsets.all(8.0),
              color: Colors.amber,
              icon: Icon(Icons.shopping_cart),
              onPressed: (){
                print('To Cart');
              },
          )

        ],
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('User Logout'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want sign out?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Accept'),
              onPressed: () {
                Navigator.of(context).pop();
                context.read<AuthenticationService>().signOut();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}