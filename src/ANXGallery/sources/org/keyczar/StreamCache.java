package org.keyczar;

import java.util.concurrent.ConcurrentHashMap;
import org.keyczar.interfaces.Stream;

class StreamCache<T extends Stream> {
    private final ConcurrentHashMap<KeyczarKey, StreamQueue<T>> cacheMap = new ConcurrentHashMap<>();

    StreamCache() {
    }

    /* access modifiers changed from: 0000 */
    public T get(KeyczarKey keyczarKey) {
        return (Stream) getQueue(keyczarKey).poll();
    }

    /* access modifiers changed from: 0000 */
    public StreamQueue<T> getQueue(KeyczarKey keyczarKey) {
        StreamQueue<T> streamQueue = (StreamQueue) this.cacheMap.get(keyczarKey);
        if (streamQueue != null) {
            return streamQueue;
        }
        StreamQueue<T> streamQueue2 = new StreamQueue<>();
        StreamQueue<T> streamQueue3 = (StreamQueue) this.cacheMap.putIfAbsent(keyczarKey, streamQueue2);
        return streamQueue3 != null ? streamQueue3 : streamQueue2;
    }

    /* access modifiers changed from: 0000 */
    public void put(KeyczarKey keyczarKey, T t) {
        getQueue(keyczarKey).add(t);
    }
}
