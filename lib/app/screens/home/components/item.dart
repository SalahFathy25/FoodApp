class Item {
  String image;
  String detailsImage;
  String title;
  String detailsTitle;
  String description;
  String longDescription;
  double price;
  double rate;
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
    this.isFavourite = false,
  });
}
