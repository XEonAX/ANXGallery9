package com.miui.gallery.provider.cache;

import android.text.TextUtils;
import com.miui.gallery.provider.cache.CacheItem;
import com.miui.gallery.provider.cache.CacheItem.ColumnMapper;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.Stack;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

abstract class Filter<T extends CacheItem> {
    private static final Pattern COMPARATOR = Pattern.compile("(?i)(<(?!=)|<=|>(?!=)|>=|=(?!=)|==|!=|(?<=\\s)LIKE(?=\\s)|(?<=\\s)IN(?=\\s|\\()|(?<=\\s)NOT\\s+IN(?=\\s|\\()|(?<=\\s)IS\\s+NULL(?=\\s|$)|(?<=\\s)NOT\\s+NULL(?=\\s|$))");
    public static final CompareFilter<MediaItem> NOT_SUPPORTED_FILTER = new CompareFilter<MediaItem>(0, null, null) {
        public MediaItem filter(MediaItem mediaItem) {
            return null;
        }
    };

    public enum Comparator {
        GREATER,
        GREATER_OR_EQUAL,
        LESS,
        LESS_OR_EQUAL,
        EQUALS,
        NOT_EQUALS,
        IN,
        NOT_IN,
        IS_NULL,
        NOT_NULL,
        LIKE;

        static Comparator from(String str) {
            char charAt = str.charAt(0);
            char charAt2 = str.charAt(str.length() - 1);
            if (charAt == '<' && charAt2 == '=') {
                return LESS_OR_EQUAL;
            }
            if (charAt == '<') {
                return LESS;
            }
            if (charAt == '>' && charAt2 == '=') {
                return GREATER_OR_EQUAL;
            }
            if (charAt == '>') {
                return GREATER;
            }
            if (charAt == '=') {
                return EQUALS;
            }
            if (charAt == '!') {
                return NOT_EQUALS;
            }
            if (charAt2 == 'n' || charAt2 == 'N') {
                return str.length() > 2 ? NOT_IN : IN;
            }
            if (charAt2 == 'l' || charAt2 == 'L') {
                return (charAt == 'i' || charAt == 'I') ? IS_NULL : NOT_NULL;
            }
            if ((charAt == 'l' || charAt == 'L') && (charAt2 == 'E' || charAt2 == 'e')) {
                return LIKE;
            }
            return null;
        }
    }

    public static abstract class CompareFilter<T extends CacheItem> extends Filter<T> {
        protected String mArgument;
        protected Comparator mComparator;
        protected int mIndex;

        public CompareFilter(int i, Comparator comparator, String str) {
            this.mIndex = i;
            this.mComparator = comparator;
            this.mArgument = str;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("CompareFilter{mIndex=");
            sb.append(this.mIndex);
            sb.append(", mComparator=");
            sb.append(this.mComparator);
            sb.append(", mArgument='");
            sb.append(this.mArgument);
            sb.append('\'');
            sb.append('}');
            return sb.toString();
        }
    }

    private enum Compound {
        AND,
        OR
    }

    private static class CompoundFilter<T extends CacheItem> extends Filter<T> {
        private Compound mCompound;
        private Filter<T> mLeft;
        private Filter<T> mRight;

        public CompoundFilter(String str, Filter<T> filter, Filter<T> filter2) {
            this.mLeft = filter;
            this.mRight = filter2;
            this.mCompound = Compound.valueOf(str);
        }

        public T filter(T t) {
            if (this.mCompound != Compound.AND) {
                return this.mLeft.filter(t) != null ? t : this.mRight.filter(t);
            }
            if (this.mLeft.filter(t) == null) {
                return null;
            }
            return this.mRight.filter(t);
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("CompoundFilter{mFilters=[");
            sb.append(this.mLeft);
            sb.append(", ");
            sb.append(this.mRight);
            sb.append("]");
            sb.append(", mCompound=");
            sb.append(this.mCompound);
            sb.append('}');
            return sb.toString();
        }
    }

    private static class DummyFilter<T extends CacheItem> extends Filter<T> {
        private DummyFilter() {
        }

        public T filter(T t) {
            return t;
        }

        public String toString() {
            return "DummyFilter";
        }
    }

    public interface FilterFactory<T extends CacheItem> {
        CompareFilter<T> getFilter(int i, Comparator comparator, String str);

        ColumnMapper getMapper();
    }

    Filter() {
    }

    private static <T extends CacheItem> Filter<T> build(String str, FilterFactory<T> filterFactory) {
        Filter<T> filter;
        if (TextUtils.isEmpty(str)) {
            return new DummyFilter();
        }
        String[][] split = split(str);
        String[] strArr = split[0];
        String[] strArr2 = split[1];
        Filter<T> filter2 = null;
        int i = 0;
        for (String trim : strArr) {
            String trim2 = trim.trim();
            Log.d(".provider.cache.Filter", "build for %s", (Object) trim2);
            if (inBracket(trim2)) {
                filter = build(trim2.substring(1, trim2.length() - 1), filterFactory);
            } else {
                Matcher matcher = COMPARATOR.matcher(trim2);
                if (matcher.find()) {
                    int index = filterFactory.getMapper().getIndex(trim2.substring(0, matcher.start()).trim());
                    if (index < 0) {
                        Log.w(".provider.cache.Filter", "Found a unrecognized column");
                    }
                    filter = filterFactory.getFilter(index, Comparator.from(matcher.group()), translateParams(trim2.substring(matcher.end(), trim2.length()).trim()));
                } else {
                    Log.w(".provider.cache.Filter", "Found a unrecognized operation");
                    filter = filterFactory.getFilter(-1, null, null);
                }
            }
            if (filter2 == null) {
                filter2 = filter;
            } else {
                i++;
                filter2 = new CompoundFilter<>(strArr2[i - 1], filter2, filter);
            }
        }
        Log.d(".provider.cache.Filter", "filter build finish: %s", (Object) filter2);
        return filter2;
    }

    private static Compound findCompound(int i, String str) {
        int i2 = i + 4;
        if (i2 >= str.length()) {
            return null;
        }
        int i3 = i + 1;
        if (str.charAt(i3) == 'a' || str.charAt(i3) == 'A') {
            int i4 = i + 2;
            if (str.charAt(i4) == 'n' || str.charAt(i4) == 'N') {
                int i5 = i + 3;
                if ((str.charAt(i5) == 'd' || str.charAt(i5) == 'D') && (Character.isSpaceChar(str.charAt(i2)) || str.charAt(i2) == '(')) {
                    return Compound.AND;
                }
            }
        }
        if (str.charAt(i3) == 'o' || str.charAt(i3) == 'O') {
            int i6 = i + 2;
            if (str.charAt(i6) == 'r' || str.charAt(i6) == 'R') {
                int i7 = i + 3;
                if (Character.isSpaceChar(str.charAt(i7)) || str.charAt(i7) == '(') {
                    return Compound.OR;
                }
            }
        }
        return null;
    }

    public static <T extends CacheItem> Filter<T> from(String str, String[] strArr, FilterFactory<T> filterFactory) {
        return build(insertArgs(str, strArr), filterFactory);
    }

    private static boolean inBracket(String str) {
        return str.charAt(0) == '(' && str.charAt(str.length() - 1) == ')';
    }

    private static String insertArgs(String str, String[] strArr) {
        if (strArr == null || strArr.length < 1) {
            return str;
        }
        StringBuilder sb = new StringBuilder();
        int i = 0;
        for (int i2 = 0; i2 < str.length(); i2++) {
            char charAt = str.charAt(i2);
            if (charAt == '?') {
                int i3 = i + 1;
                sb.append(strArr[i]);
                i = i3;
            } else {
                sb.append(charAt);
            }
        }
        return sb.toString();
    }

    private static boolean isIdentifier(char c) {
        return c == '_' || Character.isLetterOrDigit(c);
    }

    private static String[][] split(String str) {
        int i;
        Stack stack = new Stack();
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        int i2 = 0;
        int i3 = 0;
        while (i < str.length()) {
            char charAt = str.charAt(i);
            if (!isIdentifier(charAt)) {
                if (charAt == '(') {
                    stack.push(Integer.valueOf(i));
                } else {
                    if (str.charAt(i) == ')') {
                        stack.pop();
                    }
                    if (stack.isEmpty()) {
                        Compound findCompound = findCompound(i, str);
                        if (findCompound != null) {
                            arrayList.add(str.substring(i3, i));
                            arrayList2.add(findCompound.toString());
                            i = findCompound == Compound.AND ? i + 3 : i + 2;
                            i3 = i + 1;
                        }
                    }
                }
            }
            i2 = i + 1;
        }
        arrayList.add(str.substring(i3, str.length()));
        return new String[][]{(String[]) arrayList.toArray(new String[arrayList.size()]), (String[]) arrayList2.toArray(new String[arrayList2.size()])};
    }

    private static String translateParams(String str) {
        return (str.length() > 1 && str.charAt(0) == '\'' && str.charAt(str.length() - 1) == '\'') ? str.substring(1, str.length() - 1) : str;
    }

    public abstract T filter(T t);
}
