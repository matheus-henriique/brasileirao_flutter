import 'package:app_test_build/models/time.dart';
import 'package:app_test_build/models/titulo.dart';
import 'package:flutter/material.dart';

class AddTituloPage extends StatefulWidget {
  Time time;
  ValueChanged<Titulo> onSave;

  AddTituloPage({Key? key, required this.time, required this.onSave}) : super(key: key);

  @override
  _AddTituloPageState createState() => _AddTituloPageState();
}

class _AddTituloPageState extends State<AddTituloPage>{
  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Adicionar Titulo", style: TextStyle(color: Colors.white)),
        backgroundColor: widget.time.cor,
         leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white), // Ícone customizado
            onPressed: () {
              Navigator.of(context).pop(); // Voltar para a tela anterior
            },
          ),
      ),
      body: Form(
        key: _formKey, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(24),
            child: TextFormField(
              controller: _ano,
              decoration: InputDecoration(
                labelText: "Ano",
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
              validator: (value){
                if(value!.isEmpty){
                  return "Campo obrigatório";
                }
                return null;
              },
            ),
            ),

            Padding(padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: TextFormField(
              controller: _campeonato,
              decoration: InputDecoration(
                labelText: "Campeonato",
                border: OutlineInputBorder()
              ),
              validator: (value){
                if(value!.isEmpty){
                  return "Informe qual o campeonato!";
                }
                return null;
              },
            ),
            ),
            Expanded(child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(24.0),
              child: ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState?.validate() == true){
                    widget.onSave(Titulo(
                      campeonato: _campeonato.text,
                      ano: _ano.text
                    )); 
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.time.cor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.all(16.0),
                    child: Text("Salvar", style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ))
          ],
        )),
    );
}}