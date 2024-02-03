import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import 'appointment_cnt.dart';

class CloseAppoinmentsList extends StatefulWidget {
  const CloseAppoinmentsList({Key? key}) : super(key: key);

  @override
  State<CloseAppoinmentsList> createState() => _CloseAppoinmentsListState();
}

class _CloseAppoinmentsListState extends State<CloseAppoinmentsList> {
  final appointment_cnt = Get.put(AppointmentCnt());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhiteColor,
      body: Obx(
        () => DraggableHome(
          appBarColor: appPrimaryColor,
          title: Text(
            "Close Appointment",
            style: TextStyle(color: appWhiteColor),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: appWhiteColor,
              ),
              onPressed: () {
                Get.back();
              }),
          headerWidget: const Center(
            child: Text(
              'Close Appointment',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.separated(
                  separatorBuilder: (context, index) => Padding(
                        padding: hz20,
                        child: Divider(
                          thickness: 0.5,
                          color: appPrimaryColor,
                        ),
                      ),
                  padding: const EdgeInsets.only(top: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: appointment_cnt.closeAppointmentList.length,
                  itemBuilder: (context, index) => ListTile(
                        leading: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: appPrimaryColor,
                          ),
                          child: Center(
                            child: Text(
                              "${index + 1}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        title: Text(
                          appointment_cnt.closeAppointmentList[index].name,
                        ),
                      )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    "${'total'.tr} :- ${appointment_cnt.closeAppointmentList.length}",
                    style: TextStyle(color: appPrimaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
