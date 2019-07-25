package com.miui.gallery.util;

public class Gauss {
    private final double mCoefficient;
    private final double mExpDiv;
    private final double mMean;
    private final double mVariance;

    public Gauss(double d, double d2) {
        if (d2 >= 0.0d) {
            this.mMean = d;
            this.mVariance = d2;
            double d3 = d2 * 2.0d;
            this.mCoefficient = 1.0d / Math.sqrt(3.141592653589793d * d3);
            this.mExpDiv = d3;
            return;
        }
        throw new IllegalArgumentException("variance can't be negative");
    }

    /* access modifiers changed from: 0000 */
    public double value(double d) {
        return this.mCoefficient * Math.exp((-Math.pow(d - this.mMean, 2.0d)) / this.mExpDiv);
    }
}
