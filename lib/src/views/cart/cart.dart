import 'dart:developer';

import 'package:app_matic/src/provider/cart_provider.dart';
import 'package:app_matic/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  static const backgroundColor = Color(0xFF171221);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    final finalList = provider.cart;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: backgroundColor,
        title: Text('Cart', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body:
          finalList.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Spacer(),
                    Lottie.asset('assets/images/empty.json'),
                    Text(
                      'Your Cart is Empty',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 140.h),
                    // Spacer(),
                  ],
                ),
              )
              : ListView.builder(
                itemCount: finalList.length,

                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(finalList[index].image),
                    ),
                    title: Text(
                      overflow: TextOverflow.ellipsis,
                      finalList[index].title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      '\$${finalList[index].price.toString()}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: SizedBox(
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              provider.remove(index);
                            },
                            icon: Icon(Icons.remove, color: Colors.white),
                          ),
                          Text(
                            finalList[index].quantity.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {
                              provider.add(index);
                            },
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      floatingActionButton: Text(
        'Total Price : \$${provider.totalPriceValue.toStringAsFixed(2)}',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: CustomButton(text: 'Buy Now ', onPressed: () {}),
    );
  }
}
