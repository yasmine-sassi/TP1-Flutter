class Book {
  //Attributes
  late String name, image;
  late int price;
  Book(this.name, this.price, this.image);

  Map<String, dynamic> toMap() {
    return {'name': name, 'price': price, 'image': image};
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(map['name'], map['price'], map['image']);
  }
}
