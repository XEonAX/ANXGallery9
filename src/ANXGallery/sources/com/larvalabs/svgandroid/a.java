package com.larvalabs.svgandroid;

/* compiled from: ParserHelper */
public class a {
    private static final double[] e = new double[128];
    public int a;
    private char b;
    private CharSequence c;
    private int d;

    static {
        for (int i = 0; i < e.length; i++) {
            e[i] = Math.pow(10.0d, (double) i);
        }
    }

    public a(CharSequence charSequence, int i) {
        this.c = charSequence;
        this.a = i;
        this.d = charSequence.length();
        this.b = charSequence.charAt(i);
    }

    public static float a(int i, int i2) {
        double d2;
        if (i2 < -125 || i == 0) {
            return 0.0f;
        }
        if (i2 >= 128) {
            return i > 0 ? Float.POSITIVE_INFINITY : Float.NEGATIVE_INFINITY;
        } else if (i2 == 0) {
            return (float) i;
        } else {
            if (i >= 67108864) {
                i++;
            }
            if (i2 > 0) {
                double d3 = (double) i;
                double d4 = e[i2];
                Double.isNaN(d3);
                d2 = d3 * d4;
            } else {
                double d5 = (double) i;
                double d6 = e[-i2];
                Double.isNaN(d5);
                d2 = d5 / d6;
            }
            return (float) d2;
        }
    }

    private void a(char c2) {
        StringBuilder sb = new StringBuilder();
        sb.append("Unexpected char '");
        sb.append(c2);
        sb.append("'.");
        throw new RuntimeException(sb.toString());
    }

    private char f() {
        if (this.a < this.d) {
            this.a++;
        }
        if (this.a == this.d) {
            return 0;
        }
        return this.c.charAt(this.a);
    }

    public void a() {
        while (this.a < this.d && Character.isWhitespace(this.c.charAt(this.a))) {
            c();
        }
    }

    public void b() {
        while (this.a < this.d) {
            char charAt = this.c.charAt(this.a);
            if (!(charAt == ' ' || charAt == ',')) {
                switch (charAt) {
                    case 9:
                    case 10:
                        break;
                    default:
                        return;
                }
            }
            c();
        }
    }

    public void c() {
        this.b = f();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0028, code lost:
        r15.b = f();
        r5 = r15.b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0030, code lost:
        if (r5 == '.') goto L_0x005a;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0032, code lost:
        if (r5 == 'E') goto L_0x005a;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0034, code lost:
        if (r5 == 'e') goto L_0x005a;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0036, code lost:
        switch(r5) {
            case 48: goto L_0x0028;
            case 49: goto L_0x003a;
            case 50: goto L_0x003a;
            case 51: goto L_0x003a;
            case 52: goto L_0x003a;
            case 53: goto L_0x003a;
            case 54: goto L_0x003a;
            case 55: goto L_0x003a;
            case 56: goto L_0x003a;
            case 57: goto L_0x003a;
            default: goto L_0x0039;
        };
     */
    /* JADX WARNING: Code restructure failed: missing block: B:16:0x0039, code lost:
        return 0.0f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x003a, code lost:
        r5 = 0;
        r11 = 0;
        r12 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x003d, code lost:
        if (r5 >= 9) goto L_0x0049;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x003f, code lost:
        r5 = r5 + 1;
        r11 = (r11 * 10) + (r15.b - '0');
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0049, code lost:
        r12 = r12 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x004b, code lost:
        r15.b = f();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0053, code lost:
        switch(r15.b) {
            case 48: goto L_0x003d;
            case 49: goto L_0x003d;
            case 50: goto L_0x003d;
            case 51: goto L_0x003d;
            case 52: goto L_0x003d;
            case 53: goto L_0x003d;
            case 54: goto L_0x003d;
            case 55: goto L_0x003d;
            case 56: goto L_0x003d;
            case 57: goto L_0x003d;
            default: goto L_0x0056;
        };
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0056, code lost:
        r13 = r11;
        r11 = r5;
        r5 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x005a, code lost:
        r5 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x005d, code lost:
        r11 = 0;
        r12 = 0;
        r13 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:59:0x00d5, code lost:
        r15.b = f();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x00dd, code lost:
        switch(r15.b) {
            case 48: goto L_0x00d5;
            case 49: goto L_0x00e1;
            case 50: goto L_0x00e1;
            case 51: goto L_0x00e1;
            case 52: goto L_0x00e1;
            case 53: goto L_0x00e1;
            case 54: goto L_0x00e1;
            case 55: goto L_0x00e1;
            case 56: goto L_0x00e1;
            case 57: goto L_0x00e1;
            default: goto L_0x00e0;
        };
     */
    /* JADX WARNING: Code restructure failed: missing block: B:61:0x00e1, code lost:
        r1 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:63:0x00e3, code lost:
        if (r4 >= 3) goto L_0x00ee;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x00e5, code lost:
        r4 = r4 + 1;
        r1 = (r1 * 10) + (r15.b - '0');
     */
    /* JADX WARNING: Code restructure failed: missing block: B:65:0x00ee, code lost:
        r15.b = f();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:66:0x00f6, code lost:
        switch(r15.b) {
            case 48: goto L_0x00e2;
            case 49: goto L_0x00e2;
            case 50: goto L_0x00e2;
            case 51: goto L_0x00e2;
            case 52: goto L_0x00e2;
            case 53: goto L_0x00e2;
            case 54: goto L_0x00e2;
            case 55: goto L_0x00e2;
            case 56: goto L_0x00e2;
            case 57: goto L_0x00e2;
            default: goto L_0x00f9;
        };
     */
    /* JADX WARNING: Code restructure failed: missing block: B:67:0x00f9, code lost:
        r4 = r1;
     */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x005c  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0064  */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x0079 A[LOOP_START, PHI: r12 
  PHI: (r12v6 int) = (r12v0 int), (r12v7 int) binds: [B:34:0x0077, B:36:0x0083] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x0089 A[LOOP_START, PHI: r11 r12 r13 
  PHI: (r11v1 int) = (r11v0 int), (r11v2 int) binds: [B:84:0x0089, B:42:0x009e] A[DONT_GENERATE, DONT_INLINE]
  PHI: (r12v3 int) = (r12v2 int), (r12v4 int) binds: [B:84:0x0089, B:42:0x009e] A[DONT_GENERATE, DONT_INLINE]
  PHI: (r13v4 int) = (r13v0 int), (r13v5 int) binds: [B:84:0x0089, B:42:0x009e] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00b2  */
    /* JADX WARNING: Removed duplicated region for block: B:55:0x00c9  */
    /* JADX WARNING: Removed duplicated region for block: B:69:0x00fc  */
    /* JADX WARNING: Removed duplicated region for block: B:72:0x0100  */
    /* JADX WARNING: Removed duplicated region for block: B:9:0x0025  */
    public float d() {
        boolean z;
        int i;
        int i2;
        int i3;
        boolean z2;
        char c2;
        char c3 = this.b;
        boolean z3 = true;
        int i4 = 0;
        if (c3 == '+') {
            z = true;
        } else if (c3 != '-') {
            z = true;
            switch (this.b) {
                case '.':
                    z2 = false;
                    break;
                case '0':
                    break;
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                case '8':
                case '9':
                    break;
                default:
                    return Float.NaN;
            }
            if (this.b == '.') {
                this.b = f();
                switch (this.b) {
                    case '0':
                        if (i3 == 0) {
                            while (true) {
                                this.b = f();
                                i2--;
                                switch (this.b) {
                                    case '0':
                                        break;
                                    case '1':
                                    case '2':
                                    case '3':
                                    case '4':
                                    case '5':
                                    case '6':
                                    case '7':
                                    case '8':
                                    case '9':
                                    default:
                                        if (!z2) {
                                            return 0.0f;
                                        }
                                        break;
                                }
                            }
                        }
                        break;
                    case '1':
                    case '2':
                    case '3':
                    case '4':
                    case '5':
                    case '6':
                    case '7':
                    case '8':
                    case '9':
                        while (true) {
                            if (i3 < 9) {
                                i3++;
                                i = (i * 10) + (this.b - '0');
                                i2--;
                            }
                            this.b = f();
                            switch (this.b) {
                                case '0':
                                case '1':
                                case '2':
                                case '3':
                                case '4':
                                case '5':
                                case '6':
                                case '7':
                                case '8':
                                case '9':
                                    break;
                            }
                        }
                        break;
                    default:
                        if (!z2) {
                            a(this.b);
                            return 0.0f;
                        }
                        break;
                }
            }
            char c4 = this.b;
            if (c4 == 'E' || c4 == 'e') {
                this.b = f();
                c2 = this.b;
                if (c2 != '+') {
                    if (c2 != '-') {
                        switch (c2) {
                            case '0':
                            case '1':
                            case '2':
                            case '3':
                            case '4':
                            case '5':
                            case '6':
                            case '7':
                            case '8':
                            case '9':
                                break;
                            default:
                                a(this.b);
                                return 0.0f;
                        }
                        switch (this.b) {
                            case '0':
                                break;
                            case '1':
                            case '2':
                            case '3':
                            case '4':
                            case '5':
                            case '6':
                            case '7':
                            case '8':
                            case '9':
                                break;
                        }
                    } else {
                        z3 = false;
                    }
                }
                this.b = f();
                switch (this.b) {
                    case '0':
                    case '1':
                    case '2':
                    case '3':
                    case '4':
                    case '5':
                    case '6':
                    case '7':
                    case '8':
                    case '9':
                        break;
                    default:
                        a(this.b);
                        return 0.0f;
                }
                switch (this.b) {
                    case '0':
                        break;
                    case '1':
                    case '2':
                    case '3':
                    case '4':
                    case '5':
                    case '6':
                    case '7':
                    case '8':
                    case '9':
                        break;
                }
            }
            if (!z3) {
                i4 = -i4;
            }
            int i5 = i4 + i2;
            if (!z) {
                i = -i;
            }
            return a(i, i5);
        } else {
            z = false;
        }
        this.b = f();
        switch (this.b) {
            case '.':
                break;
            case '0':
                break;
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
                break;
        }
        if (this.b == '.') {
        }
        char c42 = this.b;
        this.b = f();
        c2 = this.b;
        if (c2 != '+') {
        }
        this.b = f();
        switch (this.b) {
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
                break;
        }
        switch (this.b) {
            case '0':
                break;
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
                break;
        }
        if (!z3) {
        }
        int i52 = i4 + i2;
        if (!z) {
        }
        return a(i, i52);
    }

    public float e() {
        a();
        float d2 = d();
        b();
        return d2;
    }
}
