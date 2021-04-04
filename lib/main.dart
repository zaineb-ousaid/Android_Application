import 'package:flutter/material.dart';
import 'package:flutter_app/pages/contacts.page.dart';
import 'package:flutter_app/pages/counter.page.dart';
import 'package:flutter_app/pages/gallery.page.dart';
import 'package:flutter_app/pages/home.page.dart';
import 'package:flutter_app/pages/meteo.page.dart';
void main(){
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/":(context)=>HomePage(),
        "/counter": (context)=>CounterPage(),
        "/contacts": (context)=>ContactsPage(),
        "/meteo": (context)=>MeteoPage(),
        "/gallery": (context)=>GalleryPage()

      },
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize:20, color: Colors.lightGreenAccent)
        )
      ),
    );
  }
}

