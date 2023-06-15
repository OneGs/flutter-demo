import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/common/config_colors.dart';
import 'package:untitled/pages/home/models/workbench/workbench_view.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Widget> tabList = [
    WorkbenchPage(),
    const Text('2'),
    const Text('3'),
    const Text('4'),
  ];

  final List<BottomNavigationBarItem> bottomBarList = [
    const BottomNavigationBarItem(
      icon: Image(
        image: AssetImage("lib/assets/images/notice_g.png"),
        height: 30,
      ),
      activeIcon: Image(
        image: AssetImage("lib/assets/images/notice_b.png"),
        height: 30,
      ),
      label: "工作台",
    ),
    const BottomNavigationBarItem(
      icon: Image(
        image: AssetImage("lib/assets/images/gzt.png"),
        height: 25,
      ),
      activeIcon: Image(
        image: AssetImage("lib/assets/images/gzt_g.png"),
        height: 25,
      ),
      label: "任务中心",
    ),
    const BottomNavigationBarItem(
      icon: Image(
        image: AssetImage("lib/assets/images/mail_list_g.png"),
        height: 25,
      ),
      activeIcon: Image(
        image: AssetImage("lib/assets/images/mail_list_b.png"),
        height: 25,
      ),
      label: "通讯录",
    ),
    const BottomNavigationBarItem(
      icon: Image(
        image: AssetImage("lib/assets/images/my_g.png"),
        height: 25,
      ),
      activeIcon: Image(
        image: AssetImage("lib/assets/images/my_b.png"),
        height: 25,
      ),
      label: "我",
    )
  ];

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeLogic>();
    final state = Get.find<HomeLogic>().state;

    return Scaffold(
        body: PageView.builder(
          controller: logic.pageController,
          itemCount: tabList.length,
          itemBuilder: (context, index) => tabList[index],
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: logic.setCurrentIndex,
        ),
        //--------------------------------------
        backgroundColor: ConfigColors.color_f9f9f9,
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ConfigColors.color_3FAED4,
            unselectedItemColor: ConfigColors.color_999999,
            items: bottomBarList,
            currentIndex: logic.currentIndex.value,
            onTap: logic.jumpToPage,
          );
        }));
  }
}
