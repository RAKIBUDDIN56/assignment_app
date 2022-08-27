import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  Future<void> onRefrsh() async {
    controller.getMails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            "Inbox",
            style: TextStyle(
                color: Colors.blue, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.getMails();
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.blue,
              ),
            ),
            TextButton(
              onPressed: () {
                controller.logOut();
              },
              child: const Text(
                'SIGNOUT',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
        body: Obx(() => controller.isLoading.value == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.mailList.isEmpty
                ? const Center(
                    child: Text(
                      "No Mails",
                      style: TextStyle(fontSize: 22),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: onRefrsh,
                    child: ListView.separated(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 10.0);
                        },
                        itemCount: controller.mailList.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 80,
                            child: Card(
                              elevation: 5,
                              child: ListTile(
                                title: Text(
                                    controller.mailList[index].from.address),
                                subtitle: Text(
                                  controller.mailList[index].intro,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Text(controller
                                    .mailList[index].createdAt
                                    .toString()
                                    .substring(0, 11)),
                              ),
                            ),
                          );
                        }),
                  )),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blueGrey,
          onPressed: () => _sendingMails(),
          label: const Text(
            'Send mail',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
          icon: const Icon(Icons.arrow_forward_ios_sharp),
        ));
  }

  _sendingMails() async {
    var url = 'mailto:';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
