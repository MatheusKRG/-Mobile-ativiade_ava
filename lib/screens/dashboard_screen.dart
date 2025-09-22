import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/drawer.dart';
import '../components/dashboard_card.dart';
import 'product_list_screen.dart';
import 'product_form_screen.dart';
import 'client_form_screen.dart';
import 'sale_screen.dart';
import 'sale_history_screen.dart';
import 'financial_screen.dart';
import 'reports_screen.dart';
import 'settings_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Dashboard'),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Visão Geral',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            
            // Grid de Métricas
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              children: [
                _buildMetricCard(
                  title: 'Vendas do Mês',
                  value: 'R\$ 12.540',
                  icon: Icons.shopping_cart,
                  color: Colors.green,
                  onTap: () => _navigateTo(context, SaleHistoryScreen()),
                ),
                _buildMetricCard(
                  title: 'Clientes',
                  value: '42',
                  icon: Icons.people,
                  color: Colors.blue,
                  onTap: () => _navigateTo(context, ClientFormScreen()),
                ),
                _buildMetricCard(
                  title: 'Produtos',
                  value: '156',
                  icon: Icons.inventory,
                  color: Colors.orange,
                  onTap: () => _navigateTo(context, ProductListScreen()),
                ),
                _buildMetricCard(
                  title: 'Contas a Receber',
                  value: 'R\$ 8.230',
                  icon: Icons.attach_money,
                  color: Colors.red,
                  onTap: () => _navigateTo(context, FinancialScreen()),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Navegação Rápida
            Text(
              'Acesso Rápido',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              children: [
                _buildQuickAccessButton(
                  icon: Icons.add_shopping_cart,
                  label: 'Nova Venda',
                  color: Colors.green,
                  onTap: () => _navigateTo(context, SaleScreen()),
                ),
                _buildQuickAccessButton(
                  icon: Icons.list_alt,
                  label: 'Produtos',
                  color: Colors.orange,
                  onTap: () => _navigateTo(context, ProductListScreen()),
                ),
                _buildQuickAccessButton(
                  icon: Icons.person_add,
                  label: 'Clientes',
                  color: Colors.blue,
                  onTap: () => _navigateTo(context, ClientFormScreen()),
                ),
                _buildQuickAccessButton(
                  icon: Icons.attach_money,
                  label: 'Financeiro',
                  color: Colors.red,
                  onTap: () => _navigateTo(context, FinancialScreen()),
                ),
                _buildQuickAccessButton(
                  icon: Icons.bar_chart,
                  label: 'Relatórios',
                  color: Colors.purple,
                  onTap: () => _navigateTo(context, ReportsScreen()),
                ),
                _buildQuickAccessButton(
                  icon: Icons.settings,
                  label: 'Configurações',
                  color: Colors.grey,
                  onTap: () => _navigateTo(context, SettingsScreen()),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Atividades Recentes
            Text(
              'Atividades Recentes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            _buildActivityList(),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, color: color, size: 30),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAccessButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 32),
              SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityList() {
    return Column(
      children: [
        _buildActivityItem(
          icon: Icons.shopping_cart,
          color: Colors.green,
          title: 'Venda #0234 concluída',
          subtitle: 'R\$ 459,90 - Cliente: João Silva',
          onTap: (context) => _navigateTo(context, SaleHistoryScreen()),
        ),
        _buildActivityItem(
          icon: Icons.inventory,
          color: Colors.orange,
          title: 'Produto com estoque baixo',
          subtitle: 'Monitor 24" - apenas 2 unidades',
          onTap: (context) => _navigateTo(context, ProductListScreen()),
        ),
        _buildActivityItem(
          icon: Icons.attach_money,
          color: Colors.red,
          title: 'Conta a vencer amanhã',
          subtitle: 'Fornecedor ABC - R\$ 1.230,00',
          onTap: (context) => _navigateTo(context, FinancialScreen()),
        ),
        _buildActivityItem(
          icon: Icons.people,
          color: Colors.blue,
          title: 'Novo cliente cadastrado',
          subtitle: 'Maria Santos - 14/10/2023',
          onTap: (context) => _navigateTo(context, ClientFormScreen()),
        ),
      ],
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required Function(BuildContext) onTap,
  }) {
    return Builder(
      builder: (context) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            leading: Icon(icon, color: color),
            title: Text(title),
            subtitle: Text(subtitle),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => onTap(context),
          ),
        );
      },
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}