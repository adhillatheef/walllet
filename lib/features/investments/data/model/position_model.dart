class PositionModel {
  final String id;
  final String symbol; // e.g., USDXAU
  final String type;   // "Buy" or "Sell"
  final double volume; // Lots (e.g., 2.47)
  final double entryPrice;
  final double currentPrice;
  final double stopLoss;
  final double takeProfit;
  final double swap;
  final double profit; // The floating PnL

  PositionModel({
    required this.id,
    required this.symbol,
    required this.type,
    required this.volume,
    required this.entryPrice,
    required this.currentPrice,
    required this.stopLoss,
    required this.takeProfit,
    required this.swap,
    required this.profit,
  });

  // Helper to create a copy with updated price for simulation
  PositionModel copyWith({double? currentPrice, double? profit}) {
    return PositionModel(
      id: id,
      symbol: symbol,
      type: type,
      volume: volume,
      entryPrice: entryPrice,
      currentPrice: currentPrice ?? this.currentPrice,
      stopLoss: stopLoss,
      takeProfit: takeProfit,
      swap: swap,
      profit: profit ?? this.profit,
    );
  }
}