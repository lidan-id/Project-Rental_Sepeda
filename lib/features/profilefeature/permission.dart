import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_component.dart';
import 'package:provider/provider.dart';

class PermissionManager extends StatelessWidget {
  const PermissionManager({super.key});

  @override
  Widget build(BuildContext context) {
    final permissionProvider = Provider.of<PermissionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D3250),
        title: const Text(
          "Permission Manager",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontFamily: 'Neue',
              fontSize: 35),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              SwitchListTile(
                title: const Text(
                  'Camera',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Neue',
                    color: Color(0xFFF6B17A),
                  ),
                ),
                value: permissionProvider.cameraEnabled,
                activeColor: const Color(0xFFF6B17A),
                onChanged: (value) {
                  permissionProvider.toggleCamera();
                },
              ),
              SwitchListTile(
                title: const Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Neue',
                    color: Color(0xFFF6B17A),
                  ),
                ),
                value: permissionProvider.locationEnabled,
                activeColor: const Color(0xFFF6B17A),
                onChanged: (value) {
                  permissionProvider.toggleLocation();
                },
              ),
              SwitchListTile(
                title: const Text(
                  'Microphone',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Neue',
                    color: Color(0xFFF6B17A),
                  ),
                ),
                value: permissionProvider.microphoneEnabled,
                activeColor: const Color(0xFFF6B17A),
                onChanged: (value) {
                  permissionProvider.toggleMicrophone();
                },
              ),
              SwitchListTile(
                title: const Text(
                  'History',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Neue',
                    color: Color(0xFFF6B17A),
                  ),
                ),
                value: permissionProvider.historyEnabled,
                activeColor: const Color(0xFFF6B17A),
                onChanged: (value) {
                  permissionProvider.toggleHistory();
                },
              ),
            ],
          ))
        // child: Column(
        //   children: [
        //     SwitchListTile(
        //       title: const Text(
        //         'Camera',
        //         style: TextStyle(
        //           fontSize: 25,
        //           fontFamily: 'Neue',
        //           color: Color(0xFFF6B17A),
        //         ),
        //       ),
        //       value: permissionProvider.cameraEnabled,
        //       activeColor: const Color(0xFFF6B17A),
        //       onChanged: (value) {
        //         permissionProvider.toggleCamera();
        //       },
        //     ),
        //     SwitchListTile(
        //       title: const Text(
        //         'Location',
        //         style: TextStyle(
        //           fontSize: 25,
        //           fontFamily: 'Neue',
        //           color: Color(0xFFF6B17A),
        //         ),
        //       ),
        //       value: permissionProvider.locationEnabled,
        //       activeColor: const Color(0xFFF6B17A),
        //       onChanged: (value) {
        //         permissionProvider.toggleLocation();
        //       },
        //     ),
        //     SwitchListTile(
        //       title: const Text(
        //         'Microphone',
        //         style: TextStyle(
        //           fontSize: 25,
        //           fontFamily: 'Neue',
        //           color: Color(0xFFF6B17A),
        //         ),
        //       ),
        //       value: permissionProvider.microphoneEnabled,
        //       activeColor: const Color(0xFFF6B17A),
        //       onChanged: (value) {
        //         permissionProvider.toggleMicrophone();
        //       },
        //     ),
        //     SwitchListTile(
        //       title: const Text(
        //         'History',
        //         style: TextStyle(
        //           fontSize: 25,
        //           fontFamily: 'Neue',
        //           color: Color(0xFFF6B17A),
        //         ),
        //       ),
        //       value: permissionProvider.historyEnabled,
        //       activeColor: const Color(0xFFF6B17A),
        //       onChanged: (value) {
        //         permissionProvider.toggleHistory();
        //       },
        //     ),
        //   ],
        // )
        );
  }
}
