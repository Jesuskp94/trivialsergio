import 'package:flutter/material.dart';


class DropDownMenuHome extends StatefulWidget {
  List<String> items = [];

  DropDownMenuHome({super.key, required this.items});

  @override
  State<DropDownMenuHome> createState() => _DropDownMenuHomeState();
}

class _DropDownMenuHomeState extends State<DropDownMenuHome> {
  String dropdownValue = "";

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: widget.items.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: widget.items.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );;
  }
}
