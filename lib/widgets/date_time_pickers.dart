import 'package:flutter/material.dart';

Widget buildDatePicker(
  BuildContext context,
  DateTime? selectedDate,
  Function(DateTime) onSelect,
) {
  return InkWell(
    onTap: () async {
      final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null) onSelect(picked);
    },
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[50],
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today),
          SizedBox(width: 8),
          Text(
            selectedDate != null
                ? "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"
                : "Birthdate",
            style: TextStyle(
              color: selectedDate != null ? Colors.black : Colors.grey[600],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildTimePicker(
  BuildContext context,
  TimeOfDay? time,
  Function(TimeOfDay) onSelect,
) {
  return InkWell(
    onTap: () async {
      final picked = await showTimePicker(
        context: context,
        initialTime: time ?? TimeOfDay.now(),
      );
      if (picked != null) onSelect(picked);
    },
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[50],
      ),
      child: Row(
        children: [
          Icon(Icons.access_time),
          SizedBox(width: 8),
          Text(
            time != null ? time.format(context) : "Preferred Time",
            style: TextStyle(
              color: time != null ? Colors.black : Colors.grey[600],
            ),
          ),
        ],
      ),
    ),
  );
}
