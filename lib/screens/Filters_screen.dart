
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../wedget/main_Drawer.dart';

class FiltersScreens extends StatefulWidget {
  // ignore: use_key_in_widget_constructors

  static const routeName = "filters";

  final Function saveFilters;

  final Map<String , bool> creewntFilter;

  // ignore: use_key_in_widget_constructors
  const FiltersScreens(this.saveFilters, this.creewntFilter);

  @override
  State<FiltersScreens> createState() => _FiltersScreensState();
}

class _FiltersScreensState extends State<FiltersScreens> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarin = false;
  @override
  initState(){
     _GlutenFree = widget.creewntFilter['gluten'];
    _LactoseFree = widget.creewntFilter['lactose'];
     _Vegan = widget.creewntFilter['vegan'];
     _Vegetarin = widget.creewntFilter['vegetarin'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("your filters"),
        actions: [
          IconButton(
              onPressed: () {
                final  selectedFilters = {
                  'gluten': _GlutenFree,
                  "lactose": _LactoseFree,
                  "vegan": _Vegan,
                  'vegetarin': _Vegetarin,
                };

                widget.saveFilters(selectedFilters);
              },
              icon:const Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: (Theme.of(context).textTheme.titleMedium),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  'Gluten-free', "Only include gluten-free meals", _GlutenFree,
                  (newValue) {
                setState(() {
                  _GlutenFree = newValue;
                });
              }),
              buildSwitchListTile('Lactose-free',
                  "Only include Lactose-free meals", _LactoseFree, (newValue) {
                setState(() {
                  _LactoseFree = newValue;
                });
              }),
              buildSwitchListTile(
                  'Vegan-free', "Only include Vegan-free meals", _Vegan,
                  (newValue) {
                setState(() {
                  _Vegan = newValue;
                });
              }),
              buildSwitchListTile('Vegetarin-free',
                  "Only include Vegetarin-free meals", _Vegetarin, (newValue) {
                setState(() {
                  _Vegetarin = newValue;
                });
              }),
            ],
          ))
        ],
      ),
      drawer: const MainDrawer(),
    );
  }

  SwitchListTile buildSwitchListTile(
      String title, String sub, bool isFree, Function updateValue) {
    return SwitchListTile(
        value: isFree,
        title: Text(title),
        subtitle: Text(sub),
        onChanged: updateValue);
  }
}
