import 'package:flutter/material.dart';

class DropDowMenu extends StatefulWidget {
  const DropDowMenu({super.key});

  @override
  State<DropDowMenu> createState() => _DropDowMenuState();
}

class _DropDowMenuState extends State<DropDowMenu> {
  @override
  Widget build(BuildContext context) {
    String chosenModel = "S";
    return Center(
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
          ),
        ),
        borderRadius: BorderRadius.circular(20),
        value: null,
        items:
            ['S', 'M', 'L', 'XL'].map((String value) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            chosenModel = newValue!;
          });
          debugPrint("the choosen is $chosenModel");
        },
        hint: Text("    size   ", style: Theme.of(context).textTheme.headlineSmall),
      ),
    );
  }
}
