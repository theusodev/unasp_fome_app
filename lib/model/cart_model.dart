import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartModel extends ChangeNotifier {
  // Lista de produtos
  final List<List<dynamic>> produtosItens = [
    ["Lanche Natural", "6.00", "assets/images/lanchenatural.png", "Nosso lanche natural, feito com ingredientes frescos, pão integral, proteínas magras e vegetais crocantes, oferece uma opção saudável e deliciosa para qualquer hora do dia.", "assets/images/lanchenaturaldetalhes.png", "Lanches"],
    ["Bolinho de Grão de Bico", "7.50", "assets/images/bolinhograodebico.png", "Nosso bolinho de grão de bico é uma opção saborosa e saudável, crocante por fora e macio por dentro, perfeito para qualquer ocasião.", "assets/images/bolinhodetalhes.png", "Lanches"],
    ["Croassaint", "6.00", "assets/images/croassaint.png", "Nosso croissant é leve, crocante e amanteigado, proporcionando uma experiência deliciosa e autêntica a cada mordida.", "assets/images/crossaintdetalhes.png", "Café da manhã"],
    ["Suco Natural de Laranja", "4.00", "assets/images/suconatural.png", "Suco de laranja natural, 100% puro, espremido na hora.", "assets/images/sucodetalhes.png", "Bebidas"],
    ["Suco Natural de Manga", "4.00", "assets/images/sucodemanga.jpg", "Suco de manga natural, 100% puro, feito com mangas frescas.", "assets/images/sucodemanga.jpg", "Bebidas"],
    ["Espaguete a Bolonhesa", "30.00", "assets/images/espaguete.png", "Espaguete a Bolonhesa, macarrão com carne é bom", "assets/images/espaguete.png", "Almoço"],
    ["Strogonoff Vegetariano", "25.00", "assets/images/strogonoff.png", "O nosso Strogonoff Vegetariano é uma combinação irresistível de cogumelos suculentos, legumes frescos e um molho cremoso que vai encantar seu paladar!", "assets/images/strogonoff.png", "Almoço"],
    ["Nhoque", "30.00", "assets/images/nhoque.jpeg", "Um incrível nhoque ao suculento molho pomodoro. Massa fresca.", "assets/images/nhoque.jpeg", "Janta"],
    ["Risoto", "35.00", "assets/images/risoto.jpeg", "Risoto cremoso de alho-poró e queijos finos.", "assets/images/risoto.jpeg", "Janta"],
    ["Pudim", "10.00", "assets/images/pudim.jpeg", "Pudim cremoso para adoçar a sua vida.", "assets/images/pudim.jpeg", "Sobremesas"],
    ["Tiramisu", "15.00", "assets/images/tiramisu.jpeg", "Um sofisticado doce italiano a base de café", "assets/images/tiramisu.jpeg", "Sobremesas"],
  ];

  // Lista de produtos no carrinho e suas quantidades
  Map<List<dynamic>, int> _itensCart = {};

  // Lista de pedidos feitos
  List<Map<List<dynamic>, int>> _historicoPedidos = [];

  // Getter para itens no carrinho
  Map<List<dynamic>, int> get items => _itensCart;

  // Getter para histórico de pedidos
  List<Map<List<dynamic>, int>> get historicoPedidos => _historicoPedidos;

  // Adicionar no carrinho
  void addItem(List<dynamic> item) {
    if (_itensCart.containsKey(item)) {
      _itensCart[item] = _itensCart[item]! + 1;
    } else {
      _itensCart[item] = 1;
    }
    notifyListeners();
  }

  // Remover do carrinho
  void removeItem(List<dynamic> item) {
    if (_itensCart.containsKey(item) && _itensCart[item]! > 1) {
      _itensCart[item] = _itensCart[item]! - 1;
    } else {
      _itensCart.remove(item);
    }
    notifyListeners();
  }

  // Calcular preço total do carrinho
  String calcularTotal() {
    double precoTotal = 0;
    _itensCart.forEach((item, quantidade) {
      precoTotal += double.parse(item[1]) * quantidade;
    });
    return precoTotal.toStringAsFixed(2);
  }

  // Calcular preço total de um pedido específico
  String calcularTotalPedido(Map<List<dynamic>, int> pedido) {
    double precoTotal = 0;
    pedido.forEach((item, quantidade) {
      precoTotal += double.parse(item[1]) * quantidade;
    });
    return precoTotal.toStringAsFixed(2);
  }

  // Confirmar pedido e adicionar ao histórico
  Future<void> confirmarPedido() async {
    if (_itensCart.isNotEmpty) {
      _historicoPedidos.add(Map.from(_itensCart));

      // Salvar pedido no Firestore
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(user.uid)
            .collection('historicoPedidos')
            .add({
          'pedido': _itensCart.map((key, value) => MapEntry(key[0], value)),
          'data': Timestamp.now(),
        });
      }

      _itensCart.clear();
      notifyListeners();
    }
  }

  // Carregar histórico de pedidos do Firestore
  Future<void> carregarHistoricoPedidos() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .collection('historicoPedidos')
          .orderBy('data', descending: true)
          .get();

      _historicoPedidos = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        Map<List<dynamic>, int> pedido = {};
        data['pedido'].forEach((key, value) {
          List<dynamic> item = produtosItens.firstWhere((element) => element[0] == key);
          pedido[item] = value;
        });
        return pedido;
      }).toList();
      notifyListeners();
    }
  }

  // Repetir pedido
  void refazerPedido(Map<List<dynamic>, int> pedido) {
    _itensCart = Map.from(pedido);
    notifyListeners();
  }

  // Obter quantidade de um item
  int getQuantidade(String itemNome) {
    for (var item in _itensCart.keys) {
      if (item[0] == itemNome) {
        return _itensCart[item]!;
      }
    }
    return 0;
  }
}
