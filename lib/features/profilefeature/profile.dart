import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/profilefeature/user_information.dart';
import 'package:flutter_application_1/features/signaccountfeature/login.dart';
import 'package:flutter_application_1/features/profilefeature/permission.dart';
import 'package:flutter_application_1/features/profilefeature/notification.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D3250),
        title: const Text(
          "Profile",
          style: TextStyle(color: Color(0xFFF6B17A), fontFamily: 'Neue'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFF2D3250),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfilePicture(),
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
              const SizedBox(
                height: 20,
              ),
              ProfileMenuWidget(
                menuTitle: "Log out",
                onPress: () {
                  Provider.of<RegisterProvider>(context, listen: false)
                      .changeRent(Provider.of<RentedBikeProvider>(context,
                              listen: false)
                          .bookedBike);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const Login()),
                      (route) => false);
                },
                endIcon: false,
                textColor: Colors.red,
              ),
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
      padding: const EdgeInsets.only(left: 10),
      height: 60,
      child: Row(children: [
        CircleAvatar(
          radius: 25,
          child: ClipOval(
            child: Provider.of<LoginProvider>(context).profilePic == null
                ? const Icon(Icons.person)
                : Image.file(
                    Provider.of<LoginProvider>(context).profilePic!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          Provider.of<LoginProvider>(context).user.isEmpty
              ? "DummyBot"
              : Provider.of<LoginProvider>(context).user,
          style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontFamily: "Neue",
              letterSpacing: 2),
        ),
      ]),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.menuTitle,
    required this.onPress,
    this.textColor = Colors.white,
    this.endIcon = true,
  });

  final String menuTitle;
  final VoidCallback onPress;
  final bool endIcon;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      title: Text(
        menuTitle,
        style: TextStyle(color: textColor, fontSize: 30, fontFamily: 'Neue'),
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

// class LogOut extends StatelessWidget {
//   const LogOut({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//           border: Border.all(width: 1),
//           borderRadius: BorderRadius.circular(25),
//         ),
//         child: Column(
//           children: [
//             const ListTile(
//               title: Text(
//                 "Log Out",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w900,
//                     color: Colors.red,
//                     fontFamily: 'Neue',
//                     fontSize: 30),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pushAndRemoveUntil(
//                     MaterialPageRoute(builder: (context) => const Login()),
//                     (route) => false);
//               },
//               style: ElevatedButton.styleFrom(
//                   elevation: 10,
//                   enableFeedback: true,
//                   foregroundColor: const Color(0xFF7077A1),
//                   backgroundColor: Colors.red,
//                   ),
//               child: const Text(
//                 'Log Out',
//                 style: TextStyle(fontFamily: 'Neue', color: Colors.red),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             )
//           ],
//         ));
//   }
// }



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
