import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserGender = Provider.of<LoginProvider>(context).currentUser.gender == ""? "Not Set" : Provider.of<LoginProvider>(context).currentUser.gender;
    final currentUserTglLahir = Provider.of<LoginProvider>(context).currentUser.tglLahir == DateTime(0, 0, 0)? "Not Set" : DateFormat('dd/MM/yyyy').format(Provider.of<LoginProvider>(context).currentUser.tglLahir).toString();
    final currentUserNoTlp = Provider.of<LoginProvider>(context).currentUser.noTlp == 0? "Not Set" : "0"+Provider.of<LoginProvider>(context).currentUser.noTlp.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Information",
          style: TextStyle(fontFamily: 'Neue'),
        ),
        foregroundColor: const Color(0xFFF6B17A),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.height * 0.25,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 10500,
                      // maxRadius: MediaQuery.of(context).size.height * 0.1,
                      child: ClipOval(
                        child: Provider.of<LoginProvider>(context).profilePic ==
                                null
                            ? const Icon(
                                Icons.person,
                                size: 100,
                              )
                            : Image.file(
                                Provider.of<LoginProvider>(context).profilePic!,
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                width:
                                    MediaQuery.of(context).size.height * 0.25,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 15,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200)),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: const Color(0xff7077A1),
                                child: SizedBox(
                                  width: 10,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () async {
                                            await _pickImageFromGallery(
                                                context);
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Add photo from gallery',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                      TextButton(
                                          onPressed: () async {
                                            await _pickImageFromCamera(context);
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                              'Add photo from camera',
                                              style: TextStyle(
                                                  color: Colors.white)))
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        backgroundColor: Colors.green,
                        child: const Icon(Icons.camera_alt),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              UserProfileMenuWidget(
                  leadingTitle: "Name", menuTitle: "COba", onPress: () {}),
              UserProfileMenuWidget(
                  leadingTitle: "Gender", menuTitle: currentUserGender, onPress: () {
                    // RadioListTile(value: 0, groupValue: groupValue, onChanged: onChanged)
                  }),
              UserProfileMenuWidget(
                  leadingTitle: "Birth Date",
                  menuTitle: currentUserTglLahir,
                  onPress: () {}),
              UserProfileMenuWidget(
                  leadingTitle: "Phone Number",
                  menuTitle: currentUserNoTlp,
                  onPress: () {}),
              UserProfileMenuWidget(
                  leadingTitle: "Email", menuTitle: "COba", onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class UserProfileMenuWidget extends StatelessWidget {
  const UserProfileMenuWidget({
    super.key,
    required this.leadingTitle,
    required this.menuTitle,
    required this.onPress,
    this.endIcon = true,
  });

  final String leadingTitle;
  final String menuTitle;
  final VoidCallback onPress;
  final bool endIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Text(
        leadingTitle,
        style: const TextStyle(
            color: Colors.white, fontSize: 30, fontFamily: 'Neue'),
      ),
      title: Text(
        textAlign: TextAlign.end,
        menuTitle,
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontFamily: 'Neue'),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 50,
              decoration: const ShapeDecoration(
                  shape: CircleBorder(
                      side: BorderSide(
                color: Colors.grey,
              ))),
              child: const Icon(
                Icons.arrow_right,
                color: Color(0xFFF6B17A),
              ),
            )
          : null,
    );
  }
}

Future _pickImageFromGallery(BuildContext context) async {
  final returnedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  if (returnedImage == null) return;
  Provider.of<LoginProvider>(context, listen: false)
      .changeProfilePic(File(returnedImage.path));
}

Future _pickImageFromCamera(BuildContext context) async {
  final returnedImage =
      await ImagePicker().pickImage(source: ImageSource.camera);
  print(returnedImage);
  if (returnedImage == null) return;
  Provider.of<LoginProvider>(context, listen: false)
      .changeProfilePic(File(returnedImage.path));
}
