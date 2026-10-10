
void main() {
  runApp(const StrategyGameApp());
}

class StrategyGameApp extends StatelessWidget {
  const StrategyGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String selectedCountry = "العراق";
  int gold = 1000;
  int army = 500;

  void actionAttack() {
    setState(() {
      gold -= 100;
      army -= 50;
    });
  }

  void actionRecruit() {
    setState(() {
      gold -= 200;
      army += 100;
    });
  }

  void actionTax() {
    setState(() {
      gold += 150;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blueGrey[900],
            child: Center(
              child: Text(
                "خريطة العالم: $selectedCountry",
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildResourceCard(Icons.monetization_on, "الذهب: $gold", Colors.amber),
                _buildResourceCard(Icons.shield, "الجيش: $army", Colors.redAccent),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(Icons.flag, "هجوم", actionAttack),
                _buildActionButton(Icons.person_add, "تجنيد", actionRecruit),
                _buildActionButton(Icons.account_balance, "جمع الضرائب", actionTax),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResourceCard(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 2),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String text, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(icon),
          const SizedBox(height: 5),
          Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
