package com.google.protobuf;

import com.google.protobuf.Internal.IntList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

final class IntArrayList extends AbstractProtobufList<Integer> implements IntList, PrimitiveNonBoxingCollection, RandomAccess {
    private static final IntArrayList EMPTY_LIST = new IntArrayList(new int[0], 0);
    private int[] array;
    private int size;

    static {
        EMPTY_LIST.makeImmutable();
    }

    IntArrayList() {
        this(new int[10], 0);
    }

    private IntArrayList(int[] iArr, int i) {
        this.array = iArr;
        this.size = i;
    }

    private void addInt(int i, int i2) {
        ensureIsMutable();
        if (i < 0 || i > this.size) {
            throw new IndexOutOfBoundsException(makeOutOfBoundsExceptionMessage(i));
        }
        if (this.size < this.array.length) {
            System.arraycopy(this.array, i, this.array, i + 1, this.size - i);
        } else {
            int[] iArr = new int[(((this.size * 3) / 2) + 1)];
            System.arraycopy(this.array, 0, iArr, 0, i);
            System.arraycopy(this.array, i, iArr, i + 1, this.size - i);
            this.array = iArr;
        }
        this.array[i] = i2;
        this.size++;
        this.modCount++;
    }

    public static IntArrayList emptyList() {
        return EMPTY_LIST;
    }

    private void ensureIndexInRange(int i) {
        if (i < 0 || i >= this.size) {
            throw new IndexOutOfBoundsException(makeOutOfBoundsExceptionMessage(i));
        }
    }

    private String makeOutOfBoundsExceptionMessage(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append("Index:");
        sb.append(i);
        sb.append(", Size:");
        sb.append(this.size);
        return sb.toString();
    }

    public void add(int i, Integer num) {
        addInt(i, num.intValue());
    }

    public boolean addAll(Collection<? extends Integer> collection) {
        ensureIsMutable();
        Internal.checkNotNull(collection);
        if (!(collection instanceof IntArrayList)) {
            return super.addAll(collection);
        }
        IntArrayList intArrayList = (IntArrayList) collection;
        if (intArrayList.size == 0) {
            return false;
        }
        if (Integer.MAX_VALUE - this.size >= intArrayList.size) {
            int i = this.size + intArrayList.size;
            if (i > this.array.length) {
                this.array = Arrays.copyOf(this.array, i);
            }
            System.arraycopy(intArrayList.array, 0, this.array, this.size, intArrayList.size);
            this.size = i;
            this.modCount++;
            return true;
        }
        throw new OutOfMemoryError();
    }

    public void addInt(int i) {
        addInt(this.size, i);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof IntArrayList)) {
            return super.equals(obj);
        }
        IntArrayList intArrayList = (IntArrayList) obj;
        if (this.size != intArrayList.size) {
            return false;
        }
        int[] iArr = intArrayList.array;
        for (int i = 0; i < this.size; i++) {
            if (this.array[i] != iArr[i]) {
                return false;
            }
        }
        return true;
    }

    public Integer get(int i) {
        return Integer.valueOf(getInt(i));
    }

    public int getInt(int i) {
        ensureIndexInRange(i);
        return this.array[i];
    }

    public int hashCode() {
        int i = 1;
        for (int i2 = 0; i2 < this.size; i2++) {
            i = (i * 31) + this.array[i2];
        }
        return i;
    }

    public IntList mutableCopyWithCapacity(int i) {
        if (i >= this.size) {
            return new IntArrayList(Arrays.copyOf(this.array, i), this.size);
        }
        throw new IllegalArgumentException();
    }

    public Integer remove(int i) {
        ensureIsMutable();
        ensureIndexInRange(i);
        int i2 = this.array[i];
        if (i < this.size - 1) {
            System.arraycopy(this.array, i + 1, this.array, i, (this.size - i) - 1);
        }
        this.size--;
        this.modCount++;
        return Integer.valueOf(i2);
    }

    public boolean remove(Object obj) {
        ensureIsMutable();
        for (int i = 0; i < this.size; i++) {
            if (obj.equals(Integer.valueOf(this.array[i]))) {
                System.arraycopy(this.array, i + 1, this.array, i, (this.size - i) - 1);
                this.size--;
                this.modCount++;
                return true;
            }
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public void removeRange(int i, int i2) {
        ensureIsMutable();
        if (i2 >= i) {
            System.arraycopy(this.array, i2, this.array, i, this.size - i2);
            this.size -= i2 - i;
            this.modCount++;
            return;
        }
        throw new IndexOutOfBoundsException("toIndex < fromIndex");
    }

    public Integer set(int i, Integer num) {
        return Integer.valueOf(setInt(i, num.intValue()));
    }

    public int setInt(int i, int i2) {
        ensureIsMutable();
        ensureIndexInRange(i);
        int i3 = this.array[i];
        this.array[i] = i2;
        return i3;
    }

    public int size() {
        return this.size;
    }
}
