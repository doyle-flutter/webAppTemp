import 'package:exam/_12commonComponents/main/GridComponent.dart';
import 'package:exam/_1pages/detail/material/detailPage.dart';
import 'package:flutter/material.dart';

class MainAppViewMaterial extends StatelessWidget {
  final TabController? tabController;
  final PageController? pageController;
  const MainAppViewMaterial({required this.tabController, required this.pageController});

  @override
  Widget build(BuildContext context) {
    if(this.tabController == null || this.pageController == null) return Container(child: Text("로딩"),);
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGO"),
        centerTitle: true,
        bottom: TabBar(
          controller: this.tabController,
          tabs: <String>["메뉴1","메뉴2", "찜"].map<Tab>(
            (String menu) => Tab(child: Text(menu),)
          ).toList(),
        ),
      ),
      body: PageView(
        pageSnapping: true,
        physics: NeverScrollableScrollPhysics(),
        controller: this.pageController,
        children: [
          Container(
            color: Colors.red,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.pink,
                  )
                ),
                Expanded(
                  flex: 5,
                  child: GridComponent(
                    datas: [1,2,3,4,5,6,6,7,8,9],
                    gridCount: 1,
                    itemBuilder: (BuildContext context, int index) => GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          settings: RouteSettings(name: "/detail",),
                          builder:  (BuildContext context) => DetailPageMa()
                        )
                      ),
                      child: Container(
                        color: Colors.white,
                        child: Center(child: Text("APP - $index")),
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
