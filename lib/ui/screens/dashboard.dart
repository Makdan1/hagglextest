import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hagglextest/utils/colors.dart';
import 'package:hagglextest/utils/locator.dart';
import 'package:hagglextest/utils/router/navigation_service.dart';
import 'package:hagglextest/utils/router/route_names.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Dashboard extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Dashboard> {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 175,
                color: AppColors.primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              backgroundColor: AppColors.white,
                              radius: 28,
                              child: CircleAvatar(
                                  backgroundColor: AppColors.primaryColor,
                                  radius: 26,
                                  child: CircleAvatar(
                                    child: Text(
                                      'SV',
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    backgroundColor: AppColors.secondaryColor,
                                  ))),
                          Text(
                            "HaggleX",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Badge(
                              badgeContent: Text(
                                '5',
                                style: TextStyle(color: Colors.white),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.purple.shade900,
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total portfolio balance',
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "\$****",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          ToggleSwitch(
                            minWidth: 60.0,
                            cornerRadius: 20.0,
                            activeBgColors: [
                              [AppColors.gold],
                              [AppColors.gold]
                            ],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.white,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            customTextStyles: [
                              TextStyle(color: Colors.black),
                              TextStyle(color: Colors.black)
                            ],
                            labels: ['USD', 'NGN'],
                            radiusStyle: true,
                            onToggle: (index) {
                              print('switched to: $index');
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: 145,
                            width: MediaQuery.of(context).size.width * 0.85,
                            margin: EdgeInsets.all(15.0),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.bottomLeft,
                                  stops: [
                                    0.1,
                                    0.4,
                                    0.8,
                                    0.9
                                  ],
                                  colors: [
                                    AppColors.primaryColor.withOpacity(0.7),
                                    AppColors.primaryColor,
                                    AppColors.primaryColor,
                                    AppColors.primaryColor,
                                  ]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "HaggleX\nMarketplace\n",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                        "Trade crypto and giftcard on HaggleX securely.",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white)),
                                  ],
                                )),
                          ),
                          Container(
                            height: 145,
                            width: MediaQuery.of(context).size.width * 0.85,
                            margin: EdgeInsets.all(15.0),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.bottomLeft,
                                  stops: [
                                    0.1,
                                    0.4,
                                    0.8,
                                    0.9
                                  ],
                                  colors: [
                                    AppColors.primaryColor.withOpacity(0.7),
                                    AppColors.primaryColor,
                                    AppColors.primaryColor,
                                    AppColors.primaryColor,
                                  ]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "HaggleX\nMarketplace\n",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                        "Trade crypto and giftcard on HaggleX securely.",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white)),
                                  ],
                                )),
                          ),
                          Container(
                            height: 145,
                            width: MediaQuery.of(context).size.width * 0.85,
                            margin: EdgeInsets.all(15.0),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.bottomLeft,
                                  stops: [
                                    0.1,
                                    0.4,
                                    0.8,
                                    0.9
                                  ],
                                  colors: [
                                    AppColors.primaryColor.withOpacity(0.7),
                                    AppColors.primaryColor,
                                    AppColors.primaryColor,
                                    AppColors.primaryColor,
                                  ]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "HaggleX\nMarketplace\n",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                        "Trade crypto and giftcard on HaggleX securely.",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white)),
                                  ],
                                )),
                          ),
                          Container(
                            height: 145,
                            width: MediaQuery.of(context).size.width * 0.85,
                            margin: EdgeInsets.all(15.0),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.bottomLeft,
                                  stops: [
                                    0.1,
                                    0.4,
                                    0.8,
                                    0.9
                                  ],
                                  colors: [
                                    AppColors.primaryColor.withOpacity(0.7),
                                    AppColors.primaryColor,
                                    AppColors.primaryColor,
                                    AppColors.primaryColor,
                                  ]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "HaggleX\nMarketplace\n",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                        "Trade crypto and giftcard on HaggleX securely.",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.white)),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Markets',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                            InkWell(
                              onTap: () {
                                _navigationService
                                    .navigateReplacementTo(LoginRoute);
                              },
                              child: Text('Log Out',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            )
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        shadowColor: Colors.grey,
                        child: ListTile(
                          title: Text('Haggle (HAG)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              )),
                          subtitle: Text('NGN 380',
                              style: TextStyle(
                                fontSize: 10,
                              )),
                          leading: Image.asset('assets/images/haggle.png'),
                          trailing: Image.asset(
                            'assets/images/haggle_graph.png',
                            scale: 3,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        shadowColor: Colors.grey,
                        child: ListTile(
                          title: Text('Bitcoin (BTC)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              )),
                          subtitle: Row(
                            children: [
                              Text('NGN 4,272,147.00 ',
                                  style: TextStyle(
                                    fontSize: 10,
                                  )),
                              Text(' +2.34%',
                                  style: TextStyle(
                                    color: Color(0xff52CB35),
                                    fontSize: 10,
                                  )),
                            ],
                          ),
                          leading: Image.asset('assets/images/usdt.png'),
                          trailing: Image.asset(
                            'assets/images/yellow_graph.png',
                            scale: 3,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        shadowColor: Colors.grey,
                        child: ListTile(
                          title: Text('Ethereum (ETH)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              )),
                          subtitle: Row(
                            children: [
                              Text('NGN 4,272,147.00 ',
                                  style: TextStyle(
                                    fontSize: 10,
                                  )),
                              Text(' +2.34%',
                                  style: TextStyle(
                                    color: Color(0xff52CB35),
                                    fontSize: 10,
                                  )),
                            ],
                          ),
                          leading: Image.asset('assets/images/haggle.png'),
                          trailing: Image.asset(
                            'assets/images/haggle_graph.png',
                            scale: 3,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        shadowColor: Colors.grey,
                        child: ListTile(
                          title: Text('Tether (USDT)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              )),
                          subtitle: Row(
                            children: [
                              Text('NGN 4,272,147.00 ',
                                  style: TextStyle(
                                    fontSize: 10,
                                  )),
                              Text(' +2.34%',
                                  style: TextStyle(
                                    color: Color(0xff52CB35),
                                    fontSize: 10,
                                  )),
                            ],
                          ),
                          leading: Image.asset('assets/images/usdt.png'),
                          trailing: Image.asset(
                            'assets/images/yellow_graph.png',
                            scale: 3,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        shadowColor: Colors.grey,
                        child: ListTile(
                          title: Text('Bitcoin Cash (BCH)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              )),
                          subtitle: Row(
                            children: [
                              Text('NGN 4,272,147.00 ',
                                  style: TextStyle(
                                    fontSize: 10,
                                  )),
                              Text(' +2.34%',
                                  style: TextStyle(
                                    color: Color(0xff52CB35),
                                    fontSize: 10,
                                  )),
                            ],
                          ),
                          leading: Image.asset('assets/images/haggle.png'),
                          trailing: Image.asset(
                            'assets/images/haggle_graph.png',
                            scale: 3,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        shadowColor: Colors.grey,
                        child: ListTile(
                          title: Text('Dodgecoin (DOGE)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              )),
                          subtitle: Row(
                            children: [
                              Text('NGN 4,272,147.00 ',
                                  style: TextStyle(
                                    fontSize: 10,
                                  )),
                              Text(' +2.34%',
                                  style: TextStyle(
                                    color: Color(0xff52CB35),
                                    fontSize: 10,
                                  )),
                            ],
                          ),
                          leading: Image.asset('assets/images/haggle.png'),
                          trailing: Image.asset(
                            'assets/images/yellow_graph.png',
                            scale: 3,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        shadowColor: Colors.grey,
                        child: ListTile(
                          title: Text('Litecoin (LTC)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              )),
                          subtitle: Row(
                            children: [
                              Text('NGN 4,272,147.00 ',
                                  style: TextStyle(
                                    fontSize: 10,
                                  )),
                              Text(' +2.34%',
                                  style: TextStyle(
                                    color: Color(0xff52CB35),
                                    fontSize: 10,
                                  )),
                            ],
                          ),
                          leading: Image.asset('assets/images/haggle.png'),
                          trailing: Image.asset(
                            'assets/images/haggle_graph.png',
                            scale: 3,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Do more with HaggleX',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 6,
                        shadowColor: Colors.grey,
                        child: ListTile(
                            title: Text('Send money instantly',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                )),
                            subtitle: Text('Send crypto to another wallet'),
                            leading: Image.asset('assets/images/arrow_up.png')),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 6,
                        shadowColor: Colors.grey,
                        child: ListTile(
                            title: Text('Receive money from anyone',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                )),
                            subtitle:
                                Text('Receive crypto from another wallet'),
                            leading:
                                Image.asset('assets/images/arrow_down.png')),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 6,
                        shadowColor: Colors.grey,
                        child: ListTile(
                            title: Text('Virtual Card',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                )),
                            subtitle: Text(
                                'Make faster payments using HaggleX cards'),
                            leading: Icon(
                              Icons.credit_card,
                              color: AppColors.primaryColor,
                              size: 35,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 6,
                        shadowColor: Colors.grey,
                        child: ListTile(
                            title: Text('Global Remittance',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                )),
                            subtitle: Text('Send money to anyone, anywhere'),
                            leading: Icon(
                              Icons.vpn_lock,
                              color: AppColors.primaryColor,
                              size: 35,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Trending crypto news',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          title: Text(
                              'Blockchain Bites: BTC on Ethereum, DeFi’s latest stablecoin, the currency cold wars',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              )),
                          subtitle: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Text('6hrs ago',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      )),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text('Category:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      )),
                                  Text('DeFi',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      )),
                                ],
                              )),
                          leading: Image.asset('assets/images/bitcoin.jpeg')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          title: Text(
                              'Blockchain Bites: BTC on Ethereum, DeFi’s latest stablecoin, the currency cold wars',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              )),
                          subtitle: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Text('6hrs ago',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      )),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text('Category:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      )),
                                  Text('DeFi',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      )),
                                ],
                              )),
                          leading: Image.asset('assets/images/bitcoin.jpeg')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          title: Text(
                              'Blockchain Bites: BTC on Ethereum, DeFi’s latest stablecoin, the currency cold wars',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              )),
                          subtitle: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Text('6hrs ago',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      )),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text('Category:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      )),
                                  Text('DeFi',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      )),
                                ],
                              )),
                          leading: Image.asset('assets/images/bitcoin.jpeg')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          title: Text(
                              'Blockchain Bites: BTC on Ethereum, DeFi’s latest stablecoin, the currency cold wars',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              )),
                          subtitle: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Text('6hrs ago',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      )),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text('Category:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      )),
                                  Text('DeFi',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      )),
                                ],
                              )),
                          leading: Image.asset('assets/images/bitcoin.jpeg')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          title: Text(
                              'Blockchain Bites: BTC on Ethereum, DeFi’s latest stablecoin, the currency cold wars',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              )),
                          subtitle: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Text('6hrs ago',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      )),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text('Category:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      )),
                                  Text('DeFi',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      )),
                                ],
                              )),
                          leading: Image.asset('assets/images/bitcoin.jpeg')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF2b2350),
        unselectedItemColor: Colors.black26,
        items: [
          BottomNavigationBarItem(
              label: "Home", icon: Icon(Icons.dashboard_rounded)),
          BottomNavigationBarItem(
              label: "Wallet", icon: Icon(Icons.account_balance_wallet)),
          BottomNavigationBarItem(
              label: "Refresh",
              icon: Icon(
                Icons.replay_circle_filled,
                color: AppColors.primaryColor,
              )),
          BottomNavigationBarItem(label: "Cryptosave", icon: Icon(Icons.save)),
          BottomNavigationBarItem(
              label: "More", icon: Icon(Icons.add_box_sharp)),
        ],
      ),
    );
  }
}
