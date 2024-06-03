// //
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:payment_api_crud/mixin_class_for_ui.dart';
// import 'package:payment_api_crud/payment_details.dart';
//
// import 'get_items_screen.dart';
//
// class PostScreen extends StatefulWidget {
//   const PostScreen({super.key});
//
//   @override
//   State<PostScreen> createState() => _PostScreenState();
// }
//
// class _PostScreenState extends State<PostScreen> with ShowTextField {
//   var nameController = TextEditingController();
//   var descriptionController = TextEditingController();
//   var amountController = TextEditingController();
//   var currencyController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blueGrey,
//           title: Center(
//             child:Text("Post Users"),
//           ),
//         ),
//         body: GetBuilder(
//             init: PaymentDetails(),
//             builder: (data){
//               return Center(
//                 child:Column(
//                   children: [
//                     textFieldView("Name", nameController),
//                     textFieldView("Description", descriptionController),
//                     textFieldView("Amount", amountController),
//                     textFieldView("Currency", currencyController),
//                     buttonView("Post Users", onPressed: (){
//                       data.createPostMethod(nameController.text,
//                           descriptionController.text,
//                           int.parse(amountController.text,) ,
//                           currencyController.text);
//                       Get.to(AddUsersScreen());
//
//                     })
//                   ],
//                 ),
//               );
//             })
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'api_service_screen.dart';
import 'get_items.dart';

class PostItems extends StatefulWidget {
  const PostItems({super.key});

  @override
  State<PostItems> createState() => _PostItemsState();
}

class _PostItemsState extends State<PostItems> {
  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var amountController = TextEditingController();
  var currencyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Items"),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: "Name"),),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(hintText: "Description"),),
          TextField(
            controller: amountController,
            decoration: InputDecoration(hintText: "Amount"),),
          TextField(
            controller:currencyController ,
            decoration: InputDecoration(hintText: "Currency"),),
          SizedBox(height: 30,),

          MaterialButton(onPressed: (){
            ItemsServiceApi().postItems(
              nameController.text,
              descriptionController.text,
              int.parse(amountController.text),
              currencyController.text
            );
            Navigator.push(context, MaterialPageRoute(builder: (context) => GetItems(),));
          },child: Text("Post Data"),)
        ],
      ),
    );
  }
}
