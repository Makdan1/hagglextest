import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hagglextest/core/model/country_model.dart';
import 'package:hagglextest/ui/screens/register/registerViewModel.dart';
import 'package:hagglextest/utils/colors.dart';
import 'package:hagglextest/utils/screensize.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class CountryListPage extends StatefulWidget {
  @override
  _CountryListPageState createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  List<CountryModel> searchResult = [];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        onModelReady: (v) {},
        viewModelBuilder: () => RegisterViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AppColors.primaryColor,
              body: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: searchTextField(context)),
                  Expanded(
                    child: Container(
                      child: FutureBuilder<List<CountryModel>>(
                          future: model.getCountries(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Container(
                                padding: EdgeInsets.all(20.0),
                                child: Shimmer.fromColors(
                                    direction: ShimmerDirection.ltr,
                                    period: Duration(seconds: 2),
                                    child: ListView(
                                      children: [0, 1, 2, 3, 4, 5]
                                          .map((_) => Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: Responsive.width(
                                                              context) -
                                                          100,
                                                      height: 80,
                                                      color: Colors.white,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 8.0,
                                                            color: Colors.white,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        2.0),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 8.0,
                                                            color: Colors.white,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        2.0),
                                                          ),
                                                          Container(
                                                            width: 40.0,
                                                            height: 8.0,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                    baseColor: AppColors.grey,
                                    highlightColor: Colors.white),
                              );
                            } else if (snapshot.data.isNotEmpty) {
                              return ListView(
                                  shrinkWrap: true,
                                  children: snapshot.data
                                      .map((feed) => Container(
                                              child: ListTile(
                                            onTap: () {
                                              Navigator.pop(context, feed);
                                              print(feed);
                                            },
                                            title: Text(
                                              "(+${feed?.callingCode ?? ""}) ${feed?.name ?? ""})",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                            horizontalTitleGap: 4,
                                            leading: SvgPicture.network(
                                                feed?.flag,
                                                height: 14,
                                                placeholderBuilder: (context) {
                                              return Image.asset(
                                                "assets/images/nigeriaflag.png",
                                                scale: 19.9,
                                              );
                                            }),
                                          )))
                                      .toList());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 100,
                                  ),
                                  Text(
                                    'Network error',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Network error'),
                                  SizedBox(
                                    height: 100,
                                  ),
                                ],
                              ));
                            } else {
                              return Center(
                                  child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 100,
                                  ),
                                  Text(
                                    'Country not found',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Country not found',
                                  ),
                                  SizedBox(
                                    height: 100,
                                  ),
                                ],
                              ));
                            }
                          }),
                    ),
                  ),
                ],
              ));
        });
  }

  Widget countryListItem(BuildContext context, CountryModel country,
      {VoidCallback onSelect}) {
    return ListTile(
      title: Text(
        "(+${country?.callingCode ?? ""}) ${country?.name ?? ""})",
        style:
            Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),
      ),
      onTap: onSelect,
      horizontalTitleGap: 4,
      leading: SvgPicture.network(country?.flag, height: 14,
          placeholderBuilder: (context) {
        return Icon(Icons.refresh);
      }),
    );
  }

  TextField searchTextField(
    BuildContext context,
  ) {
    return TextField(
      //onChanged: onChanged,
      style:
          Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),
      decoration: new InputDecoration(
          enabled: false,
          filled: true,
          fillColor: Colors.purple.shade900,
          hintText: "Search for country",
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Colors.white),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          isDense: true,
          contentPadding: EdgeInsets.only(left: 20),
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12.0),
            child: Icon(CupertinoIcons.search,
                color: AppColors.secondaryColor, size: 24),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(50), right: Radius.circular(50))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(50), right: Radius.circular(50)))),
    );
  }
}
