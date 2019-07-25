package com.google.common.collect;

final class RegularImmutableSet<E> extends ImmutableSet<E> {
    static final RegularImmutableSet<Object> EMPTY;
    final transient Object[] elements;
    private final transient int hashCode;
    private final transient int mask;
    private final transient int size;
    final transient Object[] table;

    static {
        RegularImmutableSet regularImmutableSet = new RegularImmutableSet(new Object[0], 0, null, 0, 0);
        EMPTY = regularImmutableSet;
    }

    RegularImmutableSet(Object[] objArr, int i, Object[] objArr2, int i2, int i3) {
        this.elements = objArr;
        this.table = objArr2;
        this.mask = i2;
        this.hashCode = i;
        this.size = i3;
    }

    public boolean contains(Object obj) {
        Object[] objArr = this.table;
        if (obj == null || objArr == null) {
            return false;
        }
        int smearedHash = Hashing.smearedHash(obj);
        while (true) {
            int i = smearedHash & this.mask;
            Object obj2 = objArr[i];
            if (obj2 == null) {
                return false;
            }
            if (obj2.equals(obj)) {
                return true;
            }
            smearedHash = i + 1;
        }
    }

    /* access modifiers changed from: 0000 */
    public int copyIntoArray(Object[] objArr, int i) {
        System.arraycopy(this.elements, 0, objArr, i, this.size);
        return i + this.size;
    }

    public int hashCode() {
        return this.hashCode;
    }

    /* access modifiers changed from: 0000 */
    public boolean isHashCodeFast() {
        return true;
    }

    public UnmodifiableIterator<E> iterator() {
        return Iterators.forArray(this.elements, 0, this.size, 0);
    }

    public int size() {
        return this.size;
    }
}
