import 'package:estore/screens/auth/authentication_service.dart';
import 'package:estore/screens/auth/sign_in_page.dart';
import 'package:estore/screens/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context)=> context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: LoaderScreen(),
      ),
    );
  }
}

class LoaderScreen extends StatefulWidget{
  @override
  _LoaderScreenState createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen>{
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds:6,
      navigateAfterSeconds: new AuthenticationWrapper(),
      image: new Image.asset("assets/images/tayanaLogo.png"),
      photoSize: 150,
      backgroundColor: Colors.white,
      loaderColor: Colors.amber,
    );
  }

}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if(firebaseUser!=null){
      return HomePage();
    }
    return SignInPage();
  }
  
}

