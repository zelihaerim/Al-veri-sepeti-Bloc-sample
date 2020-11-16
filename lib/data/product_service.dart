import 'package:bloc_sample_1/models/product.dart';

class ProductService{
  static List<Product> products=new List<Product>();
  static ProductService _singleton= ProductService._internal();

  factory ProductService(){
    return _singleton;
  }
  ProductService._internal();
  static List<Product> getAll(){// kendimiz doldurdugumuz icin 2-3 kere ana sayfa da tekrar edecek :(
    products.add(new Product(1,"Acer Laptop",6000));
    products.add(new Product(2,"Asus Laptop",7000));
    products.add(new Product(3,"MAC Laptop",8000));
    return products;

  }

}