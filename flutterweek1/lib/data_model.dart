class ProductData {
  final String title;
  final List<Product> products;

  ProductData({required this.title, required this.products});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    List<dynamic> productListJson = json['data'];
    List<Product> productList =
        productListJson.map((product) => Product.fromJson(product)).toList();
    return ProductData(title: json['title'], products: productList);
  }
}

class Product {
  final int id;
  final String category;
  final String title;
  final String description;
  final int price;
  final String texture;
  final String wash;
  final String place;
  final String note;
  final String story;
  final List<ItemColors> colors;
  final List<String> sizes;
  final List<Variant> variants;
  final String mainImage;
  final List<String> images;

  Product({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.texture,
    required this.wash,
    required this.place,
    required this.note,
    required this.story,
    required this.colors,
    required this.sizes,
    required this.variants,
    required this.mainImage,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<dynamic> colorsJson = json['colors'];
    List<ItemColors> colors =
        colorsJson.map((color) => ItemColors.fromJson(color)).toList();

    List<dynamic> variantsJson = json['variants'];
    List<Variant> variants =
        variantsJson.map((variant) => Variant.fromJson(variant)).toList();

    return Product(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      texture: json['texture'],
      wash: json['wash'],
      place: json['place'],
      note: json['note'],
      story: json['story'],
      colors: colors,
      sizes: List<String>.from(json['sizes']),
      variants: variants,
      mainImage: json['main_image'],
      images: List<String>.from(json['images']),
    );
  }
}

class ItemColors {
  final String code;
  final String name;

  ItemColors({required this.code, required this.name});

  factory ItemColors.fromJson(Map<String, dynamic> json) {
    return ItemColors(code: json['code'], name: json['name']);
  }
}

class Variant {
  final String colorCode;
  final String size;
  final int stock;

  Variant({required this.colorCode, required this.size, required this.stock});

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
        colorCode: json['color_code'],
        size: json['size'],
        stock: json['stock']);
  }
}

List<Product> manItems = [
  Product(
      id: 1,
      category: 'man',
      title: '大衣',
      description: '123123',
      price: 666,
      texture: '123123',
      wash: '12313',
      place: 'place',
      note: 'note',
      story: 'story',
      colors: [ItemColors(code: 'code', name: 'name')],
      sizes: ['S', 'M', 'L'],
      variants: [Variant(colorCode: 'colorCode', size: 'size', stock: 5)],
      mainImage:
          'https://www.settour.com.tw/ss_img/info/location/PAR/R0/PAR0000115/PAR0000115_64041.jpg',
      images: [
        'https://www.settour.com.tw/ss_img/info/location/PAR/R0/PAR0000115/PAR0000115_64041.jpg'
      ]),
  Product(
      id: 1,
      category: 'man',
      title: '大衣',
      description: '123123',
      price: 666,
      texture: '123123',
      wash: '12313',
      place: 'place',
      note: 'note',
      story: 'story',
      colors: [ItemColors(code: 'code', name: 'name')],
      sizes: ['XS', 'S', 'M', 'L'],
      variants: [Variant(colorCode: 'colorCode', size: 'size', stock: 5)],
      mainImage:
          'https://www.settour.com.tw/ss_img/info/location/PAR/R0/PAR0000115/PAR0000115_64041.jpg',
      images: [
        'https://www.settour.com.tw/ss_img/info/location/PAR/R0/PAR0000115/PAR0000115_64041.jpg'
      ]),
  Product(
      id: 1,
      category: 'man',
      title: '大衣',
      description: '123123',
      price: 666,
      texture: '123123',
      wash: '12313',
      place: 'place',
      note: 'note',
      story: 'story',
      colors: [ItemColors(code: 'code', name: 'name')],
      sizes: ['S', 'M', 'L'],
      variants: [Variant(colorCode: 'colorCode', size: 'size', stock: 5)],
      mainImage:
          'https://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2016/03/28/20160328-024000_U6251_M142129_6df2.jpg?itok=4KQSoi0q',
      images: [
        'https://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2016/03/28/20160328-024000_U6251_M142129_6df2.jpg?itok=4KQSoi0q'
      ]),
  Product(
      id: 1,
      category: 'man',
      title: '大衣',
      description: '123123',
      price: 666,
      texture: '123123',
      wash: '12313',
      place: 'place',
      note: 'note',
      story: 'story',
      colors: [ItemColors(code: 'code', name: 'name')],
      sizes: ['S', 'M', 'L'],
      variants: [Variant(colorCode: 'colorCode', size: 'size', stock: 5)],
      mainImage:
          'https://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2016/03/28/20160328-024000_U6251_M142129_6df2.jpg?itok=4KQSoi0q',
      images: [
        'https://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2016/03/28/20160328-024000_U6251_M142129_6df2.jpg?itok=4KQSoi0q'
      ]),
];
