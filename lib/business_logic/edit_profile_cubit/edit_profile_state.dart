part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class GetImageSuccesEditState extends EditProfileState{}

class UserProfileLoadingState extends EditProfileState{}

class UserProfileSucessState extends EditProfileState{}

class UserProfileErorrState extends EditProfileState{}

class GetCitiesDataSuccess extends EditProfileState{}

class GetCitiesDataErorr extends EditProfileState{}

class SelectChoiceSuccessState extends EditProfileState{}
