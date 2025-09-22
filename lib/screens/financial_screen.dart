import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../models/financial.dart';

class FinancialScreen extends StatefulWidget {
  @override
  _FinancialScreenState createState() => _FinancialScreenState();
}

class _FinancialScreenState extends State<FinancialScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Financeiro', showBackButton: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ToggleButtons(
              isSelected: [_selectedIndex == 0, _selectedIndex == 1],
              onPressed: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Contas a Receber'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Contas a Pagar'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: financials.length,
              itemBuilder: (context, index) {
                final financial = financials[index];
                if ((_selectedIndex == 0 && financial.type == 'receivable') ||
                    (_selectedIndex == 1 && financial.type == 'payable')) {
                  return _buildFinancialCard(financial);
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialCard(Financial financial) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(
          financial.type == 'receivable' ? Icons.arrow_circle_down : Icons.arrow_circle_up,
          color: financial.type == 'receivable' ? Colors.green : Colors.red,
          size: 40,
        ),
        title: Text(
          financial.description,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Vencimento: ${_formatDate(financial.dueDate)}'),
            Text(
              'Status: ${financial.status == 'paid' ? 'Pago' : 'Pendente'}',
              style: TextStyle(
                color: financial.status == 'paid' ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'R\$${financial.value.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: financial.type == 'receivable' ? Colors.green : Colors.red,
              ),
            ),
            if (financial.status == 'pending')
              OutlinedButton(
                onPressed: () {},
                child: Text('Marcar como Pago'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: financial.type == 'receivable' ? Colors.green : Colors.red,
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}