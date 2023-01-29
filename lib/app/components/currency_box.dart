import 'dart:math';

import 'package:flutter/material.dart';

import '../models/currency_view.dart';

class CurrencyBox extends StatelessWidget {

  final List<CurrencyModel> items;
  final TextEditingController controller;
   CurrencyModel selectedItem;
  void Function(CurrencyModel?)? onChanged;
  CurrencyBox({super.key, required this.items,required this.controller, this.onChanged, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: DropdownButton(
                        value: selectedItem,
                        isExpanded: true,
                        underline: Container(
                          height: 1,
                          color: Colors.amber,
                        ),
                        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
                        onChanged: onChanged
                        
                      ),
                    )),
                SizedBox(width: 10),
                Expanded(child: TextField(controller: controller, decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber))
                ),), flex: 2)
              ],
            );
  }
}