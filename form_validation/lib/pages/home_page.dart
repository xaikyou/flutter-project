import 'package:flutter/material.dart';
import 'package:form_validation/config/constants.dart';
import 'package:form_validation/pages/date_and_location.dart';
import 'package:form_validation/pages/details.dart';
import 'package:form_validation/pages/guests.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Widget tabTitle({required Widget icon, required String title}) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black54),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: icon,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: titleSize,
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _getAppBarTitle() {
    switch (_tabController.index) {
      case 0:
        return tabTitle(
          icon: const Icon(LineAwesomeIcons.file_alt),
          title: ' What\'s your event about?',
        );
      case 1:
        return tabTitle(
          icon: const Icon(LineAwesomeIcons.thumbtack_solid),
          title: '\tWhen and where will it take place?',
        );
      case 2:
      default:
        return tabTitle(
          icon: const Icon(LineAwesomeIcons.user_friends_solid),
          title: '\tWho should join it?',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    var tabTextStyle = const TextStyle(
      fontSize: 17,
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: _getAppBarTitle(),
          scrolledUnderElevation: 0,
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: IgnorePointer(
              ignoring: false,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: UnderlineTabIndicator(
                  borderSide: const BorderSide(color: Colors.blue, width: 5),
                  borderRadius: BorderRadius.circular(10),
                  insets: const EdgeInsets.symmetric(vertical: 45),
                ),
                dividerHeight: 0,
                labelColor: Colors.blue,
                tabAlignment: TabAlignment.start,
                tabs: [
                  Tab(
                    child: Text(
                      'Details',
                      style: tabTextStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Date and location',
                      style: tabTextStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Guests',
                      style: tabTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Details(
              nextButton: () => _tabController.animateTo(1),
            ),
            DateAndLocation(
              nextButton: () => _tabController.animateTo(2),
              backButton: () => _tabController.animateTo(0),
            ),
            Guests(
              backButton: () => _tabController.animateTo(1),
            ),
          ],
        ),
      ),
    );
  }
}
