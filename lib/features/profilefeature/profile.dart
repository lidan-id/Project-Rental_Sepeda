import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/profilefeature/user_information.dart';
import 'package:flutter_application_1/features/rentfeature/rent_status_page.dart';
import 'package:flutter_application_1/features/signaccountfeature/login.dart';
import 'package:flutter_application_1/features/profilefeature/permission.dart';
import 'package:flutter_application_1/features/profilefeature/notification.dart';
import 'package:flutter_application_1/features/topupfeature/toppup.dart';
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
                onPress: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const TopUp()));
                },
              ),
              ProfileMenuWidget(
                menuTitle: "History",
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RentStatusPage()));
                },
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
              const SizedBox(
                height: 20,
              ),
              ProfileMenuWidget(
                menuTitle: "Log out",
                onPress: () {
                  //pemindahan data ke user
                  for (int i = 0;
                      i <
                          Provider.of<RegisterProvider>(context, listen: false)
                              .users
                              .length;
                      i++) {
                    if (Provider.of<RegisterProvider>(context, listen: false)
                                .users[i]
                                .username ==
                            Provider.of<LoginProvider>(context, listen: false)
                                .currentUser
                                .username &&
                        Provider.of<RegisterProvider>(context, listen: false)
                                .users[i]
                                .password ==
                            Provider.of<LoginProvider>(context, listen: false)
                                .currentUser
                                .password) {
                      Provider.of<RegisterProvider>(context, listen: false)
                              .users[i]
                              .email =
                          Provider.of<LoginProvider>(context, listen: false)
                              .currentUser
                              .email;
                      Provider.of<RegisterProvider>(context, listen: false)
                              .users[i]
                              .name =
                          Provider.of<LoginProvider>(context, listen: false)
                              .currentUser
                              .name;
                      Provider.of<RegisterProvider>(context, listen: false)
                              .users[i]
                              .tglLahir =
                          Provider.of<LoginProvider>(context, listen: false)
                              .currentUser
                              .tglLahir;
                      Provider.of<RegisterProvider>(context, listen: false)
                              .users[i]
                              .noTlp =
                          Provider.of<LoginProvider>(context, listen: false)
                              .currentUser
                              .noTlp;
                      Provider.of<RegisterProvider>(context, listen: false)
                              .users[i]
                              .gender =
                          Provider.of<LoginProvider>(context, listen: false)
                              .currentUser
                              .gender;
                      Provider.of<RegisterProvider>(context, listen: false)
                              .users[i]
                              .bikeInRent =
                          Provider.of<LoginProvider>(context, listen: false)
                              .currentUser
                              .bikeInRent;
                      Provider.of<RegisterProvider>(context, listen: false)
                              .users[i]
                              .bookedBike =
                          Provider.of<LoginProvider>(context, listen: false)
                              .currentUser
                              .bookedBike;
                      Provider.of<RegisterProvider>(context, listen: false)
                              .users[i]
                              .rentCompleteBike =
                          Provider.of<LoginProvider>(context, listen: false)
                              .currentUser
                              .rentCompleteBike;
                      Provider.of<LoginProvider>(context, listen: false)
                          .currentUser
                          .bikeInRent = [];
                      Provider.of<LoginProvider>(context, listen: false)
                          .currentUser
                          .bookedBike = [];
                      Provider.of<LoginProvider>(context, listen: false)
                          .currentUser
                          .rentCompleteBike = [];
                    }
                  }
                  //logout
                  Provider.of<RegisterProvider>(context, listen: false)
                      .changeRent(
                          Provider.of<RentedBikeProvider>(context,
                                  listen: false)
                              .bookedBike,
                          Provider.of<RentedBikeProvider>(context,
                                  listen: false)
                              .bikeInRent,
                          Provider.of<RentedBikeProvider>(context,
                                  listen: false)
                              .rentCompleteBike);

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
              : Provider.of<LoginProvider>(context).currentUser.name,
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
