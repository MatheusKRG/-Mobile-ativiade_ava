class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final String category;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.category,
    required this.imageUrl,
  });
}

List<Product> products = [
  Product(
    id: 1,
    name: 'Notebook Dell',
    description: 'Notebook Dell i7, 16GB RAM, 512GB SSD',
    price: 3499.99,
    stock: 15,
    category: 'Informática',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  Product(
    id: 2,
    name: 'Mouse Sem Fio',
    description: 'Mouse óptico sem fio',
    price: 89.90,
    stock: 42,
    category: 'Informática',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  Product(
    id: 3,
    name: 'Teclado Mecânico',
    description: 'Teclado mecânico RGB',
    price: 299.90,
    stock: 23,
    category: 'Informática',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  Product(
    id: 4,
    name: 'Monitor 24"',
    description: 'Monitor LED 24 polegadas',
    price: 899.90,
    stock: 8,
    category: 'Informática',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  Product(
    id: 5,
    name: 'Impressora Laser',
    description: 'Impressora laser monocromática',
    price: 1299.90,
    stock: 5,
    category: 'Informática',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  Product(
    id: 6,
    name: 'Tablet Samsung',
    description: 'Tablet 10 polegadas, 64GB',
    price: 1599.90,
    stock: 12,
    category: 'Informática',
    imageUrl: 'https://via.placeholder.com/150',
  ),
];