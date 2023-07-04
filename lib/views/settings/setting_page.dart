import 'package:flutter/cupertino.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool chatBackup = true;

  /*
  * This method is for showing action sheet for cupertino
  * */

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Settings'),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              CupertinoFormSection(
                  header: const Text('Account Details'),
                  children: [
                    CupertinoFormRow(
                        prefix: const Text('Chat Backup'),
                        child: CupertinoSwitch(
                            value: chatBackup,
                            onChanged: (value) {
                              setState(() {
                                chatBackup = !chatBackup;
                              });
                            }))
                  ]),
              Center(
                child: CupertinoButton(
                  child: const Text('Chat Wallpaper'),
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                        title: const Text('Set Wallpaper Theme'),
                        actions: [
                          CupertinoActionSheetAction(
                              onPressed: () {}, child: const Text('Light')),
                          CupertinoActionSheetAction(
                              onPressed: () {}, child: const Text('Dark'))
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
