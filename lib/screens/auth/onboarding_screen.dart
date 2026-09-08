import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'احجز طلبك مسبقاً',
      'desc': 'اختر ما يناسبك من مئات المتاجر والمطاعم والكافيهات وحدد وقت استلامك بكل مرونة.',
      'icon': Icons.restaurant_menu_rounded,
    },
    {
      'title': 'تواصل مباشر مع المتجر',
      'desc': 'دردشة حية ومباشرة مع المتجر لتخصيص طلبك ومتابعة تجهيزه لحظة بلحظة.',
      'icon': Icons.forum_rounded,
    },
    {
      'title': 'استلم فوراً دون انتظار',
      'desc': 'صل في الوقت المحدد وتفادى طوابير الانتظار، طلبك سيكون جاهزاً بانتظارك.',
      'icon': Icons.electric_bolt_rounded,
    },
  ];

  void _finish() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: _finish,
            child: const Text('تخطي', style: TextStyle(color: Color(0xFF64748B), fontSize: 14)),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (i) => setState(() => _currentIndex = i),
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            color: const Color(0xFF0D9488).withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(page['icon'] as IconData, size: 68, color: const Color(0xFF0D9488)),
                        ),
                        const SizedBox(height: 36),
                        Text(
                          page['title'] as String,
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          page['desc'] as String,
                          style: const TextStyle(fontSize: 14, color: Color(0xFF64748B), height: 1.6),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentIndex == i ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == i ? const Color(0xFF0D9488) : const Color(0xFFCBD5E1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_currentIndex < _pages.length - 1) {
                    _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  } else {
                    _finish();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D9488),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(
                  _currentIndex == _pages.length - 1 ? 'ابدأ الاستخدام' : 'التالي',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
