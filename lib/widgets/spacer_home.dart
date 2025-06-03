import 'package:flutter/material.dart';

class SpacerHome extends StatelessWidget { 
  final String  largetitle ;
  final String subtitle;
  final String textright;
 final VoidCallback ?ontap;

  const SpacerHome({super.key,
  required this.largetitle,
required this.subtitle,
  required this.textright,
  required this.ontap,

  
  });

  @override
  Widget build(BuildContext context) {
    return   Row(
          children: [
           Padding(
             padding: const EdgeInsets.all(22),
             child: Column(
            
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(largetitle,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                
                ),
                ),
                Text(subtitle,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ))
             
             
              ],
             ),
           ),Spacer(flex: 1,),
           
           InkWell(
              onTap: () => ontap,
             child: Padding(
             
               padding: const EdgeInsets.all(20),
               child: Text(textright,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color:  const Color.fromARGB(255, 93, 92, 92),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )
               ),
             ),
           ),
          

          ],




          ) ;
  }
}