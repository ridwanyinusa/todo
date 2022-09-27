

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:todo/app/core/utils/extensions.dart';
import 'package:todo/app/modules/home/controller.dart';

class DetailPage extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var task = homeCtrl.task.value!;
    var color = HexColor.fromHex(task.color);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(3.0.wp),
            child: Row(
              children: [
                IconButton(onPressed: (() {
                  Get.back();
                  homeCtrl.changeTask(null);
                }), icon: const Icon(Icons.arrow_back_ios))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
            child: Row(
              children: [
                Icon(
                  IconData(task.icon, fontFamily: 'MaterialIcons'),
                  color: color,
                  ),
                  SizedBox(width: 3.0.sp,),
                  Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.bold
                    ),
                  )
              ],
            ),
          ),
          Obx( () {
            var totalTodos = homeCtrl.doingTodos.length + homeCtrl.doneTodos.length;
              return Padding(
                padding: EdgeInsets.only(
                  left: 16.0.wp,
                  top: 3.0.wp,
                  right: 16.0.wp
                ),
                child: Row(
                children: [
                  Text('$totalTodos Tasks',
                  style: TextStyle(
                    fontSize: 12.0.sp,
                    color: Colors.grey
                  ),),
                  SizedBox(width: 3.0.wp,),
                  StepProgressIndicator(totalSteps: totalTodos == 0 ? 1 : totalTodos)
                ],
            ),
              );
          }
            
          )
        ],
      )
    );
  }
}