package com.nexstreaming.app.common.util;

/* compiled from: SimplexNoise */
public class k {
    private static a[] a;
    private static a[] b;
    private static short[] c = {151, 160, 137, 91, 90, 15, 131, 13, 201, 95, 96, 53, 194, 233, 7, 225, 140, 36, 103, 30, 69, 142, 8, 99, 37, 240, 21, 10, 23, 190, 6, 148, 247, 120, 234, 75, 0, 26, 197, 62, 94, 252, 219, 203, 117, 35, 11, 32, 57, 177, 33, 88, 237, 149, 56, 87, 174, 20, 125, 136, 171, 168, 68, 175, 74, 165, 71, 134, 139, 48, 27, 166, 77, 146, 158, 231, 83, 111, 229, 122, 60, 211, 133, 230, 220, 105, 92, 41, 55, 46, 245, 40, 244, 102, 143, 54, 65, 25, 63, 161, 1, 216, 80, 73, 209, 76, 132, 187, 208, 89, 18, 169, 200, 196, 135, 130, 116, 188, 159, 86, 164, 100, 109, 198, 173, 186, 3, 64, 52, 217, 226, 250, 124, 123, 5, 202, 38, 147, 118, 126, 255, 82, 85, 212, 207, 206, 59, 227, 47, 16, 58, 17, 182, 189, 28, 42, 223, 183, 170, 213, 119, 248, 152, 2, 44, 154, 163, 70, 221, 153, 101, 155, 167, 43, 172, 9, 129, 22, 39, 253, 19, 98, 108, 110, 79, 113, 224, 232, 178, 185, 112, 104, 218, 246, 97, 228, 251, 34, 242, 193, 238, 210, 144, 12, 191, 179, 162, 241, 81, 51, 145, 235, 249, 14, 239, 107, 49, 192, 214, 31, 181, 199, 106, 157, 184, 84, 204, 176, 115, 121, 50, 45, 127, 4, 150, 254, 138, 236, 205, 93, 222, 114, 67, 29, 24, 72, 243, 141, 128, 195, 78, 66, 215, 61, 156, 180};
    private static short[] d = new short[512];
    private static short[] e = new short[512];
    private static final double f = ((Math.sqrt(3.0d) - 1.0d) * 0.5d);
    private static final double g = ((3.0d - Math.sqrt(3.0d)) / 6.0d);
    private static final double h = ((Math.sqrt(5.0d) - 1.0d) / 4.0d);
    private static final double i = ((5.0d - Math.sqrt(5.0d)) / 20.0d);

    /* compiled from: SimplexNoise */
    private static class a {
        double a;
        double b;
        double c;
        double d;

        a(double d2, double d3, double d4) {
            this.a = d2;
            this.b = d3;
            this.c = d4;
        }

        a(double d2, double d3, double d4, double d5) {
            this.a = d2;
            this.b = d3;
            this.c = d4;
            this.d = d5;
        }
    }

    static {
        a aVar = new a(1.0d, 1.0d, 0.0d);
        a aVar2 = new a(-1.0d, 1.0d, 0.0d);
        a aVar3 = new a(1.0d, -1.0d, 0.0d);
        a aVar4 = new a(-1.0d, -1.0d, 0.0d);
        a aVar5 = new a(1.0d, 0.0d, 1.0d);
        a aVar6 = new a(-1.0d, 0.0d, 1.0d);
        a aVar7 = new a(1.0d, 0.0d, -1.0d);
        a aVar8 = new a(-1.0d, 0.0d, -1.0d);
        a aVar9 = new a(0.0d, 1.0d, 1.0d);
        a aVar10 = new a(0.0d, -1.0d, 1.0d);
        a aVar11 = new a(0.0d, 1.0d, -1.0d);
        a aVar12 = new a(0.0d, -1.0d, -1.0d);
        a = new a[]{aVar, aVar2, aVar3, aVar4, aVar5, aVar6, aVar7, aVar8, aVar9, aVar10, aVar11, aVar12};
        a aVar13 = new a(0.0d, 1.0d, 1.0d, 1.0d);
        a aVar14 = new a(0.0d, 1.0d, 1.0d, -1.0d);
        a aVar15 = new a(0.0d, 1.0d, -1.0d, 1.0d);
        a aVar16 = new a(0.0d, 1.0d, -1.0d, -1.0d);
        a aVar17 = new a(0.0d, -1.0d, 1.0d, 1.0d);
        a aVar18 = new a(0.0d, -1.0d, 1.0d, -1.0d);
        a aVar19 = new a(0.0d, -1.0d, -1.0d, 1.0d);
        a aVar20 = new a(0.0d, -1.0d, -1.0d, -1.0d);
        a aVar21 = new a(1.0d, 0.0d, 1.0d, 1.0d);
        a aVar22 = new a(1.0d, 0.0d, 1.0d, -1.0d);
        a aVar23 = new a(1.0d, 0.0d, -1.0d, 1.0d);
        a aVar24 = new a(1.0d, 0.0d, -1.0d, -1.0d);
        a aVar25 = new a(-1.0d, 0.0d, 1.0d, 1.0d);
        a aVar26 = new a(-1.0d, 0.0d, 1.0d, -1.0d);
        a aVar27 = new a(-1.0d, 0.0d, -1.0d, 1.0d);
        a aVar28 = new a(-1.0d, 0.0d, -1.0d, -1.0d);
        a aVar29 = new a(1.0d, 1.0d, 0.0d, 1.0d);
        a aVar30 = new a(1.0d, 1.0d, 0.0d, -1.0d);
        a aVar31 = new a(1.0d, -1.0d, 0.0d, 1.0d);
        a aVar32 = new a(1.0d, -1.0d, 0.0d, -1.0d);
        a aVar33 = new a(-1.0d, 1.0d, 0.0d, 1.0d);
        a aVar34 = new a(-1.0d, 1.0d, 0.0d, -1.0d);
        a aVar35 = new a(-1.0d, -1.0d, 0.0d, 1.0d);
        a aVar36 = new a(-1.0d, -1.0d, 0.0d, -1.0d);
        a aVar37 = new a(1.0d, 1.0d, 1.0d, 0.0d);
        a aVar38 = new a(1.0d, 1.0d, -1.0d, 0.0d);
        a aVar39 = new a(1.0d, -1.0d, 1.0d, 0.0d);
        a aVar40 = new a(1.0d, -1.0d, -1.0d, 0.0d);
        a aVar41 = new a(-1.0d, 1.0d, 1.0d, 0.0d);
        a aVar42 = new a(-1.0d, 1.0d, -1.0d, 0.0d);
        a aVar43 = new a(-1.0d, -1.0d, 1.0d, 0.0d);
        a aVar44 = new a(-1.0d, -1.0d, -1.0d, 0.0d);
        b = new a[]{aVar13, aVar14, aVar15, aVar16, aVar17, aVar18, aVar19, aVar20, aVar21, aVar22, aVar23, aVar24, aVar25, aVar26, aVar27, aVar28, aVar29, aVar30, aVar31, aVar32, aVar33, aVar34, aVar35, aVar36, aVar37, aVar38, aVar39, aVar40, aVar41, aVar42, aVar43, aVar44};
        for (int i2 = 0; i2 < 512; i2++) {
            d[i2] = c[i2 & 255];
            e[i2] = (short) (d[i2] % 12);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x011f  */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0121  */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x013e  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0140  */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x015f  */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x0161  */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x017e  */
    public static double a(double d2, double d3, double d4) {
        int i2;
        short s;
        short s2;
        int i3;
        short s3;
        double d5;
        double d6;
        double d7;
        double d8;
        double d9;
        double d10;
        double d11;
        short s4;
        short s5;
        int i4;
        double d12 = (d2 + d3 + d4) * 0.3333333333333333d;
        int a2 = a(d2 + d12);
        int a3 = a(d3 + d12);
        int a4 = a(d4 + d12);
        double d13 = (double) (a2 + a3 + a4);
        Double.isNaN(d13);
        double d14 = d13 * 0.16666666666666666d;
        double d15 = (double) a2;
        Double.isNaN(d15);
        double d16 = d15 - d14;
        double d17 = (double) a3;
        Double.isNaN(d17);
        double d18 = d17 - d14;
        int i5 = a2;
        int i6 = a3;
        double d19 = (double) a4;
        Double.isNaN(d19);
        double d20 = d2 - d16;
        double d21 = d3 - d18;
        double d22 = d4 - (d19 - d14);
        short s6 = 0;
        if (d20 < d21) {
            if (d21 < d22) {
                s5 = 0;
                i4 = 1;
            } else if (d20 < d22) {
                s5 = 1;
                i4 = 0;
            } else {
                s4 = 1;
            }
            s2 = 0;
            s = 1;
            i2 = 1;
            double d23 = (double) s6;
            Double.isNaN(d23);
            double d24 = (d20 - d23) + 0.16666666666666666d;
            double d25 = (double) s3;
            Double.isNaN(d25);
            double d26 = (d21 - d25) + 0.16666666666666666d;
            double d27 = (double) i3;
            Double.isNaN(d27);
            double d28 = (d22 - d27) + 0.16666666666666666d;
            double d29 = (double) s2;
            Double.isNaN(d29);
            double d30 = (d20 - d29) + 0.3333333333333333d;
            double d31 = (double) s;
            Double.isNaN(d31);
            double d32 = (d21 - d31) + 0.3333333333333333d;
            double d33 = (double) i2;
            Double.isNaN(d33);
            double d34 = (d22 - d33) + 0.3333333333333333d;
            double d35 = (d20 - 1.0d) + 0.5d;
            double d36 = (d21 - 1.0d) + 0.5d;
            double d37 = (d22 - 1.0d) + 0.5d;
            short s7 = i5 & 255;
            short s8 = i6 & 255;
            int i7 = a4 & 255;
            short s9 = e[d[d[i7] + s8] + s7];
            short s10 = e[s6 + s7 + d[s3 + s8 + d[i3 + i7]]];
            short s11 = e[s2 + s7 + d[s + s8 + d[i2 + i7]]];
            short s12 = e[s7 + 1 + d[s8 + 1 + d[i7 + 1]]];
            d5 = ((0.6d - (d20 * d20)) - (d21 * d21)) - (d22 * d22);
            double d38 = 0.0d;
            if (d5 < 0.0d) {
            }
            d7 = ((0.6d - (d24 * d24)) - (d26 * d26)) - (d28 * d28);
            if (d7 < 0.0d) {
            }
            d9 = ((0.6d - (d30 * d30)) - (d32 * d32)) - (d34 * d34);
            if (d9 < 0.0d) {
            }
            d11 = ((0.6d - (d35 * d35)) - (d36 * d36)) - (d37 * d37);
            if (d11 >= 0.0d) {
            }
            return (d6 + d8 + d10 + d38) * 32.0d;
        } else if (d21 >= d22) {
            s4 = 0;
            s6 = 1;
        } else {
            if (d20 >= d22) {
                s3 = 0;
                s6 = 1;
                i3 = 0;
            } else {
                s3 = 0;
                i3 = 1;
            }
            s2 = 1;
            s = 0;
            i2 = 1;
            double d232 = (double) s6;
            Double.isNaN(d232);
            double d242 = (d20 - d232) + 0.16666666666666666d;
            double d252 = (double) s3;
            Double.isNaN(d252);
            double d262 = (d21 - d252) + 0.16666666666666666d;
            double d272 = (double) i3;
            Double.isNaN(d272);
            double d282 = (d22 - d272) + 0.16666666666666666d;
            double d292 = (double) s2;
            Double.isNaN(d292);
            double d302 = (d20 - d292) + 0.3333333333333333d;
            double d312 = (double) s;
            Double.isNaN(d312);
            double d322 = (d21 - d312) + 0.3333333333333333d;
            double d332 = (double) i2;
            Double.isNaN(d332);
            double d342 = (d22 - d332) + 0.3333333333333333d;
            double d352 = (d20 - 1.0d) + 0.5d;
            double d362 = (d21 - 1.0d) + 0.5d;
            double d372 = (d22 - 1.0d) + 0.5d;
            short s72 = i5 & 255;
            short s82 = i6 & 255;
            int i72 = a4 & 255;
            short s92 = e[d[d[i72] + s82] + s72];
            short s102 = e[s6 + s72 + d[s3 + s82 + d[i3 + i72]]];
            short s112 = e[s2 + s72 + d[s + s82 + d[i2 + i72]]];
            short s122 = e[s72 + 1 + d[s82 + 1 + d[i72 + 1]]];
            d5 = ((0.6d - (d20 * d20)) - (d21 * d21)) - (d22 * d22);
            double d382 = 0.0d;
            if (d5 < 0.0d) {
                d6 = 0.0d;
            } else {
                double d39 = d5 * d5;
                d6 = d39 * d39 * a(a[s92], d20, d21, d22);
            }
            d7 = ((0.6d - (d242 * d242)) - (d262 * d262)) - (d282 * d282);
            if (d7 < 0.0d) {
                d8 = 0.0d;
            } else {
                double d40 = d7 * d7;
                d8 = d40 * d40 * a(a[s102], d242, d262, d282);
            }
            d9 = ((0.6d - (d302 * d302)) - (d322 * d322)) - (d342 * d342);
            if (d9 < 0.0d) {
                d10 = 0.0d;
            } else {
                double d41 = d9 * d9;
                d10 = a(a[s112], d302, d322, d342) * d41 * d41;
            }
            d11 = ((0.6d - (d352 * d352)) - (d362 * d362)) - (d372 * d372);
            if (d11 >= 0.0d) {
                double d42 = d11 * d11;
                d382 = a(a[s122], d352, d362, d372) * d42 * d42;
            }
            return (d6 + d8 + d10 + d382) * 32.0d;
        }
        i3 = 0;
        s2 = 1;
        s = 1;
        i2 = 0;
        double d2322 = (double) s6;
        Double.isNaN(d2322);
        double d2422 = (d20 - d2322) + 0.16666666666666666d;
        double d2522 = (double) s3;
        Double.isNaN(d2522);
        double d2622 = (d21 - d2522) + 0.16666666666666666d;
        double d2722 = (double) i3;
        Double.isNaN(d2722);
        double d2822 = (d22 - d2722) + 0.16666666666666666d;
        double d2922 = (double) s2;
        Double.isNaN(d2922);
        double d3022 = (d20 - d2922) + 0.3333333333333333d;
        double d3122 = (double) s;
        Double.isNaN(d3122);
        double d3222 = (d21 - d3122) + 0.3333333333333333d;
        double d3322 = (double) i2;
        Double.isNaN(d3322);
        double d3422 = (d22 - d3322) + 0.3333333333333333d;
        double d3522 = (d20 - 1.0d) + 0.5d;
        double d3622 = (d21 - 1.0d) + 0.5d;
        double d3722 = (d22 - 1.0d) + 0.5d;
        short s722 = i5 & 255;
        short s822 = i6 & 255;
        int i722 = a4 & 255;
        short s922 = e[d[d[i722] + s822] + s722];
        short s1022 = e[s6 + s722 + d[s3 + s822 + d[i3 + i722]]];
        short s1122 = e[s2 + s722 + d[s + s822 + d[i2 + i722]]];
        short s1222 = e[s722 + 1 + d[s822 + 1 + d[i722 + 1]]];
        d5 = ((0.6d - (d20 * d20)) - (d21 * d21)) - (d22 * d22);
        double d3822 = 0.0d;
        if (d5 < 0.0d) {
        }
        d7 = ((0.6d - (d2422 * d2422)) - (d2622 * d2622)) - (d2822 * d2822);
        if (d7 < 0.0d) {
        }
        d9 = ((0.6d - (d3022 * d3022)) - (d3222 * d3222)) - (d3422 * d3422);
        if (d9 < 0.0d) {
        }
        d11 = ((0.6d - (d3522 * d3522)) - (d3622 * d3622)) - (d3722 * d3722);
        if (d11 >= 0.0d) {
        }
        return (d6 + d8 + d10 + d3822) * 32.0d;
    }

    private static double a(a aVar, double d2, double d3, double d4) {
        return (aVar.a * d2) + (aVar.b * d3) + (aVar.c * d4);
    }

    private static int a(double d2) {
        int i2 = (int) d2;
        return d2 < ((double) i2) ? i2 - 1 : i2;
    }
}
