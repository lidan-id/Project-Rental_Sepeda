import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/profilefeature/user_information.dart';
import 'package:flutter_application_1/features/signaccountfeature/login.dart';
import 'package:flutter_application_1/features/profilefeature/permission.dart';
import 'package:flutter_application_1/features/profilefeature/notification.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

//suggest: change username/password

// Provider
// class NotificationProvider extends ChangeNotifier {
//   int _notificationRadio = 0;
//   int get notificationRadio => _notificationRadio;
//   bool transactionsChecked = false;
//   bool nearYouChecked = false;
//   bool weeklySummaryChecked = false;
//   bool specialOffersChecked = false;
//   bool eventChecked = false;
//   bool appUpdatesChecked = false;

//   void setNotificationRadio(int value) {
//     _notificationRadio = value;
//     notifyListeners();
//   }

//   void setTransactionsChecked(bool value) {
//     transactionsChecked = value;
//     notifyListeners();
//   }

//   void setNearYouChecked(bool value) {
//     nearYouChecked = value;
//     notifyListeners();
//   }

//   void setWeeklySummaryChecked(bool value) {
//     weeklySummaryChecked = value;
//     notifyListeners();
//   }

//   void setSpecialOffersChecked(bool value) {
//     specialOffersChecked = value;
//     notifyListeners();
//   }

//   void setEventChecked(bool value) {
//     eventChecked = value;
//     notifyListeners();
//   }

//   void setAppUpdatesChecked(bool value) {
//     appUpdatesChecked = value;
//     notifyListeners();
//   }
// }

// class PermissionProvider with ChangeNotifier {
//   bool cameraEnabled = false;
//   bool locationEnabled = true;
//   bool microphoneEnabled = false;
//   bool historyEnabled = false;

//   void toggleCamera() {
//     cameraEnabled = !cameraEnabled;
//     notifyListeners();
//   }

//   void toggleLocation() {
//     locationEnabled = !locationEnabled;
//     notifyListeners();
//   }

//   void toggleMicrophone() {
//     microphoneEnabled = !microphoneEnabled;
//     notifyListeners();
//   }

//   void toggleHistory() {
//     historyEnabled = !historyEnabled;
//     notifyListeners();
//   }
// }

// Widget
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D3250),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontFamily: 'Neue'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFF2D3250),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfilePicture(),
              ProfileMenuWidget(
                menuTitle: "User Information",
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UserInformation()));
                },
              ),
              ProfileMenuWidget(
                menuTitle: "My Balance",
                onPress: () {},
              ),
              ProfileMenuWidget(
                menuTitle: "History",
                onPress: () {},
              ),
              ProfileMenuWidget(
                menuTitle: "Help Center",
                onPress: () {},
              ),
              ProfileMenuWidget(
                menuTitle: "Notification",
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NotificationSettings()));
                },
              ),
              ProfileMenuWidget(
                menuTitle: "Permission",
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PermissionManager()));
                },
              ),
              ProfileMenuWidget(
                menuTitle: "Privacy Policy",
                onPress: () {},
              ),
              ProfileMenuWidget(
                menuTitle: "Terms of Service",
                onPress: () {},
              ),
              ProfileMenuWidget(
                menuTitle: "Log out",
                onPress: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const Login()),
                      (route) => false);
                },
                endIcon: false,
              ),
              // LogOut()
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 60,
      child: Row(children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: Color(0xff7077A1),
                  child: Container(
                    width: 10,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              _pickImageFromGallery(context);
                            },
                            child: Text(
                              'Add photo from gallery',
                              style: TextStyle(color: Colors.white),
                            )),
                        TextButton(
                            onPressed: () {
                              _pickImageFromCamera(context);
                            },
                            child: Text('Add photo from camera',
                                style: TextStyle(color: Colors.white)))
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: CircleAvatar(
            radius: 25,
            child: ClipOval(
              child: Provider.of<LoginProvider>(context).profilePic == null
                  ? Icon(Icons.person)
                  : Image.file(
                      Provider.of<LoginProvider>(context).profilePic!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          Provider.of<LoginProvider>(context).user,
          style: TextStyle(fontSize: 20, color: Colors.white),
        )
      ]),
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

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.menuTitle,
    required this.onPress,
    this.endIcon = true,
  });

  final String menuTitle;
  final VoidCallback onPress;
  final bool endIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      title: Text(
        menuTitle,
        style: const TextStyle(
            color: Colors.white, fontSize: 30, fontFamily: 'Neue'),
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

// class PermissionManager extends StatelessWidget {
//   const PermissionManager({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final permissionProvider = Provider.of<PermissionProvider>(context);
//     return Container(
//         decoration: BoxDecoration(
//           border: Border.all(width: 1),
//           borderRadius: BorderRadius.circular(25),
//         ),
//         child: Column(
//           children: [
//             const ListTile(
//               title: Text(
//                 "Permission Manager",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w900,
//                     color: Colors.white,
//                     fontFamily: 'Neue',
//                     fontSize: 35),
//               ),
//             ),
//             SwitchListTile(
//               title: const Text(
//                 'Camera',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontFamily: 'Neue',
//                   color: Color(0xFFF6B17A),
//                 ),
//               ),
//               value: permissionProvider.cameraEnabled,
//               activeColor: const Color(0xFFF6B17A),
//               onChanged: (value) {
//                 permissionProvider.toggleCamera();
//               },
//             ),
//             SwitchListTile(
//               title: const Text(
//                 'Location',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontFamily: 'Neue',
//                   color: Color(0xFFF6B17A),
//                 ),
//               ),
//               value: permissionProvider.locationEnabled,
//               activeColor: const Color(0xFFF6B17A),
//               onChanged: (value) {
//                 permissionProvider.toggleLocation();
//               },
//             ),
//             SwitchListTile(
//               title: const Text(
//                 'Microphone',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontFamily: 'Neue',
//                   color: Color(0xFFF6B17A),
//                 ),
//               ),
//               value: permissionProvider.microphoneEnabled,
//               activeColor: const Color(0xFFF6B17A),
//               onChanged: (value) {
//                 permissionProvider.toggleMicrophone();
//               },
//             ),
//             SwitchListTile(
//               title: const Text(
//                 'History',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontFamily: 'Neue',
//                   color: Color(0xFFF6B17A),
//                 ),
//               ),
//               value: permissionProvider.historyEnabled,
//               activeColor: const Color(0xFFF6B17A),
//               onChanged: (value) {
//                 permissionProvider.toggleHistory();
//               },
//             ),
//           ],
//         ));
//   }
// }

// class NotificationSettings extends StatelessWidget {
//   const NotificationSettings({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final notificationProvider = Provider.of<NotificationProvider>(context);
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(width: 1),
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Column(
//         children: [
//           const ListTile(
//             title: Text(
//               "Notification Settings",
//               style: TextStyle(
//                   fontWeight: FontWeight.w900,
//                   color: Colors.white,
//                   fontFamily: 'Neue',
//                   fontSize: 35),
//             ),
//           ),
//           RadioListTile(
//             activeColor: const Color(0xFFF6B17A),
//             title: const Text(
//               'All',
//               style: TextStyle(
//                   fontSize: 25, fontFamily: 'Neue', color: Color(0xFFF6B17A)),
//             ),
//             subtitle: const Text(
//               'Receive all types of notifications from the app.',
//               style: TextStyle(
//                 fontSize: 15,
//                 fontFamily: 'Neue',
//                 color: Colors.white,
//               ),
//             ),
//             value: 0,
//             groupValue: notificationProvider.notificationRadio,
//             onChanged: (value) {
//               notificationProvider.setNotificationRadio(value!);
//             },
//           ),
//           RadioListTile(
//             activeColor: const Color(0xFFF6B17A),
//             title: const Text(
//               'Important',
//               style: TextStyle(
//                   fontSize: 25, fontFamily: 'Neue', color: Color(0xFFF6B17A)),
//             ),
//             subtitle: const Text(
//               'Only receive  important notifications.',
//               style: TextStyle(
//                 fontSize: 15,
//                 fontFamily: 'Neue',
//                 color: Colors.white,
//               ),
//             ),
//             value: 1,
//             groupValue: notificationProvider.notificationRadio,
//             onChanged: (value) {
//               notificationProvider.setNotificationRadio(value!);
//             },
//           ),
//           RadioListTile(
//             activeColor: const Color(0xFFF6B17A),
//             title: const Text(
//               'None',
//               style: TextStyle(
//                   fontSize: 25, fontFamily: 'Neue', color: Color(0xFFF6B17A)),
//             ),
//             subtitle: const Text(
//               "You won't be disturbed by any notifications.",
//               style: TextStyle(
//                 fontSize: 15,
//                 fontFamily: 'Neue',
//                 color: Colors.white,
//               ),
//             ),
//             value: 2,
//             groupValue: notificationProvider.notificationRadio,
//             onChanged: (value) {
//               notificationProvider.setNotificationRadio(value!);
//             },
//           ),
//           RadioListTile(
//             activeColor: const Color(0xFFF6B17A),
//             title: const Text(
//               'Custom',
//               style: TextStyle(
//                   fontSize: 25, fontFamily: 'Neue', color: Color(0xFFF6B17A)),
//             ),
//             subtitle: const Text(
//               "Customize which notifications you want to receive.",
//               style: TextStyle(
//                 fontSize: 15,
//                 fontFamily: 'Neue',
//                 color: Colors.white,
//               ),
//             ),
//             value: 3,
//             groupValue: notificationProvider.notificationRadio,
//             onChanged: (value) {
//               notificationProvider.setNotificationRadio(value!);
//             },
//           ),
//           //Custom Notif
//           if (notificationProvider.notificationRadio == 3)
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: const Color(0xFF424769),
//               ),
//               width: MediaQuery.of(context).size.width * 0.7,
//               child: Column(
//                 children: [
//                   CheckboxListTile(
//                     activeColor: const Color(0xFFF6B17A),
//                     side: const BorderSide(
//                         strokeAlign: 2, color: Color(0xFF2D3250)),
//                     checkColor: const Color(0xFF2D3250),
//                     title: const Text(
//                       'Transactions',
//                       style: TextStyle(
//                           fontFamily: 'Neue',
//                           fontSize: 15,
//                           color: Colors.white),
//                     ),
//                     value: notificationProvider.transactionsChecked,
//                     onChanged: (value) {
//                       notificationProvider
//                           .setTransactionsChecked(value ?? false);
//                     },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(0),
//                     ),
//                   ),
//                   CheckboxListTile(
//                     activeColor: const Color(0xFFF6B17A),
//                     side: const BorderSide(
//                         strokeAlign: 2, color: Color(0xFF2D3250)),
//                     checkColor: const Color(0xFF2D3250),
//                     title: const Text(
//                       'Near You',
//                       style: TextStyle(
//                           fontFamily: 'Neue',
//                           fontSize: 15,
//                           color: Colors.white),
//                     ),
//                     value: notificationProvider.nearYouChecked,
//                     onChanged: (value) {
//                       notificationProvider.setNearYouChecked(value ?? false);
//                     },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(0),
//                     ),
//                   ),
//                   CheckboxListTile(
//                     activeColor: const Color(0xFFF6B17A),
//                     side: const BorderSide(
//                         strokeAlign: 2, color: Color(0xFF2D3250)),
//                     checkColor: const Color(0xFF2D3250),
//                     title: const Text(
//                       'Weekly Summary',
//                       style: TextStyle(
//                           fontFamily: 'Neue',
//                           fontSize: 15,
//                           color: Colors.white),
//                     ),
//                     value: notificationProvider.weeklySummaryChecked,
//                     onChanged: (value) {
//                       notificationProvider
//                           .setWeeklySummaryChecked(value ?? false);
//                     },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(0),
//                     ),
//                   ),
//                   CheckboxListTile(
//                     activeColor: const Color(0xFFF6B17A),
//                     side: const BorderSide(
//                         strokeAlign: 2, color: Color(0xFF2D3250)),
//                     checkColor: const Color(0xFF2D3250),
//                     title: const Text(
//                       'Special Offers',
//                       style: TextStyle(
//                           fontFamily: 'Neue',
//                           fontSize: 15,
//                           color: Colors.white),
//                     ),
//                     value: notificationProvider.specialOffersChecked,
//                     onChanged: (value) {
//                       notificationProvider
//                           .setSpecialOffersChecked(value ?? false);
//                     },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(0),
//                     ),
//                   ),
//                   CheckboxListTile(
//                     activeColor: const Color(0xFFF6B17A),
//                     side: const BorderSide(
//                         strokeAlign: 2, color: Color(0xFF2D3250)),
//                     checkColor: const Color(0xFF2D3250),
//                     title: const Text(
//                       'Event',
//                       style: TextStyle(
//                           fontFamily: 'Neue',
//                           fontSize: 15,
//                           color: Colors.white),
//                     ),
//                     value: notificationProvider.eventChecked,
//                     onChanged: (value) {
//                       notificationProvider.setEventChecked(value ?? false);
//                     },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(0),
//                     ),
//                   ),
//                   CheckboxListTile(
//                     activeColor: const Color(0xFFF6B17A),
//                     side: const BorderSide(
//                         strokeAlign: 2, color: Color(0xFF2D3250)),
//                     checkColor: const Color(0xFF2D3250),
//                     title: const Text(
//                       'App Updates',
//                       style: TextStyle(
//                           fontFamily: 'Neue',
//                           fontSize: 15,
//                           color: Colors.white),
//                     ),
//                     value: notificationProvider.appUpdatesChecked,
//                     onChanged: (value) {
//                       notificationProvider.setAppUpdatesChecked(value ?? false);
//                     },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(0),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            const ListTile(
              title: Text(
                "Log Out",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontFamily: 'Neue',
                    fontSize: 30),
              ),
            ),
            //tambah logic Logout
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const Login()),
                    (route) => false);
              },
              style: ElevatedButton.styleFrom(
                elevation: 10,
                enableFeedback: true,
                foregroundColor: const Color(0xFF7077A1),
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(fontFamily: 'Neue', color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ));
  }
}



// class Profile extends StatelessWidget {
//   const Profile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile",
//         style: TextStyle(fontFamily: 'Neue'),),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(10),
//           child: Column(
//             children: [
//               ListTile(
//                 title: Text("Edit Profile"),
//                 trailing: Container(
//                   width: 30,
//                   height: 30,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     color: Colors.grey),
//                   child: const Icon(Icons.arrow_right),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
