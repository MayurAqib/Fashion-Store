import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saba_fashion_store/provider/cart_provider.dart';
import 'package:saba_fashion_store/utils/const.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartWidget extends StatelessWidget {
  const CartWidget(
      {super.key,
      required this.imageUrl,
      required this.price,
      required this.productId,
      required this.quantity,
      required this.title});
  final String productId;
  final String imageUrl;
  final String title;
  final double price;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                  title: const Text('Are you sure'),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(color: Colors.black),
                          )),
                      TextButton(
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false)
                                .removeItemfromCart(productId);
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  )),
            );
          },
          child: Container(
            height: 97,
            width: 100,
            decoration: BoxDecoration(
                color: backgroundColor, borderRadius: BorderRadius.circular(8)),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        )
      ]),
      child: Card(
        color: backgroundColor.withOpacity(0.03),
        shadowColor: backgroundColor.withOpacity(0.1),
        child: ListTile(
          leading: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: 60,
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              Text('per item: \$ $price'),
              const SizedBox(width: 12),
              Text(
                'x $quantity',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Total'),
              Text(
                '\$ ${price * quantity}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
