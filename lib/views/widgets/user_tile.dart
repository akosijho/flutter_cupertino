import 'package:cupertino_app/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
        leading: Container(
          width: 32,
          decoration: BoxDecoration(
            color: user.color,
            shape: BoxShape.circle
          ),
        ),
        title: Text(user.name));
  }
}
