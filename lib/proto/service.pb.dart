///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Empty', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Empty clone() => Empty()..mergeFromMessage(this);
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty _defaultInstance;
}

class RegisterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RegisterRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOM<User>(1, 'user', subBuilder: User.create)
    ..aOB(2, 'active')
    ..hasRequiredFields = false
  ;

  RegisterRequest._() : super();
  factory RegisterRequest() => create();
  factory RegisterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RegisterRequest clone() => RegisterRequest()..mergeFromMessage(this);
  RegisterRequest copyWith(void Function(RegisterRequest) updates) => super.copyWith((message) => updates(message as RegisterRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterRequest create() => RegisterRequest._();
  RegisterRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterRequest> createRepeated() => $pb.PbList<RegisterRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterRequest>(create);
  static RegisterRequest _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get active => $_getBF(1);
  @$pb.TagNumber(2)
  set active($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearActive() => clearField(2);
}

class LogoutRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LogoutRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  LogoutRequest._() : super();
  factory LogoutRequest() => create();
  factory LogoutRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogoutRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LogoutRequest clone() => LogoutRequest()..mergeFromMessage(this);
  LogoutRequest copyWith(void Function(LogoutRequest) updates) => super.copyWith((message) => updates(message as LogoutRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogoutRequest create() => LogoutRequest._();
  LogoutRequest createEmptyInstance() => create();
  static $pb.PbList<LogoutRequest> createRepeated() => $pb.PbList<LogoutRequest>();
  @$core.pragma('dart2js:noInline')
  static LogoutRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogoutRequest>(create);
  static LogoutRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class Close extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Close', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Close._() : super();
  factory Close() => create();
  factory Close.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Close.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Close clone() => Close()..mergeFromMessage(this);
  Close copyWith(void Function(Close) updates) => super.copyWith((message) => updates(message as Close));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Close create() => Close._();
  Close createEmptyInstance() => create();
  static $pb.PbList<Close> createRepeated() => $pb.PbList<Close>();
  @$core.pragma('dart2js:noInline')
  static Close getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Close>(create);
  static Close _defaultInstance;
}

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('User', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'name')
    ..a<$core.List<$core.int>>(3, 'profilePic', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User() => create();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  User clone() => User()..mergeFromMessage(this);
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get profilePic => $_getN(2);
  @$pb.TagNumber(3)
  set profilePic($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProfilePic() => $_has(2);
  @$pb.TagNumber(3)
  void clearProfilePic() => clearField(3);
}

class Message extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Message', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'senderId')
    ..aOS(2, 'targetId')
    ..aOS(3, 'body')
    ..aOS(4, 'timestamp')
    ..aOB(5, 'read')
    ..aOM<Media>(6, 'media', subBuilder: Media.create)
    ..hasRequiredFields = false
  ;

  Message._() : super();
  factory Message() => create();
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Message clone() => Message()..mergeFromMessage(this);
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get senderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set senderId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSenderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSenderId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get targetId => $_getSZ(1);
  @$pb.TagNumber(2)
  set targetId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get body => $_getSZ(2);
  @$pb.TagNumber(3)
  set body($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBody() => $_has(2);
  @$pb.TagNumber(3)
  void clearBody() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get timestamp => $_getSZ(3);
  @$pb.TagNumber(4)
  set timestamp($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get read => $_getBF(4);
  @$pb.TagNumber(5)
  set read($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRead() => $_has(4);
  @$pb.TagNumber(5)
  void clearRead() => clearField(5);

  @$pb.TagNumber(6)
  Media get media => $_getN(5);
  @$pb.TagNumber(6)
  set media(Media v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasMedia() => $_has(5);
  @$pb.TagNumber(6)
  void clearMedia() => clearField(6);
  @$pb.TagNumber(6)
  Media ensureMedia() => $_ensure(5);
}

enum Media_Data {
  image, 
  video, 
  file, 
  chunkSize, 
  empty, 
  notSet
}

class Media extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Media_Data> _Media_DataByTag = {
    1 : Media_Data.image,
    2 : Media_Data.video,
    3 : Media_Data.file,
    4 : Media_Data.chunkSize,
    5 : Media_Data.empty,
    0 : Media_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Media', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..a<$core.List<$core.int>>(1, 'image', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'video', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'file', $pb.PbFieldType.OY)
    ..a<$core.int>(4, 'chunkSize', $pb.PbFieldType.O3, protoName: 'chunkSize')
    ..aOB(5, 'empty')
    ..hasRequiredFields = false
  ;

  Media._() : super();
  factory Media() => create();
  factory Media.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Media.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Media clone() => Media()..mergeFromMessage(this);
  Media copyWith(void Function(Media) updates) => super.copyWith((message) => updates(message as Media));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Media create() => Media._();
  Media createEmptyInstance() => create();
  static $pb.PbList<Media> createRepeated() => $pb.PbList<Media>();
  @$core.pragma('dart2js:noInline')
  static Media getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Media>(create);
  static Media _defaultInstance;

  Media_Data whichData() => _Media_DataByTag[$_whichOneof(0)];
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.List<$core.int> get image => $_getN(0);
  @$pb.TagNumber(1)
  set image($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get video => $_getN(1);
  @$pb.TagNumber(2)
  set video($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVideo() => $_has(1);
  @$pb.TagNumber(2)
  void clearVideo() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get file => $_getN(2);
  @$pb.TagNumber(3)
  set file($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFile() => $_has(2);
  @$pb.TagNumber(3)
  void clearFile() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get chunkSize => $_getIZ(3);
  @$pb.TagNumber(4)
  set chunkSize($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChunkSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearChunkSize() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get empty => $_getBF(4);
  @$pb.TagNumber(5)
  set empty($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEmpty() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmpty() => clearField(5);
}

class MediaResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MediaResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOB(1, 'done')
    ..aOS(2, 'error')
    ..hasRequiredFields = false
  ;

  MediaResponse._() : super();
  factory MediaResponse() => create();
  factory MediaResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MediaResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MediaResponse clone() => MediaResponse()..mergeFromMessage(this);
  MediaResponse copyWith(void Function(MediaResponse) updates) => super.copyWith((message) => updates(message as MediaResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MediaResponse create() => MediaResponse._();
  MediaResponse createEmptyInstance() => create();
  static $pb.PbList<MediaResponse> createRepeated() => $pb.PbList<MediaResponse>();
  @$core.pragma('dart2js:noInline')
  static MediaResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MediaResponse>(create);
  static MediaResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get done => $_getBF(0);
  @$pb.TagNumber(1)
  set done($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDone() => $_has(0);
  @$pb.TagNumber(1)
  void clearDone() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
}

class SignupRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignupRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOM<User>(1, 'user', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  SignupRequest._() : super();
  factory SignupRequest() => create();
  factory SignupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SignupRequest clone() => SignupRequest()..mergeFromMessage(this);
  SignupRequest copyWith(void Function(SignupRequest) updates) => super.copyWith((message) => updates(message as SignupRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignupRequest create() => SignupRequest._();
  SignupRequest createEmptyInstance() => create();
  static $pb.PbList<SignupRequest> createRepeated() => $pb.PbList<SignupRequest>();
  @$core.pragma('dart2js:noInline')
  static SignupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignupRequest>(create);
  static SignupRequest _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}

class SignupResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SignupResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOB(1, 'done')
    ..aOS(2, 'msg')
    ..hasRequiredFields = false
  ;

  SignupResponse._() : super();
  factory SignupResponse() => create();
  factory SignupResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignupResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SignupResponse clone() => SignupResponse()..mergeFromMessage(this);
  SignupResponse copyWith(void Function(SignupResponse) updates) => super.copyWith((message) => updates(message as SignupResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignupResponse create() => SignupResponse._();
  SignupResponse createEmptyInstance() => create();
  static $pb.PbList<SignupResponse> createRepeated() => $pb.PbList<SignupResponse>();
  @$core.pragma('dart2js:noInline')
  static SignupResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignupResponse>(create);
  static SignupResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get done => $_getBF(0);
  @$pb.TagNumber(1)
  set done($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDone() => $_has(0);
  @$pb.TagNumber(1)
  void clearDone() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);
}

class AddFriendRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddFriendRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  AddFriendRequest._() : super();
  factory AddFriendRequest() => create();
  factory AddFriendRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddFriendRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AddFriendRequest clone() => AddFriendRequest()..mergeFromMessage(this);
  AddFriendRequest copyWith(void Function(AddFriendRequest) updates) => super.copyWith((message) => updates(message as AddFriendRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddFriendRequest create() => AddFriendRequest._();
  AddFriendRequest createEmptyInstance() => create();
  static $pb.PbList<AddFriendRequest> createRepeated() => $pb.PbList<AddFriendRequest>();
  @$core.pragma('dart2js:noInline')
  static AddFriendRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddFriendRequest>(create);
  static AddFriendRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class AddFriendResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddFriendResponse', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOB(1, 'done')
    ..aOM<User>(2, 'user', subBuilder: User.create)
    ..aOS(3, 'msg')
    ..hasRequiredFields = false
  ;

  AddFriendResponse._() : super();
  factory AddFriendResponse() => create();
  factory AddFriendResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddFriendResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AddFriendResponse clone() => AddFriendResponse()..mergeFromMessage(this);
  AddFriendResponse copyWith(void Function(AddFriendResponse) updates) => super.copyWith((message) => updates(message as AddFriendResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddFriendResponse create() => AddFriendResponse._();
  AddFriendResponse createEmptyInstance() => create();
  static $pb.PbList<AddFriendResponse> createRepeated() => $pb.PbList<AddFriendResponse>();
  @$core.pragma('dart2js:noInline')
  static AddFriendResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddFriendResponse>(create);
  static AddFriendResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get done => $_getBF(0);
  @$pb.TagNumber(1)
  set done($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDone() => $_has(0);
  @$pb.TagNumber(1)
  void clearDone() => clearField(1);

  @$pb.TagNumber(2)
  User get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(User v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  User ensureUser() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);
}

