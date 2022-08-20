import 'package:flutter/material.dart';
import '../models/catalogs.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => {
          // ignore: avoid_print
          print(item.name)
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.des),
        trailing: Text("\$ ${item.price.toString()}"),
      ),
    );
  }
}
