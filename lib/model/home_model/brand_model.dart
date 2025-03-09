import '../../utils/image_constants.dart';

class PopularCardModel {
  String name;
  String title;
  String price;
  String? description;
  String image;
  int quantity;
  PopularCardModel(
      {required this.name,
      required this.title,
      this.description,
      required this.image,
       this.quantity = 1,
      required this.price});
  static List<PopularCardModel> listItem = [
    PopularCardModel(
        name: 'BEST SELLAR',
        title: 'Nike Joradan',
        price: '3050',
        image: ImageConstants.shoe,
        description:
            'The Nike Jordan series, originally designed for Michael Jordan, is known for its stylish design and superior performance. The shoes feature premium materials, excellent cushioning (Air technology), and great ankle support, making them perfect for basketball and streetwear'),
    PopularCardModel(
        name: 'BEST SELLAR',
        title: 'Nike Clup Max',
        price: '4500',
        image: ImageConstants.shoe3,
        description:
            'The Nike Club Max is a casual sneaker designed for everyday comfort. It features a lightweight design, breathable mesh upper, and cushioned sole, making it ideal for walking, running errands, or casual sports activities'),
    PopularCardModel(
        name: 'BEST SELLAR',
        title: 'Nike Air Max ',
        price: '8200',
        image: ImageConstants.shoe,
        description:
            'The Nike Air Max is famous for its visible Air cushioning technology, providing superior comfort and impact absorption. These shoes are great for running, training, or casual wear due to their iconic design, durability, and support'),
    PopularCardModel(
        name: 'BEST SELLAR',
        title: 'Nike Jordan Retro',
        price: '3500',
        image: ImageConstants.shoe3,
        description:
            'A variation of the Jordan line, the Nike Jordan Retro series brings back classic Air Jordan designs with modern updates. It combines heritage style with performance-driven features, making it a favorite among sneaker collectors and basketball players'),
  ];
}
