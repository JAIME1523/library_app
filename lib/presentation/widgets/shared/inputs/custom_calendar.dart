import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({super.key, required this.onChanged});
  final void Function(DateTime?) onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return DateTimeField(
        validator: (value) {
          if (value == null) return "Se requiere fecha";
          return null;
        },
        format: DateFormat("dd/MM/yyyy"),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colors.primary, width: 1.5),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          fillColor: const Color.fromARGB(55, 184, 184, 184),
          filled: true,
          hintText: "Fecha nacimiento",
          labelText: "Fecha nacimiento",
          isDense: true,
          prefixIcon: const Icon(Icons.edit_calendar),
        ),
        onChanged: onChanged,
        onShowPicker: (context, currentValue) async {
          FocusManager.instance.primaryFocus?.unfocus();
          final date = await showDatePicker(
            context: context,
            firstDate: DateTime(1940),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime.now(),
          );
          if (date != null) {
            return date;
          } else {
            return currentValue;
          }
        });
  }
}
