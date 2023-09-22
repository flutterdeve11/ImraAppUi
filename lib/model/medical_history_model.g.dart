// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalHistoryModel _$MedicalHistoryModelFromJson(Map<String, dynamic> json) =>
    MedicalHistoryModel()
      ..user = json['user'] as String?
      ..procedure = json['procedure'] as String?
      ..reason = json['reason'] as String?
      ..medCenter = json['medCenter'] as String?
      ..date = json['date'] as String?
      ..createdAt = json['createdAt'] as String?
      ..updatedAt = json['updatedAt'] as String?;

Map<String, dynamic> _$MedicalHistoryModelToJson(
        MedicalHistoryModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'procedure': instance.procedure,
      'reason': instance.reason,
      'medCenter': instance.medCenter,
      'date': instance.date,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

MedicalHistoryCompleteModel _$MedicalHistoryCompleteModelFromJson(
        Map<String, dynamic> json) =>
    MedicalHistoryCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MedicalHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MedicalHistoryCompleteModelToJson(
        MedicalHistoryCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
