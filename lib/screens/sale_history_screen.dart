import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../models/sale.dart';
import '../components/sale_card.dart';

class SaleHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Histórico de Vendas', showBackButton: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Buscar venda',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                FilterChip(
                  label: Text('Filtrar'),
                  onSelected: (bool value) {},
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sales.length,
              itemBuilder: (context, index) {
                return SaleCard(sale: sales[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}