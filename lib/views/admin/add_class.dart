import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/other_controllers.dart';
import 'package:school_management_app/controllers/user_controller.dart';
import 'package:school_management_app/models/staff.dart';
import 'package:school_management_app/services/api_manage_get.dart';
import 'package:school_management_app/views/admin/manage_class.dart';
import 'package:school_management_app/widgets/default_button.dart';
import 'package:school_management_app/widgets/header.dart';

class AddClass extends StatelessWidget {
  static const routeName = '/addClass';
  const AddClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OtherControllers _otherController = OtherControllers();
    final ScrollController _scrollController = ScrollController();
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          const Header(),
          Expanded(
              child: ListView(
            controller: _scrollController,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  margin: const EdgeInsets.symmetric(vertical: 40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhiteColor),
                  child: Form(
                    key: _otherController.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Class Information',
                            style: Theme.of(context).textTheme.headline6),
                        const Divider(),
                        SizedBox(height: size.height * 0.04),
                        TextFormField(
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
                              isDense: true,
                              onChanged: (value) {
                                _otherController.selectStaff(value);
                              },
                              onSaved: (Staffs? value) {
                                _otherController.classObj.staff.customuser.id =
                                    value!.customuser.id;
                              },
                              decoration:
                                  const InputDecoration(labelText: 'Staff'),
                              items: List.generate(controller.staffLists.length,
                                  (index) {
                                Staffs staff = controller.staffLists[index];
                                return DropdownMenuItem<Staffs>(
                                  onTap: () {
                                    _otherController.classObj.staff.customuser
                                        .id = staff.customuser.id;
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
                ),
              ),
              const ManageClass()
            ],
          ))
        ],
      ),
    );
  }
}
