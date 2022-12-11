class StockModel {
  int? id;
  String? name;
  String? tag;
  String? color;
  List<CriteriaModel>? criteria;
  Map<String, VariableValue>? variables;

  StockModel(
      {this.id,
      this.name,
      this.tag,
      this.color,
      this.criteria,
      this.variables});

  StockModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tag = json['tag'];
    color = json['color'];
    if (json['criteria'] != null) {
      criteria = <CriteriaModel>[];
      json['criteria'].forEach((v) {
        criteria!.add(CriteriaModel.fromJson(v));
      });
    }
    if (json['variable'] != null) {
      if (json['variable'] is Map) {
        final variableMap = json['variable'] as Map;
        variables ??= {};
        variableMap.entries.map((e) {
          variables?[e.key] = VariableValue.fromJson(e.value);
        }).toList();
      }
    }
  }
}

class CriteriaModel {
  String? type;
  String? text;

  CriteriaModel({this.type, this.text});

  CriteriaModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['text'] = text;
    return data;
  }
}

class VariableValue {
  String? defaultValue;
  List<int>? values;

  VariableValue({this.defaultValue, this.values});
  VariableValue.fromJson(Map<String, dynamic> json) {
    defaultValue = json['default_value'];
    values = json['values'];
  }
}

// class Autogenerated {
// 	Variable? variable;

// 	Autogenerated({this.variable});

// 	Autogenerated.fromJson(Map<String, dynamic> json) {
// 		variable = json['variable'] != null ? Variable.fromJson(json['variable']) : null;
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = <String, dynamic>{};
// 		if (variable != null) {
//       data['variable'] = variable!.toJson();
//     }
// 		return data;
// 	}
// }

// class Variable {
// 	1? 1;

// 	Variable({this.1});

// 	Variable.fromJson(Map<String, dynamic> json) {
// 		1 = json['$1'] != null ? new 1.fromJson(json['$1']) : null;
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = <String, dynamic>{};
// 		if (this.1 != null) {
//       data['$1'] = this.1.toJson();
//     }
// 		return data;
// 	}
// }

// class 1 {
// 	String? type;
// 	List<int>? values;

// 	1({this.type, this.values});

// 	1.fromJson(Map<String, dynamic> json) {
// 		type = json['type'];
// 		values = json['values'].cast<int>();
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = <String, dynamic>{};
// 		data['type'] = type;
// 		data['values'] = values;
// 		return data;
// 	}
// }