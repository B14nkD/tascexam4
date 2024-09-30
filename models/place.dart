class Place {
  final String name;
  final String description;

  Place({required this.name, required this.description});

  // Hàm này giúp chuyển JSON thành đối tượng Place
  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      description: json['description'],
    );
  }

  @override
  String toString() {
    return 'Place: $name, Description: $description';
  }
}
