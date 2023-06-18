// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:saba_fashion_store/pages/products_detailed_page.dart';
import 'package:saba_fashion_store/provider/cart_provider.dart';
import 'package:saba_fashion_store/utils/const.dart';

import '../provider/product_model.dart';

class ProductsTile extends StatelessWidget {
  const ProductsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final product = Provider.of<Product>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 10, right: 5),
      child: Container(
        // height: 500,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor.withOpacity(0.2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ProductsDetail.routeName,
                      arguments: product.id);
                },
                child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(product.imagePath),
                            fit: BoxFit.cover)),
                    child: Consumer(
                      builder: (context, value, child) => Container(
                        alignment: const Alignment(1, -1),
                        child: IconButton(
                          onPressed: () {
                            product.toggleFavourite();
                          },
                          icon: Icon(product.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border),
                          color: Colors.red,
                          iconSize: 28,
                        ),
                      ),
                    )),
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              product.name,
              style: GoogleFonts.bebasNeue(
                  color: const Color(0xff424874), fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                product.decs,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff424874)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'MRP : \$ ${product.price}',
                    style: GoogleFonts.bebasNeue(
                        color: const Color(0xff424874), fontSize: 18),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        color: Colors.black),
                    child: Center(
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {
                          cart.addProduct(product.id.toString(), product.price,
                              product.name, product.imagePath);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Item added to Cart'),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                                label: 'UNDO',
                                onPressed: () {
                                  cart.removeSingleItems(product.id);
                                }),
                          ));
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
