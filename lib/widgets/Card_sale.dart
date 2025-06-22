

import 'package:flutter/material.dart';
import 'package:takiro_store/model/product.dart';

class CardSale extends StatefulWidget {
  final Product product;
  final Size size;
 
// Unique ID based on current time
  // Example image URL
   const CardSale({super.key, required this.size,
  required this.product,


  });

  @override
  State<CardSale> createState() => _CardSaleState();
}

class _CardSaleState extends State<CardSale> {
  bool click = false ;
  @override
  Widget build(BuildContext context) {
  
    return  Container(
      width: widget.size.width * 0.45,

      decoration: BoxDecoration(
// Rounded corners
      color: Colors.white

      ), // Take up 45% of screen width
      child: Stack(
        children:[ Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add some space at the top
            ClipRRect(
         borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
        
        
                  Hero(
                    tag: "the product id is ${widget.product.id}", // Unique hero tag for the product
                    child: Image.network(
                      widget.product.imageUrl,
                      width: widget.size.width * 0.45,
                      height: widget.size.height * 0.25,
                      fit: BoxFit.cover,
                      // Add a unique hero tag using the product's unique identifier
                      // Assuming product has an id
                    ),
                  ),
                  Opacity(
                    opacity: 0.3,
                    child: Container(
                      width: widget.size.width * 0.45,
                      height: widget.size.height * 0.25,
                      color:Colors.grey, // Semi-transparent overlay,
                    ),
                  ),
                     widget.product.discount !=0 ?
                  Container(
                   decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(10),
                    child: Text(
                      "-${ widget.product.discount ??0}% ",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
        
                  ):SizedBox()
                ],
              ),
            ),
           Row(
          children: [
          // Add some space on the left
             // Add some space on the left
            // Generate filled stars
            ...List.generate(widget.product.rating??0, (index) => const Icon(
        Icons.star,
        color: Colors.yellow,
        size: 20,
            )),
            // Generate empty stars
            ...List.generate(5 -( widget.product.rating??0), (index) => const Icon(
        Icons.star,
        color: Colors.grey,
        size: 20,
            )),
        Text(
          "(${widget.product.numberOfReviews ?? 0})",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        )
          ],
        )
             , Text(
              widget.product.name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
        
              ),),
               Text(
              widget.product.category,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
        
              ),)
              , Text.rich(


        widget.product.discount !=0?
        TextSpan(
          text:
          "${widget.product.price}"" \$",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            decoration: TextDecoration.lineThrough, // No strikethrough
          ),




                 children: [


    TextSpan(
    text:

    "      ${widget.product.discount ==0 ? widget.product.price:  widget.product.price - (
    (widget.product.price * (widget.product.discount??0  )) / 100

    ) }"" \$",
    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 15,
    decoration: TextDecoration.none, // Strikethrough
    ),)

               // Add some space between prices



                 ]
        ):TextSpan(
    text:

    "${widget.product.discount ==0 ? widget.product.price:  widget.product.price - (
    (widget.product.price * (widget.product.discount??0  )) / 100

    ) }"" \$",
    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 15,
    decoration: TextDecoration.none, // Strikethrough
    ),)
        
        ) ],
        ),
        Positioned(
        
                right: 0,
                    top: widget.size.height * 0.22,
                  child: SizedBox(
                    width: 40,
                    child: FloatingActionButton(
                      
                      shape:  CircleBorder(),
                        backgroundColor: Colors.white,
                        child : Icon(
                            click?   Icons.favorite : Icons.favorite_border
                    
                        )
                        ,
                        onPressed: (){
                    
                          setState(() {
                            click = !click; 
                          });
                    
                        }
                    
                    ),
                  ),
                ),
        ],
        
      ),
    );
  }
}