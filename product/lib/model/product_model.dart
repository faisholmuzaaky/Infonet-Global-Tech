class ProductModel {
  int? id;
  String? title;
  String? description;
  int? price;
  num? discountPercentage;
  num? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<dynamic>? images;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      price: data['price'],
      discountPercentage: data['discountPercentage'],
      rating: data['rating'],
      stock: data['stock'],
      brand: data['brand'],
      category: data['category'],
      thumbnail: data['thumbnail'],
      images: data['images'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discount_percentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }
}
