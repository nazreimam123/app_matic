import 'dart:developer';

import 'package:app_matic/src/model/model.dart';
import 'package:app_matic/src/provider/cart_provider.dart';
import 'package:app_matic/src/views/cart/cart.dart';
import 'package:app_matic/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetails extends StatefulWidget {
  final Appmatic items;
  const ItemDetails({super.key, required this.items});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  static const backgroundColor = Color(0xFF171221);

  bool isCart = false;

  @override
  Widget build(BuildContext context) {
    final providercart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: backgroundColor,
        title: Text('Details', style: TextStyle(color: Colors.white)),
        centerTitle: true,

        actions: [
          Stack(
            children: [
              IconButton(
                iconSize: 35,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cart()),
                  );
                },
                icon: Icon(Icons.shopping_cart_outlined),
              ),
              providercart.cart.isNotEmpty
                  ? Positioned(
                    right: 12,
                    top: 4,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Cart()),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        radius: 8,
                        child: Center(
                          child: Text(
                            providercart.cart.length.toString(),
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.items.image,
              height: 350,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              widget.items.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            Text(
              // overflow: TextOverflow.,
              widget.items.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '\$${widget.items.price.toString()}',
                  style: TextStyle(color: Color(0xffA394C7)),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        text: isCart ? 'Go to cart' : 'Add to cart ',
        onPressed: () {
          if (isCart) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Cart()),
            );
          } else {
            providercart.addtocart(widget.items);

            setState(() {
              isCart = true;
            });
          }
        },
      ),
    );
  }
}
