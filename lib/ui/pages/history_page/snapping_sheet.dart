import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/provider/theme_provider.dart';
import 'package:flutter_application_1/ui/pages/history_page/history_data.dart';
import 'package:flutter_application_1/ui/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class SimpleSnappingSheet extends StatelessWidget {
  final ScrollController listViewController = ScrollController();
  final SnappingSheetController snappingSheetController =
      SnappingSheetController();
  SimpleSnappingSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      lockOverflowDrag: true,
      snappingPositions: const [
        SnappingPosition.factor(
          positionFactor: 0.60,
          snappingCurve: Curves.easeOut,
          snappingDuration: Duration(milliseconds: 1000),
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(
          grabbingContentOffset: GrabbingContentOffset.top,
          snappingCurve: Curves.easeOut,
          snappingDuration: Duration(milliseconds: 1000),
          positionFactor: 0.03,
        ),
      ],
      grabbing: const GrabbingWidget(),
      grabbingHeight: 30,
      sheetBelow: null,
      controller: snappingSheetController,
      sheetAbove: SnappingSheetContent(
        draggable: true,
        child: const HistoryData(),
      ),
    );
  }
}

class GrabbingWidget extends StatelessWidget {
  const GrabbingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = themeProvider.isDarkTheme;
    return Container(
      decoration: BoxDecoration(
        color: isDarkTheme ? AppColors.dark : AppColors.light,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
        boxShadow: [
          BoxShadow(blurRadius: 10, color: isDarkTheme ? Colors.white.withOpacity(0.25) : Colors.black.withOpacity(0.25)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 100,
            height: 7,
            decoration: BoxDecoration(
              color:
                  isDarkTheme ? AppColors.light : AppColors.dark,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
