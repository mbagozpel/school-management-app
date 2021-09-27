import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/app_strings.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/custom_page.dart';
import 'package:school_management_app/models/side_bar.dart';

import 'package:school_management_app/utils/basic_utils.dart';
import 'package:school_management_app/utils/responsive.dart';
import 'package:school_management_app/widgets/profile_notiification.dart';
import 'package:school_management_app/widgets/search_field.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          // height: size.height * 0.06,
          color: kWhiteColor,
          width: double.infinity,
          child: Row(
            children: [
              if (!Responsive.isDesktop(context))
                IconButton(
                  onPressed: () => menuController.controlMenu(),
                  icon: const FaIcon(FontAwesomeIcons.list),
                ),
              if (!Responsive.isMobile(context)
              // ||
              //     !Responsive.isMobileSmall(context)
              )
                welcomeText(context),
              if (!Responsive.isMobile(context)
              // ||
              //     !Responsive.isMobileSmall(context)
              )
                SizedBox(width: size.width * 0.01),
              if (!Responsive.isMobileSmall(context))
                Expanded(
                    child: SearchField(
                  press: () {},
                )),
              SizedBox(
                width: size.width * 0.005,
              ),
              const VerticalDivider(),
              SizedBox(
                width: size.width * 0.005,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Notifications(),
                  SizedBox(
                    width: size.width * 0.005,
                  ),
                  const VerticalDivider(),
                  SizedBox(
                    width: size.width * 0.005,
                  ),
                  const ProfileCard(),
                ],
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IntrinsicHeight(
            child: GetBuilder<CustomPageController>(
              init: CustomPageController(),
              // initState: (_) {},
              builder: (controller) {
                return Row(
                  children: [
                    const Text('Home'),
                    const VerticalDivider(
                      color: Colors.black,
                    ),
                    Text(adminSideBar[controller.selectedIndex].title)
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Padding welcomeText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FaIcon(FontAwesomeIcons.graduationCap),
          const SizedBox(
            width: 10,
          ),
          RichText(
              text: TextSpan(
            children: [
              if (Responsive.isDesktop(context))
                TextSpan(
                  text: School.schoolName,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      height: 1, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              TextSpan(
                text: ' School Management System',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(height: 1, fontSize: 18),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
