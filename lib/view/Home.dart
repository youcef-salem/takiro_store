import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takiro_store/controlers/Data_base.dart';
import 'package:takiro_store/model/product.dart';
import 'package:takiro_store/utilities/image.dart';

import 'package:takiro_store/widgets/Card_sale.dart';
import 'package:takiro_store/widgets/spacer_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final data_base = Provider.of<fire_store_db>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Stack(
            children: [
              Image.asset(
                ImageUtil.banner_home,
                width: size.width,
                height: size.height * 0.3,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.3,
                child: Container(
                  width: size.width,
                  height: size.height * 0.3,
                  color: const Color.fromARGB(255, 2, 2, 2),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.only(top: 180, left: 20),
                  child: Text(
                    " Week Offer ",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SpacerHome(
            largetitle: "Sale",
            subtitle: "Best summer sales",
            textright: "view all",
            ontap: () => {},
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  products
                      .map(
                        (product) => Padding(
                          padding: const EdgeInsets.all(16),
                          child: CardSale(size: size, product: product),
                        ),
                      )
                      .toList(),
            ),
          ),
          SpacerHome(
            largetitle: "New",
            subtitle: "y'have seen it before",
            textright: "view all",
            ontap: () => {},
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,

            child: StreamBuilder(
              stream: data_base.stream_product(),
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (asyncSnapshot.hasError) {
                  return Center(child: Text('Error: ${asyncSnapshot.error}'));
                }
                if (!asyncSnapshot.hasData ||
                    asyncSnapshot.data == null ||
                    asyncSnapshot.data!.isEmpty) {
                  return const Center(child: Text("No product available"));
                }
                final list_products = asyncSnapshot.data!;
                return Row(
                  children:
                      list_products
                          .map(
                            (product) => Padding(
                              padding: const EdgeInsets.all(16),
                              child: CardSale(size: size, product: product),
                            ),
                          )
                          .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
