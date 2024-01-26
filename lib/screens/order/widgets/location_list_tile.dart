import 'package:flutter/material.dart';

class LocationListTile extends StatelessWidget {
  const LocationListTile(
      {super.key, required this.location, required this.press});

  final String location;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            onTap: press,
            horizontalTitleGap: 0,
            leading: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.location_city_outlined),
            ),
            title: Text(
              location,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )),
        const Divider(
          height: 2,
          thickness: 1,
        )
      ],
    );
  }
}
