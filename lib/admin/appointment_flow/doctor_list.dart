// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// import '../../constant.dart';
// import '../../data/user_model.dart';

// class AppointmentDoctorListScreen extends StatefulWidget {
//   const AppointmentDoctorListScreen({Key? key}) : super(key: key);

//   @override
//   State<AppointmentDoctorListScreen> createState() =>
//       _AppointmentDoctorListScreenState();
// }

// class _AppointmentDoctorListScreenState
//     extends State<AppointmentDoctorListScreen> {
//   FirebaseFirestore store = FirebaseFirestore.instance;

//   Stream<List<User>> responce() =>
//       store.collection("doctor").snapshots().map((event) => event.docs
//           .map(
//             (e) => User.fromJson(e.data()),
//           )
//           .toList());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: ListView.builder(
//       itemBuilder: (context, index) {
//         return StreamBuilder(
//             stream: responce(),
//             builder: (context, snapshot) {
//               final users = snapshot.data!;
//               return GestureDetector(
//                 onTap: () {},
//                 child: Padding(
//                   padding: hz10,
//                   child: Container(
//                     height: 50,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: appSecondaryColor),
//                     child: ListTile(
//                       leading: const Icon(Icons.person),
//                       title: Text(
//                         users[index].name,
//                       ),
//                       trailing: IconButton(
//                         onPressed: () async {
//                           setState(() {});
//                           await store.collection('doctor').doc().delete();
//                         },
//                         icon: const Icon(Icons.cancel),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             });
//       },
//     ));
//   }
// }
