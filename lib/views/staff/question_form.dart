import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/widgets/default_button.dart';

class QuestionForm extends StatelessWidget {
  const QuestionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Type your question, with corresponding choices and answer',
              style: Theme.of(context).textTheme.bodyText1),
          const Divider(),
          const SizedBox(height: 20),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  maxLength: 2,
                  autocorrect: true,
                  decoration: const InputDecoration(
                    isCollapsed: true,
                    labelText: 'Question',
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FaIcon(Icons.edit),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autocorrect: true,
                        decoration: const InputDecoration(
                          isCollapsed: true,
                          labelText: 'Option 1',
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FaIcon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        autocorrect: true,
                        decoration: const InputDecoration(
                          isCollapsed: true,
                          labelText: 'Option 2',
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FaIcon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autocorrect: true,
                        decoration: const InputDecoration(
                          isCollapsed: true,
                          labelText: 'Option 3',
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FaIcon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        autocorrect: true,
                        decoration: const InputDecoration(
                            isCollapsed: true,
                            labelText: 'Answer',
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(Icons.edit),
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                DefaultButton(
                    text: 'Add Question',
                    press: () {},
                    width: _size.width * 0.1)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
