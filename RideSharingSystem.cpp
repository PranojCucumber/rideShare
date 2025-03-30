#include <iostream>
#include <vector>
using namespace std;

class Ride {
protected:
    int rideID;
    string pickupLocation, dropoffLocation;
    double distance, fare;
public:
    Ride(int id, string pickup, string dropoff, double dist) 
        : rideID(id), pickupLocation(pickup), dropoffLocation(dropoff), distance(dist) {}

    virtual double calculateFare() = 0; // Polymorphic method
    virtual void rideDetails() {
        cout << "Ride ID: " << rideID << ", From: " << pickupLocation 
             << " to " << dropoffLocation << ", Distance: " << distance << " miles.\n";
    }
};

class StandardRide : public Ride {
public:
    StandardRide(int id, string pickup, string dropoff, double dist) : Ride(id, pickup, dropoff, dist) {}
    
    double calculateFare() override {
        return distance * 2.0; // Standard rate per mile
    }
};

class PremiumRide : public Ride {
public:
    PremiumRide(int id, string pickup, string dropoff, double dist) : Ride(id, pickup, dropoff, dist) {}

    double calculateFare() override {
        return distance * 3.5; // Premium rate per mile
    }
};

class Driver {
private:
    vector<Ride*> assignedRides;
public:
    string driverID, name;
    double rating;

    Driver(string id, string driverName, double rate) : driverID(id), name(driverName), rating(rate) {}

    void addRide(Ride* ride) {
        assignedRides.push_back(ride);
    }

    void getDriverInfo() {
        cout << "Driver ID: " << driverID << ", Name: " << name << ", Rating: " << rating << "\n";
        cout << "Assigned Rides:\n";
        for (Ride* r : assignedRides) {
            r->rideDetails();
        }
    }
};

class Rider {
public:
    string riderID, name;
    vector<Ride*> requestedRides;

    Rider(string id, string riderName) : riderID(id), name(riderName) {}

    void requestRide(Ride* ride) {
        requestedRides.push_back(ride);
    }

    void viewRides() {
        cout << "Rider " << name << "'s requested rides:\n";
        for (Ride* r : requestedRides) {
            r->rideDetails();
            cout << "Fare: $" << r->calculateFare() << "\n";
        }
    }
};

// Main function for testing
int main() {
    Rider rider1("R123", "Alice");
    Driver driver1("D456", "Bob", 4.8);

    Ride* ride1 = new StandardRide(1, "A", "B", 10);
    Ride* ride2 = new PremiumRide(2, "X", "Y", 15);

    rider1.requestRide(ride1);
    rider1.requestRide(ride2);
    driver1.addRide(ride1);
    driver1.addRide(ride2);

    cout << "=== Rider's Rides ===\n";
    rider1.viewRides();

    cout << "\n=== Driver Info ===\n";
    driver1.getDriverInfo();

    delete ride1;
    delete ride2;
    return 0;
}
