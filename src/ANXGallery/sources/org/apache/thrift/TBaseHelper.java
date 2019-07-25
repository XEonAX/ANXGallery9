package org.apache.thrift;

import java.nio.ByteBuffer;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import org.keyczar.Keyczar;

public final class TBaseHelper {
    private static final Comparator comparator = new NestedStructureComparator();

    private static class NestedStructureComparator implements Comparator {
        private NestedStructureComparator() {
        }

        public int compare(Object obj, Object obj2) {
            if (obj == null && obj2 == null) {
                return 0;
            }
            if (obj == null) {
                return -1;
            }
            if (obj2 == null) {
                return 1;
            }
            return obj instanceof List ? TBaseHelper.compareTo((List) obj, (List) obj2) : obj instanceof Set ? TBaseHelper.compareTo((Set) obj, (Set) obj2) : obj instanceof Map ? TBaseHelper.compareTo((Map) obj, (Map) obj2) : obj instanceof byte[] ? TBaseHelper.compareTo((byte[]) obj, (byte[]) obj2) : TBaseHelper.compareTo((Comparable) obj, (Comparable) obj2);
        }
    }

    public static int byteBufferToByteArray(ByteBuffer byteBuffer, byte[] bArr, int i) {
        int remaining = byteBuffer.remaining();
        System.arraycopy(byteBuffer.array(), byteBuffer.arrayOffset() + byteBuffer.position(), bArr, i, remaining);
        return remaining;
    }

    public static byte[] byteBufferToByteArray(ByteBuffer byteBuffer) {
        if (wrapsFullArray(byteBuffer)) {
            return byteBuffer.array();
        }
        byte[] bArr = new byte[byteBuffer.remaining()];
        byteBufferToByteArray(byteBuffer, bArr, 0);
        return bArr;
    }

    public static int compareTo(byte b, byte b2) {
        if (b < b2) {
            return -1;
        }
        return b2 < b ? 1 : 0;
    }

    public static int compareTo(int i, int i2) {
        if (i < i2) {
            return -1;
        }
        return i2 < i ? 1 : 0;
    }

    public static int compareTo(long j, long j2) {
        if (j < j2) {
            return -1;
        }
        return j2 < j ? 1 : 0;
    }

    public static int compareTo(Comparable comparable, Comparable comparable2) {
        return comparable.compareTo(comparable2);
    }

    public static int compareTo(String str, String str2) {
        return str.compareTo(str2);
    }

    public static int compareTo(List list, List list2) {
        int compareTo = compareTo(list.size(), list2.size());
        if (compareTo != 0) {
            return compareTo;
        }
        for (int i = 0; i < list.size(); i++) {
            int compare = comparator.compare(list.get(i), list2.get(i));
            if (compare != 0) {
                return compare;
            }
        }
        return 0;
    }

    public static int compareTo(Map map, Map map2) {
        int compareTo = compareTo(map.size(), map2.size());
        if (compareTo != 0) {
            return compareTo;
        }
        TreeMap treeMap = new TreeMap(comparator);
        treeMap.putAll(map);
        Iterator it = treeMap.entrySet().iterator();
        TreeMap treeMap2 = new TreeMap(comparator);
        treeMap2.putAll(map2);
        Iterator it2 = treeMap2.entrySet().iterator();
        while (it.hasNext() && it2.hasNext()) {
            Entry entry = (Entry) it.next();
            Entry entry2 = (Entry) it2.next();
            int compare = comparator.compare(entry.getKey(), entry2.getKey());
            if (compare != 0) {
                return compare;
            }
            int compare2 = comparator.compare(entry.getValue(), entry2.getValue());
            if (compare2 != 0) {
                return compare2;
            }
        }
        return 0;
    }

    public static int compareTo(Set set, Set set2) {
        int compareTo = compareTo(set.size(), set2.size());
        if (compareTo != 0) {
            return compareTo;
        }
        TreeSet treeSet = new TreeSet(comparator);
        treeSet.addAll(set);
        TreeSet treeSet2 = new TreeSet(comparator);
        treeSet2.addAll(set2);
        Iterator it = treeSet.iterator();
        Iterator it2 = treeSet2.iterator();
        while (it.hasNext() && it2.hasNext()) {
            int compare = comparator.compare(it.next(), it2.next());
            if (compare != 0) {
                return compare;
            }
        }
        return 0;
    }

    public static int compareTo(short s, short s2) {
        if (s < s2) {
            return -1;
        }
        return s2 < s ? 1 : 0;
    }

    public static int compareTo(boolean z, boolean z2) {
        return Boolean.valueOf(z).compareTo(Boolean.valueOf(z2));
    }

    public static int compareTo(byte[] bArr, byte[] bArr2) {
        int compareTo = compareTo(bArr.length, bArr2.length);
        if (compareTo != 0) {
            return compareTo;
        }
        for (int i = 0; i < bArr.length; i++) {
            int compareTo2 = compareTo(bArr[i], bArr2[i]);
            if (compareTo2 != 0) {
                return compareTo2;
            }
        }
        return 0;
    }

    public static String paddedByteString(byte b) {
        return Integer.toHexString((b | Keyczar.FORMAT_VERSION) & 511).toUpperCase().substring(1);
    }

    public static ByteBuffer rightSize(ByteBuffer byteBuffer) {
        return wrapsFullArray(byteBuffer) ? byteBuffer : ByteBuffer.wrap(byteBufferToByteArray(byteBuffer));
    }

    public static void toString(ByteBuffer byteBuffer, StringBuilder sb) {
        byte[] array = byteBuffer.array();
        int arrayOffset = byteBuffer.arrayOffset();
        int limit = byteBuffer.limit();
        int i = limit - arrayOffset > 128 ? arrayOffset + 128 : limit;
        for (int i2 = arrayOffset; i2 < i; i2++) {
            if (i2 > arrayOffset) {
                sb.append(" ");
            }
            sb.append(paddedByteString(array[i2]));
        }
        if (limit != i) {
            sb.append("...");
        }
    }

    public static boolean wrapsFullArray(ByteBuffer byteBuffer) {
        return byteBuffer.hasArray() && byteBuffer.position() == 0 && byteBuffer.arrayOffset() == 0 && byteBuffer.remaining() == byteBuffer.capacity();
    }
}
