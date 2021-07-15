abstract class SettingState{}
class SettingInitial extends SettingState{}
class SettingLoading extends SettingState{}
class SettingSuccess extends SettingState{}
class SettingError extends SettingState{
  final error;
  SettingError(this.error);
}