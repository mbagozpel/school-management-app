import 'package:flutter/material.dart';
import 'package:school_management_app/views/admin/add_student/student_form.dart';
import 'package:school_management_app/widgets/header.dart';

class AddStudent extends StatelessWidget {
  static const routename = '/addstaff';
  const AddStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Header(),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 30),
                  child: StudentForm(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
