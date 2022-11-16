import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_firebase_teste/main.dart';

import 'home.dart';

class AlterarExcluir extends StatefulWidget {
  DocumentSnapshot docid;
  AlterarExcluir({required this.docid});

  @override
  State<AlterarExcluir> createState() => _AlterarExcluirState();
}

class _AlterarExcluirState extends State<AlterarExcluir> {
  TextEditingController Nome = TextEditingController();
  TextEditingController Telefone = TextEditingController();
  TextEditingController CPF = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Endereco = TextEditingController();

  @override
  void initState() {
    Nome = TextEditingController(text: widget.docid.get('Nome'));
    Telefone = TextEditingController(text: widget.docid.get('Telefone'));
    CPF = TextEditingController(text: widget.docid.get('CPF'));
    Email = TextEditingController(text: widget.docid.get('Email'));
    Endereco = TextEditingController(text: widget.docid.get('Endereço'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'Nome': Nome.text,
                'Telefone': Telefone.text,
                'CPF': CPF.text,
                'Email': Email.text,
                'Endereço':Endereco.text,
              }).whenComplete(() => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Home())));
            },
            child: Text('Atualizar'),
          ),
                    MaterialButton(
            onPressed: () {
             widget.docid.reference.delete().whenComplete(() => 
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Home())));
            },
            child: Text('Apagar'),
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
                controller: Email,
                decoration: InputDecoration(hintText: 'Email'),
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
                controller: Telefone,
                expands: true,
                maxLines: null,
                decoration: InputDecoration(hintText: 'Telefone'),
              ),
            ))
          ],
        ),
      ),
    );
  }

}

