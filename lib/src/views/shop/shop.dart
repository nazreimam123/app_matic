import 'dart:developer';
import 'package:app_matic/src/provider/api_provider.dart';
import 'package:app_matic/src/provider/cart_provider.dart';
import 'package:app_matic/src/views/cart/cart.dart';
import 'package:app_matic/src/views/item_details/item_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  static const backgroundColor = Color(0xFF171221);
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<Api2Provider>(context, listen: false).fetchData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Api2Provider>(context);
    final provider2 = Provider.of<CartProvider>(context);
    print('length ${provider.items.length}');
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: backgroundColor,
        title: Text(
          'Shop',
          style: TextStyle(
            color: Colors.white,
            // fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
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
              provider2.cart.isNotEmpty
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
                            provider2.cart.length.toString(),
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
      body:
          provider.isloading
              ? Center(child: CircularProgressIndicator(color: Colors.white))
              : GridView.builder(
                itemCount: provider.items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  // childAspectRatio: (100 / 100),
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      log('message');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ItemDetails(items: provider.items[index]);
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 10, left: 8, right: 8),
                      height: 173,
                      width: 173,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 130,
                            width: 130,
                            child: Image.network(
                              provider.items[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            provider.items[index].title,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            '\$${provider.items[index].price.toString()}',
                            style: TextStyle(color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
