import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/other_controllers.dart';

import 'package:school_management_app/models/session.dart';
import 'package:school_management_app/views/admin/edit_session.dart';

class ManageSession extends StatelessWidget {
  static const routename = '/manageSession';
  const ManageSession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Sessions',
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
                    columnSpacing: _size.width * 0.08,
                    showCheckboxColumn: true,
                    columns: const [
                      DataColumn(label: Text('SN'), numeric: true),
                      DataColumn(
                        label: Text('Session Start Year'),
                      ),
                      DataColumn(
                        label: Text('Session End Year'),
                      ),
                      DataColumn(
                        label: Text('Edit'),
                      ),
                    ],
                    rows:
                        List.generate(controller.sessionLists.length, (index) {
                      SessionYearModel session = controller.sessionLists[index];
                      return DataRow(cells: [
                        DataCell(
                          Text(
                            (index + 1).toString(),
                          ),
                        ),
                        DataCell(Text(session.sessionStartYear)),
                        DataCell(Text(session.sessionEndYear)),
                        DataCell(
                          IconButton(
                            icon: const Icon(FontAwesomeIcons.edit,
                                color: Colors.blue, size: 15),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      EditSession(
                                        session: session,
                                      ));
                            },
                          ),
                        ),
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
