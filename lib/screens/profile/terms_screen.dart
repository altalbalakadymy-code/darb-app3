import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الشروط والأحكام')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Text(
          '''شروط وأحكام منصة دَربْ:

1. طبيعة الخدمة:
منصة درب توفر للمستخدمين إمكانية استعراض المتاجر، طلب المنتجات مسبقاً، والتواصل المباشر مع أصحاب المتاجر للاستلام المباشر.

2. الحجز المسبق:
يلتزم المستخدم بالوصول في الوقت المحدد للاستلام لضمان جودة الأطعمة والمشروبات الساخنة والباردة.

3. التواصل والدردشة:
يتم استخدام الدردشة حصراً للاستفسارات المتعلقة بالطلبات والمنتجات مع الالتزام بالاحترام المتبادل.

4. إلغاء الطلبات:
يمكن إلغاء الطلب والتواصل مع المتجر قبل بدء عملية التحضير الفعلية داخل المتجر.''',
          style: TextStyle(fontSize: 14, color: Color(0xFF334155), height: 1.8),
        ),
      ),
    );
  }
}
