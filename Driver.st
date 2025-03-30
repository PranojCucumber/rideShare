Object subclass: #Driver
    instanceVariableNames: 'driverID name rating assignedRides'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'.

Driver >> initializeWithID: anID name: aName rating: aRating [
    driverID := anID.
    name := aName.
    rating := aRating.
    assignedRides := OrderedCollection new.
]

Driver >> addRide: aRide [
    assignedRides add: aRide.
]

Driver >> getDriverInfo [
    ^ 'Driver ID: ', driverID asString, ' Name: ', name, 
      ' Rating: ', rating asString, ' Rides: ', assignedRides size asString.
]
