import '../../resource/images_manager.dart';
import '../../resource/strings_manager.dart';


// ToDo BoardingMode
class BoardingModel {
  final String image;
  final String title;
  final String subTitle;

  BoardingModel(
      {required this.image, required this.title, required this.subTitle});
}

// ToDo List BoardingModel
List<BoardingModel> boarding = [
  BoardingModel(
    image: ImageAssets.onBoarding1,
    title: AppStrings.titleOnBoarding1,
    subTitle: AppStrings.subtitleOnBoarding1,
  ),
  BoardingModel(
    image: ImageAssets.onBoarding2,
    title: AppStrings.titleOnBoarding2,
    subTitle: AppStrings.subtitleOnBoarding2,
  ),
  BoardingModel(
    image: ImageAssets.onBoarding3,
    title: AppStrings.titleOnBoarding3,
    subTitle: AppStrings.subtitleOnBoarding3,
  ),
  BoardingModel(
    image: ImageAssets.onBoarding4,
    title: AppStrings.titleOnBoarding3,
    subTitle: AppStrings.subtitleOnBoarding3,
  ),
];