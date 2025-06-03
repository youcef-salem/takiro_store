
import 'package:flutter/material.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
     
      children: [
        Stack(

  
          children: [
            
            Image.asset(ImageUtil.banner_home,
              width: size.width,
              height: size.height * 0.3,
              fit: BoxFit.cover,
            ),
            Opacity(opacity: 0.3,
              child: Container(
                width: size.width,
                height: size.height * 0.3,
                color: const Color.fromARGB(255, 2, 2, 2),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
              padding: const EdgeInsets.only(top: 180,left: 20),
                child :
                   Text(" Week Offer "
                  ,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    )
                  ),),
            )
              ],
            )

          
          ,SpacerHome(largetitle: "Sale", 
          subtitle: "Best summer sales",
           textright: "view all"
           ,ontap: () => {},
           ),
           SingleChildScrollView(
            scrollDirection: Axis.horizontal,
             child: Row(
              
             children: [
               SizedBox(width: 20),
              CardSale(size: size,
               imageUrl: ImageUtil.saleimage1,numberstar: 4,
               // Example percentage
               persone_evaliue: 10,
               prev_price: 100,
                new_price: 77,
                product_name: " PIndaa",
                product_category: "Daily Show",
               ),

                SizedBox(width: 20),
              CardSale(size: size,
               imageUrl: ImageUtil.saleimage2,  
               numberstar: 2,persone_evaliue: 4, 
               prev_price: 50,
                new_price: 45,
                product_name: "Nike Air",
                product_category: "Sport Shoes", 
                  ),
                SizedBox(width: 20),
              CardSale(size: size,
               imageUrl: ImageUtil.saleimage3,   numberstar: 0, persone_evaliue: 0,
               

                prev_price: 200,
                new_price: 100,
                product_name: "Fitfont",
                product_category: "Summer",

                ),
             ],
             
             
             
             ),
           )

         
           
          
          ],

    );

  }
}
