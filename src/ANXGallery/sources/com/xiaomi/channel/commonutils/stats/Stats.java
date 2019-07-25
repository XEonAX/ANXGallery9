package com.xiaomi.channel.commonutils.stats;

import java.util.LinkedList;

public class Stats {
    private LinkedList<Item> statsQueue = new LinkedList<>();

    public static class Item {
        /* access modifiers changed from: private */
        public static final Stats sStats = new Stats();
        public String annotation;
        public int key;
        public Object obj;

        Item(int i, Object obj2) {
            this.key = i;
            this.obj = obj2;
        }
    }

    private void checkSize() {
        if (this.statsQueue.size() > 100) {
            this.statsQueue.removeFirst();
        }
    }

    public static Stats instance() {
        return Item.sStats;
    }

    public synchronized int getCount() {
        return this.statsQueue.size();
    }

    public synchronized LinkedList<Item> getStats() {
        LinkedList<Item> linkedList;
        linkedList = this.statsQueue;
        this.statsQueue = new LinkedList<>();
        return linkedList;
    }

    public synchronized void stat(Object obj) {
        this.statsQueue.add(new Item(0, obj));
        checkSize();
    }
}
