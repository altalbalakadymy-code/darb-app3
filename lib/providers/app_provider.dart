import 'package:flutter/foundation.dart';

class StoreItem {
  final String id;
  final String name;
  final String category;
  final double rating;
  final String distance;
  final String prepTime;
  final String imageType;

  StoreItem({
    required this.id,
    required this.name,
    required this.category,
    required this.rating,
    required this.distance,
    required this.prepTime,
    required this.imageType,
  });
}

class ProductItem {
  final String id;
  final String name;
  final String storeName;
  final double price;
  final String description;
  final String category;

  ProductItem({
    required this.id,
    required this.name,
    required this.storeName,
    required this.price,
    required this.description,
    required this.category,
  });
}

class OrderItem {
  final String id;
  final String title;
  final String store;
  final double price;
  final int quantity;
  final String status;
  final String date;
  final String time;
  final String notes;
  final int step; // 0: تم الاستلام, 1: قيد التحضير, 2: بانتظار وصولك, 3: تم الاستلام

  OrderItem({
    required this.id,
    required this.title,
    required this.store,
    required this.price,
    required this.quantity,
    required this.status,
    required this.date,
    required this.time,
    this.notes = '',
    this.step = 1,
  });
}

class ChatMessage {
  final String text;
  final String time;
  final bool isMe;

  ChatMessage({
    required this.text,
    required this.time,
    required this.isMe,
  });
}

class AppProvider with ChangeNotifier {
  int _currentNavIndex = 0;
  int get currentNavIndex => _currentNavIndex;

  void setNavIndex(int index) {
    _currentNavIndex = index;
    notifyListeners();
  }

  // بيانات المستخدم
  String userName = "هيمو البرمجي";
  String userEmail = "hemo@darb.app";
  String userPhone = "+967 770 000 000";

  void updateUserProfile(String name, String email, String phone) {
    userName = name;
    userEmail = email;
    userPhone = phone;
    notifyListeners();
  }

  // المتاجر
  final List<StoreItem> _stores = [
    StoreItem(
      id: 'S1',
      name: 'برجر درب هاوس',
      category: 'وجبات سريعة',
      rating: 4.8,
      distance: '1.2 كم',
      prepTime: '15-20 دقيقة',
      imageType: 'burger',
    ),
    StoreItem(
      id: 'S2',
      name: 'درب كافيه رويال',
      category: 'كافيهات ومشروبات',
      rating: 4.9,
      distance: '0.8 كم',
      prepTime: '10 دقائق',
      imageType: 'coffee',
    ),
    StoreItem(
      id: 'S3',
      name: 'مخبوزات البستان الذهبي',
      category: 'مخابز ومعجنات',
      rating: 4.7,
      distance: '2.5 كم',
      prepTime: '25 دقيقة',
      imageType: 'bakery',
    ),
    StoreItem(
      id: 'S4',
      name: 'بيتزا فينيسيا الإيطالية',
      category: 'مطاعم وسريعة',
      rating: 4.6,
      distance: '3.1 كم',
      prepTime: '20-30 دقيقة',
      imageType: 'pizza',
    ),
  ];

  List<StoreItem> get stores => _stores;

  // المنتجات
  final List<ProductItem> _products = [
    ProductItem(
      id: 'P1',
      name: 'برجر دبل تشيز الفاخر',
      storeName: 'برجر درب هاوس',
      price: 8.50,
      description: 'شريحتان من اللحم البقري الطازج مع جبنة شيدر صوص درب الخاص.',
      category: 'مطاعم وسريعة',
    ),
    ProductItem(
      id: 'P2',
      name: 'سبانش كولد لاتيه',
      storeName: 'درب كافيه رويال',
      price: 4.20,
      description: 'مزيج الإسبريسو الغني مع الحليب المكثف والثلج المنعش.',
      category: 'كافيهات ومشروبات',
    ),
    ProductItem(
      id: 'P3',
      name: 'بيتزا ببروني مقرمشة',
      storeName: 'بيتزا فينيسيا الإيطالية',
      price: 11.00,
      description: 'عجينة إيطالية أصلية مع صلصة الطماطم وجبن الموزاريلا والببروني.',
      category: 'مطاعم وسريعة',
    ),
    ProductItem(
      id: 'P4',
      name: 'بوكس معجنات الصباح',
      storeName: 'مخبوزات البستان الذهبي',
      price: 6.00,
      description: 'تشكيلة طازجة من الكرواسون والفطائر المخبوزة يومياً.',
      category: 'مخابز ومعجنات',
    ),
  ];

  List<ProductItem> get products => _products;

  // الطلبات والحجوزات
  final List<OrderItem> _orders = [
    OrderItem(
      id: 'DRB-7821',
      title: 'برجر دبل تشيز الفاخر',
      store: 'برجر درب هاوس',
      price: 8.50,
      quantity: 1,
      status: 'قيد التجهيز في المتجر',
      date: 'اليوم',
      time: '01:30 م',
      notes: 'بدون مخلل مع إضافة صوص',
      step: 1,
    ),
    OrderItem(
      id: 'DRB-6540',
      title: 'سبانش كولد لاتيه',
      store: 'درب كافيه رويال',
      price: 8.40,
      quantity: 2,
      status: 'بانتظار وصولك للاستلام',
      date: 'اليوم',
      time: '11:15 ص',
      notes: 'حليب قليل الدسم',
      step: 2,
    ),
  ];

  List<OrderItem> get orders => _orders;

  void addOrder(OrderItem order) {
    _orders.insert(0, order);
    notifyListeners();
  }

  // المحادثات المباشرة
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: 'مرحباً بك في خدمة عملاء درب! طلبك رقم DRB-7821 قيد التحضير وسيكون جاهزاً في الموعد.',
      time: '01:10 م',
      isMe: false,
    ),
    ChatMessage(
      text: 'شكراً لكم، سأصل للاستلام بعد 15 دقيقة.',
      time: '01:12 م',
      isMe: true,
    ),
    ChatMessage(
      text: 'على الرحب والسعة، بانتظارك فور وصولك لاستلام طلبك مباشرة!',
      time: '01:13 م',
      isMe: false,
    ),
  ];

  List<ChatMessage> get messages => _messages;

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;
    _messages.add(
      ChatMessage(
        text: text,
        time: 'الآن',
        isMe: true,
      ),
    );
    notifyListeners();
  }
}
