import '/presentation/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MailPage extends StatefulWidget {
  final String email;
  const MailPage({Key? key, required this.email}) : super(key: key);
  @override
  State<MailPage> createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> with WidgetsBindingObserver {
  final homeController = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  late AppLifecycleState _lastState;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed &&
        _lastState == AppLifecycleState.paused) {
      print(state);
      homeController.getAllMails();
    }
    _lastState = state;
  }

  Future<void> onRefrsh() async {
    homeController.getAllMails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(() {
            return homeController.isLoadingMails.value
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: onRefrsh,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        homeController.mailList.isEmpty
                            ? const Center(
                                child: Text(
                                  'Inbox empty',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Row(
                                children: const [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                    'Mail',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  Expanded(
                                      child: Text(
                                    'From',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              itemCount: homeController.mailList.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      homeController.mailList[index].intro ??
                                          '',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                    )),
                                    Expanded(
                                        child: Text(
                                      homeController
                                          .mailList[index].from.address,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                    )),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  );
          }),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.blueGrey,
            onPressed: () => _sendingMails(widget.email),
            label: const Text(
              'Send mail',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            icon: const Icon(Icons.arrow_forward_ios_sharp),
          )),
    );
  }

  _sendingMails(String email) async {
    var url = 'mailto:$email';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));

      homeController.getAllMails();
    } else {
      throw 'Could not launch $url';
    }
  }
}
