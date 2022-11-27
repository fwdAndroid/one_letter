import 'package:one_letter/splash.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_letter/provider/user_provider.dart';
import 'package:one_letter/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCz6Y5JetikS-08Qs8UA8TbRNFRqSGP7ZM",
            authDomain: "one-letter.firebaseapp.com",
            projectId: "one-letter",
            storageBucket: "one-letter.appspot.com",
            messagingSenderId: "675977751063",
            appId: "1:675977751063:web:ee2686263ef5b8efc80a52",
            measurementId: "G-Q47SDRNJC9"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'One Letters',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          // home:StreamBuilder(
          //   stream: FirebaseAuth.instance.authStateChanges(),
          //   builder: (context,snapshot){
          //     if(snapshot.connectionState == ConnectionState.active){
          //       if(snapshot.hasData){
          //         return  ResponsiveLayout(mobileScreenLayout: MobileScreenLayout(), webScreenLayout: WebScreenLayout());

          //       }else if(snapshot.hasError){
          //         return Center(
          //           child: Text("${snapshot.error}"),
          //         );
          //       }
          //     }
          //       if(snapshot.connectionState == ConnectionState.waiting){
          //          return Center(
          //            child: CircularProgressIndicator(),
          //          );
          //       }
          //       return const LoginScreen();
          //   },
          // )

          home: SplashScreen()),
    );
  }
}
