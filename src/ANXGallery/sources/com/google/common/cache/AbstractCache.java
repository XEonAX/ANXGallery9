package com.google.common.cache;

public abstract class AbstractCache<K, V> implements Cache<K, V> {

    public static final class SimpleStatsCounter implements StatsCounter {
        private final LongAddable evictionCount = LongAddables.create();
        private final LongAddable hitCount = LongAddables.create();
        private final LongAddable loadExceptionCount = LongAddables.create();
        private final LongAddable loadSuccessCount = LongAddables.create();
        private final LongAddable missCount = LongAddables.create();
        private final LongAddable totalLoadTime = LongAddables.create();

        public void recordEviction() {
            this.evictionCount.increment();
        }

        public void recordHits(int i) {
            this.hitCount.add((long) i);
        }

        public void recordLoadException(long j) {
            this.loadExceptionCount.increment();
            this.totalLoadTime.add(j);
        }

        public void recordLoadSuccess(long j) {
            this.loadSuccessCount.increment();
            this.totalLoadTime.add(j);
        }

        public void recordMisses(int i) {
            this.missCount.add((long) i);
        }
    }

    public interface StatsCounter {
        void recordEviction();

        void recordHits(int i);

        void recordLoadException(long j);

        void recordLoadSuccess(long j);

        void recordMisses(int i);
    }
}
