import 'package:flutter/material.dart';
import 'package:takiro_store/model/product.dart';

class ProductDetails extends StatelessWidget {
  final Product pr;
 
  const ProductDetails({super.key, required this.pr, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            pr.name.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              pr.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ],
        ),
       









      ),
    );
  }
}
