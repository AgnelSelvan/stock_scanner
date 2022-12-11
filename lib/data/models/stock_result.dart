import 'package:flutter/material.dart';
import 'package:stock_scanner/core/extension/double.dart';

class StockResult {
  int? id;
  String? name;
  String? tag;
  String? color;
  List<Criteria>? criteria;

  StockResult({this.id, this.name, this.tag, this.color, this.criteria});

  StockResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tag = json['tag'];
    color = json['color'];
    if (json['criteria'] != null) {
      criteria = <Criteria>[];
      json['criteria'].forEach((v) {
        criteria!.add(Criteria.fromJson(v));
      });
    }
  }
}

class Criteria {
  String? type;
  String? text;
  String? finalText;
  Map<String, VariableValue>? variables;
  List<VariableValue>? allVariables;
  List<ChangedTextColor>? allText;

  Criteria(
      {this.type,
      this.text,
      this.variables,
      this.finalText,
      this.allVariables,
      this.allText});

  Criteria.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    text = json['text'];
    if (json['variable'] != null) {
      if (json['variable'] is Map) {
        final variableMap = json['variable'] as Map;
        variables ??= {};
        variableMap.entries.map((e) {
          final variable = VariableValue.fromJson(e.value);
          variables?[e.key] = variable;
          allVariables?.add(variable);
        }).toList();
      }
    }
    final noNullText = text ?? '';

    allText ??= [];
    allText =
        getAllTextColor([ChangedTextColor(noNullText, Colors.white)], r"$1");
    allText = getAllTextColor(allText ?? [], r"$2");
    allText = getAllTextColor(allText ?? [], r"$3");
    allText = getAllTextColor(allText ?? [], r"$4");
  }

  List<ChangedTextColor> getAllTextColor(
      List<ChangedTextColor> noNullTextList, String matchReg) {
    List<ChangedTextColor> allTextColor = [];
    for (var noNullText in noNullTextList) {
      final oneIndex = noNullText.text.indexOf(matchReg);
      if (oneIndex != -1) {
        final varVa = variables?[matchReg];
        final varValues = (varVa?.values ?? []);
        final value = varValues.isNotEmpty
            ? varValues.first.removeTrailingZeros
            : varVa?.defaultValue?.removeTrailingZeros;
        if (noNullText.color == Colors.blue[800]!) {
          continue;
        } else {
          allTextColor.add(ChangedTextColor(
              noNullText.text.substring(0, oneIndex), Colors.white));
          allTextColor
              .add(ChangedTextColor("(${value ?? ''})", Colors.blue[800]!));
          allTextColor.add(ChangedTextColor(
              noNullText.text.substring(oneIndex + 2), Colors.white));
        }
      } else {
        allTextColor.add(ChangedTextColor(noNullText.text, noNullText.color));
      }
    }

    return allTextColor;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['text'] = text;
    return data;
  }
}

class ChangedTextColor {
  final String text;
  final Color color;

  ChangedTextColor(this.text, this.color);
}

class VariableValue {
  double? defaultValue;
  List<double>? values;

  VariableValue({this.defaultValue, this.values});
  VariableValue.fromJson(Map<String, dynamic> json) {
    defaultValue = double.tryParse("${json['default_value']}") ?? 0;
    values ??= [];
    if (json['values'] != null) {
      if (json['values'] is List) {
        for (var element in json['values']) {
          values?.add(double.tryParse("$element") ?? 0);
        }
      }
    }
  }
}
