import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String title;
  final String store;
  final double price;

  const ProductDetailsScreen({
    super.key,
    required this.title,
    required this.store,
    required this.price,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 1;
  final _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final totalPrice = widget.price * _quantity;

    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل الطلب المسبق')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF0D9488).withOpacity(0.08),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF0D9488).withOpacity(0.2)),
              ),
              child: const Center(
                child: Icon(
                  Icons.storefront_rounded,
                  size: 74,
                  color: Color(0xFF0D9488),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                  ),
                ),
                Text(
                  '${widget.price.toStringAsFixed(2)} \$',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D9488),
                  ),
                ),
              ],
            ),
            Text(
              widget.store,
              style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            const Text(
              'طريقة التنفيذ:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            const Text(
              'حجز وتحضير مسبق من المتجر. يتم تجهيز طلبك في الوقت المتفق عليه لتستلمه فوراً دون الحاجة لانتظار إعداده.',
              style: TextStyle(color: Color(0xFF334155), height: 1.5, fontSize: 13),
            ),
            const SizedBox(height: 20),
            const Text(
              'الكمية المطلوبة:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton.filledTonal(
                  onPressed: () {
                    if (_quantity > 1) setState(() => _quantity--);
                  },
                  icon: const Icon(Icons.remove),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    '$_quantity',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton.filledTonal(
                  onPressed: () => setState(() => _quantity++),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _notesController,
              decoration: InputDecoration(
                labelText: 'ملاحظات وتفضيلات إضافية للمتجر',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            context.read<AppProvider>().addOrder(
                  OrderItem(
                    id: 'DRB-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}',
                    title: widget.title,
                    store: widget.store,
                    price: totalPrice,
                    quantity: _quantity,
                    status: 'مؤكد وجارِ التجهيز',
                    date: 'اليوم',
                    time: 'الآن',
                    notes: _notesController.text,
                  ),
                );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Color(0xFF0D9488),
                content: Text('تم تأكيد حجز الطلب المسبق في درب بنجاح!'),
              ),
            );
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0D9488),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          child: Text(
            'تأكيد الطلب المسبق (${totalPrice.toStringAsFixed(2)} \$)',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
