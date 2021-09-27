import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_management_app/constants/colors.dart';

class SearchField extends StatelessWidget {
  final VoidCallback press;
  const SearchField({Key? key, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: true,
      decoration: InputDecoration(
          isCollapsed: true,
          fillColor: kBackgroundColor,
          filled: true,
          contentPadding: const EdgeInsets.all(8),
          hintText: 'Search here...',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.grey, fontSize: 10),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, color: kWhiteColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, color: kWhiteColor),
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: InkWell(
            onTap: press,
            child: Container(
              padding: const EdgeInsets.all(10),
              // height: size.height * 0.04,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: const FaIcon(
                FontAwesomeIcons.search,
                size: 20,
              ),
            ),
          )),
    );
  }
}
