import '../../utils/image_constants.dart';

class SidebarModel {
  String title;
  String image;
    String routeName;
  SidebarModel( {required this.title, required this.image, required this.routeName});
  static List<SidebarModel> itemList = [
    SidebarModel(title: 'Profile', image: ImageConstants.user, routeName: 'profileScreen',),
    SidebarModel(title: 'Home Page', image: ImageConstants.home, routeName: '/home'),
    SidebarModel(title: 'My Cart', image: ImageConstants.myCard, routeName: 'myCardScreen'),
    SidebarModel(title: 'Orders', image: ImageConstants.order, routeName: 'ordersScreen'),
    SidebarModel(title: 'Notifications', image: ImageConstants.notify, routeName: 'notification'),
  ];
}
