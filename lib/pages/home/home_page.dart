import 'package:app_test_build/models/time.dart';
import 'package:app_test_build/pages/home/home_controller.dart';
import 'package:app_test_build/pages/time/times_page.dart';
import 'package:app_test_build/repositories/times_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

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
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light
        ),
        title: Center(
          child: Text("Brasileirão", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Consumer<TimesRepository>(
        builder: (context, repository, child) {
          return ListView.separated(
            itemCount: repository.times.length,
            itemBuilder: (BuildContext context, int time){
              final List<Time> tabela = repository.times;
          
              return ListTile(
                leading: Image.network(tabela[time].brasao),
                title: Text(tabela[time].nome),
                subtitle: Text('Titulos: ${tabela[time].titulos.length}'),
                trailing: Text(tabela[time].pontos.toString()),
                onTap: () {
                  Get.to(() => TimePage(key: Key(tabela[time].nome), time: tabela[time]));
              });
            }, 
            separatorBuilder: (context, i)=> Divider(), 
            padding: EdgeInsets.all(16),
          );
        },
      )
    );
  }
}