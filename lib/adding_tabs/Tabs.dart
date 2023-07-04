/*Creating tabs with CupertinoTabScaffold*/
import 'package:flutter/cupertino.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

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
                builder: (context) => const CustomScrollView(
                  slivers: [
                    CupertinoSliverNavigationBar(
                      largeTitle: Text('Chats'),
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
