package com.google.common.cache;

import com.google.common.collect.ForwardingObject;

public abstract class ForwardingCache<K, V> extends ForwardingObject implements Cache<K, V> {
    protected ForwardingCache() {
    }

    public void cleanUp() {
        delegate().cleanUp();
    }

    /* access modifiers changed from: protected */
    public abstract Cache<K, V> delegate();

    public V getIfPresent(Object obj) {
        return delegate().getIfPresent(obj);
    }

    public void invalidateAll() {
        delegate().invalidateAll();
    }

    public void put(K k, V v) {
        delegate().put(k, v);
    }
}
