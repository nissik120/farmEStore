import 'package:estore/screens/auth/authentication_service.dart';
import 'package:estore/screens/home/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavigationBar(

      ),
    );
  }
}