import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/other_controllers.dart';

import 'package:school_management_app/models/subject.dart';

import 'package:school_management_app/views/admin/edit_subject.dart';

class ManageSubject extends StatelessWidget {
  static const routename = '/manageSubject';
  const ManageSubject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Subjects',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(),
            SingleChildScrollView(
              child: GetBuilder<OtherControllers>(
                init: OtherControllers(),
                builder: (controller) {
                  return DataTable(
                    // headingRowColor: Colors.green,
                    // columnSpacing: 100,
                    showCheckboxColumn: true,
                    columns: const [
                      DataColumn(label: Text('SN'), numeric: true),
                      DataColumn(
                        label: Text('Subject Title'),
                      ),
                      DataColumn(
                        label: Text('Subject Teacher'),
                      ),
                      DataColumn(
                        label: Text('Edit'),
                      ),
                      DataColumn(
                        label: Text('Delete'),
                      )
                    ],
                    rows:
                        List.generate(controller.subjectLists.length, (index) {
                      Subject _subject = controller.subjectLists[index];
                      return DataRow(cells: [
                        DataCell(
                          Text(
                            (index + 1).toString(),
                          ),
                        ),
                        DataCell(Text(_subject.subjectName)),
                        DataCell(Text(_subject.staffId.customuser.lastName +
                            ' ' +
                            _subject.staffId.customuser.firstName)),
                        DataCell(
                          IconButton(
                            icon: const Icon(FontAwesomeIcons.edit,
                                color: Colors.blue, size: 15),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      EditSubject(
                                        subject: _subject,
                                      ));
                            },
                          ),
                        ),
                        DataCell(IconButton(
                          icon: const Icon(FontAwesomeIcons.trash,
                              color: Colors.red, size: 15),
                          onPressed: () {
                            controller.subjectDelete(_subject.id, context);
                          },
                        ))
                      ]);
                    }),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
