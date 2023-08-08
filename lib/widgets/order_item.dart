import 'package:flutter/material.dart';
import '../provider/order.dart' as ord;

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;
  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: const Text('34:44'
                // DateFormat('dd MM yyyy hh:mm').format(order.dateTime)
                ),
            trailing: IconButton(
                onPressed: () {}, icon: const Icon(Icons.expand_more)),
          )
        ],
      ),
    );
  }
}
