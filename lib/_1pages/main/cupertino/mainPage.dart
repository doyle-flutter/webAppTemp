import 'package:exam/_12commonComponents/main/GridComponent.dart';
import 'package:exam/_1pages/detail/cupertino/detailPage.dart';
import 'package:flutter/cupertino.dart';

class MainPageCu extends StatelessWidget {
  CupertinoTabController _tabController = new CupertinoTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        controller: _tabController,
        tabBar: CupertinoTabBar(
          items: <String>["메뉴1", "메뉴2", "찜"].map<BottomNavigationBarItem>(
            (String menu) => BottomNavigationBarItem(
              label: menu, icon: Icon(CupertinoIcons.add)
            )
          ).toList()
        ),
        tabBuilder: (BuildContext context, int index) => SafeArea(
          bottom: false,
          child: Container(
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      color: CupertinoColors.systemPink,
                    )
                ),
                Expanded(
                    flex: 5,
                    child: Container(
                      color: CupertinoColors.activeOrange,
                      child: GridComponent(
                        gridCount: 1,
                        datas: [11,22,33,44,55,66,77,88,99],
                        itemBuilder: (BuildContext context, int index) => GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              CupertinoPageRoute(builder: (BuildContext context) => DetailPageCu())
                          ),
                          child: Container(
                            color: CupertinoColors.white,
                            child: Container(child: Center(child: Text("Cu - $index"),),),
                          ),
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}

