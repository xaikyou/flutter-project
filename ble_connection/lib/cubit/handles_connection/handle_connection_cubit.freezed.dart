// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'handle_connection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HandleConnectionStateData {
  List<BluetoothDevice> get devices => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HandleConnectionStateDataCopyWith<HandleConnectionStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HandleConnectionStateDataCopyWith<$Res> {
  factory $HandleConnectionStateDataCopyWith(HandleConnectionStateData value,
          $Res Function(HandleConnectionStateData) then) =
      _$HandleConnectionStateDataCopyWithImpl<$Res, HandleConnectionStateData>;
  @useResult
  $Res call({List<BluetoothDevice> devices});
}

/// @nodoc
class _$HandleConnectionStateDataCopyWithImpl<$Res,
        $Val extends HandleConnectionStateData>
    implements $HandleConnectionStateDataCopyWith<$Res> {
  _$HandleConnectionStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
  }) {
    return _then(_value.copyWith(
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<BluetoothDevice>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HandleConnectionStateDataImplCopyWith<$Res>
    implements $HandleConnectionStateDataCopyWith<$Res> {
  factory _$$HandleConnectionStateDataImplCopyWith(
          _$HandleConnectionStateDataImpl value,
          $Res Function(_$HandleConnectionStateDataImpl) then) =
      __$$HandleConnectionStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BluetoothDevice> devices});
}

/// @nodoc
class __$$HandleConnectionStateDataImplCopyWithImpl<$Res>
    extends _$HandleConnectionStateDataCopyWithImpl<$Res,
        _$HandleConnectionStateDataImpl>
    implements _$$HandleConnectionStateDataImplCopyWith<$Res> {
  __$$HandleConnectionStateDataImplCopyWithImpl(
      _$HandleConnectionStateDataImpl _value,
      $Res Function(_$HandleConnectionStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
  }) {
    return _then(_$HandleConnectionStateDataImpl(
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<BluetoothDevice>,
    ));
  }
}

/// @nodoc

class _$HandleConnectionStateDataImpl implements _HandleConnectionStateData {
  const _$HandleConnectionStateDataImpl(
      {final List<BluetoothDevice> devices = const []})
      : _devices = devices;

  final List<BluetoothDevice> _devices;
  @override
  @JsonKey()
  List<BluetoothDevice> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString() {
    return 'HandleConnectionStateData(devices: $devices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HandleConnectionStateDataImpl &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HandleConnectionStateDataImplCopyWith<_$HandleConnectionStateDataImpl>
      get copyWith => __$$HandleConnectionStateDataImplCopyWithImpl<
          _$HandleConnectionStateDataImpl>(this, _$identity);
}

abstract class _HandleConnectionStateData implements HandleConnectionStateData {
  const factory _HandleConnectionStateData(
      {final List<BluetoothDevice> devices}) = _$HandleConnectionStateDataImpl;

  @override
  List<BluetoothDevice> get devices;
  @override
  @JsonKey(ignore: true)
  _$$HandleConnectionStateDataImplCopyWith<_$HandleConnectionStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HandleConnectionState {
  HandleConnectionStateData get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HandleConnectionStateData data)
        handleConnectionInitial,
    required TResult Function(HandleConnectionStateData data) connecting,
    required TResult Function(HandleConnectionStateData data) connected,
    required TResult Function(HandleConnectionStateData data) connectionFailed,
    required TResult Function(HandleConnectionStateData data) disconnecting,
    required TResult Function(HandleConnectionStateData data) disconnected,
    required TResult Function(HandleConnectionStateData data)
        disconnectionFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult? Function(HandleConnectionStateData data)? connecting,
    TResult? Function(HandleConnectionStateData data)? connected,
    TResult? Function(HandleConnectionStateData data)? connectionFailed,
    TResult? Function(HandleConnectionStateData data)? disconnecting,
    TResult? Function(HandleConnectionStateData data)? disconnected,
    TResult? Function(HandleConnectionStateData data)? disconnectionFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult Function(HandleConnectionStateData data)? connecting,
    TResult Function(HandleConnectionStateData data)? connected,
    TResult Function(HandleConnectionStateData data)? connectionFailed,
    TResult Function(HandleConnectionStateData data)? disconnecting,
    TResult Function(HandleConnectionStateData data)? disconnected,
    TResult Function(HandleConnectionStateData data)? disconnectionFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HandleConnectionInitial value)
        handleConnectionInitial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Connected value) connected,
    required TResult Function(ConnectionFailed value) connectionFailed,
    required TResult Function(Disconnecting value) disconnecting,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(DisconnectionFailed value) disconnectionFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(ConnectionFailed value)? connectionFailed,
    TResult? Function(Disconnecting value)? disconnecting,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(DisconnectionFailed value)? disconnectionFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Connected value)? connected,
    TResult Function(ConnectionFailed value)? connectionFailed,
    TResult Function(Disconnecting value)? disconnecting,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(DisconnectionFailed value)? disconnectionFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HandleConnectionStateCopyWith<HandleConnectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HandleConnectionStateCopyWith<$Res> {
  factory $HandleConnectionStateCopyWith(HandleConnectionState value,
          $Res Function(HandleConnectionState) then) =
      _$HandleConnectionStateCopyWithImpl<$Res, HandleConnectionState>;
  @useResult
  $Res call({HandleConnectionStateData data});

  $HandleConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class _$HandleConnectionStateCopyWithImpl<$Res,
        $Val extends HandleConnectionState>
    implements $HandleConnectionStateCopyWith<$Res> {
  _$HandleConnectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HandleConnectionStateData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HandleConnectionStateDataCopyWith<$Res> get data {
    return $HandleConnectionStateDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HandleConnectionInitialImplCopyWith<$Res>
    implements $HandleConnectionStateCopyWith<$Res> {
  factory _$$HandleConnectionInitialImplCopyWith(
          _$HandleConnectionInitialImpl value,
          $Res Function(_$HandleConnectionInitialImpl) then) =
      __$$HandleConnectionInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HandleConnectionStateData data});

  @override
  $HandleConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$HandleConnectionInitialImplCopyWithImpl<$Res>
    extends _$HandleConnectionStateCopyWithImpl<$Res,
        _$HandleConnectionInitialImpl>
    implements _$$HandleConnectionInitialImplCopyWith<$Res> {
  __$$HandleConnectionInitialImplCopyWithImpl(
      _$HandleConnectionInitialImpl _value,
      $Res Function(_$HandleConnectionInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$HandleConnectionInitialImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HandleConnectionStateData,
    ));
  }
}

/// @nodoc

class _$HandleConnectionInitialImpl implements _HandleConnectionInitial {
  const _$HandleConnectionInitialImpl(this.data);

  @override
  final HandleConnectionStateData data;

  @override
  String toString() {
    return 'HandleConnectionState.handleConnectionInitial(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HandleConnectionInitialImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HandleConnectionInitialImplCopyWith<_$HandleConnectionInitialImpl>
      get copyWith => __$$HandleConnectionInitialImplCopyWithImpl<
          _$HandleConnectionInitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HandleConnectionStateData data)
        handleConnectionInitial,
    required TResult Function(HandleConnectionStateData data) connecting,
    required TResult Function(HandleConnectionStateData data) connected,
    required TResult Function(HandleConnectionStateData data) connectionFailed,
    required TResult Function(HandleConnectionStateData data) disconnecting,
    required TResult Function(HandleConnectionStateData data) disconnected,
    required TResult Function(HandleConnectionStateData data)
        disconnectionFailed,
  }) {
    return handleConnectionInitial(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult? Function(HandleConnectionStateData data)? connecting,
    TResult? Function(HandleConnectionStateData data)? connected,
    TResult? Function(HandleConnectionStateData data)? connectionFailed,
    TResult? Function(HandleConnectionStateData data)? disconnecting,
    TResult? Function(HandleConnectionStateData data)? disconnected,
    TResult? Function(HandleConnectionStateData data)? disconnectionFailed,
  }) {
    return handleConnectionInitial?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult Function(HandleConnectionStateData data)? connecting,
    TResult Function(HandleConnectionStateData data)? connected,
    TResult Function(HandleConnectionStateData data)? connectionFailed,
    TResult Function(HandleConnectionStateData data)? disconnecting,
    TResult Function(HandleConnectionStateData data)? disconnected,
    TResult Function(HandleConnectionStateData data)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (handleConnectionInitial != null) {
      return handleConnectionInitial(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HandleConnectionInitial value)
        handleConnectionInitial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Connected value) connected,
    required TResult Function(ConnectionFailed value) connectionFailed,
    required TResult Function(Disconnecting value) disconnecting,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(DisconnectionFailed value) disconnectionFailed,
  }) {
    return handleConnectionInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(ConnectionFailed value)? connectionFailed,
    TResult? Function(Disconnecting value)? disconnecting,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(DisconnectionFailed value)? disconnectionFailed,
  }) {
    return handleConnectionInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Connected value)? connected,
    TResult Function(ConnectionFailed value)? connectionFailed,
    TResult Function(Disconnecting value)? disconnecting,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(DisconnectionFailed value)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (handleConnectionInitial != null) {
      return handleConnectionInitial(this);
    }
    return orElse();
  }
}

abstract class _HandleConnectionInitial implements HandleConnectionState {
  const factory _HandleConnectionInitial(final HandleConnectionStateData data) =
      _$HandleConnectionInitialImpl;

  @override
  HandleConnectionStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$HandleConnectionInitialImplCopyWith<_$HandleConnectionInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectingImplCopyWith<$Res>
    implements $HandleConnectionStateCopyWith<$Res> {
  factory _$$ConnectingImplCopyWith(
          _$ConnectingImpl value, $Res Function(_$ConnectingImpl) then) =
      __$$ConnectingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HandleConnectionStateData data});

  @override
  $HandleConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ConnectingImplCopyWithImpl<$Res>
    extends _$HandleConnectionStateCopyWithImpl<$Res, _$ConnectingImpl>
    implements _$$ConnectingImplCopyWith<$Res> {
  __$$ConnectingImplCopyWithImpl(
      _$ConnectingImpl _value, $Res Function(_$ConnectingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ConnectingImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HandleConnectionStateData,
    ));
  }
}

/// @nodoc

class _$ConnectingImpl implements Connecting {
  const _$ConnectingImpl(this.data);

  @override
  final HandleConnectionStateData data;

  @override
  String toString() {
    return 'HandleConnectionState.connecting(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectingImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectingImplCopyWith<_$ConnectingImpl> get copyWith =>
      __$$ConnectingImplCopyWithImpl<_$ConnectingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HandleConnectionStateData data)
        handleConnectionInitial,
    required TResult Function(HandleConnectionStateData data) connecting,
    required TResult Function(HandleConnectionStateData data) connected,
    required TResult Function(HandleConnectionStateData data) connectionFailed,
    required TResult Function(HandleConnectionStateData data) disconnecting,
    required TResult Function(HandleConnectionStateData data) disconnected,
    required TResult Function(HandleConnectionStateData data)
        disconnectionFailed,
  }) {
    return connecting(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult? Function(HandleConnectionStateData data)? connecting,
    TResult? Function(HandleConnectionStateData data)? connected,
    TResult? Function(HandleConnectionStateData data)? connectionFailed,
    TResult? Function(HandleConnectionStateData data)? disconnecting,
    TResult? Function(HandleConnectionStateData data)? disconnected,
    TResult? Function(HandleConnectionStateData data)? disconnectionFailed,
  }) {
    return connecting?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult Function(HandleConnectionStateData data)? connecting,
    TResult Function(HandleConnectionStateData data)? connected,
    TResult Function(HandleConnectionStateData data)? connectionFailed,
    TResult Function(HandleConnectionStateData data)? disconnecting,
    TResult Function(HandleConnectionStateData data)? disconnected,
    TResult Function(HandleConnectionStateData data)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HandleConnectionInitial value)
        handleConnectionInitial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Connected value) connected,
    required TResult Function(ConnectionFailed value) connectionFailed,
    required TResult Function(Disconnecting value) disconnecting,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(DisconnectionFailed value) disconnectionFailed,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(ConnectionFailed value)? connectionFailed,
    TResult? Function(Disconnecting value)? disconnecting,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(DisconnectionFailed value)? disconnectionFailed,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Connected value)? connected,
    TResult Function(ConnectionFailed value)? connectionFailed,
    TResult Function(Disconnecting value)? disconnecting,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(DisconnectionFailed value)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class Connecting implements HandleConnectionState {
  const factory Connecting(final HandleConnectionStateData data) =
      _$ConnectingImpl;

  @override
  HandleConnectionStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$ConnectingImplCopyWith<_$ConnectingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectedImplCopyWith<$Res>
    implements $HandleConnectionStateCopyWith<$Res> {
  factory _$$ConnectedImplCopyWith(
          _$ConnectedImpl value, $Res Function(_$ConnectedImpl) then) =
      __$$ConnectedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HandleConnectionStateData data});

  @override
  $HandleConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ConnectedImplCopyWithImpl<$Res>
    extends _$HandleConnectionStateCopyWithImpl<$Res, _$ConnectedImpl>
    implements _$$ConnectedImplCopyWith<$Res> {
  __$$ConnectedImplCopyWithImpl(
      _$ConnectedImpl _value, $Res Function(_$ConnectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ConnectedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HandleConnectionStateData,
    ));
  }
}

/// @nodoc

class _$ConnectedImpl implements Connected {
  const _$ConnectedImpl(this.data);

  @override
  final HandleConnectionStateData data;

  @override
  String toString() {
    return 'HandleConnectionState.connected(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      __$$ConnectedImplCopyWithImpl<_$ConnectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HandleConnectionStateData data)
        handleConnectionInitial,
    required TResult Function(HandleConnectionStateData data) connecting,
    required TResult Function(HandleConnectionStateData data) connected,
    required TResult Function(HandleConnectionStateData data) connectionFailed,
    required TResult Function(HandleConnectionStateData data) disconnecting,
    required TResult Function(HandleConnectionStateData data) disconnected,
    required TResult Function(HandleConnectionStateData data)
        disconnectionFailed,
  }) {
    return connected(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult? Function(HandleConnectionStateData data)? connecting,
    TResult? Function(HandleConnectionStateData data)? connected,
    TResult? Function(HandleConnectionStateData data)? connectionFailed,
    TResult? Function(HandleConnectionStateData data)? disconnecting,
    TResult? Function(HandleConnectionStateData data)? disconnected,
    TResult? Function(HandleConnectionStateData data)? disconnectionFailed,
  }) {
    return connected?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult Function(HandleConnectionStateData data)? connecting,
    TResult Function(HandleConnectionStateData data)? connected,
    TResult Function(HandleConnectionStateData data)? connectionFailed,
    TResult Function(HandleConnectionStateData data)? disconnecting,
    TResult Function(HandleConnectionStateData data)? disconnected,
    TResult Function(HandleConnectionStateData data)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HandleConnectionInitial value)
        handleConnectionInitial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Connected value) connected,
    required TResult Function(ConnectionFailed value) connectionFailed,
    required TResult Function(Disconnecting value) disconnecting,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(DisconnectionFailed value) disconnectionFailed,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(ConnectionFailed value)? connectionFailed,
    TResult? Function(Disconnecting value)? disconnecting,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(DisconnectionFailed value)? disconnectionFailed,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Connected value)? connected,
    TResult Function(ConnectionFailed value)? connectionFailed,
    TResult Function(Disconnecting value)? disconnecting,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(DisconnectionFailed value)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class Connected implements HandleConnectionState {
  const factory Connected(final HandleConnectionStateData data) =
      _$ConnectedImpl;

  @override
  HandleConnectionStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectionFailedImplCopyWith<$Res>
    implements $HandleConnectionStateCopyWith<$Res> {
  factory _$$ConnectionFailedImplCopyWith(_$ConnectionFailedImpl value,
          $Res Function(_$ConnectionFailedImpl) then) =
      __$$ConnectionFailedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HandleConnectionStateData data});

  @override
  $HandleConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ConnectionFailedImplCopyWithImpl<$Res>
    extends _$HandleConnectionStateCopyWithImpl<$Res, _$ConnectionFailedImpl>
    implements _$$ConnectionFailedImplCopyWith<$Res> {
  __$$ConnectionFailedImplCopyWithImpl(_$ConnectionFailedImpl _value,
      $Res Function(_$ConnectionFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ConnectionFailedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HandleConnectionStateData,
    ));
  }
}

/// @nodoc

class _$ConnectionFailedImpl implements ConnectionFailed {
  const _$ConnectionFailedImpl(this.data);

  @override
  final HandleConnectionStateData data;

  @override
  String toString() {
    return 'HandleConnectionState.connectionFailed(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionFailedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionFailedImplCopyWith<_$ConnectionFailedImpl> get copyWith =>
      __$$ConnectionFailedImplCopyWithImpl<_$ConnectionFailedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HandleConnectionStateData data)
        handleConnectionInitial,
    required TResult Function(HandleConnectionStateData data) connecting,
    required TResult Function(HandleConnectionStateData data) connected,
    required TResult Function(HandleConnectionStateData data) connectionFailed,
    required TResult Function(HandleConnectionStateData data) disconnecting,
    required TResult Function(HandleConnectionStateData data) disconnected,
    required TResult Function(HandleConnectionStateData data)
        disconnectionFailed,
  }) {
    return connectionFailed(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult? Function(HandleConnectionStateData data)? connecting,
    TResult? Function(HandleConnectionStateData data)? connected,
    TResult? Function(HandleConnectionStateData data)? connectionFailed,
    TResult? Function(HandleConnectionStateData data)? disconnecting,
    TResult? Function(HandleConnectionStateData data)? disconnected,
    TResult? Function(HandleConnectionStateData data)? disconnectionFailed,
  }) {
    return connectionFailed?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult Function(HandleConnectionStateData data)? connecting,
    TResult Function(HandleConnectionStateData data)? connected,
    TResult Function(HandleConnectionStateData data)? connectionFailed,
    TResult Function(HandleConnectionStateData data)? disconnecting,
    TResult Function(HandleConnectionStateData data)? disconnected,
    TResult Function(HandleConnectionStateData data)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (connectionFailed != null) {
      return connectionFailed(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HandleConnectionInitial value)
        handleConnectionInitial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Connected value) connected,
    required TResult Function(ConnectionFailed value) connectionFailed,
    required TResult Function(Disconnecting value) disconnecting,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(DisconnectionFailed value) disconnectionFailed,
  }) {
    return connectionFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(ConnectionFailed value)? connectionFailed,
    TResult? Function(Disconnecting value)? disconnecting,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(DisconnectionFailed value)? disconnectionFailed,
  }) {
    return connectionFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Connected value)? connected,
    TResult Function(ConnectionFailed value)? connectionFailed,
    TResult Function(Disconnecting value)? disconnecting,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(DisconnectionFailed value)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (connectionFailed != null) {
      return connectionFailed(this);
    }
    return orElse();
  }
}

abstract class ConnectionFailed implements HandleConnectionState {
  const factory ConnectionFailed(final HandleConnectionStateData data) =
      _$ConnectionFailedImpl;

  @override
  HandleConnectionStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$ConnectionFailedImplCopyWith<_$ConnectionFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisconnectingImplCopyWith<$Res>
    implements $HandleConnectionStateCopyWith<$Res> {
  factory _$$DisconnectingImplCopyWith(
          _$DisconnectingImpl value, $Res Function(_$DisconnectingImpl) then) =
      __$$DisconnectingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HandleConnectionStateData data});

  @override
  $HandleConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$DisconnectingImplCopyWithImpl<$Res>
    extends _$HandleConnectionStateCopyWithImpl<$Res, _$DisconnectingImpl>
    implements _$$DisconnectingImplCopyWith<$Res> {
  __$$DisconnectingImplCopyWithImpl(
      _$DisconnectingImpl _value, $Res Function(_$DisconnectingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$DisconnectingImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HandleConnectionStateData,
    ));
  }
}

/// @nodoc

class _$DisconnectingImpl implements Disconnecting {
  const _$DisconnectingImpl(this.data);

  @override
  final HandleConnectionStateData data;

  @override
  String toString() {
    return 'HandleConnectionState.disconnecting(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisconnectingImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisconnectingImplCopyWith<_$DisconnectingImpl> get copyWith =>
      __$$DisconnectingImplCopyWithImpl<_$DisconnectingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HandleConnectionStateData data)
        handleConnectionInitial,
    required TResult Function(HandleConnectionStateData data) connecting,
    required TResult Function(HandleConnectionStateData data) connected,
    required TResult Function(HandleConnectionStateData data) connectionFailed,
    required TResult Function(HandleConnectionStateData data) disconnecting,
    required TResult Function(HandleConnectionStateData data) disconnected,
    required TResult Function(HandleConnectionStateData data)
        disconnectionFailed,
  }) {
    return disconnecting(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult? Function(HandleConnectionStateData data)? connecting,
    TResult? Function(HandleConnectionStateData data)? connected,
    TResult? Function(HandleConnectionStateData data)? connectionFailed,
    TResult? Function(HandleConnectionStateData data)? disconnecting,
    TResult? Function(HandleConnectionStateData data)? disconnected,
    TResult? Function(HandleConnectionStateData data)? disconnectionFailed,
  }) {
    return disconnecting?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult Function(HandleConnectionStateData data)? connecting,
    TResult Function(HandleConnectionStateData data)? connected,
    TResult Function(HandleConnectionStateData data)? connectionFailed,
    TResult Function(HandleConnectionStateData data)? disconnecting,
    TResult Function(HandleConnectionStateData data)? disconnected,
    TResult Function(HandleConnectionStateData data)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (disconnecting != null) {
      return disconnecting(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HandleConnectionInitial value)
        handleConnectionInitial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Connected value) connected,
    required TResult Function(ConnectionFailed value) connectionFailed,
    required TResult Function(Disconnecting value) disconnecting,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(DisconnectionFailed value) disconnectionFailed,
  }) {
    return disconnecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(ConnectionFailed value)? connectionFailed,
    TResult? Function(Disconnecting value)? disconnecting,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(DisconnectionFailed value)? disconnectionFailed,
  }) {
    return disconnecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Connected value)? connected,
    TResult Function(ConnectionFailed value)? connectionFailed,
    TResult Function(Disconnecting value)? disconnecting,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(DisconnectionFailed value)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (disconnecting != null) {
      return disconnecting(this);
    }
    return orElse();
  }
}

abstract class Disconnecting implements HandleConnectionState {
  const factory Disconnecting(final HandleConnectionStateData data) =
      _$DisconnectingImpl;

  @override
  HandleConnectionStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$DisconnectingImplCopyWith<_$DisconnectingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisconnectedImplCopyWith<$Res>
    implements $HandleConnectionStateCopyWith<$Res> {
  factory _$$DisconnectedImplCopyWith(
          _$DisconnectedImpl value, $Res Function(_$DisconnectedImpl) then) =
      __$$DisconnectedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HandleConnectionStateData data});

  @override
  $HandleConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$DisconnectedImplCopyWithImpl<$Res>
    extends _$HandleConnectionStateCopyWithImpl<$Res, _$DisconnectedImpl>
    implements _$$DisconnectedImplCopyWith<$Res> {
  __$$DisconnectedImplCopyWithImpl(
      _$DisconnectedImpl _value, $Res Function(_$DisconnectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$DisconnectedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HandleConnectionStateData,
    ));
  }
}

/// @nodoc

class _$DisconnectedImpl implements Disconnected {
  const _$DisconnectedImpl(this.data);

  @override
  final HandleConnectionStateData data;

  @override
  String toString() {
    return 'HandleConnectionState.disconnected(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisconnectedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisconnectedImplCopyWith<_$DisconnectedImpl> get copyWith =>
      __$$DisconnectedImplCopyWithImpl<_$DisconnectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HandleConnectionStateData data)
        handleConnectionInitial,
    required TResult Function(HandleConnectionStateData data) connecting,
    required TResult Function(HandleConnectionStateData data) connected,
    required TResult Function(HandleConnectionStateData data) connectionFailed,
    required TResult Function(HandleConnectionStateData data) disconnecting,
    required TResult Function(HandleConnectionStateData data) disconnected,
    required TResult Function(HandleConnectionStateData data)
        disconnectionFailed,
  }) {
    return disconnected(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult? Function(HandleConnectionStateData data)? connecting,
    TResult? Function(HandleConnectionStateData data)? connected,
    TResult? Function(HandleConnectionStateData data)? connectionFailed,
    TResult? Function(HandleConnectionStateData data)? disconnecting,
    TResult? Function(HandleConnectionStateData data)? disconnected,
    TResult? Function(HandleConnectionStateData data)? disconnectionFailed,
  }) {
    return disconnected?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult Function(HandleConnectionStateData data)? connecting,
    TResult Function(HandleConnectionStateData data)? connected,
    TResult Function(HandleConnectionStateData data)? connectionFailed,
    TResult Function(HandleConnectionStateData data)? disconnecting,
    TResult Function(HandleConnectionStateData data)? disconnected,
    TResult Function(HandleConnectionStateData data)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HandleConnectionInitial value)
        handleConnectionInitial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Connected value) connected,
    required TResult Function(ConnectionFailed value) connectionFailed,
    required TResult Function(Disconnecting value) disconnecting,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(DisconnectionFailed value) disconnectionFailed,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(ConnectionFailed value)? connectionFailed,
    TResult? Function(Disconnecting value)? disconnecting,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(DisconnectionFailed value)? disconnectionFailed,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Connected value)? connected,
    TResult Function(ConnectionFailed value)? connectionFailed,
    TResult Function(Disconnecting value)? disconnecting,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(DisconnectionFailed value)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class Disconnected implements HandleConnectionState {
  const factory Disconnected(final HandleConnectionStateData data) =
      _$DisconnectedImpl;

  @override
  HandleConnectionStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$DisconnectedImplCopyWith<_$DisconnectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisconnectionFailedImplCopyWith<$Res>
    implements $HandleConnectionStateCopyWith<$Res> {
  factory _$$DisconnectionFailedImplCopyWith(_$DisconnectionFailedImpl value,
          $Res Function(_$DisconnectionFailedImpl) then) =
      __$$DisconnectionFailedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HandleConnectionStateData data});

  @override
  $HandleConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$DisconnectionFailedImplCopyWithImpl<$Res>
    extends _$HandleConnectionStateCopyWithImpl<$Res, _$DisconnectionFailedImpl>
    implements _$$DisconnectionFailedImplCopyWith<$Res> {
  __$$DisconnectionFailedImplCopyWithImpl(_$DisconnectionFailedImpl _value,
      $Res Function(_$DisconnectionFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$DisconnectionFailedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HandleConnectionStateData,
    ));
  }
}

/// @nodoc

class _$DisconnectionFailedImpl implements DisconnectionFailed {
  const _$DisconnectionFailedImpl(this.data);

  @override
  final HandleConnectionStateData data;

  @override
  String toString() {
    return 'HandleConnectionState.disconnectionFailed(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisconnectionFailedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisconnectionFailedImplCopyWith<_$DisconnectionFailedImpl> get copyWith =>
      __$$DisconnectionFailedImplCopyWithImpl<_$DisconnectionFailedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HandleConnectionStateData data)
        handleConnectionInitial,
    required TResult Function(HandleConnectionStateData data) connecting,
    required TResult Function(HandleConnectionStateData data) connected,
    required TResult Function(HandleConnectionStateData data) connectionFailed,
    required TResult Function(HandleConnectionStateData data) disconnecting,
    required TResult Function(HandleConnectionStateData data) disconnected,
    required TResult Function(HandleConnectionStateData data)
        disconnectionFailed,
  }) {
    return disconnectionFailed(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult? Function(HandleConnectionStateData data)? connecting,
    TResult? Function(HandleConnectionStateData data)? connected,
    TResult? Function(HandleConnectionStateData data)? connectionFailed,
    TResult? Function(HandleConnectionStateData data)? disconnecting,
    TResult? Function(HandleConnectionStateData data)? disconnected,
    TResult? Function(HandleConnectionStateData data)? disconnectionFailed,
  }) {
    return disconnectionFailed?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandleConnectionStateData data)? handleConnectionInitial,
    TResult Function(HandleConnectionStateData data)? connecting,
    TResult Function(HandleConnectionStateData data)? connected,
    TResult Function(HandleConnectionStateData data)? connectionFailed,
    TResult Function(HandleConnectionStateData data)? disconnecting,
    TResult Function(HandleConnectionStateData data)? disconnected,
    TResult Function(HandleConnectionStateData data)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (disconnectionFailed != null) {
      return disconnectionFailed(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HandleConnectionInitial value)
        handleConnectionInitial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Connected value) connected,
    required TResult Function(ConnectionFailed value) connectionFailed,
    required TResult Function(Disconnecting value) disconnecting,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(DisconnectionFailed value) disconnectionFailed,
  }) {
    return disconnectionFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(ConnectionFailed value)? connectionFailed,
    TResult? Function(Disconnecting value)? disconnecting,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(DisconnectionFailed value)? disconnectionFailed,
  }) {
    return disconnectionFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HandleConnectionInitial value)? handleConnectionInitial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Connected value)? connected,
    TResult Function(ConnectionFailed value)? connectionFailed,
    TResult Function(Disconnecting value)? disconnecting,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(DisconnectionFailed value)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (disconnectionFailed != null) {
      return disconnectionFailed(this);
    }
    return orElse();
  }
}

abstract class DisconnectionFailed implements HandleConnectionState {
  const factory DisconnectionFailed(final HandleConnectionStateData data) =
      _$DisconnectionFailedImpl;

  @override
  HandleConnectionStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$DisconnectionFailedImplCopyWith<_$DisconnectionFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
