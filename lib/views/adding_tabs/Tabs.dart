/*Creating tabs with CupertinoTabScaffold*/
import 'package:cupertino_app/models/user.dart';
import 'package:cupertino_app/views/widgets/user_tile.dart';
import 'package:flutter/cupertino.dart';

class Tabs extends StatefulWidget {
  Tabs({super.key});

  final List<User> _filteredUsers = users;

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(currentIndex: 1, items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone), label: 'Calls'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2), label: 'Chats'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: 'Settings'),
        ]),
        tabBuilder: (context, index) {
          late final CupertinoTabView returnValue;
          switch (index) {
            case 0:
              returnValue = CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      middle: Text('Calls'),
                    ),
                    child: Center(child: Text('Calls')));
              });
              break;
            case 1:
              returnValue = CupertinoTabView(
                builder: (context) => CustomScrollView(
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 5,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return UserTile(user: widget._filteredUsers[index]);
                        },
                        childCount: widget._filteredUsers.length,
                      ),
                    )
                  ],
                ),
              );
              break;
            case 2:
              returnValue = CupertinoTabView(
                builder: (context) => const Placeholder(),
              );
              break;
          }
          return returnValue;
        });
  }
}
