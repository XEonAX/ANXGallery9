package com.miui.gallery.util;

public class OptionalResult<T> {
    private final T result;

    public OptionalResult(T t) {
        this.result = t;
    }

    public T getIncludeNull() {
        return this.result;
    }
}
