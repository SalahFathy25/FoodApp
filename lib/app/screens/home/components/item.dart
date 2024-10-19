// ignore_for_file: public_member_api_docs, sort_constructors_first
class Item {
  String image;
  String detailsImage;
  String title;
  String detailsTitle;
  String description;
  String longDescription;
  double price;
  double rate;
  int id;
  bool isFavourite;

  Item({
    required this.image,
    required this.detailsImage,
    required this.title,
    required this.detailsTitle,
    required this.description,
    required this.longDescription,
    required this.price,
    required this.rate,
    required this.id,
    this.isFavourite = false,
  });
}
