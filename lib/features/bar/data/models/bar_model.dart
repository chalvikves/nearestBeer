import '../../../../core/constants/constants.dart';
import '../../business/entities/bar_entity.dart';

class BarModel extends BarEntity {
  const BarModel({
    required String name,
    required int id,
    // required int closingTime,
    // required String path,
  }) : super(
          name: name,
          id: id,
          // closingTime: closingTime,
          //  path: path,
        );

  factory BarModel.fromJson(Map<String, dynamic> json) {
    return BarModel(
      name: json[kName],
      id: json[kId],
      // closingTime: json[kClosingTime],
      // path: json[kPath],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      kName: name,
      kId: id,
      // kClosingTime: closingTime,
      //kPath: path,
    };
  }
}
