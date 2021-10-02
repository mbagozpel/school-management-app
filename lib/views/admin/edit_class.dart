import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/other_controllers.dart';
import 'package:school_management_app/controllers/user_controller.dart';
import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/staff.dart';
import 'package:school_management_app/widgets/default_button.dart';

class EditClass extends StatelessWidget {
  final Classes classObj;
  const EditClass({Key? key, required this.classObj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OtherControllers _otherController = OtherControllers();
    final size = MediaQuery.of(context).size;

    return AlertDialog(
      backgroundColor: kBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      actions: [
        Form(
          key: _otherController.editFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Class Information',
                  style: Theme.of(context).textTheme.headline6),
              const Divider(),
              SizedBox(height: size.height * 0.04),
              TextFormField(
                initialValue: classObj.className,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a class name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _otherController.classObj.className = value!;
                },
                autocorrect: true,
                decoration: const InputDecoration(
                    isCollapsed: true,
                    labelText: 'Class Title',
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FaIcon(FontAwesomeIcons.home),
                    )),
              ),
              SizedBox(height: size.height * 0.04),
              GetBuilder<UserController>(
                init: UserController(),
                initState: (_) {},
                builder: (controller) {
                  return DropdownButtonFormField(
                    onChanged: (value) {
                      _otherController.selectStaff(value);
                    },
                    onSaved: (Staffs? value) {
                      _otherController.classObj.staff.customuser.id =
                          value!.customuser.id;
                    },
                    decoration: const InputDecoration(labelText: 'Staff'),
                    items: List.generate(controller.staffLists.length, (index) {
                      Staffs staff = controller.staffLists[index];
                      return DropdownMenuItem<Staffs>(
                        onTap: () {
                          _otherController.classObj.staff.customuser.id =
                              staff.customuser.id;
                        },
                        value: staff,
                        child: Text(
                            '${staff.customuser.lastName} ${staff.customuser.firstName}'),
                      );
                    }),
                  );
                },
              ),
              SizedBox(height: size.height * 0.06),
              DefaultButton(
                  text: 'Add Class',
                  press: () {
                    _otherController.addClass(context);
                  })
            ],
          ),
        ),
      ],
    );
  }
}
