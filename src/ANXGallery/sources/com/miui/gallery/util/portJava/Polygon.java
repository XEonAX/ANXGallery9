package com.miui.gallery.util.portJava;

import java.io.Serializable;

public class Polygon implements Serializable {
    private static final long serialVersionUID = -6460061437900069969L;
    protected Rectangle bounds;
    public int npoints;
    public int[] xpoints;
    public int[] ypoints;

    /* access modifiers changed from: 0000 */
    public void calculateBounds(int[] iArr, int[] iArr2, int i) {
        int i2 = Integer.MIN_VALUE;
        int i3 = Integer.MAX_VALUE;
        int i4 = Integer.MAX_VALUE;
        int i5 = Integer.MIN_VALUE;
        for (int i6 = 0; i6 < i; i6++) {
            int i7 = iArr[i6];
            i3 = Math.min(i3, i7);
            i2 = Math.max(i2, i7);
            int i8 = iArr2[i6];
            i4 = Math.min(i4, i8);
            i5 = Math.max(i5, i8);
        }
        this.bounds = new Rectangle(i3, i4, i2 - i3, i5 - i4);
    }

    public boolean contains(double d, double d2) {
        int i;
        int i2;
        double d3;
        double d4;
        double d5 = d;
        double d6 = d2;
        if (this.npoints <= 2 || !getBoundingBox().contains(d5, d6)) {
            return false;
        }
        int i3 = this.xpoints[this.npoints - 1];
        int i4 = this.ypoints[this.npoints - 1];
        int i5 = i3;
        int i6 = 0;
        int i7 = 0;
        while (i6 < this.npoints) {
            int i8 = this.xpoints[i6];
            int i9 = this.ypoints[i6];
            if (i9 != i4) {
                if (i8 < i5) {
                    if (d5 < ((double) i5)) {
                        i2 = i8;
                    }
                } else if (d5 < ((double) i8)) {
                    i2 = i5;
                }
                if (i9 < i4) {
                    double d7 = (double) i9;
                    if (d6 >= d7) {
                        i = i7;
                        if (d6 < ((double) i4)) {
                            if (d5 < ((double) i2)) {
                                i7 = i + 1;
                                i6++;
                                i5 = i8;
                                i4 = i9;
                            } else {
                                double d8 = (double) i8;
                                Double.isNaN(d8);
                                double d9 = d5 - d8;
                                Double.isNaN(d7);
                                double d10 = d9;
                                d4 = d6 - d7;
                                d3 = d10;
                            }
                        }
                        i7 = i;
                        i6++;
                        i5 = i8;
                        i4 = i9;
                    }
                } else {
                    i = i7;
                    double d11 = (double) i4;
                    if (d6 >= d11 && d6 < ((double) i9)) {
                        if (d5 < ((double) i2)) {
                            i7 = i + 1;
                            i6++;
                            i5 = i8;
                            i4 = i9;
                        } else {
                            double d12 = (double) i5;
                            Double.isNaN(d12);
                            d3 = d5 - d12;
                            Double.isNaN(d11);
                            d4 = d6 - d11;
                        }
                    }
                    i7 = i;
                    i6++;
                    i5 = i8;
                    i4 = i9;
                }
                double d13 = (double) (i4 - i9);
                Double.isNaN(d13);
                double d14 = d4 / d13;
                double d15 = (double) (i5 - i8);
                Double.isNaN(d15);
                if (d3 < d14 * d15) {
                    i7 = i + 1;
                    i6++;
                    i5 = i8;
                    i4 = i9;
                }
                i7 = i;
                i6++;
                i5 = i8;
                i4 = i9;
            }
            i = i7;
            i7 = i;
            i6++;
            i5 = i8;
            i4 = i9;
        }
        return (i7 & 1) != 0;
    }

    public boolean contains(int i, int i2) {
        return contains((double) i, (double) i2);
    }

    @Deprecated
    public Rectangle getBoundingBox() {
        if (this.npoints == 0) {
            return new Rectangle();
        }
        if (this.bounds == null) {
            calculateBounds(this.xpoints, this.ypoints, this.npoints);
        }
        return this.bounds.getBounds();
    }
}
