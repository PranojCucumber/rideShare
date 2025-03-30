Object subclass: #Rider
    instanceVariableNames: 'riderID name requestedRides'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'.

Rider >> initializeWithID: anID name: aName [
    riderID := anID.
    name := aName.
    requestedRides := OrderedCollection new.
]

Rider >> requestRide: aRide [
    requestedRides add: aRide.
]

Rider >> viewRides [
    ^ requestedRides collect: [:ride | ride rideDetails].
]
