import 'package:flutter/material.dart';
import '../components/app_bar.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _darkMode = false;
  String _selectedCurrency = 'BRL';
  String _selectedLanguage = 'Português';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Configurações', showBackButton: true),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Preferências',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  title: Text('Notificações'),
                  value: _notifications,
                  onChanged: (bool value) {
                    setState(() {
                      _notifications = value;
                    });
                  },
                ),
                Divider(height: 1),
                SwitchListTile(
                  title: Text('Modo Escuro'),
                  value: _darkMode,
                  onChanged: (bool value) {
                    setState(() {
                      _darkMode = value;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Configurações Gerais',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Moeda'),
                  trailing: DropdownButton<String>(
                    value: _selectedCurrency,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCurrency = newValue!;
                      });
                    },
                    items: <String>['BRL', 'USD', 'EUR']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text('Idioma'),
                  trailing: DropdownButton<String>(
                    value: _selectedLanguage,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLanguage = newValue!;
                      });
                    },
                    items: <String>['Português', 'English', 'Español']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text('Backup de Dados'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
                Divider(height: 1),
                ListTile(
                  title: Text('Sobre o Aplicativo'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Conta',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Alterar Email'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
                Divider(height: 1),
                ListTile(
                  title: Text('Alterar Senha'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
                Divider(height: 1),
                ListTile(
                  title: Text(
                    'Sair da Conta',
                    style: TextStyle(color: Colors.red),
                  ),
                  trailing: Icon(Icons.exit_to_app, color: Colors.red),
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          Center(
            child: Text(
              'Versão 1.0.0',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}