import 'package:edu_app/components/searchfield_widget.dart';
import 'package:edu_app/components/sidebar_button.dart';
import 'package:edu_app/components/sidebar_row.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/sideBar.dart';

class HomeScreenNavBar extends StatefulWidget {
  const HomeScreenNavBar({Key? key, required this.triggerAnimation})
      : super(key: key);

  final VoidCallback triggerAnimation;

  @override
  State<HomeScreenNavBar> createState() => _HomeScreenNavBarState();
}

class _HomeScreenNavBarState extends State<HomeScreenNavBar> {
  bool showDrawer = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                showDrawer = !showDrawer;
              });
            },
            child: SidebarButton(triggerAnimation: widget.triggerAnimation),
          ),
          SearchFieldWidget(),
          Icon(
            Icons.notifications,
            color: kPrimaryLabelColor,
          ),
          SizedBox(width: 16.0),
          CircleAvatar(
            radius: 18.0,
            backgroundImage: AssetImage("asset/images/avatar.png"),
          ),
        ],
      ),
    );
  }
}
  Widget buildDrawer(BuildContext context) {
    return Container(
      // width: 30,
      // height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: [
          BoxShadow(
            color: kShadowColor,
            offset: Offset(0, 12),
            blurRadius: 16.0,
          ),
        ],
      ),
    // child: Image.asset(
    //     "asset/icons/icon-sidebar.png",
    //     color: kPrimaryLabelColor,
    //   ),
    //   padding: EdgeInsets.symmetric(
    //     horizontal: 12.0,
    //     vertical: 14.0,
    //   ),
      child: Drawer(

        width: 300,
        elevation: 10,
        backgroundColor: kSidebarBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('asset/images/avatar.png'),
                    radius: 21.0,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Premraj Zambre",
                        style: kHeadlineLabelStyle,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "License ends on 30 Aug, 2022",
                        style: kSearchPlaceholderStyle,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Divider(
                height: 2,
                color: Colors.black26,
                thickness: 2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              SidebarRow(
                item: sidebarItem[0],
              ),
              SizedBox(
                height: 32.0,
              ),
              SidebarRow(
                item: sidebarItem[1],
              ),
              SizedBox(
                height: 32.0,
              ),
              SidebarRow(
                item: sidebarItem[2],
              ),
              SizedBox(
                height: 32.0,
              ),
              SidebarRow(
                item: sidebarItem[3],
              ),
              SizedBox(
                height: 32.0,
              ),
              Spacer(),
              Row(
                children: [
                  Image.asset(
                    "asset/icons/icon-logout.png",
                    width: 17.0,
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    "log Out",
                    style: kSecondaryCalloutLabelStyle,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }