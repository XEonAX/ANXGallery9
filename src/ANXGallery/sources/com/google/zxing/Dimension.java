package com.google.zxing;

public final class Dimension {
    private final int height;
    private final int width;

    public boolean equals(Object obj) {
        if (!(obj instanceof Dimension)) {
            return false;
        }
        Dimension dimension = (Dimension) obj;
        return this.width == dimension.width && this.height == dimension.height;
    }

    public int getHeight() {
        return this.height;
    }

    public int getWidth() {
        return this.width;
    }

    public int hashCode() {
        return (this.width * 32713) + this.height;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(String.valueOf(this.width));
        sb.append("x");
        sb.append(this.height);
        return sb.toString();
    }
}
