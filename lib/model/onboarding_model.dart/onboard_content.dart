import 'package:ecommerce_app/utils/image_constants.dart';

class OnboardContentModel {
  String title;
  String description;
  String image;
  String name;
  OnboardContentModel(
      {required this.title,
      required this.description,
      required this.name,
      required this.image});
  static List <OnboardContentModel>onboardList = [
    OnboardContentModel(
        title: 'Start Journey With Nike',
        description: 'Smart, Gorgeous & Fashionable Collection',
        name: 'Get Started',
        image: ImageConstants.onboardingImage1),
    OnboardContentModel(
        title: 'Follow Latest Style Shoes',
        description:
            'There Are Many Beautiful And Attractive Plants To Your Room',
        name: 'Next',
        image: ImageConstants.onboardingImage2),
    OnboardContentModel(
        title: 'Summer Shoes Nike 2025',
        description: 'Amet Minim Lit Nodeseru Saku Nandu sit Alique Dolor',
        name: 'Next',
        image: ImageConstants.onboardingImage3),
  ];
}
