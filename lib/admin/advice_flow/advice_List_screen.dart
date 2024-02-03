import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import 'add_advice.dart';
import 'advice_cnt.dart';

class AdviceListScreen extends StatelessWidget {
  bool isUser;
  AdviceListScreen({Key? key, this.isUser = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adviceCnt = Get.put(AdviceCnt());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            'addAdvice'.tr,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: Obx(
          () => Column(children: [
            Expanded(
              child: Padding(
                padding: hz20,
                child: ListView.separated(
                  separatorBuilder: (context, index) => h20,
                  itemCount: adviceCnt.adviceList.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: cr20,
                              border: Border.all(color: appBlackColor),
                              color: appSecondaryColor,
                              image: DecorationImage(
                                  image: FileImage(
                                    File(adviceCnt.adviceList[index].image),
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        if (!isUser)
                          Positioned(
                              top: 10,
                              right: 10,
                              child: InkWell(
                                  onTap: () {
                                    adviceCnt.adviceList
                                        .remove(adviceCnt.adviceList[index]);
                                  },
                                  child: const Icon(
                                    Icons.cancel,
                                    size: 30,
                                  ))),
                        Positioned(
                            top: 20,
                            left: 20,
                            child: Text(adviceCnt.adviceList[index].advice))
                      ],
                    );
                  },
                ),
              ),
            ),
            if (!isUser)
              Align(
                alignment: Alignment.bottomCenter,
                child: OutlinedButton(
                  clipBehavior: Clip.none,
                  onPressed: () {
                    Get.to(
                      const AddAdvice(),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    minimumSize: const Size(250, 50),
                  ),
                  child: Text(
                    'addAdvice'.tr,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
          ]),
        ));
  }
}
