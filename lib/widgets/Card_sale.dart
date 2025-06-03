import 'package:flutter/material.dart';

class CardSale extends StatelessWidget {
  final Size size;
  String  imageUrl ;
  int purcentage ; 
  int numberstar; 
  int persone_evaliue ; 
  
  
  // Example image URL
   CardSale({super.key, required this.size,
  required this.imageUrl,required
  this.purcentage ,
required this.numberstar
,required this.persone_evaliue

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.45,
      decoration: BoxDecoration(
// Rounded corners
      color: Colors.white

      ), // Take up 45% of screen width
      child: Column(
        children: [
          // Add some space at the top
          ClipRRect(
       borderRadius: BorderRadius.circular(15), 
            child: Stack(
              children: [
                Image.asset(
                  imageUrl,
                  width: size.width * 0.45,
                  height: size.height * 0.25, // Adjust height as needed
                  fit: BoxFit.cover,
                ),
                Opacity(
                  opacity: 0.3,
                  child: Container(
                    width: size.width * 0.45,
                    height: size.height * 0.25,
                    color:Colors.grey, // Semi-transparent overlay,
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
    ...List.generate(numberstar, (index) => const Icon(
      Icons.star,
      color: Colors.yellow,
      size: 20,
    )),
    // Generate empty stars
    ...List.generate(5 - numberstar, (index) => const Icon(
      Icons.star,
      color: Colors.grey,
      size: 20,
    )),
      Text(
        "($persone_evaliue)",
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      )
  ],
)
           


        ],
      ),
    );
  }
}