import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_firebase_teste/main.dart';

class Adicionar extends StatelessWidget {
  TextEditingController Nome = TextEditingController();
  TextEditingController Telefone = TextEditingController();
  TextEditingController CPF = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Endereco = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection("Alunos");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                'Nome': Nome.text,
                'CPF': CPF.text,
                'Email': Email.text,
                'Telefone': Telefone.text,
                'Endereço': Endereco.text,
              }).whenComplete(() => 
              Navigator.pushReplacement(context, 
              MaterialPageRoute(builder: (_)=> Home())));
            },
            child: Text('Salvar'),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: Nome,
                decoration: InputDecoration(hintText: 'Nome'),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: CPF,
                decoration: InputDecoration(hintText: 'CPF'),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: Telefone,
                decoration: InputDecoration(hintText: 'Telefone'),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: Endereco,
                decoration: InputDecoration(hintText: 'Endereço'),
              ),
            ),
            Expanded(
                child: Container(
              child: TextField(
                controller: Email,
                decoration: InputDecoration(hintText: 'Email'),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
