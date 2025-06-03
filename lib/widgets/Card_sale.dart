import 'package:flutter/material.dart';

class CardSale extends StatefulWidget {
  final Size size;
  String  imageUrl ;

  int numberstar; 
  int persone_evaliue ; 
  String product_name ;
  String product_category ;  // Default product name, can be changed later
  int prev_price ; 
  int new_price ;
// Unique ID based on current time
  // Example image URL
   CardSale({super.key, required this.size,
  required this.imageUrl,

required this.numberstar
,required this.persone_evaliue,
required this.product_name,
required this.product_category,
required this.prev_price,
required this.new_price,
  });

  @override
  State<CardSale> createState() => _CardSaleState();
}

class _CardSaleState extends State<CardSale> {
  bool click = false ;
  @override
  Widget build(BuildContext context) {
    int purcentage = ((widget.prev_price - widget.new_price) / widget.prev_price * 100).round();
    return Container(
      width: widget.size.width * 0.45,

      decoration: BoxDecoration(
// Rounded corners
      color: Colors.white

      ), // Take up 45% of screen width
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add some space at the top
          ClipRRect(
       borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [


                Image.asset(
                  widget.imageUrl,
                  width: widget.size.width * 0.45,
                  height: widget.size.height * 0.25, // Adjust height as needed
                  fit: BoxFit.cover,
                ),
                Opacity(
                  opacity: 0.3,
                  child: Container(
                    width: widget.size.width * 0.45,
                    height: widget.size.height * 0.25,
                    color:Colors.grey, // Semi-transparent overlay,
                  ),
                ),
                  Positioned(

                 top: 200,left: widget.size.width * 0.34 ,
                  child: FloatingActionButton(
                    shape:  CircleBorder(),
                      backgroundColor: Colors.white,
                      child : Icon(
                          click?   Icons.favorite : Icons.favorite_border
                  
                      )
                      ,
                      onPressed: (){
                  
                        setState(() {
                          click = true ;
                        });
                  
                      }
                  
                  ),
                ),
                Container(
                 decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    "-$purcentage% ",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                )
              ],
            ),
          ),
         Row(
  children: [
    const SizedBox(width: 10), // Add some space on the left
     // Add some space on the left
    // Generate filled stars
    ...List.generate(widget.numberstar, (index) => const Icon(
      Icons.star,
      color: Colors.yellow,
      size: 20,
    )),
    // Generate empty stars
    ...List.generate(5 - widget.numberstar, (index) => const Icon(
      Icons.star,
      color: Colors.grey,
      size: 20,
    )),
      Text(
        "(${widget.persone_evaliue})",
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      )
  ],
)
           , Text(
            widget.product_name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.bold,

            ),),
             Text(
            widget.product_category,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,

            ),)
            , Row(

              children: [
                Text(
                  "${widget.prev_price}"" \$",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.lineThrough, // No strikethrough
                  ),
                ),
                SizedBox(width: 10), // Add some space between prices
                Text(
                  "${widget.new_price}"" \$",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    decoration: TextDecoration.none, // Strikethrough
                  ),
                ),
              ],
            ),


        ],
      ),
    );
  }
}