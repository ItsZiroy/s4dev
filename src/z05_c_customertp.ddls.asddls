@AbapCatalog.sqlViewName: 'Z05CCUSTTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exercise 5 consumption'
@VDM.viewType: #CONSUMPTION
@OData.publish: true

@ObjectModel: {
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    semanticKey: ['CustomerNumber'],
    compositionRoot: true,
    transactionalProcessingDelegated: true
}
@Metadata.allowExtensions: true
define view Z05_C_CUSTOMERTP
  as select from DS4_I_CUSTOMERTP
  association [*] to Z05_C_BOOKINGTP as _Booking on $projection.CustomerGuid = _Booking.CustomerGuid
{
  key CustomerGuid,
      CustomerNumber,
      Form,
      CustomerName,
      Street,
      PostCode,
      City,
      Country,
      Email,
      Telephone,
      Discount,
      // Associations
      @ObjectModel: {
          association: { type: [#TO_COMPOSITION_CHILD] }
      }
      _Booking
}
