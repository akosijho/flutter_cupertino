import 'package:cupertino_app/models/user.dart';
import 'package:cupertino_app/views/widgets/user_tile.dart';
import 'package:flutter/cupertino.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.users});

  final List<User> users;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: const Text('Chats'),
          leading: const Text(
            'Edit',
            style: TextStyle(color: CupertinoColors.link),
          ),
          middle: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CupertinoActivityIndicator(),
              SizedBox(width: 8),
              Text('Waiting for network')
            ],
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 5,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return UserTile(user: widget.users[index]);
            },
            childCount: widget.users.length,
          ),
        )
      ],
    );
  }
}
