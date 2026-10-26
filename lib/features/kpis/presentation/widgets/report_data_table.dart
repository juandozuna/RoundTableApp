import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';

/// Plain table behind a chart's "Tabla" view; also the drill-down table.
/// Columns from [numericFrom] on are right-aligned.
class ReportDataTable extends StatelessWidget {
  const ReportDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.numericFrom = 1,
    this.maxHeight = 280,
  });

  final List<String> columns;
  final List<List<String>> rows;
  final int numericFrom;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowHeight: 40,
            dataRowMinHeight: 40,
            dataRowMaxHeight: 52,
            columnSpacing: 20,
            columns: [
              for (var i = 0; i < columns.length; i++)
                DataColumn(
                  numeric: i >= numericFrom,
                  label: Text(
                    columns[i].toUpperCase(),
                    style: context.textStyles.kicker,
                  ),
                ),
            ],
            rows: [
              for (final row in rows)
                DataRow(cells: [for (final cell in row) DataCell(Text(cell))]),
            ],
          ),
        ),
      ),
    );
  }
}
