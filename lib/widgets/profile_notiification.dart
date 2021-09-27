import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_management_app/constants/colors.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEv,
      children: [
        notiCont(context, icon: FontAwesomeIcons.envelope),
        const SizedBox(width: 5),
        notiCont(context, icon: Icons.notifications_outlined)
      ],
    );
  }

  Container notiCont(BuildContext context, {required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(10),
      // height: MediaQuery.of(context).size.height * 0.05,
      child: Icon(
        icon,
        size: 20,
      ),
      decoration: const BoxDecoration(
        color: kBackgroundColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/2.0x/flutter_logo.png'),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mba Gospel',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text('Admin',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 10))
            ])
      ],
    );
  }
}
