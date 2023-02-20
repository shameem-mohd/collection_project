import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/repositary/bloc/CreateCustomer/create_customer_bloc.dart';
import 'package:project/ui/Widgets/DropButton.dart';
import 'package:project/ui/Widgets/TextfieldInput.dart';
import 'package:project/ui/home/GetCustomer.dart';

class CreateCustomer extends StatefulWidget {
  const CreateCustomer({Key? key}) : super(key: key);

  @override
  State<CreateCustomer> createState() => _CreateCustomerState();
}

class _CreateCustomerState extends State<CreateCustomer> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _guardianNameController = TextEditingController();
  final TextEditingController _houseNameController = TextEditingController();
  final TextEditingController _postController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    _guardianNameController.dispose();
    _houseNameController.dispose();
    _postController.dispose();
    _pinController.dispose();
    _landmarkController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CreateCustomerBloc, CreateCustomerState>(
          listener: (context, state) {
            if (state is CreateCustomerLoading) {
              // print("CreateCustomer loading");
            }
            if (state is CreateCustomerLoaded) {
              // BlocProvider.of<CreateCustomerBloc>(context)
              //     .add(FetchCreateCustomer());
              // print("CreateCustomer loaded");
            }
            if (state is CreateCustomerError) {
              // print("CreateCustomer Error");
            }
            // TODO: implement listener
          },
        ),
      ],
      child: Scaffold(
          resizeToAvoidBottomInset: false,

          // backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "Customer Registration",
              style: TextStyle(color: Colors.black),
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.white,
              systemNavigationBarColor: Colors.red,

              // Status bar brightness (optional)
              statusBarIconBrightness: Brightness.dark,
              // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
          ),
          body: SafeArea(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 24,
                ),
                // Flexible(
                //   child: Container(),
                //   flex: 2,
                // ),
                TextFieldInput(
                  textEditingController: _nameController,
                  hintText: "Enter your username",
                  textInputType: TextInputType.text,
                  labelText: "name",
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  textEditingController: _mobileController,
                  hintText: "Enter your mobile",
                  textInputType: TextInputType.text,
                  labelText: "mobile",
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  textEditingController: _guardianNameController,
                  hintText: "Enter your guardian name",
                  textInputType: TextInputType.text,
                  labelText: "guardian name",
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  textEditingController: _houseNameController,
                  hintText: "Enter your house name",
                  textInputType: TextInputType.text,
                  labelText: "house name",
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  textEditingController: _postController,
                  hintText: "Enter your post",
                  textInputType: TextInputType.text,
                  labelText: "post",
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  textEditingController: _pinController,
                  hintText: "Enter your pin",
                  textInputType: TextInputType.text,
                  labelText: "pin",
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  textEditingController: _landmarkController,
                  hintText: "Enter your landmark",
                  textInputType: TextInputType.text,
                  labelText: "landmark",
                ),
                // const SizedBox(
                //   height: 24,
                // ),
                const WidgetDropDownButton(),
                GestureDetector(
                  onTap: () {
                    // BlocProvider.of<CreateCustomerBloc>(context).add(
                    //     FetchCreateCustomer(
                    //         name: _nameController.text,
                    //         mobile: _mobileController.text,
                    //         guardianName: _guardianNameController.text,
                    //         houseName: _houseNameController.text,
                    //         post1: _postController.text,
                    //         pin: _pinController.text,
                    //         landmark: _landmarkController.text,
                    //         routeId: id1.first.id!.toString(),
                    //         schemeId: id2.first.id!.toString(),
                    //         placeId: placeValue,
                    //         paymentMethod: dropdownValue));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const GetCustomer()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: const ShapeDecoration(
                        color: Color(0xff264050),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4)))),
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
              ],
            ),
          ))),
    );
  }
}
