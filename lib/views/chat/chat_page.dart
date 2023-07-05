import 'package:cupertino_app/models/user.dart';
import 'package:cupertino_app/views/widgets/user_tile.dart';
import 'package:flutter/cupertino.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  // final List<User> users;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _searchController = TextEditingController();
  List<User> _filteredUser = users;

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
        SliverToBoxAdapter(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: ClipRect(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: CupertinoSearchTextField(
                  controller: _searchController,
                  onChanged: (value){
                    _updateUserList(value);
                  },
                  onSubmitted: (value){
                    _updateUserList(value);
                  },
                  onSuffixTap: (){
                    _updateUserList('');
                  },
                ),
              ),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 5,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return UserTile(user: _filteredUser[index]);
            },
            childCount: _filteredUser.length,
          ),
        )
      ],
    );
  }

  void _updateUserList(String value) {
    debugPrint(value);

    if (value.isNotEmpty) {
      _filteredUser = users
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      _searchController.text = "";
      _filteredUser = users;
    }
    setState(() {});
  }
}
