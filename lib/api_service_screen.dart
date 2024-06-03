
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import 'items_modal_screen.dart';


class ItemsServiceApi {
  postItems(
      String name,
      String description,
      int amount,
      String currency
      )async{
    var apiUri = Uri.parse("https://api.razorpay.com/v1/items");
    var headers = {
      "Authorization": 'Basic ${base64Encode(
        utf8.encode(
            '${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
      )}',
      "Content-Type": "application/json",
    };
    var responce = await http.post(apiUri,headers: headers,body: json.encode({
      "name":name,
      "description": description,
      "amount": amount,
      "currency":currency

    }));
    if(responce.statusCode == 200){
      print("Success");
      Fluttertoast.showToast(
        msg: "Order created successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }else {
      print("Failed with status: ${responce.statusCode}");
      Fluttertoast.showToast(
        msg: "Failed to create order: ${responce.reasonPhrase}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
  Future<ItemsApiModal> getItems()async{
    var apiUri = Uri.parse("https://api.razorpay.com/v1/items");
    var headers = {
      "Authorization": 'Basic ${base64Encode(
        utf8.encode(
            '${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
      )}',
      "Content-Type": "application/json",
    };
    var responce = await http.get(apiUri,headers: headers);
    if(responce.statusCode==200){
      var decode = jsonDecode(responce.body);
      var data = ItemsApiModal.fromJson(decode);
      return data;
    }else{
      return ItemsApiModal();
    }

  }
  upDate(String name, String discription, int amount, String currency, String id)async{
    var headers = {
      "Authorization": 'Basic ${base64Encode(
        utf8.encode(
            '${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
      )}',
    };
    var response = await http.put(Uri.parse("https://api.razorpay.com/v1/items/$id"),
    headers: headers,
    body: json.encode({
      "name":name,
      "discription":discription,
      "amount":amount,
      "currency":currency
    }));
    if(response.statusCode == 200){
      print(response.statusCode);
    }
  }

  Future<void> deleteData(String id) async {
    var  apiUrl = Uri.parse("https://api.razorpay.com/v1/items/$id");
    var headers={
      "Authorization": 'Basic ${base64Encode(
        utf8.encode('${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
      )}',
      "Content-Type": "application/json",
    };

    var response = await http.delete(apiUrl,headers: headers);

    if (response.statusCode == 200) {
      print('Item deleted successfully');
    }else{
      print("Item not deleted");
    }
  }
}













// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
//
// import 'items_modal_screen.dart';
//
// class ItemsServiceApi{
//   postItems(String name, String description,int amount, String currency)async{
//     var headers = {
//       "Authorization": 'Basic ${base64Encode(
//         utf8.encode(
//             '${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
//       )}',
//
//     };
//   var response = await http.post(Uri.parse("https://api.razorpay.com/v1/items"),
//       headers: headers,
//       body: json.encode({"name":name,"description":description,"amount":amount,"currency":currency})
//   );
//   if(response.statusCode == 200){
//     Fluttertoast.showToast(
//       msg: "Items created successfully",
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       textColor: Colors.white,
//       fontSize: 16.0,
//     );
//   }
//   else{
//     Fluttertoast.showToast(
//       msg: "An error occurred",
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       fontSize: 16.0,
//     );
//   }
//   }
//
//  Future<ItemsApiModal>getItems()async{
//     var headers = {
//       "Authorization": 'Basic ${base64Encode(
//         utf8.encode(
//             '${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
//       )}',
//
//     };
//     var response = await http.get(Uri.parse("https://api.razorpay.com/v1/items"),
//       headers: headers
//     );
//     if(response.statusCode == 200){
//       var data = jsonDecode(response.body);
//       var convert = ItemsApiModal.fromJson(data);
//       return convert;
//     }
//     else{
//       return ItemsApiModal();
//     }
//   }
//   upDate(String name, String discription, int amount, String currency, String id)async{
//     var headers = {
//       "Authorization": 'Basic ${base64Encode(
//         utf8.encode(
//             '${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
//       )}',
//     };
//     var response = await http.put(Uri.parse("https://api.razorpay.com/v1/items/$id"),
//     headers: headers,
//     body: json.encode({
//       "name":name,
//       "discription":discription,
//       "amount":amount,
//       "currency":currency
//     }));
//     if(response.statusCode == 200){
//       print(response.statusCode);
//     }
//   }
// }