package com.google.common.util.concurrent;

public final class SettableFuture<V> extends TrustedFuture<V> {
    private SettableFuture() {
    }

    public static <V> SettableFuture<V> create() {
        return new SettableFuture<>();
    }

    public boolean set(V v) {
        return super.set(v);
    }

    public boolean setException(Throwable th) {
        return super.setException(th);
    }
}
