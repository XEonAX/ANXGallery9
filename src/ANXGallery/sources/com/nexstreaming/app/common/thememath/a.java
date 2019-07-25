package com.nexstreaming.app.common.thememath;

import android.graphics.Color;
import android.graphics.ColorMatrix;

/* compiled from: NexTheme_Math */
public class a {
    static C0002a a;
    static C0002a b;
    static C0002a c;
    static C0002a d;
    static C0002a e;

    /* renamed from: com.nexstreaming.app.common.thememath.a$a reason: collision with other inner class name */
    /* compiled from: NexTheme_Math */
    private static class C0002a {
        float[] a;

        C0002a(double d, double d2, double d3, double d4, double d5, double d6, double d7, double d8, double d9, double d10, double d11, double d12, double d13, double d14, double d15, double d16) {
            this.a = new float[]{(float) d, (float) d2, (float) d3, (float) d4, (float) d5, (float) d6, (float) d7, (float) d8, (float) d9, (float) d10, (float) d11, (float) d12, (float) d13, (float) d14, (float) d15, (float) d16};
        }

        C0002a(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9, float f10, float f11, float f12, float f13, float f14, float f15, float f16) {
            this.a = new float[]{f, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16};
        }
    }

    /* compiled from: NexTheme_Math */
    private static class b {
        float[] a;

        b(double d, double d2, double d3, double d4) {
            this.a = new float[]{(float) d, (float) d2, (float) d3, (float) d4};
        }

        b(float f, float f2, float f3, float f4) {
            this.a = new float[]{f, f2, f3, f4};
        }
    }

    static {
        C0002a aVar = new C0002a(1.164d, 0.0d, 1.596d, -0.871d, 1.164d, -0.392d, -0.813d, 0.53d, 1.164d, 2.017d, 0.0d, -1.081d, 0.0d, 0.0d, 0.0d, 1.0d);
        a = aVar;
        C0002a aVar2 = new C0002a(1.164d, 0.0d, 1.596d, 0.0d, 1.164d, -0.392d, -0.813d, 0.0d, 1.164d, 2.017d, 0.0d, 0.0d, 0.0d, 0.0d, 0.0d, 1.0d);
        b = aVar2;
        C0002a aVar3 = new C0002a(0.257d, 0.504d, 0.098d, 0.0d, -0.148d, -0.291d, 0.439d, 0.0d, 0.439d, -0.368d, -0.071d, 0.0d, 0.0d, 0.0d, 0.0d, 1.0d);
        c = aVar3;
        C0002a aVar4 = new C0002a(0.257d, 0.504d, 0.098d, 0.0625d, -0.148d, -0.291d, 0.439d, 0.5d, 0.439d, -0.368d, -0.071d, 0.5d, 0.0d, 0.0d, 0.0d, 1.0d);
        d = aVar4;
        C0002a aVar5 = new C0002a(1.0d, 0.0d, 0.0d, 0.0d, 0.0d, 1.0d, 0.0d, 0.0d, 0.0d, 0.0d, 1.0d, 0.0d, 0.0d, 0.0d, 0.0d, 1.0d);
        e = aVar5;
    }

    public static ColorMatrix a(float f, float f2, float f3, int i) {
        float[] fArr = a(f, f2, f3, new b(((float) Color.red(i)) / 255.0f, ((float) Color.green(i)) / 255.0f, ((float) Color.blue(i)) / 255.0f, 1.0f)).a;
        return new ColorMatrix(new float[]{fArr[0], fArr[1], fArr[2], 0.0f, fArr[3], fArr[4], fArr[5], fArr[6], 0.0f, fArr[7], fArr[8], fArr[9], fArr[10], 0.0f, fArr[11], fArr[12], fArr[13], fArr[14], 1.0f, 0.0f});
    }

    static C0002a a() {
        C0002a aVar = new C0002a(1.0d, 0.0d, 0.0d, 0.0d, 0.0d, 1.0d, 0.0d, 0.0d, 0.0d, 0.0d, 1.0d, 0.0d, 0.0d, 0.0d, 0.0d, 1.0d);
        return aVar;
    }

    static C0002a a(float f, float f2, float f3) {
        C0002a aVar = new C0002a((double) f, 0.0d, 0.0d, 0.0d, 0.0d, (double) f2, 0.0d, 0.0d, 0.0d, 0.0d, (double) f3, 0.0d, 0.0d, 0.0d, 0.0d, 1.0d);
        return aVar;
    }

    static C0002a a(float f, float f2, float f3, b bVar) {
        return a(a(f, f2, f3, bVar, false), d);
    }

    static C0002a a(float f, float f2, float f3, b bVar, boolean z) {
        float f4;
        float f5;
        C0002a aVar;
        C0002a aVar2;
        b bVar2 = bVar;
        float f6 = f;
        double d2 = (double) f6;
        float f7 = -1.0f;
        if (d2 < -1.0d) {
            f5 = f2;
            f4 = -1.0f;
        } else if (d2 > 1.0d) {
            f5 = f2;
            f4 = 1.0f;
        } else {
            f4 = f6;
            f5 = f2;
        }
        double d3 = (double) f5;
        if (d3 >= -1.0d) {
            f7 = d3 > 1.0d ? 1.0f : f5;
        }
        C0002a aVar3 = z ? new C0002a(1.0d, 0.0d, 1.402d, 0.0d, 1.0d, -0.344d, -0.714d, 0.0d, 1.0d, 1.772d, 0.0d, 0.0d, 0.0d, 0.0d, 0.0d, 1.0d) : new C0002a(1.164d, 0.0d, 1.596d, 0.0d, 1.164d, -0.392d, -0.813d, 0.0d, 1.164d, 2.017d, 0.0d, 0.0d, 0.0d, 0.0d, 0.0d, 1.0d);
        b bVar3 = new b((double) f4, 0.0d, 0.0d, 0.0d);
        C0002a a2 = a(bVar3);
        b bVar4 = new b(0.5d, 0.5d, 0.5d, 0.0d);
        float f8 = f7 + 1.0f;
        C0002a a3 = a(a(bVar4), a(f8, f8, f8));
        b bVar5 = new b(-0.5d, -0.5d, -0.5d, 0.0d);
        C0002a a4 = a(a3, a(bVar5));
        if (z) {
            b bVar6 = new b(0.0d, -0.5d, -0.5d, 0.0d);
            aVar = a(bVar6);
        } else {
            b bVar7 = new b(-0.0625d, -0.5d, -0.5d, 0.0d);
            aVar = a(bVar7);
        }
        float f9 = f3 + 1.0f;
        C0002a a5 = a(1.0f, f9, f9);
        float f10 = bVar2.a[0];
        float f11 = bVar2.a[1];
        float f12 = bVar2.a[2];
        float f13 = f10 + f11 + f12;
        float f14 = f13 == 0.0f ? 1.0f : (f10 / f13) * 3.0f;
        float f15 = f13 == 0.0f ? 1.0f : (f11 / f13) * 3.0f;
        float f16 = f13 == 0.0f ? 1.0f : (f12 / f13) * 3.0f;
        if (f3 < 0.0f) {
            aVar2 = new C0002a((double) (f14 * 0.241f), (double) (f14 * 0.691f), (double) (f14 * 0.068f), 0.0d, (double) (f15 * 0.241f), (double) (f15 * 0.691f), (double) (f15 * 0.068f), 0.0d, (double) (0.241f * f16), (double) (f16 * 0.691f), (double) (f16 * 0.068f), 0.0d, 0.0d, 0.0d, 0.0d, 1.0d);
            C0002a a6 = a();
            for (int i = 0; i < 16; i++) {
                aVar2.a[i] = (aVar2.a[i] * (1.0f - f9)) + (a6.a[i] * f9);
            }
        } else {
            aVar2 = a();
        }
        return a(aVar2, a(a(a(aVar3, a(a5, aVar)), a2), a4));
    }

    static C0002a a(C0002a aVar, C0002a aVar2) {
        float[] fArr = aVar2.a;
        float[] fArr2 = aVar.a;
        C0002a aVar3 = new C0002a((fArr[0] * fArr2[0]) + (fArr[4] * fArr2[1]) + (fArr[8] * fArr2[2]) + (fArr[12] * fArr2[3]), (fArr[1] * fArr2[0]) + (fArr[5] * fArr2[1]) + (fArr[9] * fArr2[2]) + (fArr[13] * fArr2[3]), (fArr[2] * fArr2[0]) + (fArr[6] * fArr2[1]) + (fArr[10] * fArr2[2]) + (fArr[14] * fArr2[3]), (fArr[3] * fArr2[0]) + (fArr[7] * fArr2[1]) + (fArr[11] * fArr2[2]) + (fArr[15] * fArr2[3]), (fArr[0] * fArr2[4]) + (fArr[4] * fArr2[5]) + (fArr[8] * fArr2[6]) + (fArr[12] * fArr2[7]), (fArr[1] * fArr2[4]) + (fArr[5] * fArr2[5]) + (fArr[9] * fArr2[6]) + (fArr[13] * fArr2[7]), (fArr[2] * fArr2[4]) + (fArr[6] * fArr2[5]) + (fArr[10] * fArr2[6]) + (fArr[14] * fArr2[7]), (fArr[3] * fArr2[4]) + (fArr[7] * fArr2[5]) + (fArr[11] * fArr2[6]) + (fArr[15] * fArr2[7]), (fArr[0] * fArr2[8]) + (fArr[4] * fArr2[9]) + (fArr[8] * fArr2[10]) + (fArr[12] * fArr2[11]), (fArr[1] * fArr2[8]) + (fArr[5] * fArr2[9]) + (fArr[9] * fArr2[10]) + (fArr[13] * fArr2[11]), (fArr[2] * fArr2[8]) + (fArr[6] * fArr2[9]) + (fArr[10] * fArr2[10]) + (fArr[14] * fArr2[11]), (fArr[3] * fArr2[8]) + (fArr[7] * fArr2[9]) + (fArr[11] * fArr2[10]) + (fArr[15] * fArr2[11]), (fArr[0] * fArr2[12]) + (fArr[4] * fArr2[13]) + (fArr[8] * fArr2[14]) + (fArr[12] * fArr2[15]), (fArr[1] * fArr2[12]) + (fArr[5] * fArr2[13]) + (fArr[9] * fArr2[14]) + (fArr[13] * fArr2[15]), (fArr[2] * fArr2[12]) + (fArr[6] * fArr2[13]) + (fArr[10] * fArr2[14]) + (fArr[14] * fArr2[15]), (fArr[3] * fArr2[12]) + (fArr[7] * fArr2[13]) + (fArr[11] * fArr2[14]) + (fArr[15] * fArr2[15]));
        return aVar3;
    }

    static C0002a a(b bVar) {
        b bVar2 = bVar;
        C0002a aVar = new C0002a(1.0d, 0.0d, 0.0d, (double) bVar2.a[0], 0.0d, 1.0d, 0.0d, (double) bVar2.a[1], 0.0d, 0.0d, 1.0d, (double) bVar2.a[2], 0.0d, 0.0d, 0.0d, 1.0d);
        return aVar;
    }
}
