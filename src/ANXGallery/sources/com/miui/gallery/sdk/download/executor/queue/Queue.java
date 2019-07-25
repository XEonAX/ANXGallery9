package com.miui.gallery.sdk.download.executor.queue;

import com.miui.gallery.sdk.download.executor.queue.Command;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;

public class Queue<T extends Command> {
    private final LinkedList<T> mList = new LinkedList<>();
    private final HashMap<String, T> mMap = new HashMap<>();
    private final int mMaxSize;

    public Queue(int i) {
        this.mMaxSize = i;
    }

    private boolean needAdd(T t) {
        Command command = (Command) this.mMap.get(t.getKey());
        if (command == null) {
            return true;
        }
        if (command.getPriority() >= t.getPriority()) {
            return false;
        }
        remove((T) command);
        return true;
    }

    private boolean putInternal(T t, boolean z) {
        if (!needAdd(t)) {
            return false;
        }
        this.mMap.put(t.getKey(), t);
        if (z) {
            this.mList.addFirst(t);
            if (this.mMaxSize > 0 && size() > this.mMaxSize) {
                this.mMap.remove(((Command) this.mList.removeLast()).getKey());
            }
        } else {
            this.mList.addLast(t);
        }
        return true;
    }

    private void remove(T t) {
        this.mMap.remove(t.getKey());
        this.mList.remove(t);
    }

    public void clear() {
        this.mMap.clear();
        this.mList.clear();
    }

    public T get(String str) {
        return (Command) this.mMap.get(str);
    }

    public List<T> poll(int i) {
        LinkedList linkedList = new LinkedList();
        ListIterator listIterator = this.mList.listIterator();
        while (listIterator.hasNext() && linkedList.size() < i) {
            Command command = (Command) listIterator.next();
            linkedList.add(command);
            listIterator.remove();
            this.mMap.remove(command.getKey());
        }
        return linkedList;
    }

    public int putAtFirst(List<T> list) {
        int i = 0;
        ListIterator listIterator = list.listIterator(0);
        while (listIterator.hasNext()) {
            i += putInternal((Command) listIterator.next(), true) ? 1 : 0;
        }
        return i;
    }

    public int putAtLast(List<T> list) {
        ListIterator listIterator = list.listIterator(0);
        int i = 0;
        while (listIterator.hasNext()) {
            i += putInternal((Command) listIterator.next(), false) ? 1 : 0;
        }
        return i;
    }

    public T remove(String str) {
        T t = (Command) this.mMap.remove(str);
        if (t != null) {
            this.mList.remove(t);
        }
        return t;
    }

    public int size() {
        return this.mMap.size();
    }

    public Collection<T> values() {
        return Collections.unmodifiableCollection(this.mMap.values());
    }
}
