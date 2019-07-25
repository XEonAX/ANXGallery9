package com.edmodo.cropper.cropwindow.edge;

public class EdgePair {
    public Edge primary;
    public Edge secondary;

    public EdgePair(Edge edge, Edge edge2) {
        this.primary = edge;
        this.secondary = edge2;
    }
}
