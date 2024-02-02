import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:language_picker/languages.g.dart';

class SettingPage extends StatefulWidget  {
   SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}


class _SettingPageState extends State<SettingPage> with TickerProviderStateMixin {

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  var country = [
    'India',
    'Pakistan',
    'China',
    'Japan',
    'Shri lanka',
  ];
  var fonts = [
    'India',
    'Pakistan',
    'China',
    'Japan',
    'Shri lanka',
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Text("General"),
              Text("Label"),
              Text("Inbox"),
            ]
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: TabBarView(
                controller:_tabController    ,
                  children: [
                    general(),
                    Center(child:Text("Inbox") ,),
                    Center(child:Text("Inbox") ,)
                  ]
              ),
            ),
          )
        ],
      )
    );
  }
  Language _selectedDropdownLanguage = Languages.english;

// It's sample code of Dropdown Item.
  Widget _buildDropdownItem(Language language) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 8.0,
        ),
        Text("${language.name} (${language.isoCode})"),
      ],
    );
  }

  Widget general(){
    return
        Column(
          children: [
            Row(
              children: [
                Text('Language: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Gmail display language:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Container(
                  height: 20,
                  width: 200,
                  decoration: BoxDecoration(
                      border:Border.all(
                          width: 0.5
                      )
                  ),
                  child: LanguagePickerDropdown(

                    initialValue: Languages.english,
                    itemBuilder: _buildDropdownItem,
                    onValuePicked: (Language language) {
                      _selectedDropdownLanguage = language;
                    },
                  ),
                )
              ],
            ).paddingOnly(top: 10),
            Divider().paddingSymmetric(vertical: 10),
            Row(
              children: [
                Text('Phone number: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Default country code:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Container(
                  height: 20,
                  width: 200,
                  decoration: BoxDecoration(
                      border:Border.all(
                          width: 0.5
                      )
                  ),
                  child:DropdownButton(
                    focusColor: Colors.white,
                    value: 'India',
                    icon:  Icon(Icons.keyboard_arrow_down),
                    items: country.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        // dropdownvalue = newValue!;
                      });
                    },
                  ), )
              ],
            ),
            Divider().paddingSymmetric(vertical: 10),
            Row(
              children: [
                Text('Default text: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Card(
                  elevation: 10,
                  child: Container(
                    height: 60,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            DropdownButton(
                              focusColor: Colors.white,
                              value: 'abel',
                              icon: Icon(Icons.arrow_drop_down),
                              items: [
                                DropdownMenuItem(child: Text("abel",style: GoogleFonts.abel(),), value: "abel"),
                                DropdownMenuItem(child: Text("aBeeZee",style: GoogleFonts.aBeeZee(),), value: "aBeeZee"),
                                DropdownMenuItem(child: Text("aboreto",style: GoogleFonts.aboreto(),), value: "data1"),
                                DropdownMenuItem(child: Text("roboto",style: GoogleFonts.roboto(),), value: "roboto"),
                                DropdownMenuItem(child: Text("breeSerif",style: GoogleFonts.breeSerif(),), value: "breeSerif"),
                                DropdownMenuItem(child: Text("archivoNarrow",style: GoogleFonts.archivoNarrow(),), value: "archivoNarrow"),
                                DropdownMenuItem(child: Text("cormorantGaramond",style: GoogleFonts.cormorantGaramond(),), value: "cormorantGaramond"),
                              ],
                              onChanged: (value) {
                                // Handle the onChanged event
                              },
                            ),
                            DropdownButton(
                              focusColor: Colors.white,
                              value: 'small',
                              icon: Icon(Icons.arrow_drop_down),
                              items: [
                                DropdownMenuItem(child: Text("small",style: TextStyle(fontSize: 10),), value: "small"),
                                DropdownMenuItem(child: Text("Normal",style: TextStyle(fontSize: 14),), value: "Normal"),
                                DropdownMenuItem(child: Text("Large",style: TextStyle(fontSize: 18),), value: "Large"),
                                DropdownMenuItem(child: Text("Huge",style: TextStyle(fontSize: 20),), value: "Huge"),


                              ],
                              onChanged: (value) {
                                // Handle the onChanged event
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Divider().paddingSymmetric(vertical: 10),
            Row(
              children: [
                Text('Stars: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            Divider().paddingSymmetric(vertical: 10),
            Row(
              children: [
                Text('Signature: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 10);
  }
}