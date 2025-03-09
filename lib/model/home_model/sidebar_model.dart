import '../../utils/image_constants.dart';

class SidebarModel {
  String title;
  String image;
    String routeName;
  SidebarModel( {required this.title, required this.image, required this.routeName});
  static List<SidebarModel> itemList = [
    SidebarModel(title: 'Home Page', image: ImageConstants.home, routeName: '/dashboardScreen'),
    SidebarModel(title: 'My Cart', image: ImageConstants.myCard, routeName: 'myCardScreen'),
    SidebarModel(title: 'Orders', image: ImageConstants.order, routeName: 'ordersScreen'),
    SidebarModel(title: 'Support', image: ImageConstants.messagelite, routeName: 'supportScreen'),
    SidebarModel(title: 'About us', image: ImageConstants.about, routeName: 'aboutScreen'),
  ];
}
