import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/app_strings.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/user_controller.dart';
import 'package:school_management_app/services/api_manage_get.dart';
import 'package:school_management_app/services/api_manager_post.dart';
import 'package:school_management_app/utils/basic_utils.dart';
import 'package:school_management_app/utils/responsive.dart';
import 'package:school_management_app/widgets/default_button.dart';
import 'package:school_management_app/widgets/select_picture.dart';

class StaffForm extends StatelessWidget {
  StaffForm({Key? key}) : super(key: key);

  final UserController _controller = UserController();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: kWhiteColor),
      child: Form(
        key: _controller.staffFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Teacher's Biodata",
              style: Theme.of(context).textTheme.headline6,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Center(child: SelectPicture(controller: _controller)),
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
                      Expanded(child: _DOB(context)),
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
                  _phoneNumber()
                ],
              ),
            SizedBox(
              height: _size.height * 0.04,
            ),
            GetBuilder<UserController>(
              init: UserController(),
              initState: (_) {},
              builder: (controller) {
                return DefaultButton(
                    text: 'Add Staff',
                    press: () {
                      if (controller.image == null) {
                        showSnackBar(context, text: 'Please select an image');
                        return;
                      }
                      _controller.signUpStaff(context);
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
        _controller.staff.customuser.email = value!.trim();
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
        _controller.staff.customuser.firstName = value!.trim();
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
        _controller.staff.customuser.username = value!.trim();
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
        _controller.staff.customuser.lastName = value!.trim();
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
        _controller.staff.customuser.password = value!.trim();
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
        _controller.staff.gender = value!.trim();
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
        _controller.staff.address = value!.trim();
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
        _controller.staff.phoneNo = value!.trim();
      },
    );
  }

  Widget _DOB(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      // initState: (_) {},
      builder: (controller) {
        return TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return kDateNullError;
            }
            return null;
          },
          controller: controller.dateValue,
          key: const ValueKey('date'),
          keyboardType: TextInputType.text,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onTap: () {
            controller.selectDate(context);
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
            _controller.staff.dob = value!.trim();
          },
        );
      },
    );
  }
}
