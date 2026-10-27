// ===========================================================================
// product.dart  —  NEW FILE IN SESSION 05
// ---------------------------------------------------------------------------
// Our first MODEL. Instead of keeping a product's name, description and price
// in three separate lists, we group them into one object:
//
//   Product(name: 'Apple', description: 'Fresh organic red apple', price: 1.20)
//
// Now one Product can be stored in a list, passed to another screen, and read
// with p.name / p.price.
//
// The `?` makes each field nullable (it can be null), so when we read it we
// write p.name! to say "I know it isn't null".
// ===========================================================================

class Product {
  String? name;
  String? description;
  double? price;
  // Named parameters in { }: you write the field names when creating a
  // Product, and the order doesn't matter.
  Product({this.name, this.description, this.price});
}
