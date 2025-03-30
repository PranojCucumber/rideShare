Ride subclass: #StandardRide
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'.

StandardRide >> fare [
    fare := distance * 1.5.
    ^ fare.
]
