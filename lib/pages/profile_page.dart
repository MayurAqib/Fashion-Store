import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saba_fashion_store/utils/const.dart';
import 'package:saba_fashion_store/utils/user_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _selectedImage;
  final userCollection = FirebaseFirestore.instance.collection('users');
  final user = FirebaseAuth.instance.currentUser!;

  Future<void> imageUpload() async {
    final userCredentials = FirebaseAuth.instance.currentUser!;
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('imageUrl')
        .child('${userCredentials.uid}.jpg');
    await storageRef.putFile(_selectedImage!);
    final imageUrl = await storageRef.getDownloadURL();
    if (imageUrl.isNotEmpty) {
      await userCollection.doc(userCredentials.email).update({
        'imageUrl': imageUrl,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.05),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  const SizedBox(
                    height: 400,
                  ),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(color: backgroundColor),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.email)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final userData =
                              snapshot.data!.data() as Map<String, dynamic>;
                          return UserImage(
                            onPickImage: (pickedImage) =>
                                _selectedImage = pickedImage,
                            onUpload: () {
                              imageUpload();
                              Navigator.pop(context);
                            },
                            imageUrl: userData['imageUrl'],
                          );
                        } else {
                          return const Text('Upload Image');
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.email)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final userData =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return Column(
                      children: [
                        Text(
                          userData['Name'],
                          style: GoogleFonts.bebasNeue(fontSize: 40),
                        ),
                        Text(
                          'Age: ${userData['Age'].toString()}',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 25, color: Colors.grey),
                        )
                      ],
                    );
                  }
                  return const Text(
                    'UserName',
                  );
                },
              ),
            ],
          ),
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Are you sure?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),
                            TextButton(
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.pop(context);
                                },
                                child: const Text('Logout')),
                          ],
                        ));
              },
              child: Text(
                'logout!',
                style: GoogleFonts.bebasNeue(color: Colors.black, fontSize: 30),
              ))
        ],
      ),
    );
  }
}
