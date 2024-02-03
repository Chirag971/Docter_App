import 'package:doctor_app/admin/notes_flow/add_notes.dart';
import 'package:doctor_app/admin/notes_flow/note_cnt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class NotesListScreen extends StatelessWidget {
  bool isUser;
  NotesListScreen({Key? key, this.isUser = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cnt = Get.put(NoteCnt());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          isUser ? 'Notes' : 'add Notes',
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Column(children: [
        Expanded(
            child: Padding(
                padding: hz20,
                child: Obx(
                  () => ListView.separated(
                    separatorBuilder: (context, index) => h20,
                    itemCount: cnt.noteList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: cr20,
                          border: Border.all(color: appBlackColor),
                          color: appSecondaryColor,
                        ),
                        child: ListTile(
                          title: Text(cnt.noteList[index]),
                          trailing: isUser
                              ? null
                              : IconButton(
                                  icon: const Icon(Icons.cancel),
                                  onPressed: () {
                                    cnt.noteList.remove(cnt.noteList[index]);
                                  },
                                ),
                        ),
                      );
                    },
                  ),
                ))),
        if (!isUser)
          Align(
            alignment: Alignment.bottomCenter,
            child: OutlinedButton(
              clipBehavior: Clip.none,
              onPressed: () {
                Get.to(
                  const AddNotes(),
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
    );
  }
}
