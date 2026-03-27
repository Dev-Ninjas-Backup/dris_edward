import 'package:dris_edward/core/common/constants/imagepath.dart';
import 'package:dris_edward/features/order_details/model/order_detail_model.dart';
import 'package:get/get.dart';

class OrderDetailController extends GetxController {
  Rx<OrderDetail> orderDetail = OrderDetail(
    restaurantName: "McDonald's",
    restaurantImage: 'assets/images/mcdonalds.png',
    date: 'Mar 12, 2026',
    time: '2:30 PM',
    price: '\$23.49',
    orderId: '#ORD-2026-0312',
    deliveryImage: Imagepath.orderDetailsImage,
    driverName: 'Naim Almas',
    driverImage: 'assets/images/driver_profile.png',
    driverStatus: 'On The Way',
    subtotal: '\$60.00',
    deliveryFee: '\$10',
    serviceFee: '\$20',
    total: '\$90',
  ).obs;
}
