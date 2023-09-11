import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DropDownMenuHome extends StatefulWidget {
  const DropDownMenuHome({super.key});

  @override
  State<DropDownMenuHome> createState() => _DropDownMenuHomeState();
}

class _DropDownMenuHomeState extends State<DropDownMenuHome> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );;
  }
}
