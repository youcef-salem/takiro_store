import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takiro_store/controlers/Data_base.dart';
import 'package:takiro_store/controlers/auth_conteroler.dart';
import 'package:takiro_store/model/product.dart';
import 'package:takiro_store/utilities/routes.dart';

class CardSale extends StatelessWidget {
  final Product product;
  final Size size;
  final String? section;

  const CardSale({
    super.key,
    required this.size,
    required this.product,
    this.section = "defult",
  });

  @override
  Widget build(BuildContext context) {
    final provi = Provider.of<fire_store_db>(context);
    final ct = Provider.of<auth_controler>(context);
    return InkWell(
      onTap:
          () => Navigator.of(context, rootNavigator: true).pushNamed(
            Routes.product_details,
            arguments: {'product': product, 'database': provi, 'auht_ct':ct},
          ),

      child: Container(
        width: size.width * 0.45,

        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      Image.network(
                        product.imageUrl,
                        width: size.width * 0.45,
                        height: size.height * 0.25,
                        fit: BoxFit.cover,
                      ),
                      Opacity(
                        opacity: 0.3,
                        child: Container(
                          width: size.width * 0.45,
                          height: size.height * 0.25,
                          color: Colors.grey,
                        ),
                      ),
                      product.discount != 0
                          ? Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(10),
                            child: Text(
                              "-${product.discount ?? 0}% ",
                              style: Theme.of(
                                context,
                              ).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          )
                          : SizedBox(),
                    ],
                  ),
                ),
                Row(
                  children: [
                    ...List.generate(
                      product.rating ?? 0,
                      (index) => const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                    ),
                    ...List.generate(
                      5 - (product.rating ?? 0),
                      (index) =>
                          const Icon(Icons.star, color: Colors.grey, size: 20),
                    ),
                    Text(
                      "(${product.numberOfReviews ?? 0})",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.category,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text.rich(
                  product.discount != 0
                      ? TextSpan(
                        text: "${product.price} \$",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          decoration: TextDecoration.lineThrough,
                        ),
                        children: [
                          TextSpan(
                            text:
                                "      ${product.discount == 0 ? product.price : product.price - ((product.price * (product.discount ?? 0)) / 100)} \$",
                            style: Theme.of(
                              context,
                            ).textTheme.headlineSmall?.copyWith(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      )
                      : TextSpan(
                        text:
                            "${product.discount == 0 ? product.price : product.price - ((product.price * (product.discount ?? 0)) / 100)} \$",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                        ),
                      ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: size.height * 0.22,
              child: SizedBox(
                width: 40,
                child: FloatingActionButton(
                  heroTag: 'fab_${product.id}_$section',
                  shape: CircleBorder(),
                  backgroundColor: Colors.white,
                  child: Icon(
                    product.is_favorite
                        ? Icons.favorite_sharp
                        : Icons.favorite_border,
                  ),
                  onPressed: () => provi.togle_fav(product),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
