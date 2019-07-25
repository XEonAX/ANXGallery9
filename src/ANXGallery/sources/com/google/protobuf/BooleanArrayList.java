package com.google.protobuf;

import com.google.protobuf.Internal.BooleanList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

final class BooleanArrayList extends AbstractProtobufList<Boolean> implements BooleanList, PrimitiveNonBoxingCollection, RandomAccess {
    private static final BooleanArrayList EMPTY_LIST = new BooleanArrayList(new boolean[0], 0);
    private boolean[] array;
    private int size;

    static {
        EMPTY_LIST.makeImmutable();
    }

    BooleanArrayList() {
        this(new boolean[10], 0);
    }

    private BooleanArrayList(boolean[] zArr, int i) {
        this.array = zArr;
        this.size = i;
    }

    private void addBoolean(int i, boolean z) {
        ensureIsMutable();
        if (i < 0 || i > this.size) {
            throw new IndexOutOfBoundsException(makeOutOfBoundsExceptionMessage(i));
        }
        if (this.size < this.array.length) {
            System.arraycopy(this.array, i, this.array, i + 1, this.size - i);
        } else {
            boolean[] zArr = new boolean[(((this.size * 3) / 2) + 1)];
            System.arraycopy(this.array, 0, zArr, 0, i);
            System.arraycopy(this.array, i, zArr, i + 1, this.size - i);
            this.array = zArr;
        }
        this.array[i] = z;
        this.size++;
        this.modCount++;
    }

    public static BooleanArrayList emptyList() {
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

    public void add(int i, Boolean bool) {
        addBoolean(i, bool.booleanValue());
    }

    public boolean addAll(Collection<? extends Boolean> collection) {
        ensureIsMutable();
        Internal.checkNotNull(collection);
        if (!(collection instanceof BooleanArrayList)) {
            return super.addAll(collection);
        }
        BooleanArrayList booleanArrayList = (BooleanArrayList) collection;
        if (booleanArrayList.size == 0) {
            return false;
        }
        if (Integer.MAX_VALUE - this.size >= booleanArrayList.size) {
            int i = this.size + booleanArrayList.size;
            if (i > this.array.length) {
                this.array = Arrays.copyOf(this.array, i);
            }
            System.arraycopy(booleanArrayList.array, 0, this.array, this.size, booleanArrayList.size);
            this.size = i;
            this.modCount++;
            return true;
        }
        throw new OutOfMemoryError();
    }

    public void addBoolean(boolean z) {
        addBoolean(this.size, z);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof BooleanArrayList)) {
            return super.equals(obj);
        }
        BooleanArrayList booleanArrayList = (BooleanArrayList) obj;
        if (this.size != booleanArrayList.size) {
            return false;
        }
        boolean[] zArr = booleanArrayList.array;
        for (int i = 0; i < this.size; i++) {
            if (this.array[i] != zArr[i]) {
                return false;
            }
        }
        return true;
    }

    public Boolean get(int i) {
        return Boolean.valueOf(getBoolean(i));
    }

    public boolean getBoolean(int i) {
        ensureIndexInRange(i);
        return this.array[i];
    }

    public int hashCode() {
        int i = 1;
        for (int i2 = 0; i2 < this.size; i2++) {
            i = (i * 31) + Internal.hashBoolean(this.array[i2]);
        }
        return i;
    }

    public BooleanList mutableCopyWithCapacity(int i) {
        if (i >= this.size) {
            return new BooleanArrayList(Arrays.copyOf(this.array, i), this.size);
        }
        throw new IllegalArgumentException();
    }

    public Boolean remove(int i) {
        ensureIsMutable();
        ensureIndexInRange(i);
        boolean z = this.array[i];
        if (i < this.size - 1) {
            System.arraycopy(this.array, i + 1, this.array, i, (this.size - i) - 1);
        }
        this.size--;
        this.modCount++;
        return Boolean.valueOf(z);
    }

    public boolean remove(Object obj) {
        ensureIsMutable();
        for (int i = 0; i < this.size; i++) {
            if (obj.equals(Boolean.valueOf(this.array[i]))) {
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

    public Boolean set(int i, Boolean bool) {
        return Boolean.valueOf(setBoolean(i, bool.booleanValue()));
    }

    public boolean setBoolean(int i, boolean z) {
        ensureIsMutable();
        ensureIndexInRange(i);
        boolean z2 = this.array[i];
        this.array[i] = z;
        return z2;
    }

    public int size() {
        return this.size;
    }
}
