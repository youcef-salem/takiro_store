
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
            
            Image.asset("assets/img5.webp",
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
              ,
             children: [
               SizedBox(width: 20),
              CardSale(size: size,
               imageUrl: ImageUtil.saleimage1,purcentage: 23,numberstar: 4,
               // Example percentage
               persone_evaliue: 10,
               ),

                SizedBox(width: 20),
              CardSale(size: size,
               imageUrl: ImageUtil.saleimage2,   purcentage: 10,numberstar: 2,persone_evaliue: 4,    ),
                SizedBox(width: 20),
              CardSale(size: size,
               imageUrl: ImageUtil.saleimage3, purcentage: 50,  numberstar: 0, persone_evaliue: 0, ),
             ],
             
             
             
             ),
           )

         
           
          
          ],

    );

  }
}
