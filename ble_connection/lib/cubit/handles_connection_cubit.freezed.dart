// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'handles_connection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HandlesConnectionStateData {
  List<BluetoothDevice> get devices => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HandlesConnectionStateDataCopyWith<HandlesConnectionStateData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HandlesConnectionStateDataCopyWith<$Res> {
  factory $HandlesConnectionStateDataCopyWith(HandlesConnectionStateData value,
          $Res Function(HandlesConnectionStateData) then) =
      _$HandlesConnectionStateDataCopyWithImpl<$Res,
          HandlesConnectionStateData>;
  @useResult
  $Res call({List<BluetoothDevice> devices});
}

/// @nodoc
class _$HandlesConnectionStateDataCopyWithImpl<$Res,
        $Val extends HandlesConnectionStateData>
    implements $HandlesConnectionStateDataCopyWith<$Res> {
  _$HandlesConnectionStateDataCopyWithImpl(this._value, this._then);

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
abstract class _$$HandlesConnectionStateDataImplCopyWith<$Res>
    implements $HandlesConnectionStateDataCopyWith<$Res> {
  factory _$$HandlesConnectionStateDataImplCopyWith(
          _$HandlesConnectionStateDataImpl value,
          $Res Function(_$HandlesConnectionStateDataImpl) then) =
      __$$HandlesConnectionStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BluetoothDevice> devices});
}

/// @nodoc
class __$$HandlesConnectionStateDataImplCopyWithImpl<$Res>
    extends _$HandlesConnectionStateDataCopyWithImpl<$Res,
        _$HandlesConnectionStateDataImpl>
    implements _$$HandlesConnectionStateDataImplCopyWith<$Res> {
  __$$HandlesConnectionStateDataImplCopyWithImpl(
      _$HandlesConnectionStateDataImpl _value,
      $Res Function(_$HandlesConnectionStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
  }) {
    return _then(_$HandlesConnectionStateDataImpl(
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<BluetoothDevice>,
    ));
  }
}

/// @nodoc

class _$HandlesConnectionStateDataImpl implements _HandlesConnectionStateData {
  const _$HandlesConnectionStateDataImpl(
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
    return 'HandlesConnectionStateData(devices: $devices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HandlesConnectionStateDataImpl &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HandlesConnectionStateDataImplCopyWith<_$HandlesConnectionStateDataImpl>
      get copyWith => __$$HandlesConnectionStateDataImplCopyWithImpl<
          _$HandlesConnectionStateDataImpl>(this, _$identity);
}

abstract class _HandlesConnectionStateData
    implements HandlesConnectionStateData {
  const factory _HandlesConnectionStateData(
      {final List<BluetoothDevice> devices}) = _$HandlesConnectionStateDataImpl;

  @override
  List<BluetoothDevice> get devices;
  @override
  @JsonKey(ignore: true)
  _$$HandlesConnectionStateDataImplCopyWith<_$HandlesConnectionStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HandlesConnectionState {
  HandlesConnectionStateData get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HandlesConnectionStateData data)
        handlesConnectionInitial,
    required TResult Function(HandlesConnectionStateData data) connecting,
    required TResult Function(HandlesConnectionStateData data) connected,
    required TResult Function(HandlesConnectionStateData data) connectionFailed,
    required TResult Function(HandlesConnectionStateData data) disconnecting,
    required TResult Function(HandlesConnectionStateData data) disconnected,
    required TResult Function(HandlesConnectionStateData data)
        disconnectionFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandlesConnectionStateData data)?
        handlesConnectionInitial,
    TResult? Function(HandlesConnectionStateData data)? connecting,
    TResult? Function(HandlesConnectionStateData data)? connected,
    TResult? Function(HandlesConnectionStateData data)? connectionFailed,
    TResult? Function(HandlesConnectionStateData data)? disconnecting,
    TResult? Function(HandlesConnectionStateData data)? disconnected,
    TResult? Function(HandlesConnectionStateData data)? disconnectionFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandlesConnectionStateData data)? handlesConnectionInitial,
    TResult Function(HandlesConnectionStateData data)? connecting,
    TResult Function(HandlesConnectionStateData data)? connected,
    TResult Function(HandlesConnectionStateData data)? connectionFailed,
    TResult Function(HandlesConnectionStateData data)? disconnecting,
    TResult Function(HandlesConnectionStateData data)? disconnected,
    TResult Function(HandlesConnectionStateData data)? disconnectionFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HandlesConnectionInitial value)
        handlesConnectionInitial,
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
    TResult? Function(_HandlesConnectionInitial value)?
        handlesConnectionInitial,
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
    TResult Function(_HandlesConnectionInitial value)? handlesConnectionInitial,
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
  $HandlesConnectionStateCopyWith<HandlesConnectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HandlesConnectionStateCopyWith<$Res> {
  factory $HandlesConnectionStateCopyWith(HandlesConnectionState value,
          $Res Function(HandlesConnectionState) then) =
      _$HandlesConnectionStateCopyWithImpl<$Res, HandlesConnectionState>;
  @useResult
  $Res call({HandlesConnectionStateData data});

  $HandlesConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class _$HandlesConnectionStateCopyWithImpl<$Res,
        $Val extends HandlesConnectionState>
    implements $HandlesConnectionStateCopyWith<$Res> {
  _$HandlesConnectionStateCopyWithImpl(this._value, this._then);

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
              as HandlesConnectionStateData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HandlesConnectionStateDataCopyWith<$Res> get data {
    return $HandlesConnectionStateDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HandlesConnectionInitialImplCopyWith<$Res>
    implements $HandlesConnectionStateCopyWith<$Res> {
  factory _$$HandlesConnectionInitialImplCopyWith(
          _$HandlesConnectionInitialImpl value,
          $Res Function(_$HandlesConnectionInitialImpl) then) =
      __$$HandlesConnectionInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HandlesConnectionStateData data});

  @override
  $HandlesConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$HandlesConnectionInitialImplCopyWithImpl<$Res>
    extends _$HandlesConnectionStateCopyWithImpl<$Res,
        _$HandlesConnectionInitialImpl>
    implements _$$HandlesConnectionInitialImplCopyWith<$Res> {
  __$$HandlesConnectionInitialImplCopyWithImpl(
      _$HandlesConnectionInitialImpl _value,
      $Res Function(_$HandlesConnectionInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$HandlesConnectionInitialImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HandlesConnectionStateData,
    ));
  }
}

/// @nodoc

class _$HandlesConnectionInitialImpl implements _HandlesConnectionInitial {
  const _$HandlesConnectionInitialImpl(this.data);

  @override
  final HandlesConnectionStateData data;

  @override
  String toString() {
    return 'HandlesConnectionState.handlesConnectionInitial(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HandlesConnectionInitialImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HandlesConnectionInitialImplCopyWith<_$HandlesConnectionInitialImpl>
      get copyWith => __$$HandlesConnectionInitialImplCopyWithImpl<
          _$HandlesConnectionInitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HandlesConnectionStateData data)
        handlesConnectionInitial,
    required TResult Function(HandlesConnectionStateData data) connecting,
    required TResult Function(HandlesConnectionStateData data) connected,
    required TResult Function(HandlesConnectionStateData data) connectionFailed,
    required TResult Function(HandlesConnectionStateData data) disconnecting,
    required TResult Function(HandlesConnectionStateData data) disconnected,
    required TResult Function(HandlesConnectionStateData data)
        disconnectionFailed,
  }) {
    return handlesConnectionInitial(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandlesConnectionStateData data)?
        handlesConnectionInitial,
    TResult? Function(HandlesConnectionStateData data)? connecting,
    TResult? Function(HandlesConnectionStateData data)? connected,
    TResult? Function(HandlesConnectionStateData data)? connectionFailed,
    TResult? Function(HandlesConnectionStateData data)? disconnecting,
    TResult? Function(HandlesConnectionStateData data)? disconnected,
    TResult? Function(HandlesConnectionStateData data)? disconnectionFailed,
  }) {
    return handlesConnectionInitial?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandlesConnectionStateData data)? handlesConnectionInitial,
    TResult Function(HandlesConnectionStateData data)? connecting,
    TResult Function(HandlesConnectionStateData data)? connected,
    TResult Function(HandlesConnectionStateData data)? connectionFailed,
    TResult Function(HandlesConnectionStateData data)? disconnecting,
    TResult Function(HandlesConnectionStateData data)? disconnected,
    TResult Function(HandlesConnectionStateData data)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (handlesConnectionInitial != null) {
      return handlesConnectionInitial(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HandlesConnectionInitial value)
        handlesConnectionInitial,
    required TResult Function(Connecting value) connecting,
    required TResult Function(Connected value) connected,
    required TResult Function(ConnectionFailed value) connectionFailed,
    required TResult Function(Disconnecting value) disconnecting,
    required TResult Function(Disconnected value) disconnected,
    required TResult Function(DisconnectionFailed value) disconnectionFailed,
  }) {
    return handlesConnectionInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HandlesConnectionInitial value)?
        handlesConnectionInitial,
    TResult? Function(Connecting value)? connecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(ConnectionFailed value)? connectionFailed,
    TResult? Function(Disconnecting value)? disconnecting,
    TResult? Function(Disconnected value)? disconnected,
    TResult? Function(DisconnectionFailed value)? disconnectionFailed,
  }) {
    return handlesConnectionInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HandlesConnectionInitial value)? handlesConnectionInitial,
    TResult Function(Connecting value)? connecting,
    TResult Function(Connected value)? connected,
    TResult Function(ConnectionFailed value)? connectionFailed,
    TResult Function(Disconnecting value)? disconnecting,
    TResult Function(Disconnected value)? disconnected,
    TResult Function(DisconnectionFailed value)? disconnectionFailed,
    required TResult orElse(),
  }) {
    if (handlesConnectionInitial != null) {
      return handlesConnectionInitial(this);
    }
    return orElse();
  }
}

abstract class _HandlesConnectionInitial implements HandlesConnectionState {
  const factory _HandlesConnectionInitial(
      final HandlesConnectionStateData data) = _$HandlesConnectionInitialImpl;

  @override
  HandlesConnectionStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$HandlesConnectionInitialImplCopyWith<_$HandlesConnectionInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectingImplCopyWith<$Res>
    implements $HandlesConnectionStateCopyWith<$Res> {
  factory _$$ConnectingImplCopyWith(
          _$ConnectingImpl value, $Res Function(_$ConnectingImpl) then) =
      __$$ConnectingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HandlesConnectionStateData data});

  @override
  $HandlesConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ConnectingImplCopyWithImpl<$Res>
    extends _$HandlesConnectionStateCopyWithImpl<$Res, _$ConnectingImpl>
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
              as HandlesConnectionStateData,
    ));
  }
}

/// @nodoc

class _$ConnectingImpl implements Connecting {
  const _$ConnectingImpl(this.data);

  @override
  final HandlesConnectionStateData data;

  @override
  String toString() {
    return 'HandlesConnectionState.connecting(data: $data)';
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
    required TResult Function(HandlesConnectionStateData data)
        handlesConnectionInitial,
    required TResult Function(HandlesConnectionStateData data) connecting,
    required TResult Function(HandlesConnectionStateData data) connected,
    required TResult Function(HandlesConnectionStateData data) connectionFailed,
    required TResult Function(HandlesConnectionStateData data) disconnecting,
    required TResult Function(HandlesConnectionStateData data) disconnected,
    required TResult Function(HandlesConnectionStateData data)
        disconnectionFailed,
  }) {
    return connecting(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandlesConnectionStateData data)?
        handlesConnectionInitial,
    TResult? Function(HandlesConnectionStateData data)? connecting,
    TResult? Function(HandlesConnectionStateData data)? connected,
    TResult? Function(HandlesConnectionStateData data)? connectionFailed,
    TResult? Function(HandlesConnectionStateData data)? disconnecting,
    TResult? Function(HandlesConnectionStateData data)? disconnected,
    TResult? Function(HandlesConnectionStateData data)? disconnectionFailed,
  }) {
    return connecting?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandlesConnectionStateData data)? handlesConnectionInitial,
    TResult Function(HandlesConnectionStateData data)? connecting,
    TResult Function(HandlesConnectionStateData data)? connected,
    TResult Function(HandlesConnectionStateData data)? connectionFailed,
    TResult Function(HandlesConnectionStateData data)? disconnecting,
    TResult Function(HandlesConnectionStateData data)? disconnected,
    TResult Function(HandlesConnectionStateData data)? disconnectionFailed,
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
    required TResult Function(_HandlesConnectionInitial value)
        handlesConnectionInitial,
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
    TResult? Function(_HandlesConnectionInitial value)?
        handlesConnectionInitial,
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
    TResult Function(_HandlesConnectionInitial value)? handlesConnectionInitial,
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

abstract class Connecting implements HandlesConnectionState {
  const factory Connecting(final HandlesConnectionStateData data) =
      _$ConnectingImpl;

  @override
  HandlesConnectionStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$ConnectingImplCopyWith<_$ConnectingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectedImplCopyWith<$Res>
    implements $HandlesConnectionStateCopyWith<$Res> {
  factory _$$ConnectedImplCopyWith(
          _$ConnectedImpl value, $Res Function(_$ConnectedImpl) then) =
      __$$ConnectedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HandlesConnectionStateData data});

  @override
  $HandlesConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ConnectedImplCopyWithImpl<$Res>
    extends _$HandlesConnectionStateCopyWithImpl<$Res, _$ConnectedImpl>
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
              as HandlesConnectionStateData,
    ));
  }
}

/// @nodoc

class _$ConnectedImpl implements Connected {
  const _$ConnectedImpl(this.data);

  @override
  final HandlesConnectionStateData data;

  @override
  String toString() {
    return 'HandlesConnectionState.connected(data: $data)';
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
    required TResult Function(HandlesConnectionStateData data)
        handlesConnectionInitial,
    required TResult Function(HandlesConnectionStateData data) connecting,
    required TResult Function(HandlesConnectionStateData data) connected,
    required TResult Function(HandlesConnectionStateData data) connectionFailed,
    required TResult Function(HandlesConnectionStateData data) disconnecting,
    required TResult Function(HandlesConnectionStateData data) disconnected,
    required TResult Function(HandlesConnectionStateData data)
        disconnectionFailed,
  }) {
    return connected(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandlesConnectionStateData data)?
        handlesConnectionInitial,
    TResult? Function(HandlesConnectionStateData data)? connecting,
    TResult? Function(HandlesConnectionStateData data)? connected,
    TResult? Function(HandlesConnectionStateData data)? connectionFailed,
    TResult? Function(HandlesConnectionStateData data)? disconnecting,
    TResult? Function(HandlesConnectionStateData data)? disconnected,
    TResult? Function(HandlesConnectionStateData data)? disconnectionFailed,
  }) {
    return connected?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandlesConnectionStateData data)? handlesConnectionInitial,
    TResult Function(HandlesConnectionStateData data)? connecting,
    TResult Function(HandlesConnectionStateData data)? connected,
    TResult Function(HandlesConnectionStateData data)? connectionFailed,
    TResult Function(HandlesConnectionStateData data)? disconnecting,
    TResult Function(HandlesConnectionStateData data)? disconnected,
    TResult Function(HandlesConnectionStateData data)? disconnectionFailed,
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
    required TResult Function(_HandlesConnectionInitial value)
        handlesConnectionInitial,
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
    TResult? Function(_HandlesConnectionInitial value)?
        handlesConnectionInitial,
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
    TResult Function(_HandlesConnectionInitial value)? handlesConnectionInitial,
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

abstract class Connected implements HandlesConnectionState {
  const factory Connected(final HandlesConnectionStateData data) =
      _$ConnectedImpl;

  @override
  HandlesConnectionStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectionFailedImplCopyWith<$Res>
    implements $HandlesConnectionStateCopyWith<$Res> {
  factory _$$ConnectionFailedImplCopyWith(_$ConnectionFailedImpl value,
          $Res Function(_$ConnectionFailedImpl) then) =
      __$$ConnectionFailedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HandlesConnectionStateData data});

  @override
  $HandlesConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ConnectionFailedImplCopyWithImpl<$Res>
    extends _$HandlesConnectionStateCopyWithImpl<$Res, _$ConnectionFailedImpl>
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
              as HandlesConnectionStateData,
    ));
  }
}

/// @nodoc

class _$ConnectionFailedImpl implements ConnectionFailed {
  const _$ConnectionFailedImpl(this.data);

  @override
  final HandlesConnectionStateData data;

  @override
  String toString() {
    return 'HandlesConnectionState.connectionFailed(data: $data)';
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
    required TResult Function(HandlesConnectionStateData data)
        handlesConnectionInitial,
    required TResult Function(HandlesConnectionStateData data) connecting,
    required TResult Function(HandlesConnectionStateData data) connected,
    required TResult Function(HandlesConnectionStateData data) connectionFailed,
    required TResult Function(HandlesConnectionStateData data) disconnecting,
    required TResult Function(HandlesConnectionStateData data) disconnected,
    required TResult Function(HandlesConnectionStateData data)
        disconnectionFailed,
  }) {
    return connectionFailed(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandlesConnectionStateData data)?
        handlesConnectionInitial,
    TResult? Function(HandlesConnectionStateData data)? connecting,
    TResult? Function(HandlesConnectionStateData data)? connected,
    TResult? Function(HandlesConnectionStateData data)? connectionFailed,
    TResult? Function(HandlesConnectionStateData data)? disconnecting,
    TResult? Function(HandlesConnectionStateData data)? disconnected,
    TResult? Function(HandlesConnectionStateData data)? disconnectionFailed,
  }) {
    return connectionFailed?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandlesConnectionStateData data)? handlesConnectionInitial,
    TResult Function(HandlesConnectionStateData data)? connecting,
    TResult Function(HandlesConnectionStateData data)? connected,
    TResult Function(HandlesConnectionStateData data)? connectionFailed,
    TResult Function(HandlesConnectionStateData data)? disconnecting,
    TResult Function(HandlesConnectionStateData data)? disconnected,
    TResult Function(HandlesConnectionStateData data)? disconnectionFailed,
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
    required TResult Function(_HandlesConnectionInitial value)
        handlesConnectionInitial,
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
    TResult? Function(_HandlesConnectionInitial value)?
        handlesConnectionInitial,
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
    TResult Function(_HandlesConnectionInitial value)? handlesConnectionInitial,
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

abstract class ConnectionFailed implements HandlesConnectionState {
  const factory ConnectionFailed(final HandlesConnectionStateData data) =
      _$ConnectionFailedImpl;

  @override
  HandlesConnectionStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$ConnectionFailedImplCopyWith<_$ConnectionFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisconnectingImplCopyWith<$Res>
    implements $HandlesConnectionStateCopyWith<$Res> {
  factory _$$DisconnectingImplCopyWith(
          _$DisconnectingImpl value, $Res Function(_$DisconnectingImpl) then) =
      __$$DisconnectingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HandlesConnectionStateData data});

  @override
  $HandlesConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$DisconnectingImplCopyWithImpl<$Res>
    extends _$HandlesConnectionStateCopyWithImpl<$Res, _$DisconnectingImpl>
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
              as HandlesConnectionStateData,
    ));
  }
}

/// @nodoc

class _$DisconnectingImpl implements Disconnecting {
  const _$DisconnectingImpl(this.data);

  @override
  final HandlesConnectionStateData data;

  @override
  String toString() {
    return 'HandlesConnectionState.disconnecting(data: $data)';
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
    required TResult Function(HandlesConnectionStateData data)
        handlesConnectionInitial,
    required TResult Function(HandlesConnectionStateData data) connecting,
    required TResult Function(HandlesConnectionStateData data) connected,
    required TResult Function(HandlesConnectionStateData data) connectionFailed,
    required TResult Function(HandlesConnectionStateData data) disconnecting,
    required TResult Function(HandlesConnectionStateData data) disconnected,
    required TResult Function(HandlesConnectionStateData data)
        disconnectionFailed,
  }) {
    return disconnecting(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandlesConnectionStateData data)?
        handlesConnectionInitial,
    TResult? Function(HandlesConnectionStateData data)? connecting,
    TResult? Function(HandlesConnectionStateData data)? connected,
    TResult? Function(HandlesConnectionStateData data)? connectionFailed,
    TResult? Function(HandlesConnectionStateData data)? disconnecting,
    TResult? Function(HandlesConnectionStateData data)? disconnected,
    TResult? Function(HandlesConnectionStateData data)? disconnectionFailed,
  }) {
    return disconnecting?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandlesConnectionStateData data)? handlesConnectionInitial,
    TResult Function(HandlesConnectionStateData data)? connecting,
    TResult Function(HandlesConnectionStateData data)? connected,
    TResult Function(HandlesConnectionStateData data)? connectionFailed,
    TResult Function(HandlesConnectionStateData data)? disconnecting,
    TResult Function(HandlesConnectionStateData data)? disconnected,
    TResult Function(HandlesConnectionStateData data)? disconnectionFailed,
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
    required TResult Function(_HandlesConnectionInitial value)
        handlesConnectionInitial,
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
    TResult? Function(_HandlesConnectionInitial value)?
        handlesConnectionInitial,
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
    TResult Function(_HandlesConnectionInitial value)? handlesConnectionInitial,
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

abstract class Disconnecting implements HandlesConnectionState {
  const factory Disconnecting(final HandlesConnectionStateData data) =
      _$DisconnectingImpl;

  @override
  HandlesConnectionStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$DisconnectingImplCopyWith<_$DisconnectingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisconnectedImplCopyWith<$Res>
    implements $HandlesConnectionStateCopyWith<$Res> {
  factory _$$DisconnectedImplCopyWith(
          _$DisconnectedImpl value, $Res Function(_$DisconnectedImpl) then) =
      __$$DisconnectedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HandlesConnectionStateData data});

  @override
  $HandlesConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$DisconnectedImplCopyWithImpl<$Res>
    extends _$HandlesConnectionStateCopyWithImpl<$Res, _$DisconnectedImpl>
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
              as HandlesConnectionStateData,
    ));
  }
}

/// @nodoc

class _$DisconnectedImpl implements Disconnected {
  const _$DisconnectedImpl(this.data);

  @override
  final HandlesConnectionStateData data;

  @override
  String toString() {
    return 'HandlesConnectionState.disconnected(data: $data)';
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
    required TResult Function(HandlesConnectionStateData data)
        handlesConnectionInitial,
    required TResult Function(HandlesConnectionStateData data) connecting,
    required TResult Function(HandlesConnectionStateData data) connected,
    required TResult Function(HandlesConnectionStateData data) connectionFailed,
    required TResult Function(HandlesConnectionStateData data) disconnecting,
    required TResult Function(HandlesConnectionStateData data) disconnected,
    required TResult Function(HandlesConnectionStateData data)
        disconnectionFailed,
  }) {
    return disconnected(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandlesConnectionStateData data)?
        handlesConnectionInitial,
    TResult? Function(HandlesConnectionStateData data)? connecting,
    TResult? Function(HandlesConnectionStateData data)? connected,
    TResult? Function(HandlesConnectionStateData data)? connectionFailed,
    TResult? Function(HandlesConnectionStateData data)? disconnecting,
    TResult? Function(HandlesConnectionStateData data)? disconnected,
    TResult? Function(HandlesConnectionStateData data)? disconnectionFailed,
  }) {
    return disconnected?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandlesConnectionStateData data)? handlesConnectionInitial,
    TResult Function(HandlesConnectionStateData data)? connecting,
    TResult Function(HandlesConnectionStateData data)? connected,
    TResult Function(HandlesConnectionStateData data)? connectionFailed,
    TResult Function(HandlesConnectionStateData data)? disconnecting,
    TResult Function(HandlesConnectionStateData data)? disconnected,
    TResult Function(HandlesConnectionStateData data)? disconnectionFailed,
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
    required TResult Function(_HandlesConnectionInitial value)
        handlesConnectionInitial,
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
    TResult? Function(_HandlesConnectionInitial value)?
        handlesConnectionInitial,
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
    TResult Function(_HandlesConnectionInitial value)? handlesConnectionInitial,
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

abstract class Disconnected implements HandlesConnectionState {
  const factory Disconnected(final HandlesConnectionStateData data) =
      _$DisconnectedImpl;

  @override
  HandlesConnectionStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$DisconnectedImplCopyWith<_$DisconnectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisconnectionFailedImplCopyWith<$Res>
    implements $HandlesConnectionStateCopyWith<$Res> {
  factory _$$DisconnectionFailedImplCopyWith(_$DisconnectionFailedImpl value,
          $Res Function(_$DisconnectionFailedImpl) then) =
      __$$DisconnectionFailedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HandlesConnectionStateData data});

  @override
  $HandlesConnectionStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$DisconnectionFailedImplCopyWithImpl<$Res>
    extends _$HandlesConnectionStateCopyWithImpl<$Res,
        _$DisconnectionFailedImpl>
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
              as HandlesConnectionStateData,
    ));
  }
}

/// @nodoc

class _$DisconnectionFailedImpl implements DisconnectionFailed {
  const _$DisconnectionFailedImpl(this.data);

  @override
  final HandlesConnectionStateData data;

  @override
  String toString() {
    return 'HandlesConnectionState.disconnectionFailed(data: $data)';
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
    required TResult Function(HandlesConnectionStateData data)
        handlesConnectionInitial,
    required TResult Function(HandlesConnectionStateData data) connecting,
    required TResult Function(HandlesConnectionStateData data) connected,
    required TResult Function(HandlesConnectionStateData data) connectionFailed,
    required TResult Function(HandlesConnectionStateData data) disconnecting,
    required TResult Function(HandlesConnectionStateData data) disconnected,
    required TResult Function(HandlesConnectionStateData data)
        disconnectionFailed,
  }) {
    return disconnectionFailed(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HandlesConnectionStateData data)?
        handlesConnectionInitial,
    TResult? Function(HandlesConnectionStateData data)? connecting,
    TResult? Function(HandlesConnectionStateData data)? connected,
    TResult? Function(HandlesConnectionStateData data)? connectionFailed,
    TResult? Function(HandlesConnectionStateData data)? disconnecting,
    TResult? Function(HandlesConnectionStateData data)? disconnected,
    TResult? Function(HandlesConnectionStateData data)? disconnectionFailed,
  }) {
    return disconnectionFailed?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HandlesConnectionStateData data)? handlesConnectionInitial,
    TResult Function(HandlesConnectionStateData data)? connecting,
    TResult Function(HandlesConnectionStateData data)? connected,
    TResult Function(HandlesConnectionStateData data)? connectionFailed,
    TResult Function(HandlesConnectionStateData data)? disconnecting,
    TResult Function(HandlesConnectionStateData data)? disconnected,
    TResult Function(HandlesConnectionStateData data)? disconnectionFailed,
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
    required TResult Function(_HandlesConnectionInitial value)
        handlesConnectionInitial,
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
    TResult? Function(_HandlesConnectionInitial value)?
        handlesConnectionInitial,
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
    TResult Function(_HandlesConnectionInitial value)? handlesConnectionInitial,
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

abstract class DisconnectionFailed implements HandlesConnectionState {
  const factory DisconnectionFailed(final HandlesConnectionStateData data) =
      _$DisconnectionFailedImpl;

  @override
  HandlesConnectionStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$DisconnectionFailedImplCopyWith<_$DisconnectionFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
