import 'package:client_rocket/helper_methods/sharedpref/shared_preference.dart';
import 'package:client_rocket/presentation/presentation_screens/widget_presentation_screens.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../resource/colors_manager.dart';
import '../../resource/images_manager.dart';
import '../../resource/routes_manager.dart';
import '../../resource/strings_manager.dart';
import '../../resource/values_manager.dart';
import 'model_presentation_screens.dart';




class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}
class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  bool isLast = false;

  void submit() {
    SharedCashHelper.setValue(key: 'onBoarding', value: true).then((value) {
      if (value == true) {
        Navigator.pushReplacementNamed(context, Routes.createScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p30),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: boardController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) =>
                      BuildBoardingItem(model: boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              const SizedBox(
                height: AppSize.s40,
              ),
              Row(
                children: [

                  Text(
                    ''  ,
                    style: TextStyle(
                      color: Colors.black ,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp ,
                    
                    ),
                  ),//تخطي
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        submit();
                      } else {
                        boardController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: const Icon(Icons.arrow_forward_ios),
                    backgroundColor: ColorManager.primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}