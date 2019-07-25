package com.miui.gallery.util.portJava;

import java.io.Serializable;

public class Rectangle extends Rectangle2D implements Serializable {
    private static final long serialVersionUID = -4345857070255674764L;
    public int height;
    public int width;
    public int x;
    public int y;

    public Rectangle() {
        this(0, 0, 0, 0);
    }

    public Rectangle(int i, int i2, int i3, int i4) {
        this.x = i;
        this.y = i2;
        this.width = i3;
        this.height = i4;
    }

    public boolean contains(int i, int i2) {
        return inside(i, i2);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof Rectangle)) {
            return super.equals(obj);
        }
        Rectangle rectangle = (Rectangle) obj;
        return this.x == rectangle.x && this.y == rectangle.y && this.width == rectangle.width && this.height == rectangle.height;
    }

    public Rectangle getBounds() {
        return new Rectangle(this.x, this.y, this.width, this.height);
    }

    public double getHeight() {
        return (double) this.height;
    }

    public double getWidth() {
        return (double) this.width;
    }

    public double getX() {
        return (double) this.x;
    }

    public double getY() {
        return (double) this.y;
    }

    @Deprecated
    public boolean inside(int i, int i2) {
        int i3 = this.width;
        int i4 = this.height;
        boolean z = false;
        if ((i3 | i4) < 0) {
            return false;
        }
        int i5 = this.x;
        int i6 = this.y;
        if (i < i5 || i2 < i6) {
            return false;
        }
        int i7 = i3 + i5;
        int i8 = i4 + i6;
        if ((i7 < i5 || i7 > i) && (i8 < i6 || i8 > i2)) {
            z = true;
        }
        return z;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getName());
        sb.append("[x=");
        sb.append(this.x);
        sb.append(",y=");
        sb.append(this.y);
        sb.append(",width=");
        sb.append(this.width);
        sb.append(",height=");
        sb.append(this.height);
        sb.append("]");
        return sb.toString();
    }
}
