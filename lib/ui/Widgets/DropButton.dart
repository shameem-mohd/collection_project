import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/GetRouteModel.dart';
import 'package:project/model/GetSchemeIdModel.dart';
import 'package:project/repositary/bloc/Id/id_bloc.dart';

class WidgetDropDownButton extends StatefulWidget {
  const WidgetDropDownButton({
    Key? key,
    // required this.id1,
    // required this.id2,
    // required this.dropdownValue,
    // required this.placeValue
  }) : super(key: key);
  // final String id1;
  // final String id2;
  // final String dropdownValue;
  // final String placeValue;
  @override
  State<WidgetDropDownButton> createState() => _WidgetDropDownButtonState();
}

class _WidgetDropDownButtonState extends State<WidgetDropDownButton> {
  @override
  void initState() {
    BlocProvider.of<IdBloc>(context).add(FetchRouteId());
    BlocProvider.of<IdBloc>(context).add(FetchSchemeId());
    dropValueNotifier = ValueNotifier(dlist.first.routeName!);
    dropSchemeValueNotifier = ValueNotifier(schemelist.first.code!);
    // TODO: implement initState
    super.initState();
  }

  late GetRouteModel getRouteModel;
  late GetSchemeIdModel getSchemeIdModel;

  List<Data> dlist = [
    Data(id: 0, routeName: "Route Id"),
  ];

  // late List<String> id3;
  // late List<Data> id4;
  List<SchemeData> schemelist = [
    SchemeData(id: 0, name: "Select scheme", code: "Select Scheme"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<IdBloc, IdState>(
      listener: (context, state) {
        getRouteModel = BlocProvider.of<IdBloc>(context).getRouteModel;
        getSchemeIdModel = BlocProvider.of<IdBloc>(context).getSchemeIdModel;
        dlist.addAll(getRouteModel.data!);
        schemelist.addAll(getSchemeIdModel.data!);
      },
      child: BlocBuilder<IdBloc, IdState>(builder: (context, state) {
        if (state is IdLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is IdError) {
          return RefreshIndicator(
            onRefresh: () async {
              return BlocProvider.of<IdBloc>(context).add(FetchRouteId());
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .9,
                // color: Colors.red,
                child: const Center(
                  child: Text("Oops something went wrong"),
                ),
              ),
            ),
          );
        }
        if (state is IdLoaded) {
          return Column(
            children: [
              Row(
                children: [
                  ValueListenableBuilder(
                      valueListenable: dropValueNotifier,
                      builder: (BuildContext context, String dropValue, _) {
                        return DropdownButton<String>(
                          value: dropValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            print(value);
                            print(dropValue);
                            dropValueNotifier.value = value!;

                            setState(() {
                              dropValue = value;
                              id1 = dlist
                                  .where((element) =>
                                      element.routeName!.contains(value))
                                  .toList();
                            });
                          },
                          items: dlist.map<DropdownMenuItem<String>>((value) {
                            print(value.routeName! +
                                "00000000000000000000000000000000000");
                            return DropdownMenuItem<String>(
                              value: value.routeName,
                              child: Text(value.routeName!),
                            );
                          }).toList(),
                        );
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueListenableBuilder(
                      valueListenable: dropSchemeValueNotifier,
                      builder: (BuildContext context, String schemeValue, _) {
                        return DropdownButton<String>(
                          value: schemeValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            print(value);
                            print(schemeValue);
                            dropSchemeValueNotifier.value = value!;
                            print(schemeValue);
                            print(dropSchemeValueNotifier.value);
                            setState(() {
                              schemeValue = value;
                              id2 = schemelist
                                  .where((element) =>
                                      element.code!.contains(value))
                                  .toList();
                            });
                          },
                          items:
                              schemelist.map<DropdownMenuItem<String>>((value) {
                            print(value.name! +
                                "00000000000000000000000000000000000");
                            return DropdownMenuItem<String>(
                              value: value.code,
                              child: Text(value.code!),
                            );
                          }).toList(),
                        );
                      }),
                  DropdownButton<String>(
                    value: placeValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (String? value) {
                      print(value);
                      // This is called when the user selects an item.
                      setState(() {
                        placeValue = value!;
                      });
                    },
                    items:
                        placelist.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
                onChanged: (String? value) {
                  print(value);
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items:
                    paymentlist.map<DropdownMenuItem<String>>((String valuee) {
                  return DropdownMenuItem<String>(
                    value: valuee,
                    child: Text(valuee),
                  );
                }).toList(),
              ),
            ],
          );
        } else {
          return Container();
        }
      }),
    );
  }
}

List<String> paymentlist = <String>['Select Payment', 'CASH', 'UPI'];
List<String> placelist = <String>['Select Place', 'KINFRA', 'U-CITY'];
String placeValue = placelist.first;
late ValueNotifier<String> dropValueNotifier;
late ValueNotifier<String> dropSchemeValueNotifier;
String dropdownValue = paymentlist.first;
late List<Data> id1;
late List<SchemeData> id2;
