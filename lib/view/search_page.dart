import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _pesquisarController = TextEditingController();
  bool pesquisarClicado = false;
  String pesquisarText = '';
  List<String> itens = [
    'Lanche Natural',
    'Bolinho de Grão de Bico',
    'Crassaint',
    'Suco Natural de Laranja',
  ];

  List<String> filtroItens = [];
  @override
  void initState() {
    super.initState();
    filtroItens = List.from(itens);
  }

  void _onPesquisarChanged(String value) {
    setState(() {
      pesquisarText = value;
      myFiltrosItens();
    });
  }

  void myFiltrosItens() {
    if (pesquisarText.isEmpty) {
      filtroItens = List.from(itens);
    } else {
      filtroItens = itens
          .where((item) =>
              item.toLowerCase().contains(pesquisarText.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pesquisarClicado
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: _pesquisarController,
                  onChanged: _onPesquisarChanged,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      hintText: 'Pesquisar'),
                ),
              )
            : const Text(
                "Pesquisar",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  pesquisarClicado = !pesquisarClicado;
                  if (!pesquisarClicado) {
                    _pesquisarController.clear();
                    myFiltrosItens();
                  }
                });
              },
              icon: Icon(pesquisarClicado ? Icons.close : Icons.search))
        ],
      ),
      body: ListView.builder(
          itemCount: filtroItens.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(filtroItens[index]),
            );
          }),
    );
  }
}
