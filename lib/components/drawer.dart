import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';
import '../screens/product_list_screen.dart';
import '../screens/product_form_screen.dart';
import '../screens/client_form_screen.dart';
import '../screens/sale_screen.dart';
import '../screens/sale_history_screen.dart';
import '../screens/financial_screen.dart';
import '../screens/reports_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.business_center,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Mini ERP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sistema de Gestão',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          
          // Dashboard
          ListTile(
            leading: Icon(Icons.dashboard, color: Colors.blue),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DashboardScreen()),
              );
            },
          ),
          Divider(),

          // Seção de Produtos
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'PRODUTOS',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.list_alt, color: Colors.orange),
            title: Text('Lista de Produtos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductListScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_box, color: Colors.orange),
            title: Text('Cadastrar Produto'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductFormScreen()),
              );
            },
          ),
          Divider(),

          // Seção de Vendas
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'VENDAS',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.add_shopping_cart, color: Colors.green),
            title: Text('Nova Venda'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SaleScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.history, color: Colors.green),
            title: Text('Histórico de Vendas'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SaleHistoryScreen()),
              );
            },
          ),
          Divider(),

          // Seção de Clientes
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'CLIENTES',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_add, color: Colors.blue),
            title: Text('Cadastrar Cliente'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClientFormScreen()),
              );
            },
          ),
          Divider(),

          // Seção Financeira
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'FINANCEIRO',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.attach_money, color: Colors.red),
            title: Text('Contas a Pagar/Receber'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FinancialScreen()),
              );
            },
          ),
          Divider(),

          // Seção de Relatórios
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'RELATÓRIOS',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.bar_chart, color: Colors.purple),
            title: Text('Relatórios e Gráficos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportsScreen()),
              );
            },
          ),
          Divider(),

          // Seção de Configurações
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'CONFIGURAÇÕES',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.grey),
            title: Text('Configurações Gerais'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          Divider(),

          // Sair
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.red),
            title: Text('Sair do Sistema'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}