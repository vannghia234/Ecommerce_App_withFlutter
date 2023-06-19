// import 'package:ecommerce_app/controller/get_cart_user_controller.dart';
// import 'package:ecommerce_app/screens/product-detail/components/rounded-iconBtn.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class NumOfItemButton extends StatefulWidget {
//   const NumOfItemButton({
//     super.key,
//   });

//   @override
//   State<NumOfItemButton> createState() => _NumOfItemButtonState();
// }

// class _NumOfItemButtonState extends State<NumOfItemButton> {
//   var controller = Get.find<GetCartUserController>();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   int numofcount = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Spacer(),
//         RoundedIconBtn(
//           icon: Icons.remove,
//           press: () {
//             controller.decreItem();
//           },
//         ),
//         const SizedBox(
//           width: 15,
//         ),
//         Obx(
//           () => Text(
//             'x ${controller.numOfItem}',
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//         ),
//         const SizedBox(
//           width: 15,
//         ),
//         RoundedIconBtn(
//           icon: Icons.add,
//           press: () {
//             controller.increItem();
//           },
//         ),
//       ],
//     );
//   }
// }
