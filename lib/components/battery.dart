import 'dart:async';
import 'package:flutter/material.dart';
import 'package:battery/battery.dart';
 

class BatteryLevel extends StatefulWidget {
  const BatteryLevel({super.key});

  @override
  _BatteryLevelState createState() => _BatteryLevelState();
}

class _BatteryLevelState extends State<BatteryLevel> {
  final battery = Battery();
  int batteryLevel = 100;
  BatteryState batteryState = BatteryState.full;

  late Timer timer;
  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();

    listenBatteryLevel();
    listenBatteryState();
  }

  void listenBatteryState() =>
      subscription = battery.onBatteryStateChanged.listen(
        (batteryState) => setState(() => this.batteryState = batteryState),
      );

  void listenBatteryLevel() {
    updateBatteryLevel();

    timer = Timer.periodic(
      const Duration(seconds: 10),
      (_) async => updateBatteryLevel(),
    );
  }

  Future updateBatteryLevel() async {
    final batteryLevel = await battery.batteryLevel;

    setState(() => this.batteryLevel = batteryLevel);
  }

  @override
  void dispose() {
    timer.cancel();
    subscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildBatteryState(batteryState),
              const SizedBox(height: 32),
              buildBatteryLevel(batteryLevel),
            ],
          ),
        ),
      );

  Widget buildBatteryState(BatteryState batteryState) {
    const style =
        TextStyle(fontSize: 32, color: Colors.white );
    const double size = 200;

    switch (batteryState) {
      case BatteryState.full:
        const color = Colors.green;

        return Column(
          children: [
            const Icon(Icons.battery_full, size: size, color: color),
            Text('Full!', style: style.copyWith(color: color)),
          ],
        );
      case BatteryState.charging:
        const color = Colors.green;

        return Column(
          children: [
            const Icon(Icons.battery_charging_full, size: size, color: color),
            Text('Charging...', style: style.copyWith(color: color)),
          ],
        );
      case BatteryState.discharging:
      default:
        const color = Colors.red;
        return Column(
          children: [
            const Icon(Icons.battery_alert, size: size, color: color),
            Text('Discharging...', style: style.copyWith(color: color)),
          ],
        );
    }
  }

  Widget buildBatteryLevel(int batteryLevel) => Text(
        '$batteryLevel%',
        style: const TextStyle(
          fontSize: 36,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
}
