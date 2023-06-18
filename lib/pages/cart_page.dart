import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:saba_fashion_store/provider/cart_provider.dart';
import 'package:saba_fashion_store/utils/cart_widget.dart';
import 'package:saba_fashion_store/utils/const.dart';
import 'package:saba_fashion_store/utils/my_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.05),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'C a r t',
          style: GoogleFonts.bebasNeue(fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: cart.products.length,
                    itemBuilder: (ctx, i) => CartWidget(
                        imageUrl: cart.products.values.toList()[i].imageUrl,
                        price: cart.products.values.toList()[i].price,
                        productId: cart.products.keys.toList()[i],
                        quantity: cart.products.values.toList()[i].quantity,
                        title: cart.products.values.toList()[i].title))),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: backgroundColor.withOpacity(0.2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Price',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$ ${cart.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(buttonText: 'Order', onTap: () {})
          ],
        ),
      ),
    );
  }
}
