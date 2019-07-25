package com.miui.gallery.util.portJava;

public abstract class RectangularShape implements Cloneable {
    protected RectangularShape() {
    }

    public Object clone() {
        try {
            return super.clone();
        } catch (CloneNotSupportedException unused) {
            throw new InternalError();
        }
    }

    public Rectangle getBounds() {
        double width = getWidth();
        double height = getHeight();
        if (width < 0.0d || height < 0.0d) {
            return new Rectangle();
        }
        double x = getX();
        double y = getY();
        double floor = Math.floor(x);
        double floor2 = Math.floor(y);
        return new Rectangle((int) floor, (int) floor2, (int) (Math.ceil(x + width) - floor), (int) (Math.ceil(y + height) - floor2));
    }

    public abstract double getHeight();

    public abstract double getWidth();

    public abstract double getX();

    public abstract double getY();
}
