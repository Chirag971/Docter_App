import 'dart:io';

import 'package:doctor_app/controller/image_cnt.dart';
import 'package:doctor_app/model/advice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../dashboard/screen/profile_screen/widget/image_dialog.dart';
import '../../widget/app_button.dart';
import '../../widget/app_textfield.dart';
import 'advice_cnt.dart';

class AddAdvice extends StatelessWidget {
  const AddAdvice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var adviceCnt = Get.put(AdviceCnt());
    var imageCnt = Get.put(ImageCnt());

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            'addAdvice'.tr,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Obx(
          () => Padding(
            padding: hz20,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                h20,
                InkWell(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => const ImageDialog(),
                    );
                    const ImageDialog();
                  },
                  child: imageCnt.getImage == null || imageCnt.getImage.isEmpty
                      ? Container(
                          height: 200,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.amber),
                        )
                      : ClipRRect(
                          borderRadius: cr10,
                          child: Image.file(
                            File(imageCnt.getImage.toString()),
                            fit: BoxFit.cover,
                            height: Get.height * 0.2,
                            width: Get.width,
                          ),
                        ),
                ),
                h20,
                AppTextField(
                  controller: adviceCnt.adviceTitleController,
                  hintText: 'title'.tr,
                ),
                h20,
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: cr10),
                      child: TextField(
                        controller: adviceCnt.adviceController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: cr10,
                              borderSide: BorderSide(
                                  color: buttonBorderColor, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: cr10,
                              borderSide:
                                  BorderSide(color: appBlackColor, width: 2),
                            ),
                            border: OutlineInputBorder(borderRadius: cr10)),
                        minLines:
                            6, // any number you need (It works as the rows for the textarea)
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    ),
                    if (adviceCnt.adviceController.text.isEmpty)
                      Text(
                        'addSomeAdvice'.tr,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[300]),
                      )
                  ],
                ),
                h30,
                AppButton(
                  press: () {
                    adviceCnt.adviceList.add(Advice(
                        advice: adviceCnt.adviceController.text,
                        title: adviceCnt.adviceTitleController.text,
                        image: imageCnt.getImage));
                    Get.back();
                  },
                  title: 'addAdvice'.tr,
                )
              ]),
            ),
          ),
        ));
  }
}
