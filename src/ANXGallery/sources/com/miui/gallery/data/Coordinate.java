package com.miui.gallery.data;

class Coordinate {
    public double latitude;
    public double longitude;

    public Coordinate(double d, double d2) {
        this.latitude = d;
        this.longitude = d2;
    }

    public Coordinate(String str, String str2, String str3, String str4) {
        this.latitude = LocationUtil.convertRationalLatLonToDouble(str, str2);
        this.longitude = LocationUtil.convertRationalLatLonToDouble(str3, str4);
    }

    public boolean isValid() {
        return LocationUtil.isValidateCoordinate(this.latitude, this.longitude);
    }
}
