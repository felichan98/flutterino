class Pizza {
  final int id;
  final String name;
  final String email;
  final String gender;
  final String status;

  const Pizza({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      status: json['status'],
    );
  }
}
