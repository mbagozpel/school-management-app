import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/permission_feedback_controller.dart';
import 'package:school_management_app/models/feedback_staff.dart';
import 'package:school_management_app/widgets/default_button.dart';
import 'package:school_management_app/widgets/header.dart';

class StaffSuggestions extends StatelessWidget {
  static const routeName = '/staffcomments';
  const StaffSuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final FeedbackPermissionController _controller =
        FeedbackPermissionController();
    return SafeArea(
      child: Column(
        children: [
          const Header(),
          Expanded(
              child: ListView(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Staff Suggestions',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold)),
                      const Divider(),
                      SizedBox(height: _size.height * 0.04),
                      Form(
                        key: _controller.staffCommentkey,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter text';
                            }
                            return null;
                          },
                          maxLines: 5,
                          autocorrect: true,
                          decoration: const InputDecoration(
                            isCollapsed: true,
                            labelText: 'Suggestions',
                          ),
                          onSaved: (value) {
                            _controller.feedback.feedback = value!;
                          },
                        ),
                      ),
                      SizedBox(height: _size.height * 0.06),
                      DefaultButton(
                          text: 'Submit Suggestion',
                          press: () {
                            _controller.staffSendFeedback(context);
                          })
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kWhiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Suggestions History',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    SingleChildScrollView(
                      child: GetBuilder<FeedbackPermissionController>(
                        init: FeedbackPermissionController(),
                        initState: (_) {},
                        builder: (controller) {
                          return DataTable(
                            // headingRowColor: Colors.green,
                            // columnSpacing: 100,
                            showCheckboxColumn: true,
                            columns: const [
                              DataColumn(label: Text('SN'), numeric: true),
                              DataColumn(
                                label: Text('Suggestions'),
                              ),
                              DataColumn(
                                label: Text('Suggestions Reply'),
                              )
                            ],
                            rows: List.generate(
                              controller.staffFeedback.length,
                              (index) {
                                FeedBackStaff feedback =
                                    controller.staffFeedback[index];
                                return DataRow(cells: [
                                  DataCell(
                                    Text(
                                      (index + 1).toString(),
                                    ),
                                  ),
                                  DataCell(
                                    Text(feedback.feedback),
                                  ),
                                  DataCell(Text(feedback.feedbackReply == ''
                                      ? 'No reply yet'
                                      : feedback.feedbackReply))
                                ]);
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
