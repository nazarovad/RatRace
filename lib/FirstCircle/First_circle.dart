import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ratrace/FirstCircle/DataPlayer.dart';
import 'package:ratrace/slidingclippednavbar/sliding_clipped_nav_bar.dart';

class FirstCircle extends StatefulWidget {
  const FirstCircle({super.key});

  @override
  State<FirstCircle> createState() => _FirstCircleState();
}

class _FirstCircleState extends State<FirstCircle> {
  final DataPlayer dataPlayer = DataPlayer('Учитель');
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  final double heightRightLine = 30;
  double widthRightLine = double.maxFinite;
  int timing = 250;
  double positionRight = 1;
  bool checkPosition = true;
  double widthAnimateCont = 170;
  double maxWidth = 1.0;
  bool _visible = true;
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
    WidgetsBinding.instance.addPostFrameCallback((_) {

      _getScreenSize();

    });
  }

  void _getScreenSize() {
    final Size size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Внутренний круг')),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Container(alignment: Alignment.center,
            child: const Icon(
              Icons.money_off_outlined,
              size: 56,
              color: Color.fromRGBO(255, 100, 0, 1),
            ),
          ),
          Container(alignment: Alignment.center,
            child: const Icon(
              Icons.wallet_outlined,
              size: 56,
              color: Color.fromRGBO(3, 247, 211, 1),
            ),
          ),
          Container(
            child: Column(
              children: [
                _buildChartContainer(),
                _buildReportButtons(),
              ],
            ),
          ),
          Container(alignment: Alignment.center,
            child: const Icon(
              Icons.apartment_outlined,
              size: 56,
              color: Color.fromRGBO(172, 251, 2, 1),
            ),
          ),
          Container(alignment: Alignment.center,
            child: const Icon(
              Icons.trending_up_outlined,
              size: 56,
              color: Color.fromRGBO(241, 39, 99, 1),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar.colorful(
        backgroundColor: Color.fromRGBO(28, 33, 53, 1),
        onButtonPressed: changePage,
        iconSize: 30,
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            title: "Расходы",
            icon: Icons.money_off_outlined,
            activeColor: Color.fromRGBO(255, 100, 0, 1),
            inactiveColor: Color.fromRGBO(255, 100, 0, 0.3),
          ),
          BarItem(
              title: "Активы",
              icon: Icons.wallet_outlined,
              activeColor: Color.fromRGBO(3, 247, 211, 1),
              inactiveColor: Color.fromRGBO(3, 247, 211, 0.3)
          ),
          BarItem(
              title: "Главная",
              icon: Icons.home_outlined,
              activeColor: Color.fromRGBO(195, 26, 237, 1),
              inactiveColor: Color.fromRGBO(195, 26, 237, 0.3)
          ),
          BarItem(
            title: "Пассивы",
            icon: Icons.apartment_outlined,
            activeColor: Color.fromRGBO(172, 251, 2, 1),
            inactiveColor: Color.fromRGBO(172, 251, 2, 0.3),
          ),
          BarItem(
              title: "Рынок",
              icon: Icons.trending_up_outlined,
              activeColor: Color.fromRGBO(241, 39, 99, 1),
              inactiveColor: Color.fromRGBO(241, 39, 99, 0.3)
          ),
        ],
      ),
    );
  }

  Widget _buildChartContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
      ),
      margin: const EdgeInsets.all(20),
      height: 200,
      width: MediaQuery.of(context).size.width / 0.5,
      padding: const EdgeInsets.all(15),
      child: Stack(
        children: <Widget>[
          _buildAnimatedChart(),
          _buildRightPanel(),
        ],
      ),
    );
  }

  Widget _buildAnimatedChart() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: timing),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: 154,
        height: 154,
        child: Stack(
          children: <Widget>[
            _buildCircularPercentIndicator(70, 0.8, const Color.fromRGBO(241, 39, 99, 1)),
            _buildCircularPercentIndicator(60, 0.6, const Color.fromRGBO(172, 251, 2, 1)),
            _buildCircularPercentIndicator(50, 0.4, const Color.fromRGBO(3, 247, 211, 1)),
            _buildCircularPercentIndicator(40, 0.2, const Color.fromRGBO(255, 100, 0, 1)),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularPercentIndicator(double radius, double percent, Color progressColor) {
    return Align(
      child: CircularPercentIndicator(
        radius: radius,
        lineWidth: 7,
        percent: percent,
        animation: true,
        animationDuration: 2000,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: progressColor,
        backgroundColor: progressColor.withOpacity(0.3),
      ),
    );
  }

  Widget _buildRightPanel() {
    return AnimatedAlign(
      alignment: const AlignmentDirectional(1, 0),
      duration: Duration(milliseconds: timing),
      curve: Curves.easeInOutQuint,
      child: GestureDetector(
        onTap: () {
          setState(() {
            widthAnimateCont = checkPosition ? MediaQuery.of(context).size.width : 170;
            _visible = !checkPosition;
            checkPosition = !checkPosition;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: timing),
          width: widthAnimateCont,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _buildDataRows(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDataRows() {
    final List<Map<String, String>> dataRows = [
      {"title": "Пассивный доход", "value": "15 000 000", "color": "F12763"},
      {"title": "Общий доход", "value": "15 000 000", "color": "ACFB02"},
      {"title": "Общие расходы", "value": "15 000 000", "color": "03f7d3"},
      {"title": "Денежный поток", "value": "15 000 000", "color": "ff6400"},
    ];

    return dataRows.map((data) {
      return _buildDataRow(data['title']!, data['value']!, data['color']!);
    }).toList();
  }

// Функция для преобразования строки HEX в Color
  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor; // Добавляем непрозрачность, если отсутствует
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  Widget _buildDataRow(String title, String value, String colorHex) {
    final Color color = _getColorFromHex(colorHex);

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color, // Используем цвет из dataRows
          ),
          height: heightRightLine,
          width: widthRightLine,
          child: Align(
            alignment: AlignmentDirectional(-1, 0),
            child: Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(1, 0),
          child: Container(
            padding: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color, // Используем цвет из dataRows
            ),
            height: heightRightLine,
            width: 170,
            child: Align(
              alignment: AlignmentDirectional(1, 0),
              child: Text(value, style: const TextStyle(color: Colors.black, fontSize: 15)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReportButtons() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildReportHeader("Отчет о доходах"),
          _buildIncomeReport(),
          _buildReportHeader("Балансовый отчет"),
          _buildBalanceReport(),
        ],
      ),
    );
  }

  Widget _buildReportHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Align(
        alignment: AlignmentDirectional(-1, 0),
        child: Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _buildIncomeReport() {
    return Row(
      children: [
        _buildReportCard("1512", "Ден. поток"),
        _buildReportCard("1512", "Доходы"),
      ],
    );
  }

  Widget _buildBalanceReport() {
    return Row(
      children: [
        _buildReportCard("1512", "Доходы"),
        _buildReportCard("1512", "Расходы"),
      ],
    );
  }

  Widget _buildReportCard(String value, String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 5, top: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional(-0.7, 0),
                  child: Text(value, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w800)),
                ),
                Align(
                  alignment: AlignmentDirectional(0.7, 0),
                  child: Text(label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: Duration(milliseconds: timing), curve: Curves.easeOutQuad);
  }


}

