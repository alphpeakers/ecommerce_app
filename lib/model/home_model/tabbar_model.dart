import '../../utils/image_constants.dart';

class TabbarModel {
  String title;
  String image;
  TabbarModel({required this.title, required this.image});
  static List<TabbarModel> tabList = [
    TabbarModel(title: 'Nike', image: ImageConstants.nikeLogo),
    TabbarModel(title: 'Puma', image: ImageConstants.pumaLogo),
    TabbarModel(title: 'Adidas', image: ImageConstants.adidasLogo),
    TabbarModel(title: 'Converse', image: ImageConstants.coverseLogo),
    TabbarModel(title: 'UnderArmour', image: ImageConstants.underArmourLogo),
  ];
}
