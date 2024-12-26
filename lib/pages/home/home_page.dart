import 'package:app_test_build/models/time.dart';
import 'package:app_test_build/pages/home/home_controller.dart';
import 'package:app_test_build/pages/time/times_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  late HomeController homeController;

  @override
  void initState(){
    super.initState();
    homeController = HomeController();
  }

  @override
  Widget build(BuildContext context0){
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Brasileirão", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
        ),
        backgroundColor: Colors.purple,
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int time){
          final List<Time> tabela = HomeController().tabela;

          return ListTile(
            leading: Image.network(tabela[time].brasao),
            title: Text(tabela[time].nome),
            trailing: Text(tabela[time].pontos.toString()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TimePage(key: Key(tabela[time].nome), time: tabela[time]))),
          );
        }, 
        separatorBuilder: (context, i)=> Divider(), 
        itemCount: homeController.tabela.length,
        padding: EdgeInsets.all(16),
      )
    );
  }
}