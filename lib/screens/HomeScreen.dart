import 'package:edu_app/screens/sidebar_screen.dart';
import 'package:flutter/material.dart';

import '../components/homescreen_navbar.dart';
import '../components/searchfield_widget.dart';
import '../components/sidebar_button.dart';
import '../constants.dart';
import '../lists/explore_course_list.dart';
import '../lists/recent_course_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<Offset> sidebarAnimation;
  late Animation<double> fadeAnimation;
  late AnimationController sidebarAnimationController;

  var sidebarHidden = true;

  @override
  void initState() {
    super.initState();
    sidebarAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    sidebarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    fadeAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    sidebarAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Scaffold(
          drawerEnableOpenDragGesture: sidebarHidden,
          key: scaffoldKey,
          drawer: buildDrawer(context),
          appBar: AppBar(
            iconTheme: const IconThemeData(
              size: 30, //change size on your need
              color: Colors.black, //change color on your need
            ),
            backgroundColor: kBackgroundColor,
            elevation: 0,
            actions: [SizedBox(width: 40.0),
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
              SizedBox(width: 10.0),
            ],
          ),
          body: Container(
            color: kBackgroundColor,
            child: Stack(
              children: [
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // HomeScreenNavBar(
                        //   triggerAnimation: () {
                        //     setState(() {
                        //       sidebarHidden = !sidebarHidden;
                        //     });
                        //     sidebarAnimationController.forward();
                        //   },
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Recents",
                                style: kLargeTitleStyle,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "23 courses, more coming",
                                style: kSubtitleStyle,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RecentCourseList(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            top: 25.0,
                            right: 20.0,
                            bottom: 16.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Explore",
                                style: kTitle1Style,
                              ),
                            ],
                          ),
                        ),
                        ExploreCourseList(),
                      ],
                    ),
                  ),
                ),
                IgnorePointer(
                  ignoring: sidebarHidden,
                  child: Stack(
                    children: [
                      FadeTransition(
                        opacity: fadeAnimation,
                        child: GestureDetector(
                          child: Container(
                            color: Color.fromRGBO(36, 30, 41, 0.4),
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                          ),
                          onTap: () {
                            setState(() {
                              sidebarHidden = !sidebarHidden;
                            });
                            sidebarAnimationController.reverse();
                          },
                        ),
                      ),
                      SlideTransition(
                        position: sidebarAnimation,
                        child: SafeArea(
                          child: SidebarScreen(),
                          bottom: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}