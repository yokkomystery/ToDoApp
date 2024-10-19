import 'package:flutter/material.dart';

class FilterOptions extends StatefulWidget {
  final Function(bool) onFilterChanged;

  FilterOptions({required this.onFilterChanged});

  @override
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  bool showCompleted = false;

  void _updateFilter(bool value) {
    setState(() {
      showCompleted = value;
    });
    widget.onFilterChanged(showCompleted);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Show Completed Tasks'),
        Switch(
          value: showCompleted,
          onChanged: _updateFilter,
        ),
      ],
    );
  }
}
