import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/chart.dart';

class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Relatórios', showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Desempenho de Vendas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              child: SimpleBarChart(),
            ),
            SizedBox(height: 24),
            Text(
              'Resumo Financeiro',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5,
              ),
              children: [
                _buildSummaryCard('Total de Vendas', 'R\$ 12.540,00', Icons.shopping_cart, Colors.green),
                _buildSummaryCard('Contas a Receber', 'R\$ 8.230,00', Icons.arrow_circle_down, Colors.blue),
                _buildSummaryCard('Contas a Pagar', 'R\$ 3.450,00', Icons.arrow_circle_up, Colors.red),
                _buildSummaryCard('Lucro Líquido', 'R\$ 9.090,00', Icons.attach_money, Colors.purple),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Relatórios Disponíveis',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            _buildReportItem('Relatório de Vendas por Período', Icons.bar_chart),
            _buildReportItem('Relatório de Produtos Mais Vendidos', Icons.inventory),
            _buildReportItem('Relatório Financeiro Detalhado', Icons.pie_chart),
            _buildReportItem('Relatório de Clientes', Icons.people),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 30),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportItem(String title, IconData icon) {
    return Card(
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}