import 'package:flutter/material.dart';
import 'package:rentexl/Drawer/drawer.dart';
import 'package:rentexl/Drawer/drawer_controller.dart';
import 'package:rentexl/view/home2.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawsterIndex;

  @override
  void initState() {
    drawsterIndex = DrawerIndex.HOME;
    screenView =   Home2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white12,
          body: DrawerUserController(
            screenIndex: drawsterIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawsterIndex != drawerIndexdata) {
      drawsterIndex = drawerIndexdata;
      switch (drawsterIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = const Home2();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            screenView = const Home2();
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            screenView = const Home2();
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
             screenView = const Home2();
          });
          break;
        default:
          break;
      }
    }
  }
}
