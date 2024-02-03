import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constant.dart';
import '../../../../controller/image_cnt.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cnt = Get.put(ImageCnt());
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: cr10),
      backgroundColor: appSecondaryColor,
      content: SizedBox(
        height: 120,
        child: Column(children: [
          const Text(
            'select Image',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          h20,
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  cnt.getPicker(context: context, source: ImageSource.camera);
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: all10,
                  decoration:
                      BoxDecoration(border: Border.all(), borderRadius: cr10),
                  child: Row(children: const [
                    Text(
                      'Cemera',
                      style: TextStyle(fontSize: 20),
                    )
                  ]),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  cnt.getPicker(context: context, source: ImageSource.gallery);
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: all10,
                  decoration:
                      BoxDecoration(border: Border.all(), borderRadius: cr10),
                  child: Row(children: const [
                    Text(
                      'Gallery',
                      style: TextStyle(fontSize: 20),
                    )
                  ]),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
