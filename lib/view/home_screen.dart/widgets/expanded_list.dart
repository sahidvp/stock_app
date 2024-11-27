import 'package:flutter/material.dart';
import 'package:stock_app/utils/app_colors.dart';
import 'package:stock_app/view/home_screen.dart/widgets/expanded_content.dart';

import '../../../model/search_results.dart';

class ExpandableListItem extends StatefulWidget {
  final SearchResult result;

  const ExpandableListItem({super.key, required this.result});

  @override
  _ExpandableListItemState createState() => _ExpandableListItemState();
}

class _ExpandableListItemState extends State<ExpandableListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                widget.result.name, // Company name
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ),
            if (_isExpanded)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    expandedContent(
                        "Region", widget.result.symbol, Icons.public),
                    expandedContent("Market open", widget.result.marketOpen,
                        Icons.access_time),
                    expandedContent("Market close", widget.result.marketClose,
                        Icons.access_time),
                    expandedContent(
                        "Time Zone", widget.result.timezone, Icons.timer),
                    expandedContent("Currency", widget.result.currency,
                        Icons.monetization_on),
                    expandedContent("Match score",
                        widget.result.matchScore.toString(), Icons.star)
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  
}
