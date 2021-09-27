import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/utils/responsive.dart';
import 'package:school_management_app/widgets/default_button.dart';

class StudentForm extends StatelessWidget {
  StudentForm({Key? key}) : super(key: key);
  final DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: kWhiteColor),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Student's Biodata",
              style: Theme.of(context).textTheme.headline6,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            if (!Responsive.isMobile(context))
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _firstName()),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: _lastName()),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: _email())
                    ],
                  ),
                  SizedBox(
                    height: _size.height * 0.06,
                  ),
                  Row(
                    children: [
                      Expanded(child: _password()),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: _gender()),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: _address())
                    ],
                  ),
                  SizedBox(
                    height: _size.height * 0.06,
                  ),
                  Row(
                    children: [
                      Expanded(child: _DOB(context)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: _phoneNumber()),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: _class())
                    ],
                  ),
                  SizedBox(
                    height: _size.height * 0.06,
                  ),
                ],
              ),
            if (Responsive.isMobile(context))
              Column(
                children: [
                  _firstName(),
                  SizedBox(
                    height: _size.height * 0.03,
                  ),
                  _lastName(),
                  SizedBox(
                    height: _size.height * 0.03,
                  ),
                  _email(),
                  SizedBox(
                    height: _size.height * 0.03,
                  ),
                  _password(),
                  SizedBox(
                    height: _size.height * 0.03,
                  ),
                  _gender(),
                  SizedBox(
                    height: _size.height * 0.03,
                  ),
                  _address(),
                  SizedBox(
                    height: _size.height * 0.03,
                  ),
                  _DOB(context),
                  SizedBox(
                    height: _size.height * 0.03,
                  ),
                  _phoneNumber(),
                  SizedBox(
                    height: _size.height * 0.03,
                  ),
                  _class()
                ],
              ),
            SizedBox(
              height: _size.height * 0.06,
            ),
            DefaultButton(text: 'Add Student', press: () {}),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _email() {
    return TextFormField(
      autocorrect: true,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'Email',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.envelope),
          )),
    );
  }

  TextFormField _firstName() {
    return TextFormField(
      autocorrect: true,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'First Name',
          // hintText: 'Enter your First Name',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.user),
          )),
    );
  }

  TextFormField _lastName() {
    return TextFormField(
      autocorrect: true,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'Last Name',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.user),
          )),
    );
  }

  TextFormField _password() {
    return TextFormField(
      autocorrect: true,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'Password',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(Icons.visibility_off),
          )),
    );
  }

  TextFormField _gender() {
    return TextFormField(
      autocorrect: true,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'Gender',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.male),
          )),
    );
  }

  TextFormField _address() {
    return TextFormField(
      autocorrect: true,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'Address',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.locationArrow),
          )),
    );
  }

  TextFormField _phoneNumber() {
    return TextFormField(
      autocorrect: true,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'Phone Number',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.locationArrow),
          )),
    );
  }

  TextFormField _class() {
    return TextFormField(
      autocorrect: true,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'Class',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.arrowDown),
          )),
    );
  }

  TextFormField _DOB(BuildContext context) {
    return TextFormField(
      onTap: () async {
        await showDatePicker(
            context: context,
            initialDate: _selectedDate,
            firstDate: DateTime(1940),
            lastDate: DateTime(2030));
      },
      autocorrect: true,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'Date of Birth',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.calendar),
          )),
    );
  }
}
