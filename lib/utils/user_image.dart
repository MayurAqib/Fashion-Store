import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImage extends StatefulWidget {
  const UserImage(
      {super.key,
      required this.onUpload,
      required this.imageUrl,
      required this.onPickImage});
  final void Function()? onUpload;
  final String imageUrl;
  final void Function(File pickedImage) onPickImage;
  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  File? _pickedImageFile;
  final currentUser = FirebaseAuth.instance.currentUser!;

  void _pickImagFromGallery() async {
    final pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 100);

    if (pickedImage == null) {
      return;
    }
    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });
    widget.onPickImage(_pickedImageFile!);
  }

  void _pickImageFromCamera() async {
    final pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    color: const Color.fromARGB(255, 17, 1, 74),
                    child: Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                    child: _pickedImageFile != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.file(
                              _pickedImageFile!,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.grey.shade800),
                            child: const Icon(
                              Icons.image,
                              size: 30,
                            ),
                          ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 120,
                  child: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  backgroundColor: Colors.grey.shade900,
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                          onPressed: _pickImagFromGallery,
                                          child: const Text(
                                            'Gallery',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                      TextButton(
                                          onPressed: _pickImageFromCamera,
                                          child: const Text(
                                            'Camera',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: widget.onUpload,
                                        child: const Text(
                                          'Upload',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            if (mounted) {
                                              _pickedImageFile == null;
                                            }
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ],
                                ));
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 30,
                        color: Colors.white,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
