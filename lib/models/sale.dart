class Sale {
  final int id;
  final DateTime date;
  final String clientName;
  final double total;
  final String status;

  Sale({
    required this.id,
    required this.date,
    required this.clientName,
    required this.total,
    required this.status,
  });
}

List<Sale> sales = [
  Sale(
    id: 1,
    date: DateTime(2023, 10, 15),
    clientName: 'João Silva',
    total: 4599.89,
    status: 'Concluída',
  ),
  Sale(
    id: 2,
    date: DateTime(2023, 10, 14),
    clientName: 'Maria Santos',
    total: 1299.80,
    status: 'Concluída',
  ),
  Sale(
    id: 3,
    date: DateTime(2023, 10, 13),
    clientName: 'Pedro Oliveira',
    total: 899.90,
    status: 'Pendente',
  ),
];