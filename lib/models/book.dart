class Book {
  String name;
  int price;
  String image;
  String? userEmail; // association optionnelle

  Book(this.name, this.price, this.image, {this.userEmail});

  Map<String, Object?> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'userEmail': userEmail,
    };
  }

  factory Book.fromMap(Map<String, Object?> map) {
    return Book(
      map['name'].toString(),
      map['price'] as int,
      map['image'].toString(),
      userEmail: map['userEmail']?.toString(),
    );
  }
}
