import 'package:assignment/pages/settingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_navigation/side_navigation.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  RxBool isSettingVisible = true.obs;

  int selectedIndex = 0;

  Rx<Color> settingColor =Colors.white.obs;

  @override
  Widget build(BuildContext context) {
    double _height(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double _width(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    List<Widget> views =  [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(()=> Container(
              height: 600,
              width: isSettingVisible.value ? _width(0.65) : _width(0.90),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[400]
              ),
          )
          ),
          Obx(()=>  isSettingVisible.value?
          Container(
            height: 600,
            width: _width(0.3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[100],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Quick settings",style: TextStyle(fontSize: 20),),
                    IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.multiply))
                  ],
                ).paddingSymmetric(vertical: 5,horizontal: 10),
                MouseRegion(
                  cursor:SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex=2;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: settingColor.value,
                          border: Border.all(
                            color:  Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(child: Text("See all settings",style: TextStyle(color: Colors.blue),),),
                    ).paddingSymmetric(horizontal: 10),
                  ),
                )
              ],
            ),
          ):Container()),
        ],
      ),
      Center(child: Text('Dashboard'),),
      SettingPage(),
    ];

    /// The currently selected index of the bar

    return Scaffold(
      key: _key,
      appBar:  AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          onPressed: (){
            if(_key.currentState!.isDrawerOpen){
              _key.currentState!.closeDrawer();
            }else{
              _key.currentState!.openDrawer();
            }
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 40,
              width: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/gmail.webp'),
                  fit: BoxFit.cover, // or another BoxFit option based on your needs
                ),
              ),
            ).paddingSymmetric(vertical: 20),
            SizedBox(
              height: 50,
              width: _width(0.6),
              child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintText: "Search mail",
                      prefixIcon: Icon(Icons.search)),
                  textInputAction: TextInputAction.search),
            ).paddingSymmetric(vertical: 20),
            IconButton(
              onPressed: () {
                isSettingVisible.value = !isSettingVisible.value;
              },
              icon: Icon(Icons.settings),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.person_pin),)
          ],
        ),
      ),
      drawer: Drawer(),
      body: Row(
        children: [
          SideNavigationBar(
            selectedIndex: selectedIndex,
            expandable: false,
            initiallyExpanded: false,
            items: const [
              SideNavigationBarItem(
                icon: Icons.mail,
                label: 'mail',
              ),
              SideNavigationBarItem(
                icon: Icons.messenger_outline,
                label: 'chat',
              ),
              SideNavigationBarItem(
                icon: Icons.videocam_outlined,
                label: 'meet',
              ),
            ],
            onTap: (index) {
              setState((){
                selectedIndex=index;
              });
            },
            theme: SideNavigationBarTheme(
              itemTheme: SideNavigationBarItemTheme(
                selectedItemColor: Colors.black,
              ),
              togglerTheme: SideNavigationBarTogglerTheme(),
              dividerTheme: SideNavigationBarDividerTheme(
                showHeaderDivider: false,
                showMainDivider: false,
                showFooterDivider: false,
              ),
            ),
          ),
          Expanded(
            child: views.elementAt(selectedIndex),
          ),

        ],
      ),
    );
  }
}

