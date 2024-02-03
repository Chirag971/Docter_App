import 'package:doctor_app/admin/notes_flow/note_cnt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../widget/app_button.dart';

class AddNotes extends StatelessWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var noteCnt = Get.put(NoteCnt());

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Add Notes',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: hz20,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            h20,
            h20,
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: cr10),
                  child: TextField(
                    controller: noteCnt.noteController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: cr10,
                          borderSide:
                              BorderSide(color: buttonBorderColor, width: 2),
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
                if (noteCnt.noteController.text.isEmpty)
                  Text(
                    'addSomeNotes'.tr,
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
                noteCnt.noteList.add(noteCnt.noteController.text);
                Get.back();
                noteCnt.noteController.clear();
              },
              title: 'AddNotes'.tr,
            )
          ]),
        ),
      ),
    );
  }
}
