// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:payment_api_crud/get_items_screen.dart';
// import 'package:payment_api_crud/payment_details.dart';
//
// import 'mixin_class_for_ui.dart';
//
// class UpdateScreen extends StatefulWidget {
//   String id;
//   String name;
//   String description;
//   String amount;
//   String currency;
//   UpdateScreen({super.key,required this.id,required this.name,required this.description,required this.amount,required this.currency});
//
//   @override
//   State<UpdateScreen> createState() => _UpdateScreenState();
// }
//
// class _UpdateScreenState extends State<UpdateScreen> with ShowTextField{
//   var nameController = TextEditingController();
//   var descriptionController = TextEditingController();
//   var amountController = TextEditingController();
//   var currencyController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     nameController = TextEditingController(text: widget.name);
//     descriptionController = TextEditingController(text: widget.description);
//     amountController = TextEditingController(text: widget.amount);
//     currencyController = TextEditingController(text: widget.currency);
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey,
//         title: Center(
//           child:Text("Update Users"),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             textFieldView("Name", nameController),
//             textFieldView("Description", descriptionController),
//             textFieldView("Amount", amountController),
//             textFieldView("Currency", currencyController),
//             buttonView("Update", onPressed: (){
//               PaymentDetails().createUpdateMethod(nameController.text,
//                   descriptionController.text,
//                   widget.id,
//                   currencyController.text,
//                   int.parse(amountController.text));
//               Get.back(result: AddUsersScreen());
//             })
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

import 'api_service_screen.dart';

class UpdateScreen extends StatefulWidget {
  String name;
  String description;
  String amount;
  String currency;
  String id;
  UpdateScreen({super.key,required this.name, required this.description, required this.amount, required this.currency, required this.id});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var amountController = TextEditingController();
  var currencyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("UpDate Screen"),
     ),
      body: Column(
        children: [
          TextField(controller: nameController,
            decoration: InputDecoration(hintText: "name",border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),),
          TextField(controller: descriptionController,
            decoration: InputDecoration(hintText: "description",border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),),
          TextField(controller: amountController,
            decoration: InputDecoration(hintText: "amount",border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),),
          TextField(controller: currencyController,
            decoration: InputDecoration(hintText: "currency",border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),),
          SizedBox(
            height: 30,
          ),
          MaterialButton(onPressed: (){
            Navigator.pop(context);
            ItemsServiceApi().upDate(
              nameController.text,
              descriptionController.text,
              int.parse(amountController.text),
              currencyController.text,
                widget.id
            );
          },child: Text("UpDate"),)
        ],
      ),
    );
  }
}
