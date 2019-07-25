package com.google.common.cache;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

final class LongAdder extends Striped64 implements LongAddable, Serializable {
    private static final long serialVersionUID = 7249069246863182397L;

    private void readObject(ObjectInputStream objectInputStream) throws IOException, ClassNotFoundException {
        objectInputStream.defaultReadObject();
        this.busy = 0;
        this.cells = null;
        this.base = objectInputStream.readLong();
    }

    private void writeObject(ObjectOutputStream objectOutputStream) throws IOException {
        objectOutputStream.defaultWriteObject();
        objectOutputStream.writeLong(sum());
    }

    public void add(long j) {
        Cell[] cellArr = this.cells;
        if (cellArr == null) {
            long j2 = this.base;
            if (casBase(j2, j2 + j)) {
                return;
            }
        }
        int[] iArr = (int[]) threadHashCode.get();
        boolean z = true;
        if (!(iArr == null || cellArr == null)) {
            int length = cellArr.length;
            if (length >= 1) {
                Cell cell = cellArr[(length - 1) & iArr[0]];
                if (cell != null) {
                    long j3 = cell.value;
                    z = cell.cas(j3, j3 + j);
                    if (z) {
                        return;
                    }
                }
            }
        }
        retryUpdate(j, iArr, z);
    }

    public double doubleValue() {
        return (double) sum();
    }

    public float floatValue() {
        return (float) sum();
    }

    /* access modifiers changed from: 0000 */
    public final long fn(long j, long j2) {
        return j + j2;
    }

    public void increment() {
        add(1);
    }

    public int intValue() {
        return (int) sum();
    }

    public long longValue() {
        return sum();
    }

    public long sum() {
        long j = this.base;
        Cell[] cellArr = this.cells;
        if (cellArr != null) {
            for (Cell cell : cellArr) {
                if (cell != null) {
                    j += cell.value;
                }
            }
        }
        return j;
    }

    public String toString() {
        return Long.toString(sum());
    }
}
