package com.miui.gallery.util.portJava;

public abstract class Rectangle2D extends RectangularShape {
    protected Rectangle2D() {
    }

    public boolean contains(double d, double d2) {
        double x = getX();
        double y = getY();
        return d >= x && d2 >= y && d < x + getWidth() && d2 < y + getHeight();
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof Rectangle2D)) {
            return false;
        }
        Rectangle2D rectangle2D = (Rectangle2D) obj;
        if (!(getX() == rectangle2D.getX() && getY() == rectangle2D.getY() && getWidth() == rectangle2D.getWidth() && getHeight() == rectangle2D.getHeight())) {
            z = false;
        }
        return z;
    }

    public int hashCode() {
        long doubleToLongBits = Double.doubleToLongBits(getX()) + (Double.doubleToLongBits(getY()) * 37) + (Double.doubleToLongBits(getWidth()) * 43) + (Double.doubleToLongBits(getHeight()) * 47);
        return ((int) (doubleToLongBits >> 32)) ^ ((int) doubleToLongBits);
    }
}
