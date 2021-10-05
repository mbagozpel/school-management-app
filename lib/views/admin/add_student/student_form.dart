import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/app_strings.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/other_controllers.dart';
import 'package:school_management_app/controllers/student_controller.dart';

import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/session.dart';

import 'package:school_management_app/utils/basic_utils.dart';
import 'package:school_management_app/utils/responsive.dart';
import 'package:school_management_app/widgets/default_button.dart';

import 'package:school_management_app/widgets/student_select_picture.dart';

class StudentForm extends StatelessWidget {
  StudentForm({Key? key}) : super(key: key);

  final StudentController _controller = StudentController();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: kWhiteColor),
      child: Form(
        key: _controller.studentFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Student's Biodata",
              style: Theme.of(context).textTheme.headline6,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Center(child: StudentSelectPicture(controller: _controller)),
            const SizedBox(
              height: 40,
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
                      Expanded(child: _userName()),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: _password()),
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
                      Expanded(child: _dob(context)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: _gender()),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: _phoneNumber()),
                    ],
                  ),
                  SizedBox(
                    height: _size.height * 0.06,
                  ),
                  Row(
                    children: [
                      Expanded(child: _class()),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: _session()),
                      const SizedBox(
                        width: 10,
                      ),
                      const Spacer(),
                    ],
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
                  _dob(context),
                  SizedBox(
                    height: _size.height * 0.03,
                  ),
                  _phoneNumber()
                ],
              ),
            SizedBox(
              height: _size.height * 0.04,
            ),
            GetBuilder<StudentController>(
              init: StudentController(),
              initState: (_) {},
              builder: (controller) {
                return DefaultButton(
                    text: 'Add Student',
                    press: () {
                      if (controller.image == null) {
                        showSnackBar(context, text: 'Please select an image');
                        return;
                      }
                      _controller.signUpStudent(context);
                      // ApiManagerGET.getStaffs(context);
                    });
              },
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _email() {
    return TextFormField(
      key: const ValueKey('email'),
      validator: (value) {
        if (value!.isEmpty) {
          return kEmailNullError;
        }
        if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'Email',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.envelope),
          )),
      onSaved: (value) {
        _controller.student.customuser.email = value!.trim();
      },
    );
  }

  Widget _firstName() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return kNamelNullError;
        }
        return null;
      },
      key: const ValueKey('first_name'),
      keyboardType: TextInputType.text,
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'First Name',
          // hintText: 'Enter your First Name',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.user),
          )),
      onSaved: (value) {
        _controller.student.customuser.firstName = value!.trim();
      },
    );
  }

  Widget _userName() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return kNamelNullError;
        }
        return null;
      },
      key: const ValueKey('username'),
      keyboardType: TextInputType.text,
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'Userame',
          // hintText: 'Enter your First Name',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.user),
          )),
      onSaved: (value) {
        _controller.student.customuser.username = value!.trim();
      },
    );
  }

  Widget _lastName() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return kLastNamelNullError;
        }
        return null;
      },
      key: const ValueKey('last_name'),
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: true,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'Last Name',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.user),
          )),
      onSaved: (value) {
        _controller.student.customuser.lastName = value!.trim();
      },
    );
  }

  Widget _password() {
    return TextFormField(
      key: const ValueKey('password'),
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        }
        if (value.length < 8) {
          return kShortPassError;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: !_controller.isVisbile,
      decoration: InputDecoration(
          isCollapsed: true,
          labelText: 'Password',
          suffixIcon: IconButton(
            icon: _controller.isVisbile
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
            onPressed: _controller.checkVisible,
          )),
      onSaved: (value) {
        _controller.student.customuser.password = value!.trim();
      },
    );
  }

  Widget _gender() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return kGenderNullError;
        }
        return null;
      },
      key: const ValueKey('gender'),
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: true,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'Gender',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.male),
          )),
      onSaved: (value) {
        _controller.student.gender = value!.trim();
      },
    );
  }

  Widget _address() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return kAddressNullError;
        }
        return null;
      },
      key: const ValueKey('address'),
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: true,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'Address',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.locationArrow),
          )),
      onSaved: (value) {
        _controller.student.address = value!.trim();
      },
    );
  }

  Widget _phoneNumber() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return kPhoneNumberNullError;
        }
        return null;
      },
      key: const ValueKey('phone_number'),
      keyboardType: TextInputType.text,
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'Phone Number',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.phone),
          )),
      onSaved: (value) {
        _controller.student.phoneNo = value!.trim();
      },
    );
  }

  Widget _dob(BuildContext context) {
    // return GetBuilder<UserController>(
    //   init: UserController(),
    //   // initState: (_) {},
    //   builder: (controller) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return kDateNullError;
        }
        return null;
      },
      controller: _controller.dateValue,
      key: const ValueKey('date'),
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: () {
        _controller.selectDate(context);
      },
      autocorrect: true,
      decoration: const InputDecoration(
          isCollapsed: true,
          labelText: 'Date of Birth',
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.calendar),
          )),
      onSaved: (value) {
        _controller.student.dob = value!.trim();
      },
    );
    //   },
    // );
  }

  Widget _class() {
    return GetBuilder<OtherControllers>(
      init: OtherControllers(),
      initState: (_) {},
      builder: (controller) {
        return DropdownButtonFormField(
          validator: (value) {
            if (value.isBlank!) {
              return 'Please select a class';
            }
            return null;
          },
          key: const ValueKey('class'),
          isDense: true,
          onChanged: (Classes? value) {
            controller.classObj = value!;
          },
          onSaved: (Classes? value) {
            _controller.student.classId.id = value!.id;
          },
          decoration: const InputDecoration(labelText: 'Class'),
          items: List.generate(controller.classLists.length, (index) {
            Classes classObj = controller.classLists[index];
            return DropdownMenuItem<Classes>(
              onTap: () {
                _controller.student.classId.id = classObj.id;
              },
              value: classObj,
              child: Text(classObj.className),
            );
          }),
        );
      },
    );
  }

  Widget _session() {
    return GetBuilder<OtherControllers>(
      init: OtherControllers(),
      initState: (_) {},
      builder: (controller) {
        return DropdownButtonFormField(
          validator: (value) {
            if (value.isBlank!) {
              return 'Please select a session';
            }
            return null;
          },
          key: const ValueKey('session'),
          isDense: true,
          onChanged: (SessionYearModel? value) {
            controller.session = value!;
          },
          onSaved: (SessionYearModel? value) {
            _controller.student.sessionYearId.id = value!.id;
          },
          decoration: const InputDecoration(labelText: 'Session'),
          items: List.generate(controller.sessionLists.length, (index) {
            SessionYearModel session = controller.sessionLists[index];
            return DropdownMenuItem<SessionYearModel>(
              onTap: () {
                _controller.student.sessionYearId.id = session.id;
              },
              value: session,
              child:
                  Text(session.sessionStartYear + '/' + session.sessionEndYear),
            );
          }),
        );
      },
    );
  }
}
