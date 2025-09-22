class Financial {
  final int id;
  final String description;
  final DateTime dueDate;
  final double value;
  final String type; // 'receivable' or 'payable'
  final String status; // 'paid' or 'pending'

  Financial({
    required this.id,
    required this.description,
    required this.dueDate,
    required this.value,
    required this.type,
    required this.status,
  });
}

List<Financial> financials = [
  Financial(
    id: 1,
    description: 'Venda #001',
    dueDate: DateTime(2023, 10, 20),
    value: 4599.89,
    type: 'receivable',
    status: 'pending',
  ),
  Financial(
    id: 2,
    description: 'Compra de estoque',
    dueDate: DateTime(2023, 10, 18),
    value: 2200.00,
    type: 'payable',
    status: 'pending',
  ),
  Financial(
    id: 3,
    description: 'Venda #002',
    dueDate: DateTime(2023, 10, 15),
    value: 1299.80,
    type: 'receivable',
    status: 'paid',
  ),
];