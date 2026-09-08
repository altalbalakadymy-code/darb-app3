import 'package:flutter/material.dart';
import '../../providers/app_provider.dart';

class OrderTrackingScreen extends StatelessWidget {
  final OrderItem order;

  const OrderTrackingScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final steps = [
      {'title': 'تم استلام الحجز', 'desc': 'وصل الطلب إلى المتجر وبانتظار التأكيد', 'done': order.step >= 0},
      {'title': 'قيد التجهيز والتحضير', 'desc': 'المتجر يجهز طلبك الآن بعناية', 'done': order.step >= 1},
      {'title': 'بانتظار وصولك للاستلام', 'desc': 'طلبك معبأ وجاهز في المتجر لاستلامه فوراً', 'done': order.step >= 2},
      {'title': 'تم الاستلام بنجاح', 'desc': 'شكراً لاستخدامك تطبيق درب', 'done': order.step >= 3},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('متابعة الطلب ${order.id}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('المتجر: ${order.store}', style: const TextStyle(color: Color(0xFF64748B))),
                    const Divider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('الكمية: ${order.quantity}', style: const TextStyle(color: Color(0xFF475569))),
                        Text('${order.price.toStringAsFixed(2)} \$',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0D9488))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('مراحل تجهيز الحجز', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: steps.length,
              itemBuilder: (context, index) {
                final st = steps[index];
                final isDone = st['done'] as bool;
                final isLast = index == steps.length - 1;

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: isDone ? const Color(0xFF0D9488) : const Color(0xFFE2E8F0),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isDone ? Icons.check : Icons.circle,
                            size: 14,
                            color: isDone ? Colors.white : const Color(0xFF94A3B8),
                          ),
                        ),
                        if (!isLast)
                          Container(
                            width: 2,
                            height: 40,
                            color: isDone ? const Color(0xFF0D9488) : const Color(0xFFE2E8F0),
                          ),
                      ],
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(st['title'] as String,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: isDone ? const Color(0xFF0F172A) : const Color(0xFF94A3B8))),
                          Text(st['desc'] as String,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: isDone ? const Color(0xFF64748B) : const Color(0xFFCBD5E1))),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
