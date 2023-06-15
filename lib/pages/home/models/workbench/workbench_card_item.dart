import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/common//config_colors.dart';
import 'package:untitled/utils/judge.dart';
import 'package:untitled/widgets/common_image.dart';

class WorkbenchCardItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String path;

  const WorkbenchCardItem(this.name, this.imageUrl, this.path, {Key? key})
      : super(key: key);

  _clickLinkHandle(context) {
    if (!isEmpty(path)) {
      Get.toNamed(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _clickLinkHandle(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.33 - 6,
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 55,
                  height: 55,
                  child: Center(
                    child: CommonImage(
                      imageUrl,
                      width: 55,
                      height: 55,
                      fit: BoxFit.fill,
                    ),
                  )),
              const SizedBox(height: 7),
              Text(
                name,
                style: const TextStyle(
                  color: ConfigColors.color_666666,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
