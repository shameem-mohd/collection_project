import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/GetCustomerModel.dart';
import 'package:project/repositary/bloc/CreateCustomer/create_customer_bloc.dart';
import 'package:project/ui/home/CollectionPayment.dart';

class GetCustomer extends StatefulWidget {
  const GetCustomer({Key? key}) : super(key: key);

  @override
  State<GetCustomer> createState() => _GetCustomerState();
}

class _GetCustomerState extends State<GetCustomer> {
  @override
  void initState() {
    BlocProvider.of<CreateCustomerBloc>(context).add(FetchGetCustomer());
    // TODO: implement initState
    super.initState();
  }

  late GetCustomerModel getCustomerModel;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<CreateCustomerBloc, CreateCustomerState>(
            builder: (context, state) {
          if (state is CreateCustomerLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CreateCustomerError) {
            return RefreshIndicator(
              onRefresh: () async {
                return BlocProvider.of<CreateCustomerBloc>(context)
                    .add(FetchGetCustomer());
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
          if (state is CreateCustomerLoaded) {
            getCustomerModel =
                BlocProvider.of<CreateCustomerBloc>(context).getCustomerModel;
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => CollectionPayment(
                                  name: getCustomerModel.data![index].name!)));
                    },
                    child: Card(
                        child: SizedBox(
                            height: mHeight * .15,
                            width: mWidth * .4,
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.idyllwildarts.org%2Fwp-content%2Fuploads%2F2016%2F09%2Fblank-profile-picture.jpg&f=1&nofb=1&ipt=169ff180dc972ed87c5764e6d381e72396a5e38e47f76954ab66cf3f8952cdbb&ipo=images"),
                                ),
                                SizedBox(
                                  height: mHeight * .1,
                                  width: mWidth * .5,
                                  // color: Colors.red,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "Name: ",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            getCustomerModel.data![index].name
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Phone: ",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            getCustomerModel.data![index].mobile
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Place: ",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            getCustomerModel.data![index].town
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: getCustomerModel.data!.length);
          } else {
            return Container();
          }
        }));
  }
}
