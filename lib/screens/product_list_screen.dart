import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../models/product.dart';
import '../components/product_card.dart';
import 'product_form_screen.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Lista de Produtos', showBackButton: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Buscar produto',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.filter_list, color: Colors.white),
                    onPressed: () {
                      _showFilterDialog(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${products.length} produtos encontrados',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.sort, color: Colors.blue),
                  onSelected: (value) {
                    _showSortMessage(context, value);
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem<String>(
                      value: 'name',
                      child: Text('Ordenar por Nome'),
                    ),
                    PopupMenuItem<String>(
                      value: 'price',
                      child: Text('Ordenar por Preço'),
                    ),
                    PopupMenuItem<String>(
                      value: 'stock',
                      child: Text('Ordenar por Estoque'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductFormScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Filtrar Produtos'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('Todos os produtos'),
                  leading: Radio(value: 0, groupValue: 0, onChanged: (value) {}),
                ),
                ListTile(
                  title: Text('Em estoque'),
                  leading: Radio(value: 1, groupValue: 0, onChanged: (value) {}),
                ),
                ListTile(
                  title: Text('Fora de estoque'),
                  leading: Radio(value: 2, groupValue: 0, onChanged: (value) {}),
                ),
                Divider(),
                ListTile(
                  title: Text('Estoque baixo (< 10 unidades)'),
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
                ListTile(
                  title: Text('Produtos ativos'),
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Filtros aplicados com sucesso!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: Text('Aplicar Filtros'),
            ),
          ],
        );
      },
    );
  }

  void _showSortMessage(BuildContext context, String sortType) {
    String message = '';
    switch (sortType) {
      case 'name':
        message = 'Produtos ordenados por nome';
        break;
      case 'price':
        message = 'Produtos ordenados por preço';
        break;
      case 'stock':
        message = 'Produtos ordenados por estoque';
        break;
    }
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue,
      ),
    );
  }
}