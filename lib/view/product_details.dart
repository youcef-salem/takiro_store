import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takiro_store/controlers/Data_base.dart';
import 'package:takiro_store/controlers/auth_conteroler.dart';
import 'package:takiro_store/model/add_tocard.dart';
import 'package:takiro_store/model/product.dart';
import 'package:takiro_store/services/Auth.dart';
import 'package:takiro_store/utilities/constants.dart';
import 'package:takiro_store/widgets/drop_dow_menu.dart';
import 'package:takiro_store/widgets/mainbutton.dart';

class ProductDetails extends StatefulWidget {
  final Product pr;
  final fire_store_db db;
  final auth_controler ct;
  const ProductDetails({super.key, required this.pr, required this.db,
  required this.ct
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Future<void> ontap(String size) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);

      if (auth.currentUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please login to add items to cart')),
        );
        return;
      }

      final add_tocard_product = AddTocard(
        size: size,
        id: doc_id_localdb(),
        price: widget.pr.price,
        name: widget.pr.name,
        category: widget.pr.category,
        imageUrl: widget.pr.imageUrl,
        pr_id: widget.pr.id,
      );
      await widget.db.add_tocard(add_tocard_product,widget.ct.get_uuid());
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Added to cart successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to add to cart: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.pr.name.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.pr.imageUrl,
              width: double.infinity,
              height: size.height * 0.45,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 150, child: DropDowMenu()),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: IconButton(
                        onPressed:
                            () => setState(() {
                              widget.db.togle_fav(widget.pr);
                            }),
                        icon: Icon(
                          widget.pr.is_favorite
                              ? Icons.favorite_sharp
                              : Icons.favorite_border,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.pr.name,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "\$${widget.pr.price} ",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.pr.category,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ...List.generate(
                        widget.pr.rating ?? 0,
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                      ),
                      ...List.generate(
                        5 - (widget.pr.rating ?? 0),
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                      Text(
                        "(${widget.pr.numberOfReviews ?? 0})",
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
                  SizedBox(height: 10),
                  Text(
                    widget.pr.description ?? "",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height * 0.14,
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: Mainbutton(
                    txt: "Add to Card ",
                    onPressed: () async => ontap('size'),
                    border_rdios: 40.0,
                    height: 60,
                    widh: size.width * 0.85,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
