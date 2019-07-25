package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Set;

public abstract class ImmutableSet<E> extends ImmutableCollection<E> implements Set<E> {

    private static class SerializedForm implements Serializable {
        private static final long serialVersionUID = 0;
        final Object[] elements;

        SerializedForm(Object[] objArr) {
            this.elements = objArr;
        }

        /* access modifiers changed from: 0000 */
        public Object readResolve() {
            return ImmutableSet.copyOf(this.elements);
        }
    }

    ImmutableSet() {
    }

    static int chooseTableSize(int i) {
        boolean z = true;
        if (i < 751619276) {
            int highestOneBit = Integer.highestOneBit(i - 1) << 1;
            while (true) {
                double d = (double) highestOneBit;
                Double.isNaN(d);
                if (d * 0.7d >= ((double) i)) {
                    return highestOneBit;
                }
                highestOneBit <<= 1;
            }
        } else {
            if (i >= 1073741824) {
                z = false;
            }
            Preconditions.checkArgument(z, "collection too large");
            return 1073741824;
        }
    }

    private static <E> ImmutableSet<E> construct(int i, Object... objArr) {
        switch (i) {
            case 0:
                return of();
            case 1:
                return of(objArr[0]);
            default:
                int chooseTableSize = chooseTableSize(i);
                Object[] objArr2 = new Object[chooseTableSize];
                int i2 = chooseTableSize - 1;
                int i3 = 0;
                int i4 = 0;
                for (int i5 = 0; i5 < i; i5++) {
                    Object checkElementNotNull = ObjectArrays.checkElementNotNull(objArr[i5], i5);
                    int hashCode = checkElementNotNull.hashCode();
                    int smear = Hashing.smear(hashCode);
                    while (true) {
                        int i6 = smear & i2;
                        Object obj = objArr2[i6];
                        if (obj == null) {
                            int i7 = i4 + 1;
                            objArr[i4] = checkElementNotNull;
                            objArr2[i6] = checkElementNotNull;
                            i3 += hashCode;
                            i4 = i7;
                        } else if (!obj.equals(checkElementNotNull)) {
                            smear++;
                        }
                    }
                }
                Arrays.fill(objArr, i4, i, null);
                if (i4 == 1) {
                    return new SingletonImmutableSet(objArr[0], i3);
                }
                if (chooseTableSize(i4) < chooseTableSize / 2) {
                    return construct(i4, objArr);
                }
                if (i4 < objArr.length / 2) {
                    objArr = Arrays.copyOf(objArr, i4);
                }
                RegularImmutableSet regularImmutableSet = new RegularImmutableSet(objArr, i3, objArr2, i2, i4);
                return regularImmutableSet;
        }
    }

    public static <E> ImmutableSet<E> copyOf(E[] eArr) {
        switch (eArr.length) {
            case 0:
                return of();
            case 1:
                return of(eArr[0]);
            default:
                return construct(eArr.length, (Object[]) eArr.clone());
        }
    }

    public static <E> ImmutableSet<E> of() {
        return RegularImmutableSet.EMPTY;
    }

    public static <E> ImmutableSet<E> of(E e) {
        return new SingletonImmutableSet(e);
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof ImmutableSet) || !isHashCodeFast() || !((ImmutableSet) obj).isHashCodeFast() || hashCode() == obj.hashCode()) {
            return Sets.equalsImpl(this, obj);
        }
        return false;
    }

    public int hashCode() {
        return Sets.hashCodeImpl(this);
    }

    /* access modifiers changed from: 0000 */
    public boolean isHashCodeFast() {
        return false;
    }

    public abstract UnmodifiableIterator<E> iterator();

    /* access modifiers changed from: 0000 */
    public Object writeReplace() {
        return new SerializedForm(toArray());
    }
}
