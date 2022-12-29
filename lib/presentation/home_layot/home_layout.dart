
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/home_cubit/home_cubit.dart';
import '../../business_logic/home_cubit/home_state.dart';
import '../../resource/colors_manager.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.rtl,
            child: BottomNavigationBar(
              onTap: (index) {
                cubit.changeBottom(index,context);
              },
              iconSize: 20,
              currentIndex: cubit.currentIndex,
              type: BottomNavigationBarType.fixed,
              elevation: 21.5,
              selectedIconTheme: IconThemeData(
                color: ColorManager.yellowColor,
              ),
              unselectedIconTheme: const IconThemeData(
                color: Colors.grey
              ),
              backgroundColor: ColorManager.myWhite,
              selectedLabelStyle: TextStyle(
                fontSize: 10,
                color: ColorManager.yellowColor,
              ),
              selectedItemColor: ColorManager.yellowColor,
              unselectedItemColor: Colors.grey,

              items: const [
                BottomNavigationBarItem(
                  icon:
                    Icon(
                      Icons.shopping_bag_outlined  ,
                    )  ,
                  label: 'شحناتي'  ,
                ),
                BottomNavigationBarItem(
                  icon:
                  Icon(
                    Icons.calculate_outlined  ,
                  )  ,
                  label: 'أحسب شحنتك'  ,
                ),
                BottomNavigationBarItem(
                  icon:
                  Icon(
                    Icons.apartment_outlined  ,
                  )  ,
                  label: 'فروعنا'  ,
                ),
                BottomNavigationBarItem(
                  icon:
                  Icon(
                    Icons.person_outlined  ,
                  )  ,
                  label: 'حسابي'  ,
                ),
              /*  BottomNavigationBarItem(
                  icon:
                  Icon(
                    Icons.local_offer_outlined ,
                  )  ,
                  label: 'أحدث العروض'  ,
                ),*/


              ],
            ),
          ),
        );
      },
    );
  }
}
