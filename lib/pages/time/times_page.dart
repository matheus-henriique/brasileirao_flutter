import 'package:app_test_build/models/titulo.dart';
import 'package:flutter/material.dart';
import 'package:app_test_build/models/time.dart';
import 'package:app_test_build/pages/titulo/add_titulo_page.dart';

class TimePage extends StatefulWidget {
  Time time;
  TimePage({Key? key, required this.time}) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage>{


  tituloPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> AddTituloPage(time: widget.time, onSave: this.addTitulo)));
  }

  addTitulo(Titulo titulo){
    setState((){
      widget.time.titulos.add(titulo);
    });

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Titulo adicionado com sucesso!", style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.green,
    ));
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
              Navigator.of(context).pop(); // Voltar para a tela anterior
            },
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
            unselectedLabelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.normal,),
            tabs: [
              Tab(icon: Icon(Icons.stacked_line_chart), text: "Jogadores",),
              Tab(icon: Icon(Icons.emoji_events), text: "Titulos",),
            ],
          ),
        ),
        body: TabBarView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(24), 
                child: Image.network(widget.time.brasao.replaceAll("40x40", "100x100"),
              )),
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
    final quantidade = widget.time.titulos.length;

    return quantidade == 0
            ? Center(
              child: Text("Nenhum titulo conquistado"),
            )
            : ListView.separated(itemBuilder: (BuildContext context, int index){
              return ListTile(
                leading: Icon(Icons.emoji_events),
                title: Text(widget.time.titulos[index].campeonato),
                trailing: Text(widget.time.titulos[index].ano.toString()),
              );
            }, separatorBuilder: (context, i)=>Divider(), itemCount: quantidade);
  }

}