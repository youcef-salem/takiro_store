import 'package:flutter/material.dart';
import 'package:takiro_store/controlers/Data_base.dart';
import 'package:takiro_store/model/product.dart';
import 'package:takiro_store/widgets/mainbutton.dart';

class ProductDetails extends StatefulWidget {
  final Product pr;

  const ProductDetails({super.key, required this.pr});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fire_store_db data_bs = fire_store_db(uuid: widget.pr.id);
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
                              data_bs.togle_fav(widget.pr);
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
                decoration: BoxDecoration(
                  color:Colors.white,
                ),
                child: Center(
                  child: Mainbutton(txt: "Add to Card ", onPressed: () {},
                  border_rdios: 40.0,
                  height: 60,
                  widh: size.width*0.85,
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
