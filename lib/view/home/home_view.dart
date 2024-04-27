import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trackizer/common/color_extension.dart';
import 'package:trackizer/models/user_model.dart';
import 'package:trackizer/provider/user_provider.dart';

import '../../common_widget/custom_arc_painter.dart';
import '../../common_widget/segment_button.dart';
import '../../common_widget/status_button.dart';
import '../../common_widget/subscription_home_row.dart';
import '../../common_widget/upcoming_bill_row.dart';
import '../settings/settings_view.dart';
import '../subscription_info/subscription_info_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubscription = true;

  List subArr = [
    {
      "name": "Salary",
      "icon": "assets/img/income.png",
      "price": "${Constants.currencySymbol}1,00,00"
    },
    {
      "name": "Rent",
      "icon": "assets/img/expense.png",
      "price": "${Constants.currencySymbol}25,000"
    },
    {
      "name": "Taxi",
      "icon": "assets/img/expense.png",
      "price": "${Constants.currencySymbol}500"
    },
    {
      "name": "Movie",
      "icon": "assets/img/expense.png",
      "price": "${Constants.currencySymbol}1,000"
    },
    {
      "name": "Food",
      "icon": "assets/img/expense.png",
      "price": "${Constants.currencySymbol}3,000"
    },
    {
      "name": "Zomato Shares",
      "icon": "assets/img/investment.png",
      "price": "${Constants.currencySymbol}5,000"
    },
    {
      "name": "Savings",
      "icon": "assets/img/investment.png",
      "price": "${Constants.currencySymbol}59,000"
    },
  ];

  List bilArr = [
    {
      "name": "Spotify Monthly Subscription",
      "date": DateTime(2024, 05, 4),
      "price": "${Constants.currencySymbol}129"
    },
    {
      "name": "CAR EMI",
      "date": DateTime(2024, 05, 4),
      "price": "${Constants.currencySymbol}15,000"
    },
    {
      "name": "Rent",
      "date": DateTime(2024, 05, 4),
      "price": "${Constants.currencySymbol}25,000"
    },
  ];
  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    _userProvider.refreshUser();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    UserModel user = Provider.of<UserProvider>(context).getUser;
    double remainingBudget = user.totalBudget - user.budgetUsed;
    String budgetStatus =
        (user.totalBudget > user.budgetUsed) ? "On Track" : "Exceeded";
    int budgetUsed = 0;
    if (user.totalBudget > 0) {
      budgetUsed = ((user.budgetUsed / user.totalBudget) * 100).ceil();
    }
    return Scaffold(
      backgroundColor: TColor.gray,
      body: Column(
        children: [
          Container(
            height: media.width * 1.1,
            decoration: BoxDecoration(
                color: TColor.gray70.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/img/home_bg.png"),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: media.width * 0.05),
                      width: media.width * 0.72,
                      height: media.width * 0.72,
                      child: CustomPaint(
                        painter: CustomArcPainter(
                          end: 162,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SettingsView()));
                              },
                              icon: Image.asset("assets/img/settings.png",
                                  width: 25, height: 25, color: TColor.gray30))
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: media.width * 0.05,
                    ),
                    Image.asset("assets/img/app_logo.png",
                        width: media.width * 0.25, fit: BoxFit.contain),
                    SizedBox(
                      height: media.width * 0.07,
                    ),
                    Text(
                      "${Constants.currencySymbol}$remainingBudget",
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: media.width * 0.055,
                    ),
                    Text(
                      "",
                      style: TextStyle(
                          color: TColor.gray40,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: media.width * 0.07,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: TColor.border.withOpacity(0.15),
                          ),
                          color: TColor.gray60.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          "See your budget",
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: StatusButton(
                              title: "Budget Used",
                              value: "$budgetUsed%",
                              statusColor: TColor.secondary,
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: StatusButton(
                              title: "Budget Status",
                              value: budgetStatus,
                              statusColor: TColor.primary10,
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: StatusButton(
                              title: "Next bill in",
                              value: "${user.nextDue} days",
                              statusColor: TColor.secondaryG,
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Expanded(
                  child: SegmentButton(
                    title: "Your transactions",
                    isActive: isSubscription,
                    onPressed: () {
                      setState(() {
                        isSubscription = !isSubscription;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: SegmentButton(
                    title: "Upcoming bills",
                    isActive: !isSubscription,
                    onPressed: () {
                      setState(() {
                        isSubscription = !isSubscription;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          if (isSubscription)
            Expanded(
              child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: subArr.length,
                  itemBuilder: (context, index) {
                    var sObj = subArr[index] as Map? ?? {};

                    return SubScriptionHomeRow(
                      sObj: sObj,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SubscriptionInfoView(sObj: sObj)));
                      },
                    );
                  }),
            ),
          if (!isSubscription)
            Expanded(
              child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bilArr.length,
                  itemBuilder: (context, index) {
                    var sObj = bilArr[index] as Map? ?? {};

                    return UpcomingBillRow(
                      sObj: sObj,
                      onPressed: () {},
                    );
                  }),
            ),
          const SizedBox(
            height: 110,
          ),
        ],
      ),
    );
  }
}
