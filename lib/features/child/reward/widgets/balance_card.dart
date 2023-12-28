import 'package:flutter/material.dart';

class BalanceCard extends StatefulWidget {
  final int amount;

  const BalanceCard({
    super.key,
    required this.amount,
  });

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool _expanded = false;

  void _toggleExpansions() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpansions,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: _expanded ? 10.5/10*(164) : 164,
          width: _expanded ? 10.5/10*(MediaQuery.of(context).size.width - 2*24) : MediaQuery.of(context).size.width - 2*24,
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            gradient: RadialGradient(
              center: Alignment.topLeft,
              radius: 1.4,
              colors: [
                Color(0xFFFFEEC3),
                Color(0xFFFFB6C1),
                Color.fromARGB(100, 247, 136, 191)
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Jumlah Tabunganmu",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 12,
                        color: Color.fromARGB(127, 255, 255, 255),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.circle,
                        size: 12,
                        color: Color.fromARGB(127, 255, 255, 255),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.circle,
                        size: 12,
                        color: Color.fromARGB(127, 255, 255, 255),
                      ),
                    ],
                  )
                ],
              ),
              Text(
                "${widget.amount} Koin",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
              Text(
                "tetap semangat dan selalu disiplin ya",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
