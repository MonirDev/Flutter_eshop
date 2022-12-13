import 'package:eshop/app/modules/bottom_bar/widgets/tab_item.dart';
import 'package:eshop/app/utils/colors.dart';
import 'package:eshop/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 25,
              spreadRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            iconSize: 25.sp,
            currentIndex: currentTab.index,
            items: [
              _bottomNavigationBarItem(
                  icon: ImagePath.home,
                  label: tabName[TabItem.home]!,
                  isUnselect: currentTab.index != 0),
              _bottomNavigationBarItem(
                  icon: ImagePath.cart,
                  label: tabName[TabItem.shop]!,
                  isUnselect: currentTab.index != 1),
              _bottomNavigationBarItem(
                  icon: ImagePath.bag,
                  label: tabName[TabItem.bag]!,
                  isUnselect: currentTab.index != 2),
              _bottomNavigationBarItem(
                  icon: ImagePath.heart,
                  label: tabName[TabItem.favorite]!,
                  isUnselect: currentTab.index != 3),
              _bottomNavigationBarItem(
                  icon: ImagePath.profile,
                  label: tabName[TabItem.profile]!,
                  isUnselect: currentTab.index != 4),
            ],
            onTap: (index) => onSelectTab(
              TabItem.values[index],
            ),
            selectedItemColor: AppColors.red,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.white,
            unselectedLabelStyle: TextStyle(height: 0.sp),
            selectedLabelStyle: TextStyle(height: 0.sp, color: AppColors.red),
          ),
        ),
      ),
    );
  }

  // BottomNavigationBarItem
  _bottomNavigationBarItem(
      {required String icon, required String label, required bool isUnselect}) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.sp, right: 5.sp, bottom: 0.sp),
            child: Image(
              image: AssetImage(icon),
              width: 25.sp,
              color: isUnselect ? AppColors.grey : AppColors.red,
            ),
          ),
          // Visibility(
          //   visible: (label == 'Cart' && Get.find<AddtocartController>().cartcount.value > 0),
          //   child:
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   child: Container(
          //     width: 17.sp,
          //     height: 17.sp,
          //     decoration:
          //         BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
          //     child: Align(
          //       alignment: Alignment.center,
          //       child:
          //           // Obx(
          //           //   () =>
          //           Text(
          //         '3',
          //         // Get.find<AddtocartController>().cartcount.value.toString(),
          //         style: TextStyle(color: AppColors.white, fontSize: 10.sp),
          //       ),
          //       // ),
          //     ),
          //   ),
          //   // ),
          // ),
          // // Visibility(
          // //   visible: (label == 'Favourite' && Get.find<MyWishListController>().wishListCount.value > 0),
          // //   child:
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   child: Container(
          //     width: 17.sp,
          //     height: 17.sp,
          //     decoration:
          //         BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
          //     child: Align(
          //       alignment: Alignment.center,
          //       child:
          //           // Obx(
          //           //   () =>
          //           Text(
          //         '2',
          //         // Get.find<MyWishListController>().wishListCount.value.toString(),
          //         style: TextStyle(color: AppColors.white, fontSize: 10.sp),
          //       ),
          //       // ),
          //     ),
          //   ),
          // ),
          // // )
        ],
      ),
      label: label,
    );
  }
}
