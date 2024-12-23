import 'package:flutter/material.dart';
import 'package:app_test_build/models/time.dart';

class TimePage extends StatefulWidget {
  Time time;
  TimePage({Key? key, required this.time}) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.time.cor,
        centerTitle: true,
        title: Text(widget.time.nome, style: TextStyle(color: Colors.white),),
      ),
    );
  }
}