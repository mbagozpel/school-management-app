import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:school_management_app/constants/colors.dart';
import 'package:school_management_app/controllers/student_controller.dart';

class StudentSelectPicture extends StatelessWidget {
  final StudentController controller;

  const StudentSelectPicture({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final UserController _controller = Get.put(UserController());
    return Column(children: [
      GetBuilder<StudentController>(
        init: StudentController(),
        initState: (_) {},
        builder: (_controller) {
          return Stack(
            children: [
              CircleAvatar(
                radius: size.height * 0.08,
                backgroundImage: _controller.image == null
                    ? Image.asset('assets/images/user-dummy-pic.png',
                            fit: BoxFit.cover)
                        .image
                    : Image.file(
                        _controller.image!,
                        fit: BoxFit.cover,
                      ).image,
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    // padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: kWhiteColor),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        _controller.selectFiles(controller.student);
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ]);
  }
}
