import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import 'dashboard_cnt.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardCnt = Get.put(DashboardCnt());
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          body: dashboardCnt.pages.elementAt(dashboardCnt.selectedIndex.value),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 100,
              child: BottomNavigationBar(
                  onTap: (value) {
                    dashboardCnt.selectedIndex.value = value;
                  },
                  backgroundColor: dashboardCnt.selectedIndex.value == 1
                      ? null
                      : appWhiteColor,
                  unselectedItemColor: appBlackColor,
                  selectedItemColor: appPrimaryColor,
                  currentIndex: dashboardCnt.selectedIndex.value,
                  items:  [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'home'.tr,
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.calendar_month_outlined),
                        label: 'appointment'.tr),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: 'profile'.tr)
                  ]),
            ),
          ),
        ));
  }
}
