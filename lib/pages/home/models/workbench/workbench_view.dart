import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/widgets/common_image.dart';

import './workbench_card.dart';
import 'workbench_logic.dart';

class WorkbenchPage extends StatelessWidget {
  WorkbenchPage({Key? key}) : super(key: key);

  final logic = Get.put(WorkbenchLogic());
  final state = Get.find<WorkbenchLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          height: 290,
          child: Stack(
            children: [
              SizedBox(
                height: 230,
                width: MediaQuery.of(context).size.width,
                child: const CommonImage(
                  'lib/assets/images/home_bg.png',
                  height: 230,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        // --------------------------
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 0),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          // ----------------------------------
          body: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(10, 275, 10, 0),
                color: Colors.white,
                child: WorkbenchCard(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
