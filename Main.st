| ride1 ride2 driver rider ridesCollection |

"Create rides"
ride1 := StandardRide new initializeWithID: 1 pickup: 'Location A' dropoff: 'Location B' distance: 10.
ride2 := PremiumRide new initializeWithID: 2 pickup: 'Location C' dropoff: 'Location D' distance: 5.

"Calculate fares"
ride1 fare.
ride2 fare.

"Store rides in a collection for polymorphism demonstration"
ridesCollection := OrderedCollection new.
ridesCollection add: ride1.
ridesCollection add: ride2.

Transcript show: '=== Ride Details ==='; cr.
ridesCollection do: [:ride | Transcript show: ride rideDetails; cr.].

"Create driver"
driver := Driver new initializeWithID: 101 name: 'John Doe' rating: 4.9.
driver addRide: ride1.
driver addRide: ride2.

Transcript show: '=== Driver Details ==='; cr.
Transcript show: driver getDriverInfo; cr.

"Create rider"
rider := Rider new initializeWithID: 201 name: 'Alice' .
rider requestRide: ride1.
rider requestRide: ride2.

Transcript show: '=== Rider Ride History ==='; cr.
Transcript show: rider viewRides; cr.
