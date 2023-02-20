import 'package:flutter/material.dart';
import 'package:project/ui/Widgets/DropButton.dart';
import 'package:project/ui/Widgets/TextfieldInput.dart';

class CollectionPayment extends StatefulWidget {
  const CollectionPayment({Key? key, required this.name}) : super(key: key);
  final name;
  @override
  State<CollectionPayment> createState() => _CollectionPaymentState();
}

class _CollectionPaymentState extends State<CollectionPayment> {
  final TextEditingController _customerIdController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Collection Payment",
            style: TextStyle(color: Colors.black),
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
              Container(
                height: 50,
                child: TextFormField(
                    enabled: false,
                    controller: _customerIdController,
                    decoration: InputDecoration(
                      hintText: widget.name,
                      border: inputBorder,
                      focusedBorder: inputBorder,
                      enabledBorder: inputBorder,
                      filled: true,
                      // labelText: 'Mobile No',
                    )),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _amountController,
                hintText: "amount",
                textInputType: TextInputType.text,
                labelText: "amount",
              ),
              const SizedBox(
                height: 24,
              ),
              const WidgetDropDownButton(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .4,
              ),
              GestureDetector(
                onTap: () {
                  // BlocProvider.of<CreateCollectionBloc>(context).add(
                  //     FetchCreateCollection(customerId: '', amount: '', routeId: '', placeId: '', schemeId: '', pin: '', paymentMethod: ''
                  //     ));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (ctx) => const GetCustomer()));
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: const ShapeDecoration(
                      color: Color(0xff264050),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)))),
                  child: const Text(
                    "Create Collection",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
