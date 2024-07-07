import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_component.dart';
import 'package:provider/provider.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notification Settings",
          style: TextStyle(fontFamily: 'Neue'),
        ),
        foregroundColor: const Color(0xFFF6B17A),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            RadioListTile(
              activeColor: const Color(0xFFF6B17A),
              title: const Text(
                'All',
                style: TextStyle(
                    fontSize: 25, fontFamily: 'Neue', color: Color(0xFFF6B17A)),
              ),
              subtitle: const Text(
                'Receive all types of notifications from the app.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Neue',
                  color: Colors.white,
                ),
              ),
              value: 0,
              groupValue: notificationProvider.notificationRadio,
              onChanged: (value) {
                notificationProvider.setNotificationRadio(value!);
              },
            ),
            RadioListTile(
              activeColor: const Color(0xFFF6B17A),
              title: const Text(
                'Important',
                style: TextStyle(
                    fontSize: 25, fontFamily: 'Neue', color: Color(0xFFF6B17A)),
              ),
              subtitle: const Text(
                'Only receive  important notifications.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Neue',
                  color: Colors.white,
                ),
              ),
              value: 1,
              groupValue: notificationProvider.notificationRadio,
              onChanged: (value) {
                notificationProvider.setNotificationRadio(value!);
              },
            ),
            RadioListTile(
              activeColor: const Color(0xFFF6B17A),
              title: const Text(
                'None',
                style: TextStyle(
                    fontSize: 25, fontFamily: 'Neue', color: Color(0xFFF6B17A)),
              ),
              subtitle: const Text(
                "You won't be disturbed by any notifications.",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Neue',
                  color: Colors.white,
                ),
              ),
              value: 2,
              groupValue: notificationProvider.notificationRadio,
              onChanged: (value) {
                notificationProvider.setNotificationRadio(value!);
              },
            ),
            RadioListTile(
              activeColor: const Color(0xFFF6B17A),
              title: const Text(
                'Custom',
                style: TextStyle(
                    fontSize: 25, fontFamily: 'Neue', color: Color(0xFFF6B17A)),
              ),
              subtitle: const Text(
                "Customize which notifications you want to receive.",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Neue',
                  color: Colors.white,
                ),
              ),
              value: 3,
              groupValue: notificationProvider.notificationRadio,
              onChanged: (value) {
                notificationProvider.setNotificationRadio(value!);
              },
            ),
            //Custom Notif
            if (notificationProvider.notificationRadio == 3)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF424769),
                ),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: [
                    CheckboxListTile(
                      activeColor: const Color(0xFFF6B17A),
                      side: const BorderSide(
                          strokeAlign: 2, color: Color(0xFF2D3250)),
                      checkColor: const Color(0xFF2D3250),
                      title: const Text(
                        'Transactions',
                        style: TextStyle(
                            fontFamily: 'Neue',
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      value: notificationProvider.transactionsChecked,
                      onChanged: (value) {
                        notificationProvider
                            .setTransactionsChecked(value ?? false);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    CheckboxListTile(
                      activeColor: const Color(0xFFF6B17A),
                      side: const BorderSide(
                          strokeAlign: 2, color: Color(0xFF2D3250)),
                      checkColor: const Color(0xFF2D3250),
                      title: const Text(
                        'Near You',
                        style: TextStyle(
                            fontFamily: 'Neue',
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      value: notificationProvider.nearYouChecked,
                      onChanged: (value) {
                        notificationProvider.setNearYouChecked(value ?? false);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    CheckboxListTile(
                      activeColor: const Color(0xFFF6B17A),
                      side: const BorderSide(
                          strokeAlign: 2, color: Color(0xFF2D3250)),
                      checkColor: const Color(0xFF2D3250),
                      title: const Text(
                        'Weekly Summary',
                        style: TextStyle(
                            fontFamily: 'Neue',
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      value: notificationProvider.weeklySummaryChecked,
                      onChanged: (value) {
                        notificationProvider
                            .setWeeklySummaryChecked(value ?? false);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    CheckboxListTile(
                      activeColor: const Color(0xFFF6B17A),
                      side: const BorderSide(
                          strokeAlign: 2, color: Color(0xFF2D3250)),
                      checkColor: const Color(0xFF2D3250),
                      title: const Text(
                        'Special Offers',
                        style: TextStyle(
                            fontFamily: 'Neue',
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      value: notificationProvider.specialOffersChecked,
                      onChanged: (value) {
                        notificationProvider
                            .setSpecialOffersChecked(value ?? false);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    CheckboxListTile(
                      activeColor: const Color(0xFFF6B17A),
                      side: const BorderSide(
                          strokeAlign: 2, color: Color(0xFF2D3250)),
                      checkColor: const Color(0xFF2D3250),
                      title: const Text(
                        'Event',
                        style: TextStyle(
                            fontFamily: 'Neue',
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      value: notificationProvider.eventChecked,
                      onChanged: (value) {
                        notificationProvider.setEventChecked(value ?? false);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    CheckboxListTile(
                      activeColor: const Color(0xFFF6B17A),
                      side: const BorderSide(
                          strokeAlign: 2, color: Color(0xFF2D3250)),
                      checkColor: const Color(0xFF2D3250),
                      title: const Text(
                        'App Updates',
                        style: TextStyle(
                            fontFamily: 'Neue',
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      value: notificationProvider.appUpdatesChecked,
                      onChanged: (value) {
                        notificationProvider
                            .setAppUpdatesChecked(value ?? false);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      // decoration: BoxDecoration(
      //   border: Border.all(width: 1),
      //   borderRadius: BorderRadius.circular(25),
      // ),
      // child: Column(
      //   children: [
      //     RadioListTile(
      //       activeColor: const Color(0xFFF6B17A),
      //       title: const Text(
      //         'All',
      //         style: TextStyle(
      //             fontSize: 25, fontFamily: 'Neue', color: Color(0xFFF6B17A)),
      //       ),
      //       subtitle: const Text(
      //         'Receive all types of notifications from the app.',
      //         style: TextStyle(
      //           fontSize: 15,
      //           fontFamily: 'Neue',
      //           color: Colors.white,
      //         ),
      //       ),
      //       value: 0,
      //       groupValue: notificationProvider.notificationRadio,
      //       onChanged: (value) {
      //         notificationProvider.setNotificationRadio(value!);
      //       },
      //     ),
      //     RadioListTile(
      //       activeColor: const Color(0xFFF6B17A),
      //       title: const Text(
      //         'Important',
      //         style: TextStyle(
      //             fontSize: 25, fontFamily: 'Neue', color: Color(0xFFF6B17A)),
      //       ),
      //       subtitle: const Text(
      //         'Only receive  important notifications.',
      //         style: TextStyle(
      //           fontSize: 15,
      //           fontFamily: 'Neue',
      //           color: Colors.white,
      //         ),
      //       ),
      //       value: 1,
      //       groupValue: notificationProvider.notificationRadio,
      //       onChanged: (value) {
      //         notificationProvider.setNotificationRadio(value!);
      //       },
      //     ),
      //     RadioListTile(
      //       activeColor: const Color(0xFFF6B17A),
      //       title: const Text(
      //         'None',
      //         style: TextStyle(
      //             fontSize: 25, fontFamily: 'Neue', color: Color(0xFFF6B17A)),
      //       ),
      //       subtitle: const Text(
      //         "You won't be disturbed by any notifications.",
      //         style: TextStyle(
      //           fontSize: 15,
      //           fontFamily: 'Neue',
      //           color: Colors.white,
      //         ),
      //       ),
      //       value: 2,
      //       groupValue: notificationProvider.notificationRadio,
      //       onChanged: (value) {
      //         notificationProvider.setNotificationRadio(value!);
      //       },
      //     ),
      //     RadioListTile(
      //       activeColor: const Color(0xFFF6B17A),
      //       title: const Text(
      //         'Custom',
      //         style: TextStyle(
      //             fontSize: 25, fontFamily: 'Neue', color: Color(0xFFF6B17A)),
      //       ),
      //       subtitle: const Text(
      //         "Customize which notifications you want to receive.",
      //         style: TextStyle(
      //           fontSize: 15,
      //           fontFamily: 'Neue',
      //           color: Colors.white,
      //         ),
      //       ),
      //       value: 3,
      //       groupValue: notificationProvider.notificationRadio,
      //       onChanged: (value) {
      //         notificationProvider.setNotificationRadio(value!);
      //       },
      //     ),
      //     //Custom Notif
      //     if (notificationProvider.notificationRadio == 3)
      //       Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(20),
      //           color: const Color(0xFF424769),
      //         ),
      //         width: MediaQuery.of(context).size.width * 0.7,
      //         child: Column(
      //           children: [
      //             CheckboxListTile(
      //               activeColor: const Color(0xFFF6B17A),
      //               side: const BorderSide(
      //                   strokeAlign: 2, color: Color(0xFF2D3250)),
      //               checkColor: const Color(0xFF2D3250),
      //               title: const Text(
      //                 'Transactions',
      //                 style: TextStyle(
      //                     fontFamily: 'Neue',
      //                     fontSize: 15,
      //                     color: Colors.white),
      //               ),
      //               value: notificationProvider.transactionsChecked,
      //               onChanged: (value) {
      //                 notificationProvider
      //                     .setTransactionsChecked(value ?? false);
      //               },
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(0),
      //               ),
      //             ),
      //             CheckboxListTile(
      //               activeColor: const Color(0xFFF6B17A),
      //               side: const BorderSide(
      //                   strokeAlign: 2, color: Color(0xFF2D3250)),
      //               checkColor: const Color(0xFF2D3250),
      //               title: const Text(
      //                 'Near You',
      //                 style: TextStyle(
      //                     fontFamily: 'Neue',
      //                     fontSize: 15,
      //                     color: Colors.white),
      //               ),
      //               value: notificationProvider.nearYouChecked,
      //               onChanged: (value) {
      //                 notificationProvider.setNearYouChecked(value ?? false);
      //               },
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(0),
      //               ),
      //             ),
      //             CheckboxListTile(
      //               activeColor: const Color(0xFFF6B17A),
      //               side: const BorderSide(
      //                   strokeAlign: 2, color: Color(0xFF2D3250)),
      //               checkColor: const Color(0xFF2D3250),
      //               title: const Text(
      //                 'Weekly Summary',
      //                 style: TextStyle(
      //                     fontFamily: 'Neue',
      //                     fontSize: 15,
      //                     color: Colors.white),
      //               ),
      //               value: notificationProvider.weeklySummaryChecked,
      //               onChanged: (value) {
      //                 notificationProvider
      //                     .setWeeklySummaryChecked(value ?? false);
      //               },
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(0),
      //               ),
      //             ),
      //             CheckboxListTile(
      //               activeColor: const Color(0xFFF6B17A),
      //               side: const BorderSide(
      //                   strokeAlign: 2, color: Color(0xFF2D3250)),
      //               checkColor: const Color(0xFF2D3250),
      //               title: const Text(
      //                 'Special Offers',
      //                 style: TextStyle(
      //                     fontFamily: 'Neue',
      //                     fontSize: 15,
      //                     color: Colors.white),
      //               ),
      //               value: notificationProvider.specialOffersChecked,
      //               onChanged: (value) {
      //                 notificationProvider
      //                     .setSpecialOffersChecked(value ?? false);
      //               },
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(0),
      //               ),
      //             ),
      //             CheckboxListTile(
      //               activeColor: const Color(0xFFF6B17A),
      //               side: const BorderSide(
      //                   strokeAlign: 2, color: Color(0xFF2D3250)),
      //               checkColor: const Color(0xFF2D3250),
      //               title: const Text(
      //                 'Event',
      //                 style: TextStyle(
      //                     fontFamily: 'Neue',
      //                     fontSize: 15,
      //                     color: Colors.white),
      //               ),
      //               value: notificationProvider.eventChecked,
      //               onChanged: (value) {
      //                 notificationProvider.setEventChecked(value ?? false);
      //               },
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(0),
      //               ),
      //             ),
      //             CheckboxListTile(
      //               activeColor: const Color(0xFFF6B17A),
      //               side: const BorderSide(
      //                   strokeAlign: 2, color: Color(0xFF2D3250)),
      //               checkColor: const Color(0xFF2D3250),
      //               title: const Text(
      //                 'App Updates',
      //                 style: TextStyle(
      //                     fontFamily: 'Neue',
      //                     fontSize: 15,
      //                     color: Colors.white),
      //               ),
      //               value: notificationProvider.appUpdatesChecked,
      //               onChanged: (value) {
      //                 notificationProvider.setAppUpdatesChecked(value ?? false);
      //               },
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(0),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //   ],
      // ),
    );
  }
}
