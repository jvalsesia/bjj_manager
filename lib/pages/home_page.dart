import 'package:bjj_manager/common/belt_card.dart';
import 'package:bjj_manager/common/contants.dart';
import 'package:bjj_manager/common/icon_content.dart';
import 'package:bjj_manager/common/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                cardColor: kContainerColor,
                cardChild: IconContent(
                  iconData: FontAwesomeIcons.checkToSlot,
                  iconColor: kForegroundContainerColor,
                  iconLabel: 'Check-in',
                  iconLabelColor: kLabelColor,
                ),
                cardHeight: 150.0,
              )),
              Expanded(
                  child: ReusableCard(
                cardColor: kContainerColor,
                cardChild: IconContent(
                  iconData: FontAwesomeIcons.calendarDays,
                  iconColor: kForegroundContainerColor,
                  iconLabel: 'Schedule',
                  iconLabelColor: kLabelColor,
                ),
                cardHeight: 150.0,
              )),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                cardColor: kContainerColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconContent(
                      iconData: FontAwesomeIcons.person,
                      iconColor: kForegroundContainerColor,
                      iconLabel: 'Profile',
                      iconLabelColor: kLabelColor,
                    ),
                    BeltCard(
                      cardColor: Colors.purple,
                      stripes: 3,
                    ),
                  ],
                ),
                cardHeight: 200.0,
              )),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                cardColor: kContainerColor,
                cardChild: IconContent(
                  iconData: FontAwesomeIcons.envelope,
                  iconColor: kForegroundContainerColor,
                  iconLabel: 'Messsage',
                  iconLabelColor: kLabelColor,
                ),
                cardHeight: 150.0,
              )),
              Expanded(
                  child: ReusableCard(
                cardColor: kContainerColor,
                cardChild: IconContent(
                  iconData: FontAwesomeIcons.gear,
                  iconColor: kForegroundContainerColor,
                  iconLabel: 'Settings',
                  iconLabelColor: kLabelColor,
                ),
                cardHeight: 150.0,
              )),
            ],
          ),
        ),
      ],
    ));
  }
}
