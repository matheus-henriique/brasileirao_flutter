import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{


  @override
  Widget build(BuildContext context0){
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Brasileirão", textAlign: TextAlign.center,),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          // ListView.separated(itemBuilder: ["Nome"], separatorBuilder: separatorBuilder, itemCount: itemCount)
        ],
      ),
    );
  }
}