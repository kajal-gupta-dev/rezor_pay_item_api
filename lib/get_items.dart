//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:payment_api_crud/payment_details.dart';
// import 'package:payment_api_crud/payment_modal_class.dart';
// import 'package:payment_api_crud/update_screen.dart';
// import 'package:rezor_pay_item_api/update_items.dart';
//
// import 'api_service_screen.dart';
//
// class AddUsersScreen extends StatefulWidget {
//   const AddUsersScreen({super.key});
//
//   @override
//   State<AddUsersScreen> createState() => _AddUsersScreenState();
// }
//
// class _AddUsersScreenState extends State<AddUsersScreen> {
//   var data = Get.put(PaymentDetails());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: RefreshIndicator(
//           child:  FutureBuilder(
//                   future: payment.createGetMethod(),
//                   builder: (context, snapshot) {
//                     var data = snapshot.data?.items;
//                     return ListView.builder(
//                       itemCount: data?.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "${data?[index].name}",
//                                       style:
//                                       TextStyle(fontWeight: FontWeight.bold),
//                                     ),
//                                     Text("${data?[index].description}"),
//                                     Text("${data?[index].amount}"),
//                                     Text("${data?[index].currency}"),
//                                   ],
//                                 ),
//                               ),
//                               Column(
//                                 children: [
//                                   IconButton(
//                                       onPressed: () {
//                                         Navigator.push(context, MaterialPageRoute(builder: (context) =>UpdateScreen(id: "${data?[index].id}",
//                                           name:"${data?[index].name}",
//                                           description:"${data?[index].description}",
//                                           amount:"${data?[index].amount}",
//                                           currency:"${data?[index].currency}",)
//                                         ));
//
//                                       }, icon: Icon(Icons.edit)),
//                                   IconButton(
//                                       onPressed: () {
//                                         PaymentDetails().deleteData("${data?[index].id}");
//                                       },
//                                       icon: Icon(Icons.delete)),
//                                 ],
//                               )
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 );
//               }),
//           onRefresh: (){
//             return data.createGetMethod();
//           }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:rezor_pay_item_api/update_items.dart';

import 'api_service_screen.dart';

class GetItems extends StatefulWidget {
  const GetItems({super.key});

  @override
  State<GetItems> createState() => _GetItemsState();
}

class _GetItemsState extends State<GetItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get Items"),
        ),
        body: FutureBuilder(
            future: ItemsServiceApi().getItems(),
            builder: (context, snapshot) {
              var data = snapshot.data?.items;
              return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("${data?[index].name.toString}"),
                              Text("${data?[index].description.toString()}"),
                              Text("${data?[index].amount.toString()}"),
                              Text("${data?[index].currency.toString()}"),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UpdateScreen(
                                            name: "${data?[index].name}",
                                            description:
                                                "${data?[index].description}",
                                          amount: "${data?[index].amount}",
                                            currency:
                                                "${data?[index].currency}",
                                            id: "${data?[index].id}",
                                          ),
                                        ));
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.delete)),
                            ],
                          )
                        ]),
                  );
                },
              );
            }));
  }
}
