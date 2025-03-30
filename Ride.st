Object subclass: #Ride
    instanceVariableNames: 'rideID pickupLocation dropoffLocation distance fare'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'.

Ride >> initializeWithID: anID pickup: pickup dropoff: dropoff distance: aDistance [
    rideID := anID.
    pickupLocation := pickup.
    dropoffLocation := dropoff.
    distance := aDistance.
    fare := 0.
]

Ride >> fare [
    ^ fare.
]

Ride >> rideDetails [
    ^ 'Ride ID: ', rideID asString, ' Pickup: ', pickupLocation, 
      ' Dropoff: ', dropoffLocation, ' Distance: ', distance asString, 
      ' miles, Fare: $', fare asString.
]
