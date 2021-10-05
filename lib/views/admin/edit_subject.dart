import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/other_controllers.dart';
import 'package:school_management_app/controllers/user_controller.dart';
import 'package:school_management_app/models/classes.dart';
import 'package:school_management_app/models/staff.dart';
import 'package:school_management_app/models/subject.dart';
import 'package:school_management_app/widgets/default_button.dart';

class EditSubject extends StatelessWidget {
  final Subject subject;
  const EditSubject({Key? key, required this.subject}) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subject Information',
                      style: Theme.of(context).textTheme.headline6),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close, color: Colors.red))
                ],
              ),
              const Divider(),
              SizedBox(height: size.height * 0.04),
              TextFormField(
                initialValue: subject.subjectName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a subject title';
                  }
                  return null;
                },
                onSaved: (value) {
                  subject.subjectName = value!;
                },
                autocorrect: true,
                decoration: const InputDecoration(
                    isCollapsed: true,
                    labelText: 'Subject Title',
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
                      subject.staffId.customuser.id = value!.customuser.id;
                    },
                    decoration: const InputDecoration(labelText: 'Staff'),
                    items: List.generate(controller.staffLists.length, (index) {
                      Staffs staff = controller.staffLists[index];
                      return DropdownMenuItem<Staffs>(
                        onTap: () {
                          subject.staffId.customuser.id = staff.customuser.id;
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
                  text: 'Update Subject',
                  press: () {
                    _otherController.editSubject(context, subject);
                  })
            ],
          ),
        ),
      ],
    );
  }
}
