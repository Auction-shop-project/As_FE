// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      list: (json['list'] as List<dynamic>)
          .map((e) => ChatDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'list': instance.list,
    };

ChatDetails _$ChatDetailsFromJson(Map<String, dynamic> json) => ChatDetails(
      chatLog: (json['chatLog'] as List<dynamic>)
          .map((e) => Chatting.fromJson(e as Map<String, dynamic>))
          .toList(),
      roomId: (json['roomId'] as num).toInt(),
      title: json['title'] as String,
      currentPrice: (json['currentPrice'] as num).toInt(),
    );

Map<String, dynamic> _$ChatDetailsToJson(ChatDetails instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'chatLog': instance.chatLog,
      'currentPrice': instance.currentPrice,
      'title': instance.title,
    };

Chatting _$ChattingFromJson(Map<String, dynamic> json) => Chatting(
      userId: (json['userId'] as num).toInt(),
      message: json['message'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ChattingToJson(Chatting instance) => <String, dynamic>{
      'userId': instance.userId,
      'message': instance.message,
      'createdAt': instance.createdAt.toIso8601String(),
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      roomId: (json['roomId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'roomId': instance.roomId,
      'userId': instance.userId,
      'message': instance.message,
    };

MakeRoom _$MakeRoomFromJson(Map<String, dynamic> json) => MakeRoom(
      userId: (json['userId'] as num).toInt(),
      postId: (json['postId'] as num).toInt(),
      yourId: (json['yourId'] as num).toInt(),
    );

Map<String, dynamic> _$MakeRoomToJson(MakeRoom instance) => <String, dynamic>{
      'userId': instance.userId,
      'postId': instance.postId,
      'yourId': instance.yourId,
    };

ChattingRoom _$ChattingRoomFromJson(Map<String, dynamic> json) => ChattingRoom(
      userId: (json['userId'] as num).toInt(),
      yourId: (json['yourId'] as num).toInt(),
      postId: (json['postId'] as num).toInt(),
      roomId: (json['roomId'] as num).toInt(),
      nickname: json['nickname'] as String,
      imageUrl: json['imageUrl'] as String?,
      latestChatTime: json['latestChatTime'] == null
          ? null
          : DateTime.parse(json['latestChatTime'] as String),
      latestChatLog: json['latestChatLog'] as String?,
      profileUrl: json['profileUrl'] as String?,
    );

Map<String, dynamic> _$ChattingRoomToJson(ChattingRoom instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'yourId': instance.yourId,
      'postId': instance.postId,
      'roomId': instance.roomId,
      'nickname': instance.nickname,
      'imageUrl': instance.imageUrl,
      'latestChatTime': instance.latestChatTime?.toIso8601String(),
      'latestChatLog': instance.latestChatLog,
      'profileUrl': instance.profileUrl,
    };

EnterChattingRoom _$EnterChattingRoomFromJson(Map<String, dynamic> json) =>
    EnterChattingRoom(
      userId: json['userId'] as String,
      yourId: json['yourId'] as String,
      postId: json['postId'] as String,
    );

Map<String, dynamic> _$EnterChattingRoomToJson(EnterChattingRoom instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'yourId': instance.yourId,
      'postId': instance.postId,
    };
