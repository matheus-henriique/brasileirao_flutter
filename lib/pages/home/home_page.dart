import 'package:app_test_build/models/time.dart';
import 'package:app_test_build/pages/time/times_page.dart';
import 'package:app_test_build/repositories/times_repository.dart';
import 'package:app_test_build/widgets/brasao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final dynamic title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TimesRepository());
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
          title: Center(
            child: Text(
              "Brasileirão",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Obx(() {
          return ListView.separated(
            itemCount: controller.times.length,
            itemBuilder: (BuildContext context, int time) {
              return ListTile(
                  leading: Brasao(
                    image: controller.times[time].brasao,
                    width: 40,
                  ),
                  title: Text(controller.times[time].nome),
                  subtitle:
                      Text('Titulos: ${controller.times[time].titulos.length}'),
                  trailing: Text(controller.times[time].pontos.toString()),
                  onTap: () {
                    Get.to(() => TimePage(
                        key: Key(controller.times[time].nome),
                        time: controller.times[time]));
                  });
            },
            separatorBuilder: (context, i) => Divider(),
            padding: EdgeInsets.all(16),
          );
        }));
  }
}
