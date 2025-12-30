import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class LiveTickerWidget extends StatefulWidget {
  const LiveTickerWidget({super.key});

  @override
  State<LiveTickerWidget> createState() => _LiveTickerWidgetState();
}

class _LiveTickerWidgetState extends State<LiveTickerWidget> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@trade'),
  );

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _channel.stream,
      builder: (context, snapshot) {
        String price = "Loading...";
        Color priceColor = Colors.white;

        if (snapshot.hasData) {
          // Parse simplistic JSON
          // {"e":"trade","E":16... "s":"BTCUSDT","p":"27000.50", ...}
          final raw = snapshot.data.toString();
          // Quick regex extract for safety without full model parsing overhead for now
          final regExp = RegExp(r'"p":"(\d+\.\d+)"');
          final match = regExp.firstMatch(raw);
          if (match != null) {
            double val = double.parse(match.group(1)!);
            price = "\$${val.toStringAsFixed(2)}";
            // Simple visual trick: if price ends in odd/even could flicker color
            // For now, let's keep it clean white or green
            priceColor = AppColors.successGreen;
          }
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardSurface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.primaryCyan.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.currency_bitcoin, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text("BTC/USDT Live", style: AppTypography.bodyMedium.copyWith(color: Colors.white)),
                ],
              ),
              Text(
                price,
                style: AppTypography.titleMedium.copyWith(color: priceColor),
              ),
            ],
          ),
        );
      },
    );
  }
}