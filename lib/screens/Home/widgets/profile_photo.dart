import 'package:deledocdoctor/servises/doc_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorController doctorController = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('approveddoctors')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No doctors found.'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data!.docs[index];
              var docid = snapshot.data!.docs[index].id;

              return DoctorCard(
                doc: doc,
                docId: docid,
              );
            },
          );
        },
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final QueryDocumentSnapshot doc;
  final docId;

  DoctorCard({super.key, required this.doc, required this.docId});
  // final ApplicationController cntrl = Get.find();

  @override
  Widget build(BuildContext context) {
    print("......................$docId");
    print(FirebaseAuth.instance.currentUser!.uid);

    return docId == FirebaseAuth.instance.currentUser!.uid
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(doc['profile']),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doc['name'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                doc['specialist'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 2, 84, 152),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "License No: ${doc['licensenumber']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //  cntrl.docId =docId;
                            // cntrl.data=doc;
                            // Get.to(ApplicationPreview(
                            //   data: doc,
                            // )
                            // );
                            // Your onPressed logic here
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            primary: const Color.fromARGB(255, 237, 230, 230),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Colors.green, width: 2),
                            ),
                          ),
                          child: const Text("View Details"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Your onPressed logic here
                          },
                          style: ElevatedButton.styleFrom(
                            // ignore: deprecated_member_use
                            primary: const Color.fromARGB(255, 0, 4, 7),
                            // ignore: deprecated_member_use
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Colors.green, width: 2),
                            ),
                          ),
                          child: const Text("Remove"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : SizedBox();
  }
}
