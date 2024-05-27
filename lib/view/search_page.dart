import 'package:flutter/material.dart';
import 'package:unasp_fome_app/common/produtos_view.dart';
import 'package:unasp_fome_app/model/cart_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _pesquisarController = TextEditingController();
  bool pesquisarClicado = false;
  String pesquisarText = '';
  CartModel cartModel = CartModel();
  List<List<dynamic>> filtroItens = [];

  @override
  void initState() {
    super.initState();
    filtroItens = List<List<dynamic>>.from(cartModel.produtosItens);
  }

  void _onPesquisarChanged(String value) {
    setState(() {
      pesquisarText = value;
      myFiltrosItens();
    });
  }

  void myFiltrosItens() {
    if (pesquisarText.isEmpty) {
      filtroItens = List.from(cartModel.produtosItens);
    } else {
      filtroItens = cartModel.produtosItens
          .where((item) =>
              item[0].toLowerCase().contains(pesquisarText.toLowerCase()))
          .map((item) => item as List<dynamic>) // map para garantir o tipo correto
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //essa é a view da tela de pesquisa
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
                    contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    hintText: 'Pesquisar',
                  ),
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
            icon: Icon(pesquisarClicado ? Icons.close : Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Text(
                    "Pesquisas",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(16)),
            Container(
              height: 150,
              width: 380,
              decoration: 
              BoxDecoration(
                border: Border.all(
                    color: Colors.black,
                    width: 1), // Define a cor e a largura da borda
                borderRadius: BorderRadius.circular(
                    12), // Adicione um raio para bordas arredondadas, se desejar
              ),
              child: SizedBox(
                child: ListView.builder(
                  itemCount: filtroItens.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(filtroItens[index][0]),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Text(
                    "Categorias",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/cafedamanha.png',
                      width: 286,
                      height: 101,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/almoco.png',
                      width: 286,
                      height: 101,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/lanches.png',
                      width: 286,
                      height: 101,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/janta.png',
                      width: 286,
                      height: 101,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/bebidas.png',
                      width: 286,
                      height: 101,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/sobremesas.png',
                      width: 286,
                      height: 101,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
