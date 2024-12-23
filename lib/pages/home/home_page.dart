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
        itemBuilder: (BuildContext context, int i){
          final List<Time> tabela = HomeController().tabela;

          return ListTile(
            leading: Image.network(tabela[i].brasao),
            title: Text(tabela[i].nome),
            trailing: Text(tabela[i].pontos.toString()),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TimePage(time: tabela[i]))),
          );
        }, 
        separatorBuilder: (context, i)=> Divider(), 
        itemCount: homeController.tabela.length,
        padding: EdgeInsets.all(16),
      )
    );
  }
}