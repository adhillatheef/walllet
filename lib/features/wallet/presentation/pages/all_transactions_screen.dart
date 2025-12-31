import 'package:flutter/material.dart';
import 'package:wallet/core/widgets/dashboard_header.dart';
import 'package:wallet/core/widgets/transaction_tile.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class AllTransactionsScreen extends StatefulWidget {
  const AllTransactionsScreen({super.key});

  @override
  State<AllTransactionsScreen> createState() => _AllTransactionsScreenState();
}

class _AllTransactionsScreenState extends State<AllTransactionsScreen> {
  // Mock Data: Grouped by Date Headers as per design
  final List<Map<String, dynamic>> _allTransactions = [
    {
      "dateHeader": "November 30th, 2025",
      "items": [
        {"title": "Wallet deposit", "date": "23rd May 2025", "amount": "+\$21,282", "status": "Approved", "icon": Icons.account_balance_wallet, "color": AppColors.successGreen},
        {"title": "Wallet Withdraw", "date": "23rd May 2025", "amount": "-\$21,282", "status": "Approved", "icon": Icons.outbox, "color": AppColors.errorRed},
        {"title": "Referral", "date": "23rd May 2025", "amount": "+\$21,282", "status": "Approved", "icon": Icons.loop, "color": AppColors.primaryPurple},
        {"title": "Bonus", "date": "23rd May 2025", "amount": "+\$21,282", "status": "Approved", "icon": Icons.diamond_outlined, "color": AppColors.warningOrange},
        {"title": "Wallet deposit", "date": "23rd May 2025", "amount": "+\$21,282", "status": "Rejected", "icon": Icons.account_balance_wallet, "color": AppColors.successGreen},
      ]
    },
    {
      "dateHeader": "November 29th, 2025",
      "items": [
        {"title": "Wallet deposit", "date": "23rd May 2025", "amount": "+\$21,282", "status": "Approved", "icon": Icons.account_balance_wallet, "color": AppColors.successGreen},
        {"title": "Wallet Withdraw", "date": "23rd May 2025", "amount": "-\$21,282", "status": "Approved", "icon": Icons.outbox, "color": AppColors.errorRed},
      ]
    },
  ];

  String _searchQuery = "";
  DateTimeRange? _selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            // 1. Header (Reused)
            const DashboardHeader(),

            // 2. Search & Filter Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                children: [
                  // Search Field
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.cardSurface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.divider),
                      ),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (val) => setState(() => _searchQuery = val),
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Search Transactions",
                          hintStyle: AppTypography.bodySmall,
                          prefixIcon: const Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Filter Button (Date Range Picker)
                  InkWell(
                    onTap: () async {
                      final picked = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                        builder: (context, child) {
                          // Customizing the DatePicker theme to match app
                          return Theme(
                            data: ThemeData.dark().copyWith(
                              colorScheme: const ColorScheme.dark(
                                primary: AppColors.primaryCyan,
                                onPrimary: Colors.black,
                                surface: AppColors.cardSurface,
                              ),
                              scaffoldBackgroundColor: AppColors.scaffoldBackground,
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (picked != null) {
                        setState(() => _selectedDateRange = picked);
                      }
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        // Highlight if filter is active
                        color: _selectedDateRange != null ? AppColors.primaryCyan : AppColors.cardSurface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.divider),
                      ),
                      child: Icon(
                          Icons.filter_list,
                          color: _selectedDateRange != null ? Colors.black : Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 3. Grouped List using Reused TransactionTile
            Expanded(
              child: ListView.builder(
                // Removed horizontal padding here because TransactionTile
                // already has margin: EdgeInsets.only(bottom: 12, left: 24, right: 24)
                padding: const EdgeInsets.only(top: 0),
                itemCount: _allTransactions.length,
                itemBuilder: (context, index) {
                  final group = _allTransactions[index];
                  final List items = group['items'];

                  // Apply Simple Search Filter
                  final filteredItems = items.where((item) {
                    final title = item['title'].toString().toLowerCase();
                    return title.contains(_searchQuery.toLowerCase());
                  }).toList();

                  if (filteredItems.isEmpty) return const SizedBox.shrink();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date Header
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                        child: Text(
                          group['dateHeader'],
                          style: AppTypography.titleMedium.copyWith(fontSize: 16),
                        ),
                      ),
                      // List of Tiles
                      ...filteredItems.map((item) {
                        return TransactionTile(
                          title: item['title'],
                          date: item['date'],
                          amount: item['amount'],
                          status: item['status'],
                          icon: item['icon'],
                          iconColor: item['color'],
                        );
                      }),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}