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
    );
}}