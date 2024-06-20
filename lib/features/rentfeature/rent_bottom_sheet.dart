import 'package:flutter/material.dart';

Widget rentNowBottomSheet(
  BuildContext context,
  /*PostData p*/
) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
    child: Container(
      color: const Color(0xFFF6B17A),
      height: MediaQuery.of(context).size.height * 0.8,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 5,
              color: const Color(0xFF2D3250),
            ),
          ),
          const SizedBox(height: 10),
          const Expanded(
            child: Text(
              "Rent Now",
              style: TextStyle(fontFamily: "Neue", fontSize: 40),
            ),
            // ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: 4,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //           isThreeLine: true,
            //           title: const Text(
            //             "Sample1",
            //             style: TextStyle(fontWeight: FontWeight.w600),
            //           ),
            //           subtitle: Text(
            //             "Sample2",
            //             style: TextStyle(
            //                 color: Theme.of(context).colorScheme.outline),
            //           ),
            //           leading: CircleAvatar(
            //               backgroundColor:
            //                   Theme.of(context).colorScheme.outline,
            //               foregroundColor:
            //                   Theme.of(context).colorScheme.background,
            //               child: const Icon(Icons.person)));
            //     }),
          ),
        ],
      ),
    ),
  );
}

Widget rentLaterBottomSheet(
  BuildContext context,
) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
    child: Container(
      color: const Color(0xFFF6B17A),
      height: MediaQuery.of(context).size.height * 0.8,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 5,
              color: const Color(0xFF2D3250),
            ),
          ),
          const SizedBox(height: 10),
          const Expanded(
            child: Text(
              "Rent For Later",
              style: TextStyle(fontFamily: "Neue", fontSize: 40),
            ),
          ),
        ],
      ),
    ),
  );
}
