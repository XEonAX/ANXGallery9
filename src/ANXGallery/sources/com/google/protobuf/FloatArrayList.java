package com.google.protobuf;

import com.google.protobuf.Internal.FloatList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

final class FloatArrayList extends AbstractProtobufList<Float> implements FloatList, PrimitiveNonBoxingCollection, RandomAccess {
    private static final FloatArrayList EMPTY_LIST = new FloatArrayList(new float[0], 0);
    private float[] array;
    private int size;

    static {
        EMPTY_LIST.makeImmutable();
    }

    FloatArrayList() {
        this(new float[10], 0);
    }

    private FloatArrayList(float[] fArr, int i) {
        this.array = fArr;
        this.size = i;
    }

    private void addFloat(int i, float f) {
        ensureIsMutable();
        if (i < 0 || i > this.size) {
            throw new IndexOutOfBoundsException(makeOutOfBoundsExceptionMessage(i));
        }
        if (this.size < this.array.length) {
            System.arraycopy(this.array, i, this.array, i + 1, this.size - i);
        } else {
            float[] fArr = new float[(((this.size * 3) / 2) + 1)];
            System.arraycopy(this.array, 0, fArr, 0, i);
            System.arraycopy(this.array, i, fArr, i + 1, this.size - i);
            this.array = fArr;
        }
        this.array[i] = f;
        this.size++;
        this.modCount++;
    }

    public static FloatArrayList emptyList() {
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

    public void add(int i, Float f) {
        addFloat(i, f.floatValue());
    }

    public boolean addAll(Collection<? extends Float> collection) {
        ensureIsMutable();
        Internal.checkNotNull(collection);
        if (!(collection instanceof FloatArrayList)) {
            return super.addAll(collection);
        }
        FloatArrayList floatArrayList = (FloatArrayList) collection;
        if (floatArrayList.size == 0) {
            return false;
        }
        if (Integer.MAX_VALUE - this.size >= floatArrayList.size) {
            int i = this.size + floatArrayList.size;
            if (i > this.array.length) {
                this.array = Arrays.copyOf(this.array, i);
            }
            System.arraycopy(floatArrayList.array, 0, this.array, this.size, floatArrayList.size);
            this.size = i;
            this.modCount++;
            return true;
        }
        throw new OutOfMemoryError();
    }

    public void addFloat(float f) {
        addFloat(this.size, f);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FloatArrayList)) {
            return super.equals(obj);
        }
        FloatArrayList floatArrayList = (FloatArrayList) obj;
        if (this.size != floatArrayList.size) {
            return false;
        }
        float[] fArr = floatArrayList.array;
        for (int i = 0; i < this.size; i++) {
            if (Float.floatToIntBits(this.array[i]) != Float.floatToIntBits(fArr[i])) {
                return false;
            }
        }
        return true;
    }

    public Float get(int i) {
        return Float.valueOf(getFloat(i));
    }

    public float getFloat(int i) {
        ensureIndexInRange(i);
        return this.array[i];
    }

    public int hashCode() {
        int i = 1;
        for (int i2 = 0; i2 < this.size; i2++) {
            i = (i * 31) + Float.floatToIntBits(this.array[i2]);
        }
        return i;
    }

    public FloatList mutableCopyWithCapacity(int i) {
        if (i >= this.size) {
            return new FloatArrayList(Arrays.copyOf(this.array, i), this.size);
        }
        throw new IllegalArgumentException();
    }

    public Float remove(int i) {
        ensureIsMutable();
        ensureIndexInRange(i);
        float f = this.array[i];
        if (i < this.size - 1) {
            System.arraycopy(this.array, i + 1, this.array, i, (this.size - i) - 1);
        }
        this.size--;
        this.modCount++;
        return Float.valueOf(f);
    }

    public boolean remove(Object obj) {
        ensureIsMutable();
        for (int i = 0; i < this.size; i++) {
            if (obj.equals(Float.valueOf(this.array[i]))) {
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

    public Float set(int i, Float f) {
        return Float.valueOf(setFloat(i, f.floatValue()));
    }

    public float setFloat(int i, float f) {
        ensureIsMutable();
        ensureIndexInRange(i);
        float f2 = this.array[i];
        this.array[i] = f;
        return f2;
    }

    public int size() {
        return this.size;
    }
}
