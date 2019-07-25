package com.google.common.base;

import java.io.IOException;
import java.util.Iterator;

public class Joiner {
    /* access modifiers changed from: private */
    public final String separator;

    /* renamed from: com.google.common.base.Joiner$1 reason: invalid class name */
    class AnonymousClass1 extends Joiner {
        final /* synthetic */ Joiner this$0;
        final /* synthetic */ String val$nullText;

        public Joiner skipNulls() {
            throw new UnsupportedOperationException("already specified useForNull");
        }

        /* access modifiers changed from: 0000 */
        public CharSequence toString(Object obj) {
            return obj == null ? this.val$nullText : this.this$0.toString(obj);
        }
    }

    private Joiner(Joiner joiner) {
        this.separator = joiner.separator;
    }

    /* synthetic */ Joiner(Joiner joiner, AnonymousClass1 r2) {
        this(joiner);
    }

    private Joiner(String str) {
        this.separator = (String) Preconditions.checkNotNull(str);
    }

    public static Joiner on(String str) {
        return new Joiner(str);
    }

    public <A extends Appendable> A appendTo(A a, Iterator<?> it) throws IOException {
        Preconditions.checkNotNull(a);
        if (it.hasNext()) {
            a.append(toString(it.next()));
            while (it.hasNext()) {
                a.append(this.separator);
                a.append(toString(it.next()));
            }
        }
        return a;
    }

    public final StringBuilder appendTo(StringBuilder sb, Iterator<?> it) {
        try {
            appendTo((A) sb, it);
            return sb;
        } catch (IOException e) {
            throw new AssertionError(e);
        }
    }

    public final String join(Iterable<?> iterable) {
        return join(iterable.iterator());
    }

    public final String join(Iterator<?> it) {
        return appendTo(new StringBuilder(), it).toString();
    }

    public Joiner skipNulls() {
        return new Joiner(this) {
            public <A extends Appendable> A appendTo(A a, Iterator<?> it) throws IOException {
                Preconditions.checkNotNull(a, "appendable");
                Preconditions.checkNotNull(it, "parts");
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    Object next = it.next();
                    if (next != null) {
                        a.append(Joiner.this.toString(next));
                        break;
                    }
                }
                while (it.hasNext()) {
                    Object next2 = it.next();
                    if (next2 != null) {
                        a.append(Joiner.this.separator);
                        a.append(Joiner.this.toString(next2));
                    }
                }
                return a;
            }
        };
    }

    /* access modifiers changed from: 0000 */
    public CharSequence toString(Object obj) {
        Preconditions.checkNotNull(obj);
        return obj instanceof CharSequence ? (CharSequence) obj : obj.toString();
    }
}
