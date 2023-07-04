import 'package:flutter/cupertino.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool chatBackup = true;

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
              CupertinoFormSection(header: const Text('Account Details'), children: [
                CupertinoFormRow(
                    prefix: const Text('Chat Backup'),
                    child: CupertinoSwitch(
                        value: chatBackup,
                        onChanged: (value) {
                          setState(() {
                            chatBackup = !chatBackup;
                          });
                        }))
              ])
            ],
          ),
        ));
  }
}
