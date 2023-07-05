import 'package:flutter/cupertino.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  bool chatBackup = true;

  /*
  * This method is for showing action sheet for cupertino
  * */
  _showDialog(Widget child) {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 320,
            child: child,
          );
        });
  }

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
                height: 48,
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
              ),
              Center(
                child: CupertinoButton(
                  child: const Text('Delete all chat'),
                  onPressed: () {
                    showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                              title: const Text('Delete all chat'),
                              content:
                                  const Text('Proceed with deleting all chat?'),
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text('No'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoDialogAction(
                                  isDestructiveAction: true,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Yes'),
                                )
                              ],
                            ));
                  },
                ),
              ),
              Center(
                  child: CupertinoButton(
                //  Display a cupertino cupertino date picker in date picker mode
                onPressed: () {
                  _showDialog(CupertinoDatePicker(
                      backgroundColor: CupertinoColors.white,
                      use24hFormat: true,
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: date,
                      onDateTimeChanged: (DateTime newDate) {
                        setState(() => date = newDate);
                      }));
                },
                child: Text("${date.month}-${date.day}-${date.year}"),
              ))
            ],
          ),
        ));
  }
}
