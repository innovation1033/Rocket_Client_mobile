part of 'caluclate_shipment_cubit.dart';

@immutable
abstract class CaluclateShipmentState {}

class CaluclateShipmentInitial extends CaluclateShipmentState {}

class SuccessAddToProductList extends CaluclateShipmentState {}

class SuccessDeleteProductFromList  extends CaluclateShipmentState {}

class GetCitiesDataSuccess  extends CaluclateShipmentState {}

class GetCitiesDataErorr  extends CaluclateShipmentState {}

class SucessCalculateShipmentsState  extends CaluclateShipmentState {}

class ErorrCalculateShipmentsState  extends CaluclateShipmentState {}

class SelectChoiceSuccessState  extends CaluclateShipmentState {}

class BrokeState  extends CaluclateShipmentState {}

class  SucessGetCarsState extends CaluclateShipmentState {}

class ErorrGetCarsState  extends CaluclateShipmentState {}

class getCarWeight  extends CaluclateShipmentState {}

class getRemainingState extends CaluclateShipmentState {}

class getTotalPriceState extends CaluclateShipmentState {}


class SucessResetData extends CaluclateShipmentState {}