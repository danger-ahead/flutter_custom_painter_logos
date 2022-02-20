import 'package:flutter/material.dart';

import 'logos/beats.dart';
import '/logos/lg.dart';
import 'logos/gfg.dart';

void main() {
  runApp(const MyApp());
}

//root of our application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //all the logos
    List<Widget> logos = [const LG(), const Beats(), const GFG()];
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        //the background behind the logo should be white
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          //the widget that will be responsible for displaying the logo
          child: ListView.builder(
              itemCount: logos.length,
              itemBuilder: (context, i) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: logos[i]);
              }),
        ),
      ),
    );
  }
}
