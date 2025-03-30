Ride subclass: #PremiumRide
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'.

PremiumRide >> fare [
    fare := distance * 3.0.
    ^ fare.
]
