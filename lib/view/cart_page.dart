import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/model/cart_model.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Meu carrinho",
        style: TextStyle(fontSize: 36,
        fontWeight: FontWeight.bold),),
      ),
      body: Consumer<CartModel>(builder: (context, value, child) {
        return Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //lista de itens do carrinho
          Expanded(child: ListView.builder(
            itemCount: value.itensCart.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black, width: 1)
                  ),
                  child: ListTile(
                    leading: Image.asset(value.itensCart[index][2], height: 36,),
                    title: Text(value.itensCart[index][0]),
                    subtitle: Text('R\$ ' + value.itensCart[index][1]),
                    trailing: IconButton(icon: Icon(Icons.cancel),
                    onPressed: () => 
                    Provider.of<CartModel>(context, listen: false)
                    .removeItens(index)),
                  ),
                ),
              );
            })),

            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey,
                borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //preço
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Valor total",
                        style: TextStyle(color: Colors.black,
                        fontSize: 14)),
                        
                        SizedBox(height: 4),

                        Text("R\$ " + value.calcularTotal(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),)

                      ],
                    ),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: const [
                          Text("Pagar",
                          style: TextStyle(color: Colors.black),),
                          Icon(Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.black,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        ],
      );
      },)
    );
  }
}