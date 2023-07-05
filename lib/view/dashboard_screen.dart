import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uniname/model/university_model.dart';

import '../../utils/size_config.dart';
import '../utils/app_colors.dart';
import '../view_model/dashboard_view_model.dart';

class DashboardScreenScreen extends StatelessWidget {
  const DashboardScreenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = ScrollController();
    SizeConfig().init(context);
    return GetBuilder<DashboardViewModel>(builder: (homeViewModel) {
      return Scaffold(
        backgroundColor: AppColors.appBackground,
        appBar: AppBar(
          title: const Text('Name of Bangladeshi University'),
          elevation: 0,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  homeViewModel.universityList.isEmpty
                      ? const SizedBox()
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _controller,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(8),
                          itemCount: homeViewModel.universityList.length,
                          itemBuilder: (BuildContext context, int index) {
                            University university = homeViewModel.universityList[index];
                            return Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: const Icon(Icons.album),
                                    title: Text(university?.name ?? ''),
                                    subtitle: Text(university.domains![0] ?? ''),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextButton(
                                        child: Text(university.webPages![0] ?? ''),
                                        onPressed: () {/* ... */},
                                      ),
                                      const SizedBox(width: 8),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          })
                ],
              ),
            ),
            Center(
              child: Visibility(
                  visible: homeViewModel.isLoading.value,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Please wait….",
                    ),
                  )),
            ),
          ],
        ),
      );
    });
  }
}