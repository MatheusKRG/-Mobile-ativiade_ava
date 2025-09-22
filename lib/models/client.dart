class Client {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final DateTime registrationDate;
  final int totalPurchases;
  final double totalSpent;
  final bool isActive;

  Client({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.registrationDate,
    this.totalPurchases = 0,
    this.totalSpent = 0.0,
    this.isActive = true,
  });
}

List<Client> clients = [
  Client(
    id: 1,
    name: 'João Silva',
    email: 'joao@email.com',
    phone: '(11) 99999-9999',
    address: 'Rua das Flores, 123 - São Paulo/SP',
    registrationDate: DateTime(2023, 1, 15),
    totalPurchases: 12,
    totalSpent: 2540.00,
  ),
  Client(
    id: 2,
    name: 'Maria Santos',
    email: 'maria@email.com',
    phone: '(11) 98888-8888',
    address: 'Av. Paulista, 456 - São Paulo/SP',
    registrationDate: DateTime(2023, 3, 20),
    totalPurchases: 8,
    totalSpent: 1890.50,
  ),
  Client(
    id: 3,
    name: 'Pedro Oliveira',
    email: 'pedro@email.com',
    phone: '(11) 97777-7777',
    address: 'Rua Augusta, 789 - São Paulo/SP',
    registrationDate: DateTime(2023, 5, 10),
    totalPurchases: 5,
    totalSpent: 1200.00,
  ),
  Client(
    id: 4,
    name: 'Ana Costa',
    email: 'ana@email.com',
    phone: '(11) 96666-6666',
    address: 'Rua Vergueiro, 321 - São Paulo/SP',
    registrationDate: DateTime(2023, 7, 5),
    totalPurchases: 3,
    totalSpent: 750.00,
  ),
];