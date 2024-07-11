import 'package:cha_rifa/widgets/fields/fields.dart';
import 'package:flutter/material.dart';

class DropPage extends StatelessWidget {
  final ValueNotifier<String> valueListenable = ValueNotifier('');

  final List<String> items = [
    'item1',
    'item2',
    'item3',
    'item4',
    'item5',
    'item6',
    'item7',
    'item8',
    'item9',
    'item10'
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: valueListenable,
        builder: (context, value, child) {
          return Card(
            color: Colors.grey[100],
            elevation: 8,
            child: Container(
              child: SizedBox(
                width: 200,
                height: 50,
                child: Padding(
                  padding:
                      EdgeInsets.all(3.5), // Definindo padding de 16 pixels
                  child: DropdownButtonFormField(
                      borderRadius: BorderRadius.circular(15),
                      iconEnabledColor: Colors.blue,
                      decoration: getFieldName(''),
                      // icon: Icon(CupertinoIcons.list_number),
                      isExpanded: true,
                      hint: Text('Selecione um item'),
                      value: (value.isEmpty) ? null : value,
                      onChanged: (value) =>
                          valueListenable.value = value.toString(),
                      items: items
                          .map(
                            (e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ),
                          )
                          .toList()),
                ),
              ),
            ),
          );
        });
  }
}
