import 'package:bjj_manager/common/contants.dart';
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
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('BJJ Manager'),
            titleTextStyle: kTitleTextStyle),
        body: const Column(
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
                          stripes: 8,
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

class IconContent extends StatelessWidget {
  const IconContent({
    super.key,
    required this.iconData,
    required this.iconColor,
    required this.iconLabel,
    required this.iconLabelColor,
  });

  final IconData iconData;
  final Color iconColor;
  final String iconLabel;
  final Color iconLabelColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 50.0,
          color: iconColor,
        ),
        const SizedBox(height: 15.0),
        Text(
          iconLabel,
          style: TextStyle(fontSize: 18.0, color: iconLabelColor),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.cardColor,
    required this.cardChild,
    required this.cardHeight,
  });

  final Color cardColor;
  final Widget cardChild;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: cardColor, borderRadius: BorderRadius.circular(10.0)),
      height: cardHeight,
      width: 170.0,
      child: cardChild,
    );
  }
}

class BeltCard extends StatelessWidget {
  const BeltCard({
    super.key,
    required this.cardColor,
    required this.stripes,
  });

  final Color cardColor;
  final double stripes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(0.0),
          decoration: BoxDecoration(color: cardColor),
          height: 15,
          width: 260.0,
        ),
        Container(
          margin: const EdgeInsets.all(0.0),
          decoration: const BoxDecoration(color: Colors.black),
          height: 15,
          width: 70.0 - 6 * stripes,
        ),
        for (int i = 0; i < stripes; i++)
          const StripeCard(cardColor: Colors.black),
        Container(
          margin: const EdgeInsets.all(0.0),
          decoration: BoxDecoration(color: cardColor),
          height: 15,
          width: 10.0,
        ),
      ],
    );
  }
}

class StripeCard extends StatelessWidget {
  const StripeCard({
    super.key,
    required this.cardColor,
  });

  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(0.0),
          decoration: const BoxDecoration(color: Colors.white),
          height: 15,
          width: 4.0,
        ),
        Container(
          margin: const EdgeInsets.all(0.0),
          decoration: const BoxDecoration(color: Colors.black),
          height: 15,
          width: 5.0,
        ),
      ],
    );
  }
}
