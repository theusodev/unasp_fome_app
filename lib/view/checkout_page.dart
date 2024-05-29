import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unasp_fome_app/model/cart_model.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _type = 1;

  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Pagamento",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return SafeArea(
                child: Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: size.width,
                      height: 55,
                      //margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          border: _type == 1
                              ? Border.all(width: 1, color: Colors.orange)
                              : Border.all(width: 0.3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor: Colors.orange,
                                ),
                                Text("Débito",
                                    style: _type == 1
                                        ? TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)
                                        : TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey)),
                              ],
                            ),
                            Icon(Icons.credit_card)
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: size.width,
                      height: 55,
                      //margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          border: _type == 2
                              ? Border.all(width: 1, color: Colors.orange)
                              : Border.all(width: 0.3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor: Colors.orange,
                                ),
                                Text("Crédito",
                                    style: _type == 2
                                        ? TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)
                                        : TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey)),
                              ],
                            ),
                            Icon(Icons.credit_card)
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: size.width,
                      height: 55,
                      //margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          border: _type == 3
                              ? Border.all(width: 1, color: Colors.orange)
                              : Border.all(width: 0.3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor: Colors.orange,
                                ),
                                Text("Dinheiro",
                                    style: _type == 3
                                        ? TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)
                                        : TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey)),
                              ],
                            ),
                            Icon(Icons.money)
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: size.width,
                      height: 55,
                      //margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          border: _type == 4
                              ? Border.all(width: 1, color: Colors.orange)
                              : Border.all(width: 0.3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 4,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor: Colors.orange,
                                ),
                                Text("Pix",
                                    style: _type == 4
                                        ? TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black)
                                        : TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey)),
                              ],
                            ),
                            Icon(Icons.qr_code)
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total: ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                        Text(
                          "R\$ " + value.calcularTotal(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Divider(height: 16, color: Colors.black),
                    SizedBox(height: 50),

                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            "Confirmar pagamento",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          )),
                    )

                    //parei a construçã aqui
                    //video referencia: https://www.youtube.com/watch?v=RERkUPqh71Y
                  ],
                ),
              ),
            ));
          },
        ));
  }
}
