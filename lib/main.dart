import 'package:ativiade_ava/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini ERP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
      // Adicione rotas nomeadas para facilitar a navegação
      routes: {
        '/dashboard': (context) => DashboardScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}