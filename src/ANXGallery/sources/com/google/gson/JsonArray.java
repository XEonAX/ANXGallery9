package com.google.gson;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public final class JsonArray extends JsonElement implements Iterable<JsonElement> {
    private final List<JsonElement> elements = new ArrayList();

    public void add(JsonElement jsonElement) {
        if (jsonElement == null) {
            jsonElement = JsonNull.INSTANCE;
        }
        this.elements.add(jsonElement);
    }

    public boolean equals(Object obj) {
        return obj == this || ((obj instanceof JsonArray) && ((JsonArray) obj).elements.equals(this.elements));
    }

    public boolean getAsBoolean() {
        if (this.elements.size() == 1) {
            return ((JsonElement) this.elements.get(0)).getAsBoolean();
        }
        throw new IllegalStateException();
    }

    public double getAsDouble() {
        if (this.elements.size() == 1) {
            return ((JsonElement) this.elements.get(0)).getAsDouble();
        }
        throw new IllegalStateException();
    }

    public int getAsInt() {
        if (this.elements.size() == 1) {
            return ((JsonElement) this.elements.get(0)).getAsInt();
        }
        throw new IllegalStateException();
    }

    public long getAsLong() {
        if (this.elements.size() == 1) {
            return ((JsonElement) this.elements.get(0)).getAsLong();
        }
        throw new IllegalStateException();
    }

    public Number getAsNumber() {
        if (this.elements.size() == 1) {
            return ((JsonElement) this.elements.get(0)).getAsNumber();
        }
        throw new IllegalStateException();
    }

    public String getAsString() {
        if (this.elements.size() == 1) {
            return ((JsonElement) this.elements.get(0)).getAsString();
        }
        throw new IllegalStateException();
    }

    public int hashCode() {
        return this.elements.hashCode();
    }

    public Iterator<JsonElement> iterator() {
        return this.elements.iterator();
    }
}
