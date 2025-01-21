import 'package:app_test_build/models/titulo.dart';
import 'package:app_test_build/repositories/times_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EditTituloPage extends StatefulWidget {
  Titulo titulo;
  EditTituloPage({super.key, required this.titulo});

  @override
  _EditTituloPageState createState() => _EditTituloPageState();
}

class _EditTituloPageState extends State<EditTituloPage> {

    final _campeonato = TextEditingController();
    final _ano = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    @override
    void initState() {
        super.initState();
        _campeonato.text = widget.titulo.campeonato;
        _ano.text = widget.titulo.ano.toString();
    }

    editar() {
        Provider.of<TimesRepository>(context, listen: false).editTitulo(
            titulo: widget.titulo, 
            campeonato: _campeonato.text, 
            ano: _ano.text
        );

        Get.back();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Editar Titulo', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.grey[800],
        actions: [IconButton(icon: Icon(Icons.check), onPressed: editar, color: Colors.white,)],
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white), // Ícone customizado
            onPressed: () {
              Get.back(); // Voltar para a tela anterior
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
          ],
        )
      ),
    );
  }
}