import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class UploadImage extends StatefulWidget {
  UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

File? _ImageFile;
FirebaseStorage _storage = FirebaseStorage.instance;
var  imageUrl;

class _UploadImageState extends State<UploadImage> {
  final CommentController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          "New Post",
          style: TextStyle(color: Colors.blueAccent[200]),
        )),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
              onTap: () => showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  builder: (cnxt) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Pick Image from,',
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      _pickImageFromGallery();
                                      print("gallery selected");
                                    },
                                    child: Text("Gallery")),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      _PickImageFromCamera();
                                      print("Camera selected");
                                    },
                                    child: Text("Camera")),
                              ),
                           
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: CommentController,
              decoration: InputDecoration(
                  hintText: "Enter a Comment", border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
              uploadImage(_ImageFile!);
                // _pickImageFromGallery();
                // _PickImageFromCamera();
              },
              child: Text("Shair"))
        ],
      )),
    );
  }

  Future<void> _pickImageFromGallery() async {
    ImagePicker _picker = ImagePicker();
    final PickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      setState(() {
        _ImageFile = File(PickedFile.path);
      });
      uploadImage(_ImageFile!);
    }
  }

  Future<void> _PickImageFromCamera() async {
    ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _ImageFile = File(pickedFile.path);
      });
      uploadImage(_ImageFile!);
    }
  }

  uploadImage(File image) async {
    basename(image.path);
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('profileImage/${basename(image.path)}');
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    imageUrl = await snapshot.ref.getDownloadURL();
    print(image);
    // try {
    //   Reference reference = _storage.ref().child("images/");
    //   UploadTask uploadTask = reference.putFile(image);

    //   String url = await reference.getDownloadURL();

    //   print('>>>>>> $url');
    // } on Exception catch (er) {
    //   print(er);
    // }
    // Uri location = (await uploadTask.).downloadUrl;
    // return location;
  }
}
