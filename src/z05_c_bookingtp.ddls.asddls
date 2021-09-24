@AbapCatalog.sqlViewName: 'Z05CBOOKTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Exercise 5 Booking consumption'
@VDM.viewType: #CONSUMPTION
@Metadata: {
    allowExtensions: true
}
@OData.publish: true
@ObjectModel: {
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    semanticKey: ['BookingNumber', 'AirlineID', 'ConnectionNumber', 'FlightDate']
}
define view Z05_C_BOOKINGTP as select from DS4_I_BOOKINGTP
association [1] to Z05_C_CUSTOMERTP as _Customer
    on $projection.CustomerGuid = _Customer.CustomerGuid {
    key DS4_I_BOOKINGTP.BookingGuid,
    DS4_I_BOOKINGTP.AirlineID,
    DS4_I_BOOKINGTP.ConnectionNumber,
    DS4_I_BOOKINGTP.FlightDate,
    DS4_I_BOOKINGTP.BookingNumber,
    DS4_I_BOOKINGTP.BookingDate,
    DS4_I_BOOKINGTP.Class,
    DS4_I_BOOKINGTP.ForeignCurrencyPayment,
    DS4_I_BOOKINGTP.ForeignCurrency,
    DS4_I_BOOKINGTP.AgencyNumber,
    DS4_I_BOOKINGTP.CustomerGuid,
    DS4_I_BOOKINGTP.IsCancelled,
    @ObjectModel: {
        association: {
            type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
        }
    }
    _Customer
}
