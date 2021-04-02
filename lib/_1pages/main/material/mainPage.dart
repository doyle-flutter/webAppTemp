import 'package:exam/_11viewComponents/app/main/material/mainAppViewMateri.dart';
import 'package:exam/_11viewComponents/web/main/mainWebView.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainPageMa extends StatefulWidget{
  @override
  _MainPageMaState createState() => _MainPageMaState();
}

class _MainPageMaState extends State<MainPageMa> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  PageController? _pageController;
  int pageIndex = 0;

  @override
  void initState() {
    this._pageController = new PageController(initialPage: 0);
    this._tabController = new TabController(length: 3, vsync: this)
      ..addListener(() {
        if(_pageController != null){
          this.pageIndex = this._tabController!.index;
          _pageController!.animateToPage(
            this.pageIndex,
            duration: Duration(milliseconds: 500),
            curve: Curves.linear
          );
        }
      });
    if(!mounted) return;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (kIsWeb && MediaQuery.of(context).size.width > 800.0)
      ? MainWebView(tabController: _tabController, pageController: _pageController,)
      : MainAppViewMaterial(tabController: _tabController, pageController: _pageController,);
  }
}
