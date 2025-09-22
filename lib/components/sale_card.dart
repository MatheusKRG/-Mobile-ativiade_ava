import 'package:flutter/material.dart';
import '../models/sale.dart';

class SaleCard extends StatelessWidget {
  final Sale sale;

  const SaleCard({Key? key, required this.sale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(
          Icons.shopping_cart,
          color: _getStatusColor(sale.status),
          size: 40,
        ),
        title: Text(
          'Venda #${sale.id.toString().padLeft(3, '0')}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cliente: ${sale.clientName}'),
            Text('Data: ${_formatDate(sale.date)}'),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'R\$${sale.total.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.green,
              ),
            ),
            Chip(
              label: Text(
                sale.status,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              backgroundColor: _getStatusColor(sale.status),
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'concluída':
        return Colors.green;
      case 'pendente':
        return Colors.orange;
      case 'cancelada':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}