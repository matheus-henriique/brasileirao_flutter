import 'package:app_test_build/models/titulo.dart';
import 'package:app_test_build/pages/titulo/edit_titulo_page.dart';
import 'package:app_test_build/repositories/times_repository.dart';
import 'package:app_test_build/widgets/brasao.dart';
import 'package:flutter/material.dart';
import 'package:app_test_build/models/time.dart';
import 'package:app_test_build/pages/titulo/add_titulo_page.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class TimePage extends StatefulWidget {
  Time time;
  TimePage({Key? key, required this.time}) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage>{


  tituloPage(){
    Get.to(() => AddTituloPage(time: widget.time));
  }

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time.cor,
          centerTitle: true,
          title: Text(widget.time.nome, style: TextStyle(color: Colors.white),),
          actions: [IconButton(onPressed: tituloPage, icon: Icon(Icons.add), color: Colors.white)],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white), // Ícone customizado
            onPressed: () {
              Get.back(); // Voltar para a tela anterior
            },
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
            unselectedLabelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.normal,),
            tabs: [
              Tab(icon: Icon(Icons.stacked_line_chart), text: "Estatiscas",),
              Tab(icon: Icon(Icons.emoji_events), text: "Titulos",),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(24), 
                  child: Brasao( 
                    image:  widget.time.brasao,
                    width: 100,
                  ),
                ),
                Text(
                  "Pontos: ${widget.time.pontos}", 
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            titulos()
        ]),
      ),
    );
  }

  Widget titulos(){
    final time = Provider.of<TimesRepository>(context).times.firstWhere((t)=> t.nome == widget.time.nome);
    final quantidade = time.titulos.length;

    return quantidade == 0
            ? Center(
              child: Text("Nenhum titulo conquistado"),
            )
            : ListView.separated(itemBuilder: (BuildContext context, int index){
              return ListTile(
                leading: Icon(Icons.emoji_events),
                title: Text(time.titulos[index].campeonato),
                trailing: Text(time.titulos[index].ano.toString()),
                onTap: () {
                  Get.to(
                    EditTituloPage(titulo: time.titulos[index]),
                    fullscreenDialog: true
                  );
                },
              );
            }, separatorBuilder: (context, i)=>Divider(), itemCount: quantidade);
  }

}