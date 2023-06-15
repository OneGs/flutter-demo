import 'package:flutter/material.dart';

import './workbench_card_item.dart';

class WorkbenchCard extends StatelessWidget {
  final List listData = [
    {
      'name': '质量问题',
      'image': 'lib/assets/images/work/qualityProblem.png',
      'path': '/qualityTesting',
    },
    {
      'name': '质量验评',
      'image': 'lib/assets/images/work/qualityVerification.png',
      'path': '/qualityVerification',
    },
    {
      'name': '工程量填报',
      'image': 'lib/assets/images/work/visaManagement.png',
      'path': '/visaManagementPage',
    },
    {
      'name': '施工日志',
      'image': 'lib/assets/images/work/construction.png',
      'path': '/constructionLogPage',
    },
    {
      'name': '监理日志',
      'image': 'lib/assets/images/work/supervisor.png',
      'path': '/supervisorLogPage',
    },
    {
      'name': '安全检查',
      'image': 'lib/assets/images/work/security_check.png',
      'path': '/safeCheckPage',
    },
  ];

  WorkbenchCard({Key? key}) : super(key: key);

  Widget _getListData(context, index) {
    var item = listData.elementAt(index);
    return WorkbenchCardItem(
      item['name'],
      item['image'],
      item['path'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 0,
      ),
      scrollDirection: Axis.vertical,
      itemCount: listData.length,
      itemBuilder: _getListData,
    );
  }
}
