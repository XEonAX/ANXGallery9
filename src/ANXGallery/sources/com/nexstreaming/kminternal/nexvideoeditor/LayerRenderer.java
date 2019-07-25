package com.nexstreaming.kminternal.nexvideoeditor;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Color;
import android.graphics.ColorMatrix;
import android.opengl.GLES20;
import android.opengl.GLU;
import android.opengl.GLUtils;
import android.opengl.Matrix;
import android.util.Log;
import com.nexstreaming.kminternal.kinemaster.config.EditorGlobal;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

public class LayerRenderer {
    /* access modifiers changed from: private */
    public static int[] ap = new int[1];
    private static final float[] ax = {0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f};
    private p A = new q();
    private p B = new s();
    private p C = new s();
    private p D;
    private p E;
    private v F = new v();
    private v G = new v();
    private v H;
    private u I = new u();
    private u J = new u();
    private u K;
    private p L = new t();
    private p M = new t();
    private p N;
    private p O = new w();
    private p P = new w();
    private p Q;
    private p R = new x();
    private p S = new x();
    private p T;
    private y U = new y();
    private y V = new y();
    private y W;
    private g X = new g();
    private g Y = new g();
    private g Z;
    boolean a = false;
    private Bitmap aA;
    private ColorMatrix aB = new ColorMatrix();
    private ab aa = new ab();
    private ab ab = new ab();
    private ab ac;
    private k ad = new k();
    private k ae = new k();
    private k af;
    private p ag;
    private RenderTarget ah = RenderTarget.Normal;
    private boolean ai = false;
    private boolean aj = false;
    private boolean ak = false;
    private boolean al = false;
    private boolean am = false;
    private boolean an = false;
    private boolean ao = false;
    private float[] aq = {1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f};
    private ColorMatrix ar = new ColorMatrix();
    private ColorMatrix as = new ColorMatrix() {
        {
            set(new float[]{0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f});
        }
    };
    private float[] at = {1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f};
    private float[] au = {1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f};
    private FloatBuffer av = ByteBuffer.allocateDirect(64).order(ByteOrder.nativeOrder()).asFloatBuffer();
    private FloatBuffer aw = ByteBuffer.allocateDirect(32).order(ByteOrder.nativeOrder()).asFloatBuffer();
    private float[] ay = new float[16];
    private RenderMode az;
    private int b;
    private int c;
    private int d;
    private int e;
    private int f;
    private float[] g = new float[16];
    private float h = 1.0f;
    private float i;
    private float j;
    private float k;
    private int l = 0;
    private z[] m = new z[16];
    private Map<Bitmap, h> n = new WeakHashMap();
    private Set<h> o = new HashSet();
    private Map<Bitmap, h> p = new WeakHashMap();
    private Set<h> q = new HashSet();
    private Map<Bitmap, h> r;
    private Set<h> s;
    private Map<Object, Integer> t = new WeakHashMap();
    private Set<Integer> u = new HashSet();
    private Map<Object, Integer> v = new WeakHashMap();
    private Set<Integer> w = new HashSet();
    private Map<Object, Integer> x;
    private Set<Integer> y;
    private p z = new q();

    public enum RenderMode {
        Preview(0),
        Export(1);
        
        public final int id;

        private RenderMode(int i) {
            this.id = i;
        }
    }

    public enum RenderTarget {
        Normal,
        Mask
    }

    private class a extends o {
        private int b;
        private int c;
        private int d;
        private int f;
        private int g;
        private FloatBuffer h;
        private FloatBuffer i;
        private int j;
        private float[] k;
        private float l;

        a() {
            super();
            a("doBaseVertexWork");
            b("applyBase");
            c("//Base Vertex Block\nattribute vec4 a_position;\nattribute vec2 a_texCoord;uniform mat4 u_mvp_matrix;\nvarying highp vec2 v_texCoord;\nvoid doBaseVertexWork(){\n        v_texCoord = a_texCoord;\n        gl_Position = a_position * u_mvp_matrix;\n}");
            d("varying highp vec2 v_texCoord;\nuniform sampler2D u_textureSampler;\nuniform highp float u_alpha_test;\nhighp vec4 applyBase(){\n        highp vec4 color;\n        color.rgba = (texture2D(u_textureSampler, v_texCoord)).bgra;\n        if(color.a < u_alpha_test) return vec4(0,0,0,0);\n        return color;\n}");
        }

        public void a(n nVar) {
            int a2 = nVar.a();
            GLES20.glActiveTexture(33984 + a2);
            LayerRenderer.r();
            GLES20.glBindTexture(3553, this.j);
            LayerRenderer.r();
            GLES20.glUniform1i(this.d, a2);
            LayerRenderer.r();
            GLES20.glUniform1f(this.g, this.l);
            GLES20.glEnableVertexAttribArray(this.b);
            LayerRenderer.r();
            GLES20.glEnableVertexAttribArray(this.c);
            LayerRenderer.r();
            LayerRenderer.this.a(this.f, 1, true, this.k, 0);
            LayerRenderer.r();
            GLES20.glVertexAttribPointer(this.b, 4, 5126, false, 0, this.h);
            LayerRenderer.r();
            GLES20.glVertexAttribPointer(this.c, 2, 5126, false, 0, this.i);
            LayerRenderer.r();
        }

        public void a(FloatBuffer floatBuffer) {
            this.h = floatBuffer;
        }

        public void a(float[] fArr) {
            this.k = fArr;
        }

        public void a_(int i2) {
            this.j = i2;
        }

        public void b(int i2) {
            this.b = GLES20.glGetAttribLocation(i2, "a_position");
            this.c = GLES20.glGetAttribLocation(i2, "a_texCoord");
            this.f = GLES20.glGetUniformLocation(i2, "u_mvp_matrix");
            this.d = GLES20.glGetUniformLocation(i2, "u_textureSampler");
            this.g = GLES20.glGetUniformLocation(i2, "u_alpha_test");
        }

        public void b(FloatBuffer floatBuffer) {
            this.i = floatBuffer;
        }
    }

    private class aa extends o {
        float a;
        private int c;

        aa() {
            super();
            a("");
            b("applyUserAlpha");
            c("");
            d("uniform highp float u_alpha;\nhighp vec4 applyUserAlpha(highp vec4 color){\n        return color * u_alpha;\n}");
            a(1.0f);
        }

        /* access modifiers changed from: 0000 */
        public void a(float f) {
            this.a = f;
        }

        public void a(n nVar) {
            GLES20.glUniform1f(this.c, this.a);
        }

        public void b(int i) {
            this.c = GLES20.glGetUniformLocation(i, "u_alpha");
        }
    }

    private class ab implements p {
        c a;
        m b;
        e c;
        aa d;
        private int f;

        ab() {
            this.a = new c();
            this.c = new e();
            this.b = new m();
            this.d = new aa();
            this.a.a((o) new l());
            this.c.a((o) this.a);
            this.b.a((o) this.c);
            this.d.a((o) this.b);
        }

        public int a(int i, String str) {
            int glCreateShader = GLES20.glCreateShader(i);
            GLES20.glShaderSource(glCreateShader, str);
            GLES20.glCompileShader(glCreateShader);
            GLES20.glGetShaderInfoLog(glCreateShader);
            return glCreateShader;
        }

        /* access modifiers changed from: 0000 */
        public void a() {
            int a2 = a(35633, this.d.j());
            int a3 = a(35632, this.d.k());
            this.f = GLES20.glCreateProgram();
            GLES20.glAttachShader(this.f, a2);
            GLES20.glAttachShader(this.f, a3);
            GLES20.glLinkProgram(this.f);
            Log.e("layererrenderer", GLES20.glGetProgramInfoLog(this.f));
            this.d.a(this.f);
        }

        public void a(int i) {
            this.a.c(i);
        }

        public void a(int i, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            if (this.f == 0) {
                a();
            }
            GLES20.glUseProgram(this.f);
            this.a.a(floatBuffer);
            this.a.b(floatBuffer2);
            this.a.c_(i);
            this.c.a(fArr2);
            this.a.a(fArr);
            this.d.a(f2);
            this.d.b(new n());
            GLES20.glDrawArrays(5, 0, 4);
            LayerRenderer.r();
        }

        public void a(h hVar, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            a(hVar.a, fArr, fArr2, f2, floatBuffer, floatBuffer2);
        }
    }

    private class b extends o {
        private int b;
        private int c;
        private int d;
        private int f;
        private int g;
        private int h;
        private FloatBuffer i;
        private FloatBuffer j;
        private int k;
        private int l;
        private float[] m;
        private float n;
        private int o;
        private float[] p = new float[2];
        private int q;
        private float[] r = new float[2];

        b() {
            super();
            a("doBaseVertexWork");
            b("applyBlurBase");
            c("attribute vec4 a_position;\nattribute vec2 a_texCoord;uniform mat4 u_mvp_matrix;\nuniform highp vec2 u_texture_size;\nuniform highp vec2 u_block_size;\nvarying highp vec2 v_texCoord;\nvarying highp vec2 v_blurTexCoords[14];\nvoid doBaseVertexWork(){\n       v_texCoord = a_texCoord;\n       v_blurTexCoords[ 0] = v_texCoord + vec2(-7.0 / u_texture_size.x * u_block_size.x,0.0);\n       v_blurTexCoords[ 1] = v_texCoord + vec2(-6.0 / u_texture_size.x * u_block_size.x,0.0);\n       v_blurTexCoords[ 2] = v_texCoord + vec2(-5.0 / u_texture_size.x * u_block_size.x,0.0);\n       v_blurTexCoords[ 3] = v_texCoord + vec2(-4.0 / u_texture_size.x * u_block_size.x,0.0);\n       v_blurTexCoords[ 4] = v_texCoord + vec2(-3.0 / u_texture_size.x * u_block_size.x,0.0);\n       v_blurTexCoords[ 5] = v_texCoord + vec2(-2.0 / u_texture_size.x * u_block_size.x,0.0);\n       v_blurTexCoords[ 6] = v_texCoord + vec2(-1.0 / u_texture_size.x * u_block_size.x,0.0);\n       v_blurTexCoords[ 7] = v_texCoord + vec2( 1.0 / u_texture_size.x * u_block_size.x,0.0);\n       v_blurTexCoords[ 8] = v_texCoord + vec2( 2.0 / u_texture_size.x * u_block_size.x,0.0);\n       v_blurTexCoords[ 9] = v_texCoord + vec2( 3.0 / u_texture_size.x * u_block_size.x,0.0);\n       v_blurTexCoords[10] = v_texCoord + vec2( 4.0 / u_texture_size.x * u_block_size.x,0.0);\n       v_blurTexCoords[11] = v_texCoord + vec2( 5.0 / u_texture_size.x * u_block_size.x,0.0);\n       v_blurTexCoords[12] = v_texCoord + vec2( 6.0 / u_texture_size.x * u_block_size.x,0.0);\n       v_blurTexCoords[13] = v_texCoord + vec2( 7.0 / u_texture_size.x * u_block_size.x,0.0);\n       gl_Position = a_position * u_mvp_matrix;\n}");
            d("varying highp vec2 v_texCoord;\nvarying highp vec2 v_blurTexCoords[14];\nuniform highp vec2 u_texture_size;\nuniform sampler2D u_textureSampler;\nuniform sampler2D u_maskSampler;\nuniform highp vec2 u_block_size;\nuniform highp float u_alpha_test;\nhighp vec4 getTexColor(highp vec2 uv){\nhighp float dx = u_block_size.x * (1.0 / u_texture_size.x);\nhighp float dy = u_block_size.y * (1.0 / u_texture_size.y);\nhighp vec4 color = vec4(0.0);\nhighp vec2 coord = vec2(dx*floor(uv.x / dx) + 1. / u_texture_size.x, dy*floor(uv.y / dy) + 1. / u_texture_size.y);\ncolor.rgba = (texture2D(u_textureSampler, coord));\nreturn color;\n}\nhighp vec4 applyBlurBase(){\n       highp vec4 color;\n       highp vec4 mask = texture2D(u_maskSampler, v_texCoord);\n       if(mask.x == 0.0) return vec4(0, 0, 0, 0);\n       color.bgra = getTexColor(v_texCoord) * 0.159576912161;\n       color.bgra += getTexColor(v_blurTexCoords[ 0])*0.0044299121055113265;\n       color.bgra += getTexColor(v_blurTexCoords[1])*0.00895781211794;\n       color.bgra += getTexColor(v_blurTexCoords[2])*0.0215963866053;\n       color.bgra += getTexColor(v_blurTexCoords[3])*0.0443683338718;\n       color.bgra += getTexColor(v_blurTexCoords[4])*0.0776744219933;\n       color.bgra += getTexColor(v_blurTexCoords[5])*0.115876621105;\n       color.bgra += getTexColor(v_blurTexCoords[6])*0.147308056121;\n       color.bgra += getTexColor(v_blurTexCoords[7])*0.147308056121;\n       color.bgra += getTexColor(v_blurTexCoords[8])*0.115876621105;\n       color.bgra += getTexColor(v_blurTexCoords[9])*0.0776744219933;\n       color.bgra += getTexColor(v_blurTexCoords[10])*0.0443683338718;\n       color.bgra += getTexColor(v_blurTexCoords[11])*0.0215963866053;\n       color.bgra += getTexColor(v_blurTexCoords[12])*0.00895781211794;\n       color.bgra += getTexColor(v_blurTexCoords[13])*0.0044299121055113265;\n        if(color.a < u_alpha_test) return vec4(0,0,0,0);\n        return color.bgra;\n}\n");
        }

        public void a(float f2, float f3) {
            this.p[0] = ((float) Math.floor((double) (f2 * 30.0f))) + 1.0f;
            this.p[1] = ((float) Math.floor((double) (f3 * 30.0f))) + 1.0f;
        }

        public void a(n nVar) {
            a(LayerRenderer.this.f() * 0.2f, LayerRenderer.this.f() * 0.2f);
            b(LayerRenderer.this.c(), LayerRenderer.this.d());
            int a2 = nVar.a();
            GLES20.glActiveTexture(a2 + 33984);
            LayerRenderer.r();
            GLES20.glBindTexture(3553, this.k);
            LayerRenderer.r();
            GLES20.glUniform1i(this.d, a2);
            LayerRenderer.r();
            int a3 = nVar.a();
            GLES20.glActiveTexture(33984 + a3);
            LayerRenderer.r();
            GLES20.glBindTexture(3553, this.l);
            LayerRenderer.r();
            GLES20.glUniform1i(this.f, a3);
            LayerRenderer.r();
            GLES20.glUniform1f(this.h, this.n);
            GLES20.glEnableVertexAttribArray(this.b);
            LayerRenderer.r();
            GLES20.glEnableVertexAttribArray(this.c);
            LayerRenderer.r();
            LayerRenderer.this.a(this.g, 1, true, this.m, 0);
            LayerRenderer.r();
            GLES20.glVertexAttribPointer(this.b, 4, 5126, false, 0, this.i);
            LayerRenderer.r();
            GLES20.glVertexAttribPointer(this.c, 2, 5126, false, 0, this.j);
            LayerRenderer.r();
            GLES20.glUniform2f(this.o, this.p[0], this.p[1]);
            GLES20.glUniform2f(this.q, this.r[0], this.r[1]);
        }

        public void a(FloatBuffer floatBuffer) {
            this.i = floatBuffer;
        }

        public void a(float[] fArr) {
            this.m = fArr;
        }

        public void b(float f2, float f3) {
            this.r[0] = f2;
            this.r[1] = f3;
        }

        public void b(int i2) {
            this.b = GLES20.glGetAttribLocation(i2, "a_position");
            this.c = GLES20.glGetAttribLocation(i2, "a_texCoord");
            this.g = GLES20.glGetUniformLocation(i2, "u_mvp_matrix");
            this.d = GLES20.glGetUniformLocation(i2, "u_textureSampler");
            this.f = GLES20.glGetUniformLocation(i2, "u_maskSampler");
            this.h = GLES20.glGetUniformLocation(i2, "u_alpha_test");
            this.o = GLES20.glGetUniformLocation(i2, "u_block_size");
            this.q = GLES20.glGetUniformLocation(i2, "u_texture_size");
        }

        public void b(FloatBuffer floatBuffer) {
            this.j = floatBuffer;
        }

        public void b_(int i2) {
            this.k = i2;
        }

        public void c(int i2) {
            this.l = i2;
        }
    }

    private class c extends o {
        private int b;
        private int c;
        private int d;
        private int f;
        private int g;
        private int h;
        private FloatBuffer i;
        private FloatBuffer j;
        private int k;
        private int l;
        private float[] m;
        private float n;
        private int o;
        private float[] p = new float[2];
        private int q;
        private float[] r = new float[2];

        c() {
            super();
            a("doBaseVertexWork");
            b("applyBlurBase");
            c("attribute vec4 a_position;\nattribute vec2 a_texCoord;uniform mat4 u_mvp_matrix;\nuniform highp vec2 u_block_size;\nuniform highp vec2 u_texture_size;\nvarying highp vec2 v_texCoord;\nvarying highp vec2 v_blurTexCoords[14];\nvoid doBaseVertexWork(){\n       v_texCoord = a_texCoord;\n       v_blurTexCoords[ 0] = v_texCoord + vec2(0.0, -7.0 / u_texture_size.y * u_block_size.y);\n       v_blurTexCoords[ 1] = v_texCoord + vec2(0.0, -6.0 / u_texture_size.y * u_block_size.y);\n       v_blurTexCoords[ 2] = v_texCoord + vec2(0.0, -5.0 / u_texture_size.y * u_block_size.y);\n       v_blurTexCoords[ 3] = v_texCoord + vec2(0.0, -4.0 / u_texture_size.y * u_block_size.y);\n       v_blurTexCoords[ 4] = v_texCoord + vec2(0.0, -3.0 / u_texture_size.y * u_block_size.y);\n       v_blurTexCoords[ 5] = v_texCoord + vec2(0.0, -2.0 / u_texture_size.y * u_block_size.y);\n       v_blurTexCoords[ 6] = v_texCoord + vec2(0.0, -1.0 / u_texture_size.y * u_block_size.y);\n       v_blurTexCoords[ 7] = v_texCoord + vec2(0.0,  1.0 / u_texture_size.y * u_block_size.y);\n       v_blurTexCoords[ 8] = v_texCoord + vec2(0.0,  2.0 / u_texture_size.y * u_block_size.y);\n       v_blurTexCoords[ 9] = v_texCoord + vec2(0.0,  3.0 / u_texture_size.y * u_block_size.y);\n       v_blurTexCoords[10] = v_texCoord + vec2(0.0,  4.0 / u_texture_size.y * u_block_size.y);\n       v_blurTexCoords[11] = v_texCoord + vec2(0.0,  5.0 / u_texture_size.y * u_block_size.y);\n       v_blurTexCoords[12] = v_texCoord + vec2(0.0,  6.0 / u_texture_size.y * u_block_size.y);\n       v_blurTexCoords[13] = v_texCoord + vec2(0.0,  7.0 / u_texture_size.y * u_block_size.y);\n       gl_Position = a_position * u_mvp_matrix;\n}");
            d("varying highp vec2 v_texCoord;\nvarying highp vec2 v_blurTexCoords[14];\nuniform highp vec2 u_texture_size;\nuniform sampler2D u_textureSampler;\nuniform sampler2D u_maskSampler;\nuniform highp vec2 u_block_size;\nuniform highp float u_alpha_test;\nhighp vec4 getTexColor(highp vec2 uv){\nhighp float dx = u_block_size.x * (1.0 / u_texture_size.x);\nhighp float dy = u_block_size.y * (1.0 / u_texture_size.y);\nhighp vec4 color = vec4(0.0);\nhighp vec2 coord = vec2(dx*floor(uv.x / dx) + 1. / u_texture_size.x, dy*floor(uv.y / dy) + 1. / u_texture_size.y);\ncolor.rgba = (texture2D(u_textureSampler, coord));\nreturn color;\n}\nhighp vec4 applyBlurBase(){\n       highp vec4 color;\n       highp vec4 mask = texture2D(u_maskSampler, v_texCoord);\n       if(mask.x == 0.0) return vec4(0, 0, 0, 0);\n       color.bgra = getTexColor(v_texCoord) * 0.159576912161;\n       color.bgra += getTexColor(v_blurTexCoords[ 0])*0.0044299121055113265;\n       color.bgra += getTexColor(v_blurTexCoords[1])*0.00895781211794;\n       color.bgra += getTexColor(v_blurTexCoords[2])*0.0215963866053;\n       color.bgra += getTexColor(v_blurTexCoords[3])*0.0443683338718;\n       color.bgra += getTexColor(v_blurTexCoords[4])*0.0776744219933;\n       color.bgra += getTexColor(v_blurTexCoords[5])*0.115876621105;\n       color.bgra += getTexColor(v_blurTexCoords[6])*0.147308056121;\n       color.bgra += getTexColor(v_blurTexCoords[7])*0.147308056121;\n       color.bgra += getTexColor(v_blurTexCoords[8])*0.115876621105;\n       color.bgra += getTexColor(v_blurTexCoords[9])*0.0776744219933;\n       color.bgra += getTexColor(v_blurTexCoords[10])*0.0443683338718;\n       color.bgra += getTexColor(v_blurTexCoords[11])*0.0215963866053;\n       color.bgra += getTexColor(v_blurTexCoords[12])*0.00895781211794;\n       color.bgra += getTexColor(v_blurTexCoords[13])*0.0044299121055113265;\n        if(color.a < u_alpha_test) return vec4(0,0,0,0);\n        return color.rgba;\n}\n");
        }

        public void a(float f2, float f3) {
            this.p[0] = ((float) Math.floor((double) (f2 * 30.0f))) + 1.0f;
            this.p[1] = ((float) Math.floor((double) (f3 * 30.0f))) + 1.0f;
        }

        public void a(n nVar) {
            a(LayerRenderer.this.f() * 0.2f, LayerRenderer.this.f() * 0.2f);
            b(LayerRenderer.this.c(), LayerRenderer.this.d());
            int a2 = nVar.a();
            GLES20.glActiveTexture(a2 + 33984);
            LayerRenderer.r();
            GLES20.glBindTexture(3553, this.k);
            LayerRenderer.r();
            GLES20.glUniform1i(this.d, a2);
            LayerRenderer.r();
            int a3 = nVar.a();
            GLES20.glActiveTexture(33984 + a3);
            LayerRenderer.r();
            GLES20.glBindTexture(3553, this.l);
            LayerRenderer.r();
            GLES20.glUniform1i(this.f, a3);
            LayerRenderer.r();
            GLES20.glUniform1f(this.h, this.n);
            GLES20.glEnableVertexAttribArray(this.b);
            LayerRenderer.r();
            GLES20.glEnableVertexAttribArray(this.c);
            LayerRenderer.r();
            LayerRenderer.this.a(this.g, 1, true, this.m, 0);
            LayerRenderer.r();
            GLES20.glVertexAttribPointer(this.b, 4, 5126, false, 0, this.i);
            LayerRenderer.r();
            GLES20.glVertexAttribPointer(this.c, 2, 5126, false, 0, this.j);
            LayerRenderer.r();
            GLES20.glUniform2f(this.o, this.p[0], this.p[1]);
            GLES20.glUniform2f(this.q, this.r[0], this.r[1]);
        }

        public void a(FloatBuffer floatBuffer) {
            this.i = floatBuffer;
        }

        public void a(float[] fArr) {
            this.m = fArr;
        }

        public void b(float f2, float f3) {
            this.r[0] = f2;
            this.r[1] = f3;
        }

        public void b(int i2) {
            this.b = GLES20.glGetAttribLocation(i2, "a_position");
            this.c = GLES20.glGetAttribLocation(i2, "a_texCoord");
            this.g = GLES20.glGetUniformLocation(i2, "u_mvp_matrix");
            this.d = GLES20.glGetUniformLocation(i2, "u_textureSampler");
            this.f = GLES20.glGetUniformLocation(i2, "u_maskSampler");
            this.h = GLES20.glGetUniformLocation(i2, "u_alpha_test");
            this.o = GLES20.glGetUniformLocation(i2, "u_block_size");
            this.q = GLES20.glGetUniformLocation(i2, "u_texture_size");
        }

        public void b(FloatBuffer floatBuffer) {
            this.j = floatBuffer;
        }

        public void c(int i2) {
            this.l = i2;
        }

        public void c_(int i2) {
            this.k = i2;
        }
    }

    private class d extends o {
        private int b;
        private int c;
        private int d;
        private int f;
        private float[] g = new float[3];
        private float[] h = new float[4];
        private float[] i = new float[3];

        d() {
            super();
            a("");
            b("applyChromakey");
            c("");
            d("uniform highp vec3 u_keyvalue;\nuniform highp vec3 u_strength;\nuniform highp vec4 u_division;\nuniform int CKMaskOnOff;\nhighp float proportionalstep(highp float edge0, highp float edge1, highp float x){\nx = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);\nreturn x;\n}\nhighp vec4 applyChromakey(highp vec4 color){\nconst highp mat4 rgbyuv = mat4(\n\t\t\t0.300, 0.589, 0.111, -0.003,\n\t\t\t-0.169, -0.332, 0.502, 0.502,\n\t\t\t0.499, -0.420, -0.079, 0.502,\n\t\t\t0.000, 0.000, 0.000, 1.000);\nconst highp mat4 yuvrgb = mat4(\n\t\t\t1.000, 0.000, 1.402, -0.701,\n\t\t\t1.000, -0.334, -0.714, 0.529,\n\t\t\t1.000, 1.772, 0.000, -0.886,\n\t\t\t0.000, 0.000, 0.000, 1.000);\nhighp vec4 yuv = color * rgbyuv;\nhighp vec4 yuv_key = vec4(u_keyvalue, 1.0) * rgbyuv;\nhighp float radius = length(vec2(yuv.gb) - vec2(yuv_key.gb));\nhighp float alpha = proportionalstep(u_division.x, u_division.y, radius) * u_strength.x\n+ proportionalstep(u_division.y, u_division.z, radius) * u_strength.y\n+ proportionalstep(u_division.z, u_division.w, radius) * u_strength.z;\nif(CKMaskOnOff == 1){\ncolor = color * 0.000001 + vec4(alpha, alpha, alpha, 1.0);}\nelse{\ncolor = color * alpha;}\n\t\treturn color;\n\t}");
            a(0, 255, 0);
            a(0.3f, 0.4f, 0.45f, 0.5f);
            a(0.05f, 0.3f, 0.65f);
        }

        public void a(float f2, float f3, float f4) {
            this.i[0] = f2;
            this.i[1] = f3;
            this.i[2] = f4;
        }

        public void a(float f2, float f3, float f4, float f5) {
            this.h[0] = f2;
            this.h[1] = f3;
            this.h[2] = f4;
            this.h[3] = f5;
        }

        public void a(int i2, int i3, int i4) {
            this.g[0] = ((float) i2) / 255.0f;
            this.g[1] = ((float) i3) / 255.0f;
            this.g[2] = ((float) i4) / 255.0f;
        }

        public void a(n nVar) {
            int e = LayerRenderer.this.e();
            GLES20.glUniform3f(this.b, this.g[0], this.g[1], this.g[2]);
            GLES20.glUniform4f(this.c, this.h[0], this.h[1], this.h[2], this.h[3]);
            GLES20.glUniform3f(this.d, this.i[0], this.i[1], this.i[2]);
            GLES20.glUniform1i(this.f, e);
        }

        public void b(int i2) {
            this.b = GLES20.glGetUniformLocation(i2, "u_keyvalue");
            this.c = GLES20.glGetUniformLocation(i2, "u_division");
            this.d = GLES20.glGetUniformLocation(i2, "u_strength");
            this.f = GLES20.glGetUniformLocation(i2, "CKMaskOnOff");
        }
    }

    private class e extends o {
        private int b;
        private float[] c;

        e() {
            super();
            a("");
            b("applyColorConv");
            c("");
            d("uniform highp mat4 u_colorconv;\nhighp vec4 applyColorConv(highp vec4 color){\n        color = color * u_colorconv;\n        color = clamp(color, 0.0, 1.0);\n        return color;\n}");
        }

        public void a(n nVar) {
            LayerRenderer.this.a(this.b, 1, false, this.c, 0);
            LayerRenderer.r();
        }

        public void a(float[] fArr) {
            this.c = fArr;
        }

        public void b(int i) {
            this.b = GLES20.glGetUniformLocation(i, "u_colorconv");
        }
    }

    private class f extends o {
        int a;
        int b;
        float c = 1.0f;
        private int f = 0;

        f() {
            super();
            a("");
            b("applyLUT");
            c("");
            d("const highp float block_factor = 64.0;\nuniform sampler2D u_textureSampler_for_lut;\nuniform highp float u_strength_for_lut;\n\nhighp vec4 applyLUT(highp vec4 color) {\n   highp float block = (block_factor - 1.0) * color.b;\n   highp float low = floor(block);\n   highp float high = ceil(block);\n   highp float y0 = mod(low, 8.0);\n   highp float x0 = (low - y0) / 8.0;\n   highp float y1 = mod(high, 8.0);\n   highp float x1 = (high - y1) / 8.0;\n   x0 /= 8.0;\n   y0 /= 8.0;\n   x1 /= 8.0;\n   y1 /= 8.0;\n   highp vec2 rg_pos = (63.0 / 512.0) * color.rg + 0.5 / 512.0;\n   highp vec4 color0 = texture2D(u_textureSampler_for_lut, vec2(x0, y0) + rg_pos.yx).rgba;\n   highp vec4 color1 = texture2D(u_textureSampler_for_lut, vec2(x1, y1) + rg_pos.yx).rgba;\n   return vec4(mix(color.rgb, mix(color0, color1, fract(block)).rgb, u_strength_for_lut).rgb * color.a, color.a);\n}");
        }

        public void a(n nVar) {
            int a2 = nVar.a();
            GLES20.glActiveTexture(33984 + a2);
            LayerRenderer.r();
            GLES20.glBindTexture(3553, this.f);
            LayerRenderer.r();
            GLES20.glUniform1i(this.a, a2);
            LayerRenderer.r();
            GLES20.glUniform1f(this.b, this.c);
            LayerRenderer.r();
        }

        public void b(int i) {
            this.a = GLES20.glGetUniformLocation(i, "u_textureSampler_for_lut");
            this.b = GLES20.glGetUniformLocation(i, "u_strength_for_lut");
        }

        /* access modifiers changed from: 0000 */
        public void d_(int i) {
            this.f = i;
        }
    }

    private class g implements p {
        b a;
        m b;
        e c;
        aa d;
        private int f;

        g() {
            this.a = new b();
            this.c = new e();
            this.b = new m();
            this.d = new aa();
            this.a.a((o) new l());
            this.c.a((o) this.a);
            this.b.a((o) this.c);
            this.d.a((o) this.b);
        }

        public int a(int i, String str) {
            int glCreateShader = GLES20.glCreateShader(i);
            GLES20.glShaderSource(glCreateShader, str);
            GLES20.glCompileShader(glCreateShader);
            GLES20.glGetShaderInfoLog(glCreateShader);
            return glCreateShader;
        }

        /* access modifiers changed from: 0000 */
        public void a() {
            int a2 = a(35633, this.d.j());
            int a3 = a(35632, this.d.k());
            this.f = GLES20.glCreateProgram();
            GLES20.glAttachShader(this.f, a2);
            GLES20.glAttachShader(this.f, a3);
            GLES20.glLinkProgram(this.f);
            Log.e("layererrenderer", GLES20.glGetProgramInfoLog(this.f));
            this.d.a(this.f);
        }

        public void a(int i) {
            this.a.c(i);
        }

        public void a(int i, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            if (this.f == 0) {
                a();
            }
            GLES20.glUseProgram(this.f);
            this.a.a(floatBuffer);
            this.a.b(floatBuffer2);
            this.a.b_(i);
            this.c.a(fArr2);
            this.a.a(fArr);
            this.d.a(f2);
            this.d.b(new n());
            GLES20.glDrawArrays(5, 0, 4);
            LayerRenderer.r();
        }

        public void a(h hVar, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            a(hVar.a, fArr, fArr2, f2, floatBuffer, floatBuffer2);
        }
    }

    private static class h {
        int a;
        int b;
        int c;
        int d;
        boolean e = false;

        public h(Bitmap bitmap) {
            LayerRenderer.r();
            this.b = bitmap.getWidth();
            this.c = bitmap.getHeight();
            this.d = bitmap.getGenerationId();
            GLES20.glGenTextures(1, LayerRenderer.ap, 0);
            LayerRenderer.r();
            this.a = LayerRenderer.ap[0];
            StringBuilder sb = new StringBuilder();
            sb.append("Made layer texture: ");
            sb.append(this.a);
            sb.append(" (generation=");
            sb.append(this.d);
            sb.append(")");
            Log.d("LayerRenderer", sb.toString());
            GLES20.glActiveTexture(33984);
            LayerRenderer.r();
            GLES20.glBindTexture(3553, this.a);
            LayerRenderer.r();
            GLES20.glTexParameteri(3553, 10241, 9729);
            LayerRenderer.r();
            GLES20.glTexParameteri(3553, 10240, 9729);
            LayerRenderer.r();
            GLES20.glTexParameteri(3553, 10242, 33071);
            LayerRenderer.r();
            GLES20.glTexParameteri(3553, 10243, 33071);
            LayerRenderer.r();
            GLUtils.texImage2D(3553, 0, bitmap, 0);
            if (GLES20.glGetError() != 0) {
                a(3553, 0, bitmap, 0);
                LayerRenderer.r();
            }
        }

        private static void a(int i, int i2, Bitmap bitmap, int i3) {
            int width = bitmap.getWidth();
            int height = bitmap.getHeight();
            IntBuffer allocate = IntBuffer.allocate(width * height);
            bitmap.getPixels(allocate.array(), 0, width, 0, 0, width, height);
            int[] array = allocate.array();
            int length = array.length;
            for (int i4 = 0; i4 < length; i4++) {
                int i5 = array[i4];
                array[i4] = (i5 & -16711936) | ((16711680 & i5) >> 16) | ((i5 & 255) << 16);
            }
            GLES20.glTexImage2D(i, i2, 6408, width, height, i3, 6408, 5121, allocate);
        }

        public void a() {
            if (!this.e) {
                StringBuilder sb = new StringBuilder();
                sb.append("Destroy texture: ");
                sb.append(this.a);
                Log.d("LayerRenderer", sb.toString());
                LayerRenderer.ap[0] = this.a;
                GLES20.glDeleteTextures(1, LayerRenderer.ap, 0);
                LayerRenderer.r();
                this.a = 0;
                this.e = true;
            }
        }

        public void a(Bitmap bitmap) {
            if (bitmap.getGenerationId() != this.d) {
                StringBuilder sb = new StringBuilder();
                sb.append("Update layer texture: ");
                sb.append(this.a);
                sb.append(" (generation=");
                sb.append(this.d);
                sb.append("->");
                sb.append(bitmap.getGenerationId());
                sb.append(")");
                Log.d("LayerRenderer", sb.toString());
                this.d = bitmap.getGenerationId();
                if (bitmap.getWidth() == this.b && bitmap.getHeight() == this.c) {
                    GLES20.glActiveTexture(33984);
                    LayerRenderer.r();
                    GLES20.glBindTexture(3553, this.a);
                    LayerRenderer.r();
                    GLUtils.texSubImage2D(3553, 0, 0, 0, bitmap);
                    LayerRenderer.r();
                } else {
                    this.b = bitmap.getWidth();
                    this.c = bitmap.getHeight();
                    GLES20.glActiveTexture(33984);
                    LayerRenderer.r();
                    GLES20.glBindTexture(3553, this.a);
                    LayerRenderer.r();
                    GLUtils.texImage2D(3553, 0, bitmap, 0);
                    LayerRenderer.r();
                }
            }
        }
    }

    private class i extends o {
        int a;
        private int c;

        i() {
            super();
            a("maskWork");
            b("applyMask");
            c("\nvarying highp vec2 v_texCoord_for_mask;\nvoid maskWork() {\nv_texCoord_for_mask = gl_Position.xy / gl_Position.w * 0.5 + 0.5;\n}\n");
            d("\nvarying highp vec2 v_texCoord_for_mask;\nuniform sampler2D u_textureSampler_for_mask;\nhighp vec4 applyMask(highp vec4 color) {\nhighp vec4 mask = (texture2D(u_textureSampler_for_mask, v_texCoord_for_mask)).rgba;\ncolor *= mask.r;\nreturn color;\n}\n");
            LayerRenderer.this.a(1.0f);
        }

        public void a(n nVar) {
            int a2 = nVar.a();
            GLES20.glActiveTexture(33984 + a2);
            LayerRenderer.r();
            GLES20.glBindTexture(3553, this.c);
            LayerRenderer.r();
            GLES20.glUniform1i(this.a, a2);
            LayerRenderer.r();
        }

        public void b(int i) {
            this.a = GLES20.glGetUniformLocation(i, "u_textureSampler_for_mask");
        }

        /* access modifiers changed from: 0000 */
        public void e_(int i) {
            this.c = i;
        }
    }

    private class j extends o {
        private int b;
        private int c;
        private int d;
        private int f;
        private int g;
        private int h;
        private FloatBuffer i;
        private FloatBuffer j;
        private int k;
        private int l;
        private float[] m;
        private float n;
        private int o;
        private float[] p = new float[2];
        private int q;
        private float[] r = new float[2];

        j() {
            super();
            a("doMosaicBaseVertexWork");
            b("mosaicBase");
            c("//Base Vertex Block\nattribute vec4 a_position;\nattribute vec2 a_texCoord;uniform mat4 u_mvp_matrix;\nvarying highp vec2 v_texCoord;\nvoid doMosaicBaseVertexWork(){\n        v_texCoord = a_texCoord;\n        gl_Position = a_position * u_mvp_matrix;\n}");
            d("varying highp vec2 v_texCoord;\nuniform sampler2D u_textureSampler;\nuniform sampler2D u_maskSampler;\nuniform highp float u_alpha_test;\nuniform highp vec2 u_block_size;\nuniform highp vec2 u_texture_size;\nhighp vec4 mosaicBase(){\n   highp vec2 uv = v_texCoord;\n   highp vec4 mask = texture2D(u_maskSampler, uv);\n   if(mask.x == 0.0) return vec4(0, 0, 0, 0);\n   highp float dx = u_block_size.x * (1.0 / u_texture_size.x);\n   highp float dy = u_block_size.y * (1.0 / u_texture_size.y);\n   highp vec2 coord = vec2(dx*floor(uv.x / dx) + 1. / u_texture_size.x, dy*floor(uv.y / dy) + 1. / u_texture_size.y);\n   highp vec4 color = texture2D(u_textureSampler, coord);\n   if(color.a < u_alpha_test) return vec4(0,0,0,0);\n   return color;\n}");
        }

        public void a(float f2, float f3) {
            if (f2 == 0.0f && f3 == 0.0f) {
                this.p[0] = 1.0f;
                this.p[1] = 1.0f;
                return;
            }
            this.p[0] = ((float) Math.floor((double) (f2 * 49.0f))) + 1.0f;
            this.p[1] = ((float) Math.floor((double) (f3 * 49.0f))) + 1.0f;
        }

        public void a(n nVar) {
            a(LayerRenderer.this.f(), LayerRenderer.this.f());
            b(LayerRenderer.this.c(), LayerRenderer.this.d());
            int a2 = nVar.a();
            GLES20.glActiveTexture(a2 + 33984);
            LayerRenderer.r();
            GLES20.glBindTexture(3553, this.k);
            LayerRenderer.r();
            GLES20.glUniform1i(this.d, a2);
            LayerRenderer.r();
            int a3 = nVar.a();
            GLES20.glActiveTexture(33984 + a3);
            LayerRenderer.r();
            GLES20.glBindTexture(3553, this.l);
            LayerRenderer.r();
            GLES20.glUniform1i(this.f, a3);
            LayerRenderer.r();
            GLES20.glUniform1f(this.h, this.n);
            GLES20.glEnableVertexAttribArray(this.b);
            LayerRenderer.r();
            GLES20.glEnableVertexAttribArray(this.c);
            LayerRenderer.r();
            LayerRenderer.this.a(this.g, 1, true, this.m, 0);
            LayerRenderer.r();
            GLES20.glVertexAttribPointer(this.b, 4, 5126, false, 0, this.i);
            LayerRenderer.r();
            GLES20.glVertexAttribPointer(this.c, 2, 5126, false, 0, this.j);
            LayerRenderer.r();
            GLES20.glUniform2f(this.o, this.p[0], this.p[1]);
            GLES20.glUniform2f(this.q, this.r[0], this.r[1]);
        }

        public void a(FloatBuffer floatBuffer) {
            this.i = floatBuffer;
        }

        public void a(float[] fArr) {
            this.m = fArr;
        }

        public void b(float f2, float f3) {
            this.r[0] = f2;
            this.r[1] = f3;
        }

        public void b(int i2) {
            this.b = GLES20.glGetAttribLocation(i2, "a_position");
            this.c = GLES20.glGetAttribLocation(i2, "a_texCoord");
            this.g = GLES20.glGetUniformLocation(i2, "u_mvp_matrix");
            this.d = GLES20.glGetUniformLocation(i2, "u_textureSampler");
            this.f = GLES20.glGetUniformLocation(i2, "u_maskSampler");
            this.h = GLES20.glGetUniformLocation(i2, "u_alpha_test");
            this.o = GLES20.glGetUniformLocation(i2, "u_block_size");
            this.q = GLES20.glGetUniformLocation(i2, "u_texture_size");
        }

        public void b(FloatBuffer floatBuffer) {
            this.j = floatBuffer;
        }

        public void c(int i2) {
            this.l = i2;
        }

        public void f_(int i2) {
            this.k = i2;
        }
    }

    private class k implements p {
        j a;
        m b;
        e c;
        aa d;
        private int f;

        k() {
            this.a = new j();
            this.c = new e();
            this.b = new m();
            this.d = new aa();
            this.a.a((o) new l());
            this.c.a((o) this.a);
            this.b.a((o) this.c);
            this.d.a((o) this.b);
        }

        public int a(int i, String str) {
            int glCreateShader = GLES20.glCreateShader(i);
            GLES20.glShaderSource(glCreateShader, str);
            GLES20.glCompileShader(glCreateShader);
            GLES20.glGetShaderInfoLog(glCreateShader);
            return glCreateShader;
        }

        /* access modifiers changed from: 0000 */
        public void a() {
            int a2 = a(35633, this.d.j());
            int a3 = a(35632, this.d.k());
            this.f = GLES20.glCreateProgram();
            GLES20.glAttachShader(this.f, a2);
            GLES20.glAttachShader(this.f, a3);
            GLES20.glLinkProgram(this.f);
            Log.e("layererrenderer", GLES20.glGetProgramInfoLog(this.f));
            this.d.a(this.f);
        }

        public void a(int i) {
            this.a.c(i);
        }

        public void a(int i, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            if (this.f == 0) {
                a();
            }
            GLES20.glUseProgram(this.f);
            this.a.a(floatBuffer);
            this.a.b(floatBuffer2);
            this.a.f_(i);
            this.c.a(fArr2);
            this.a.a(fArr);
            this.d.a(f2);
            this.d.b(new n());
            GLES20.glDrawArrays(5, 0, 4);
            LayerRenderer.r();
        }

        public void a(h hVar, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            a(hVar.a, fArr, fArr2, f2, floatBuffer, floatBuffer2);
        }
    }

    private class l extends o {
        private l() {
            super();
        }

        public String a() {
            return "";
        }

        public void a(int i) {
        }

        public String b() {
            return "";
        }

        public void b(n nVar) {
        }

        public String c() {
            return "";
        }

        public String d() {
            return "";
        }
    }

    private class m extends o {
        private int b;
        private float[] c = new float[4];

        m() {
            super();
            a("");
            b("applyOverlay");
            c("");
            d("//Overlay Block\nuniform highp vec4 u_overlaycolor;\nhighp vec4 applyOverlay(highp vec4 color){\n        color.rgb = color.rgb * (1.0 - u_overlaycolor.a) + u_overlaycolor.rgb * color.a;\n        return color;\n}");
            e();
        }

        public void a(n nVar) {
            GLES20.glUniform4f(this.b, this.c[0], this.c[1], this.c[2], this.c[3]);
        }

        public void b(int i) {
            this.b = GLES20.glGetUniformLocation(i, "u_overlaycolor");
        }

        public void e() {
            this.c[0] = 0.0f;
            this.c[1] = 0.0f;
            this.c[2] = 0.0f;
            this.c[3] = 0.0f;
        }
    }

    private class n {
        private int b = 0;

        n() {
        }

        public int a() {
            int i = this.b;
            this.b++;
            return i;
        }
    }

    private class o {
        private o a;
        private String b = "";
        private String c = "";
        private String d = "";
        private String f = "";
        private String g = "";

        o() {
        }

        public String a() {
            StringBuilder sb = new StringBuilder();
            sb.append(this.a.a());
            sb.append(f());
            String sb2 = sb.toString();
            if (f() == "") {
                return sb2;
            }
            StringBuilder sb3 = new StringBuilder();
            sb3.append(sb2);
            sb3.append("();");
            return sb3.toString();
        }

        public void a(int i) {
            b(i);
            this.a.a(i);
        }

        public void a(n nVar) {
        }

        public void a(o oVar) {
            this.a = oVar;
        }

        public void a(String str) {
            this.c = str;
        }

        public String b() {
            String b2 = this.a.b();
            if (g() == "") {
                return b2;
            }
            StringBuilder sb = new StringBuilder();
            sb.append(g());
            sb.append("(");
            sb.append(b2);
            sb.append(")");
            return sb.toString();
        }

        public void b(int i) {
        }

        public void b(n nVar) {
            a(nVar);
            this.a.b(nVar);
        }

        public void b(String str) {
            this.d = str;
        }

        public String c() {
            StringBuilder sb = new StringBuilder();
            sb.append(this.a.c());
            sb.append(h());
            return sb.toString();
        }

        public void c(String str) {
            this.f = str;
        }

        public String d() {
            StringBuilder sb = new StringBuilder();
            sb.append(this.a.d());
            sb.append(i());
            return sb.toString();
        }

        public void d(String str) {
            this.g = str;
        }

        public final String f() {
            return this.c;
        }

        public final String g() {
            return this.d;
        }

        public final String h() {
            return this.f;
        }

        public final String i() {
            return this.g;
        }

        public final String j() {
            StringBuilder sb = new StringBuilder();
            sb.append(c());
            sb.append("\nvoid main(){\n");
            sb.append(a());
            sb.append("\n}\n");
            return sb.toString();
        }

        public final String k() {
            StringBuilder sb = new StringBuilder();
            sb.append(d());
            sb.append("\nuniform highp float alpha_test_value_;\nvoid main(){\nhighp vec4 color = ");
            sb.append(b());
            sb.append(";\nif(color.a > 0.0) gl_FragColor = color;\nelse discard;\n}\n");
            return sb.toString();
        }
    }

    private interface p {
        void a(int i, float[] fArr, float[] fArr2, float f, FloatBuffer floatBuffer, FloatBuffer floatBuffer2);

        void a(h hVar, float[] fArr, float[] fArr2, float f, FloatBuffer floatBuffer, FloatBuffer floatBuffer2);
    }

    private class q implements p {
        a a;
        m b;
        e c;
        aa d;
        private int f;

        q() {
            this.a = new a();
            this.c = new e();
            this.b = new m();
            this.d = new aa();
            this.a.a((o) new l());
            this.c.a((o) this.a);
            this.b.a((o) this.c);
            this.d.a((o) this.b);
        }

        public int a(int i, String str) {
            int glCreateShader = GLES20.glCreateShader(i);
            GLES20.glShaderSource(glCreateShader, str);
            GLES20.glCompileShader(glCreateShader);
            GLES20.glGetShaderInfoLog(glCreateShader);
            return glCreateShader;
        }

        /* access modifiers changed from: 0000 */
        public void a() {
            int a2 = a(35633, this.d.j());
            int a3 = a(35632, this.d.k());
            this.f = GLES20.glCreateProgram();
            GLES20.glAttachShader(this.f, a2);
            GLES20.glAttachShader(this.f, a3);
            GLES20.glLinkProgram(this.f);
            Log.e("layererrenderer", GLES20.glGetProgramInfoLog(this.f));
            this.d.a(this.f);
        }

        public void a(int i, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            if (this.f == 0) {
                a();
            }
            GLES20.glUseProgram(this.f);
            this.a.a(floatBuffer);
            this.a.b(floatBuffer2);
            this.a.a_(i);
            this.c.a(fArr2);
            this.a.a(fArr);
            this.d.a(f2);
            this.d.b(new n());
            GLES20.glDrawArrays(5, 0, 4);
            LayerRenderer.r();
        }

        public void a(h hVar, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            a(hVar.a, fArr, fArr2, f2, floatBuffer, floatBuffer2);
        }
    }

    private interface r extends p {
        void a(float f, float f2, float f3);

        void a(float f, float f2, float f3, float f4);

        void a(int i, int i2, int i3);
    }

    private class s implements r {
        a a;
        m b;
        aa c;
        e d;
        d e;
        private int g;

        s() {
            this.a = new a();
            this.e = new d();
            this.d = new e();
            this.b = new m();
            this.c = new aa();
            this.a.a((o) new l());
            this.e.a((o) this.a);
            this.d.a((o) this.e);
            this.b.a((o) this.d);
            this.c.a((o) this.b);
        }

        private void a() {
            int a2 = a(35633, this.c.j());
            int a3 = a(35632, this.c.k());
            this.g = GLES20.glCreateProgram();
            GLES20.glAttachShader(this.g, a2);
            GLES20.glAttachShader(this.g, a3);
            GLES20.glLinkProgram(this.g);
            GLES20.glGetProgramInfoLog(this.g);
            this.c.a(this.g);
        }

        public int a(int i, String str) {
            int glCreateShader = GLES20.glCreateShader(i);
            GLES20.glShaderSource(glCreateShader, str);
            GLES20.glCompileShader(glCreateShader);
            GLES20.glGetShaderInfoLog(glCreateShader);
            return glCreateShader;
        }

        public void a(float f2, float f3, float f4) {
            this.e.a(f2, f3, f4);
        }

        public void a(float f2, float f3, float f4, float f5) {
            this.e.a(f2, f3, f4, f5);
        }

        public void a(int i, int i2, int i3) {
            this.e.a(i, i2, i3);
        }

        public void a(int i, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            if (this.g == 0) {
                a();
            }
            GLES20.glUseProgram(this.g);
            this.a.a(floatBuffer);
            this.a.b(floatBuffer2);
            this.a.a_(i);
            this.d.a(fArr2);
            this.a.a(fArr);
            this.c.a(f2);
            this.c.b(new n());
            GLES20.glDrawArrays(5, 0, 4);
            LayerRenderer.r();
        }

        public void a(h hVar, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            a(hVar.a, fArr, fArr2, f2, floatBuffer, floatBuffer2);
        }
    }

    private class t implements r {
        a a;
        e b;
        m c;
        aa d;
        d e;
        f f;
        private int h;

        t() {
            this.a = new a();
            this.e = new d();
            this.b = new e();
            this.c = new m();
            this.d = new aa();
            this.f = new f();
            this.a.a((o) new l());
            this.e.a((o) this.a);
            this.b.a((o) this.e);
            this.c.a((o) this.b);
            this.d.a((o) this.c);
            this.f.a((o) this.d);
        }

        private void a() {
            int a2 = a(35633, this.f.j());
            int a3 = a(35632, this.f.k());
            this.h = GLES20.glCreateProgram();
            GLES20.glAttachShader(this.h, a2);
            GLES20.glAttachShader(this.h, a3);
            GLES20.glLinkProgram(this.h);
            GLES20.glGetProgramInfoLog(this.h);
            this.f.a(this.h);
        }

        public int a(int i, String str) {
            int glCreateShader = GLES20.glCreateShader(i);
            GLES20.glShaderSource(glCreateShader, str);
            GLES20.glCompileShader(glCreateShader);
            GLES20.glGetShaderInfoLog(glCreateShader);
            return glCreateShader;
        }

        public void a(float f2, float f3, float f4) {
            this.e.a(f2, f3, f4);
        }

        public void a(float f2, float f3, float f4, float f5) {
            this.e.a(f2, f3, f4, f5);
        }

        public void a(int i) {
            this.f.d_(i);
        }

        public void a(int i, int i2, int i3) {
            this.e.a(i, i2, i3);
        }

        public void a(int i, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            if (this.h == 0) {
                a();
            }
            GLES20.glUseProgram(this.h);
            this.a.a(floatBuffer);
            this.a.b(floatBuffer2);
            this.a.a_(i);
            this.b.a(fArr2);
            this.a.a(fArr);
            this.d.a(f2);
            this.f.b(new n());
            GLES20.glDrawArrays(5, 0, 4);
            LayerRenderer.r();
        }

        public void a(h hVar, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            a(hVar.a, fArr, fArr2, f2, floatBuffer, floatBuffer2);
        }
    }

    private class u implements p {
        a a;
        e b;
        m c;
        aa d;
        f e;
        private int g;

        u() {
            this.a = new a();
            this.b = new e();
            this.c = new m();
            this.d = new aa();
            this.e = new f();
            this.a.a((o) new l());
            this.b.a((o) this.a);
            this.c.a((o) this.b);
            this.d.a((o) this.c);
            this.e.a((o) this.d);
        }

        public int a(int i, String str) {
            int glCreateShader = GLES20.glCreateShader(i);
            GLES20.glShaderSource(glCreateShader, str);
            GLES20.glCompileShader(glCreateShader);
            return glCreateShader;
        }

        /* access modifiers changed from: 0000 */
        public void a() {
            int a2 = a(35633, this.e.j());
            int a3 = a(35632, this.e.k());
            this.g = GLES20.glCreateProgram();
            GLES20.glAttachShader(this.g, a2);
            GLES20.glAttachShader(this.g, a3);
            GLES20.glLinkProgram(this.g);
            Log.e("error", GLES20.glGetProgramInfoLog(this.g));
            this.e.a(this.g);
        }

        public void a(int i) {
            this.e.d_(i);
        }

        public void a(int i, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            if (this.g == 0) {
                a();
            }
            GLES20.glUseProgram(this.g);
            LayerRenderer.r();
            this.a.a(floatBuffer);
            this.a.b(floatBuffer2);
            this.a.a_(i);
            this.b.a(fArr2);
            this.a.a(fArr);
            this.d.a(f2);
            this.e.b(new n());
            GLES20.glDrawArrays(5, 0, 4);
            LayerRenderer.r();
        }

        public void a(h hVar, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            a(hVar.a, fArr, fArr2, f2, floatBuffer, floatBuffer2);
        }
    }

    private class v implements p {
        a a;
        e b;
        m c;
        aa d;
        i e;
        private int g;

        v() {
            this.a = new a();
            this.b = new e();
            this.c = new m();
            this.d = new aa();
            this.e = new i();
            this.a.a((o) new l());
            this.b.a((o) this.a);
            this.c.a((o) this.b);
            this.d.a((o) this.c);
            this.e.a((o) this.d);
        }

        public int a(int i, String str) {
            int glCreateShader = GLES20.glCreateShader(i);
            GLES20.glShaderSource(glCreateShader, str);
            GLES20.glCompileShader(glCreateShader);
            return glCreateShader;
        }

        /* access modifiers changed from: 0000 */
        public void a() {
            int a2 = a(35633, this.e.j());
            int a3 = a(35632, this.e.k());
            this.g = GLES20.glCreateProgram();
            GLES20.glAttachShader(this.g, a2);
            GLES20.glAttachShader(this.g, a3);
            GLES20.glLinkProgram(this.g);
            Log.e("error", GLES20.glGetProgramInfoLog(this.g));
            this.e.a(this.g);
        }

        public void a(int i) {
            this.e.e_(i);
        }

        public void a(int i, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            if (this.g == 0) {
                a();
            }
            GLES20.glUseProgram(this.g);
            LayerRenderer.r();
            this.a.a(floatBuffer);
            this.a.b(floatBuffer2);
            this.a.a_(i);
            this.b.a(fArr2);
            this.a.a(fArr);
            this.d.a(f2);
            this.e.b(new n());
            GLES20.glDrawArrays(5, 0, 4);
            LayerRenderer.r();
        }

        public void a(h hVar, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            a(hVar.a, fArr, fArr2, f2, floatBuffer, floatBuffer2);
        }
    }

    private class w implements r {
        a a;
        e b;
        m c;
        aa d;
        i e;
        d f;
        private int h;

        w() {
            this.a = new a();
            this.b = new e();
            this.c = new m();
            this.d = new aa();
            this.e = new i();
            this.f = new d();
            this.a.a((o) new l());
            this.f.a((o) this.a);
            this.b.a((o) this.f);
            this.c.a((o) this.b);
            this.d.a((o) this.c);
            this.e.a((o) this.d);
        }

        public int a(int i, String str) {
            int glCreateShader = GLES20.glCreateShader(i);
            GLES20.glShaderSource(glCreateShader, str);
            GLES20.glCompileShader(glCreateShader);
            return glCreateShader;
        }

        /* access modifiers changed from: 0000 */
        public void a() {
            int a2 = a(35633, this.e.j());
            int a3 = a(35632, this.e.k());
            this.h = GLES20.glCreateProgram();
            GLES20.glAttachShader(this.h, a2);
            GLES20.glAttachShader(this.h, a3);
            GLES20.glLinkProgram(this.h);
            Log.e("error", GLES20.glGetProgramInfoLog(this.h));
            this.e.a(this.h);
        }

        public void a(float f2, float f3, float f4) {
            this.f.a(f2, f3, f4);
        }

        public void a(float f2, float f3, float f4, float f5) {
            this.f.a(f2, f3, f4, f5);
        }

        public void a(int i) {
            this.e.e_(i);
        }

        public void a(int i, int i2, int i3) {
            this.f.a(i, i2, i3);
        }

        public void a(int i, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            if (this.h == 0) {
                a();
            }
            GLES20.glUseProgram(this.h);
            LayerRenderer.r();
            this.a.a(floatBuffer);
            this.a.b(floatBuffer2);
            this.a.a_(i);
            this.b.a(fArr2);
            this.a.a(fArr);
            this.d.a(f2);
            this.e.b(new n());
            GLES20.glDrawArrays(5, 0, 4);
            LayerRenderer.r();
        }

        public void a(h hVar, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            a(hVar.a, fArr, fArr2, f2, floatBuffer, floatBuffer2);
        }
    }

    private class x implements r {
        a a;
        e b;
        m c;
        aa d;
        i e;
        d f;
        f g;
        private int i;

        x() {
            this.a = new a();
            this.b = new e();
            this.c = new m();
            this.d = new aa();
            this.g = new f();
            this.e = new i();
            this.f = new d();
            this.a.a((o) new l());
            this.f.a((o) this.a);
            this.b.a((o) this.f);
            this.c.a((o) this.b);
            this.d.a((o) this.c);
            this.g.a((o) this.d);
            this.e.a((o) this.g);
        }

        public int a(int i2, String str) {
            int glCreateShader = GLES20.glCreateShader(i2);
            GLES20.glShaderSource(glCreateShader, str);
            GLES20.glCompileShader(glCreateShader);
            return glCreateShader;
        }

        /* access modifiers changed from: 0000 */
        public void a() {
            int a2 = a(35633, this.e.j());
            int a3 = a(35632, this.e.k());
            this.i = GLES20.glCreateProgram();
            GLES20.glAttachShader(this.i, a2);
            GLES20.glAttachShader(this.i, a3);
            GLES20.glLinkProgram(this.i);
            Log.e("error", GLES20.glGetProgramInfoLog(this.i));
            this.e.a(this.i);
        }

        public void a(float f2, float f3, float f4) {
            this.f.a(f2, f3, f4);
        }

        public void a(float f2, float f3, float f4, float f5) {
            this.f.a(f2, f3, f4, f5);
        }

        public void a(int i2) {
            this.e.e_(i2);
        }

        public void a(int i2, int i3, int i4) {
            this.f.a(i2, i3, i4);
        }

        public void a(int i2, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            if (this.i == 0) {
                a();
            }
            GLES20.glUseProgram(this.i);
            LayerRenderer.r();
            this.a.a(floatBuffer);
            this.a.b(floatBuffer2);
            this.a.a_(i2);
            this.b.a(fArr2);
            this.a.a(fArr);
            this.d.a(f2);
            this.e.b(new n());
            GLES20.glDrawArrays(5, 0, 4);
            LayerRenderer.r();
        }

        public void a(h hVar, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            a(hVar.a, fArr, fArr2, f2, floatBuffer, floatBuffer2);
        }

        public void b(int i2) {
            this.g.d_(i2);
        }
    }

    private class y implements p {
        a a;
        e b;
        m c;
        aa d;
        i e;
        f f;
        private int h;

        y() {
            this.a = new a();
            this.b = new e();
            this.c = new m();
            this.d = new aa();
            this.f = new f();
            this.e = new i();
            this.a.a((o) new l());
            this.b.a((o) this.a);
            this.c.a((o) this.b);
            this.d.a((o) this.c);
            this.f.a((o) this.d);
            this.e.a((o) this.f);
        }

        public int a(int i, String str) {
            int glCreateShader = GLES20.glCreateShader(i);
            GLES20.glShaderSource(glCreateShader, str);
            GLES20.glCompileShader(glCreateShader);
            return glCreateShader;
        }

        /* access modifiers changed from: 0000 */
        public void a() {
            int a2 = a(35633, this.e.j());
            int a3 = a(35632, this.e.k());
            this.h = GLES20.glCreateProgram();
            GLES20.glAttachShader(this.h, a2);
            GLES20.glAttachShader(this.h, a3);
            GLES20.glLinkProgram(this.h);
            Log.e("error", GLES20.glGetProgramInfoLog(this.h));
            this.e.a(this.h);
        }

        public void a(int i) {
            this.e.e_(i);
        }

        public void a(int i, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            if (this.h == 0) {
                a();
            }
            GLES20.glUseProgram(this.h);
            LayerRenderer.r();
            this.a.a(floatBuffer);
            this.a.b(floatBuffer2);
            this.a.a_(i);
            this.b.a(fArr2);
            this.a.a(fArr);
            this.d.a(f2);
            this.e.b(new n());
            GLES20.glDrawArrays(5, 0, 4);
            LayerRenderer.r();
        }

        public void a(h hVar, float[] fArr, float[] fArr2, float f2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
            a(hVar.a, fArr, fArr2, f2, floatBuffer, floatBuffer2);
        }

        public void b(int i) {
            this.f.d_(i);
        }
    }

    private static class z {
        private float[] a;
        private float b;
        private int c;
        private ColorMatrix d;
        private RenderTarget e;
        private boolean f;

        private z() {
            this.a = new float[16];
            this.d = new ColorMatrix();
        }

        /* access modifiers changed from: 0000 */
        public void a(float[] fArr, float f2, int i, ColorMatrix colorMatrix, RenderTarget renderTarget, boolean z) {
            System.arraycopy(fArr, 0, this.a, 0, this.a.length);
            this.b = f2;
            this.c = i;
            this.d.set(colorMatrix);
            this.e = renderTarget;
            this.f = z;
        }

        public float[] a() {
            return this.a;
        }

        public ColorMatrix b() {
            return this.d;
        }

        public float c() {
            return this.b;
        }

        public int d() {
            return this.c;
        }

        public RenderTarget e() {
            return this.e;
        }

        public boolean f() {
            return this.f;
        }
    }

    LayerRenderer() {
    }

    private static <T> T a(T t2, T t3) {
        return t2;
    }

    /* access modifiers changed from: private */
    public void a(int i2, int i3, boolean z2, float[] fArr, int i4) {
        if (z2) {
            Matrix.transposeM(this.au, 0, fArr, 0);
            GLES20.glUniformMatrix4fv(i2, i3, false, this.au, i4);
            return;
        }
        GLES20.glUniformMatrix4fv(i2, i3, false, fArr, i4);
    }

    private void a(h hVar, float f2, float f3, float f4, float f5) {
        b(f2, f3, f4, f5);
        this.ag.a(hVar, this.g, this.at, this.h, this.av, this.aw);
    }

    private h b(Bitmap bitmap) {
        h hVar = (h) this.r.get(bitmap);
        if (hVar != null) {
            hVar.a(bitmap);
            r();
            return hVar;
        }
        h hVar2 = new h(bitmap);
        r();
        this.r.put(bitmap, hVar2);
        this.s.add(hVar2);
        return hVar2;
    }

    private void b(float f2, float f3, float f4, float f5) {
        if (this.ak && this.ai && this.aj) {
            this.ag = this.T;
        } else if (this.ak && this.ai) {
            this.ag = this.Q;
        } else if (this.ak && this.aj) {
            this.ag = this.N;
        } else if (this.ak) {
            this.ag = this.D;
        } else if (this.ai && this.aj) {
            this.ag = this.W;
        } else if (this.aj) {
            this.ag = this.K;
        } else if (this.am) {
            this.ag = this.Z;
        } else if (this.an) {
            this.ag = this.ac;
        } else if (this.ao) {
            this.ag = this.af;
        } else if (this.ai) {
            this.ag = this.H;
        } else {
            this.ag = this.E;
        }
        float[] array = this.ar.getArray();
        this.at[0] = array[0];
        this.at[1] = array[1];
        this.at[2] = array[2];
        this.at[3] = array[4];
        this.at[4] = array[5];
        this.at[5] = array[6];
        this.at[6] = array[7];
        this.at[7] = array[9];
        this.at[8] = array[10];
        this.at[9] = array[11];
        this.at[10] = array[12];
        this.at[11] = array[14];
        this.at[12] = array[15];
        this.at[13] = array[16];
        this.at[14] = array[17];
        this.at[15] = 1.0f;
        float[] fArr = this.ay;
        float[] fArr2 = this.ay;
        float[] fArr3 = this.ay;
        this.ay[14] = -10.0f;
        fArr3[10] = -10.0f;
        fArr2[6] = -10.0f;
        fArr[2] = -10.0f;
        float[] fArr4 = this.ay;
        float[] fArr5 = this.ay;
        float[] fArr6 = this.ay;
        this.ay[15] = 1.0f;
        fArr6[11] = 1.0f;
        fArr5[7] = 1.0f;
        fArr4[3] = 1.0f;
        float[] fArr7 = this.ay;
        this.ay[8] = f2;
        fArr7[0] = f2;
        float[] fArr8 = this.ay;
        this.ay[5] = f5;
        fArr8[1] = f5;
        float[] fArr9 = this.ay;
        this.ay[12] = f4;
        fArr9[4] = f4;
        float[] fArr10 = this.ay;
        this.ay[13] = f3;
        fArr10[9] = f3;
        this.av.rewind();
        this.av.put(this.ay);
        this.av.rewind();
    }

    private void b(int i2, float f2, float f3, float f4, float f5) {
        b(f2, f3, f4, f5);
        this.ag.a(i2, this.g, this.at, this.h, this.av, this.aw);
    }

    /* access modifiers changed from: private */
    public static void r() {
        boolean z2 = true;
        while (true) {
            int glGetError = GLES20.glGetError();
            if (glGetError != 0) {
                if (z2) {
                    StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
                    Log.e("LayerRenderer", "GLError(s) detected at:");
                    int i2 = 0;
                    while (i2 < stackTrace.length && i2 < 5) {
                        StringBuilder sb = new StringBuilder();
                        sb.append("    ");
                        sb.append(i2);
                        sb.append(": ");
                        sb.append(stackTrace[i2].getFileName());
                        sb.append(":");
                        sb.append(stackTrace[i2].getLineNumber());
                        sb.append(" (");
                        sb.append(stackTrace[i2].getClassName());
                        sb.append(".");
                        sb.append(stackTrace[i2].getMethodName());
                        sb.append(")");
                        Log.e("LayerRenderer", sb.toString());
                        i2++;
                    }
                    z2 = false;
                }
                StringBuilder sb2 = new StringBuilder();
                sb2.append("GLError: 0x");
                sb2.append(Integer.toHexString(glGetError));
                sb2.append(" (");
                sb2.append(GLU.gluErrorString(glGetError));
                sb2.append(")");
                Log.e("LayerRenderer", sb2.toString());
            } else {
                return;
            }
        }
    }

    private void s() {
        ArrayList<h> arrayList = null;
        for (h hVar : this.s) {
            if (!this.r.containsValue(hVar)) {
                if (arrayList == null) {
                    arrayList = new ArrayList<>();
                }
                arrayList.add(hVar);
            }
        }
        if (arrayList != null) {
            for (h a2 : arrayList) {
                a2.a();
            }
            this.s.removeAll(arrayList);
        }
    }

    private void t() {
        ArrayList<Integer> arrayList = null;
        for (Integer num : this.y) {
            if (!this.x.containsValue(num)) {
                if (arrayList == null) {
                    arrayList = new ArrayList<>();
                }
                arrayList.add(num);
            }
        }
        if (arrayList != null) {
            for (Integer num2 : arrayList) {
                ap[0] = num2.intValue();
                StringBuilder sb = new StringBuilder();
                sb.append("freeUnusedEffectTextures  Destroy effect texture: ");
                sb.append(num2);
                Log.d("LayerRenderer", sb.toString());
                GLES20.glDeleteTextures(1, ap, 0);
                r();
            }
            this.y.removeAll(arrayList);
        }
    }

    public float a() {
        return (float) this.c;
    }

    public int a(Bitmap bitmap, int i2) {
        Map<Bitmap, h> map;
        Set<h> set;
        if (bitmap == null) {
            return 0;
        }
        if (i2 == 1) {
            map = this.n;
            set = this.o;
        } else {
            map = this.p;
            set = this.q;
        }
        if (map == null) {
            return 0;
        }
        h hVar = (h) map.get(bitmap);
        if (hVar != null) {
            hVar.a(bitmap);
            r();
        } else {
            hVar = new h(bitmap);
            r();
            map.put(bitmap, hVar);
            set.add(hVar);
        }
        return hVar.a;
    }

    public void a(float f2) {
        this.h = f2;
    }

    public void a(float f2, float f3) {
        Matrix.translateM(this.g, 0, f2, f3, 0.0f);
    }

    public void a(float f2, float f3, float f4, float f5) {
        Matrix.rotateM(this.g, 0, f2, f3, f4, f5);
    }

    public void a(int i2) {
        this.b = i2;
    }

    public void a(int i2, float f2, float f3, float f4, float f5) {
        if (this.aA == null) {
            this.aA = Bitmap.createBitmap(16, 16, Config.ARGB_8888);
            this.aA.eraseColor(-1);
        }
        i();
        this.aB.setScale(((float) Color.red(i2)) / 255.0f, ((float) Color.green(i2)) / 255.0f, ((float) Color.blue(i2)) / 255.0f, 1.0f);
        a(this.aB);
        a(this.h * (((float) Color.alpha(i2)) / 255.0f));
        a(this.aA, f2, f3, f4, f5);
        j();
    }

    public void a(int i2, float f2, float f3, float f4, float f5, float f6, float f7) {
        float f8 = f3 * f3;
        float f9 = f2 * f2;
        float f10 = f9 - f8;
        float f11 = (f4 * f10) + f8;
        float f12 = (f6 * f10) + f8;
        float f13 = f7 - f5;
        float f14 = 1.0f - f7;
        p[] pVarArr = {this.D, this.Q, this.N, this.T};
        int i3 = (i2 >> 16) & 255;
        int i4 = (i2 >> 8) & 255;
        int i5 = (i2 >> 0) & 255;
        for (p pVar : pVarArr) {
            r rVar = (r) pVar;
            rVar.a(i3, i4, i5);
            rVar.a(f8, f11, f12, f9);
            rVar.a(f5, f13, f14);
        }
    }

    public void a(int i2, float f2, float f3, float f4, float f5, int i3) {
        float f6;
        float f7;
        float f8;
        float f9;
        if (i2 >= 0) {
            float f10 = f4 / 2.0f;
            float f11 = f2 - f10;
            float f12 = f5 / 2.0f;
            float f13 = f3 - f12;
            float f14 = f2 + f10;
            float f15 = f3 + f12;
            if ((i3 & 1) == 1) {
                f7 = ((Float) a((T) Float.valueOf(f15), (T) Float.valueOf(f13))).floatValue();
                f6 = f13;
            } else {
                f6 = f15;
                f7 = f13;
            }
            if ((i3 & 2) == 2) {
                f9 = ((Float) a((T) Float.valueOf(f14), (T) Float.valueOf(f11))).floatValue();
                f8 = f11;
            } else {
                f8 = f14;
                f9 = f11;
            }
            b(i2, f9, f7, f8, f6);
        }
    }

    /* access modifiers changed from: 0000 */
    public void a(int i2, int i3) {
        this.c = i2;
        this.d = i3;
    }

    public void a(int i2, String str, int i3, int i4, int i5, float f2, float f3, float f4, float f5, float f6) {
        NexEditor a2 = EditorGlobal.a();
        if (a2 != null) {
            Matrix.transposeM(this.au, 0, this.g, 0);
            a2.a(i2, str, this.az.id, i3, i4, i5, this.au, f2, f3, f4, f5, f6);
        }
    }

    public void a(Bitmap bitmap) {
        if (bitmap == null) {
            this.aj = false;
            return;
        }
        this.aj = true;
        h b2 = b(bitmap);
        ((t) this.N).a(b2.a);
        ((x) this.T).b(b2.a);
        this.K.a(b2.a);
        this.W.b(b2.a);
    }

    public void a(Bitmap bitmap, float f2, float f3) {
        if (bitmap != null) {
            h b2 = b(bitmap);
            a(b2, f2 - ((float) (b2.b / 2)), f3 - ((float) (b2.c / 2)), f2 + ((float) (b2.b / 2)), f3 + ((float) (b2.c / 2)));
        }
    }

    public void a(Bitmap bitmap, float f2, float f3, float f4, float f5) {
        if (bitmap != null) {
            h b2 = b(bitmap);
            r();
            a(b2, f2, f3, f4, f5);
        }
    }

    public void a(Bitmap bitmap, float f2, float f3, float f4, float f5, int i2) {
        float f6;
        float f7;
        float f8;
        float f9;
        if (bitmap != null) {
            h b2 = b(bitmap);
            r();
            if ((i2 & 1) == 1) {
                f6 = ((Float) a((T) Float.valueOf(f5), (T) Float.valueOf(f3))).floatValue();
                f7 = f3;
            } else {
                f7 = f5;
                f6 = f3;
            }
            if ((i2 & 2) == 2) {
                f9 = ((Float) a((T) Float.valueOf(f4), (T) Float.valueOf(f2))).floatValue();
                f8 = f2;
            } else {
                f9 = f2;
                f8 = f4;
            }
            a(b2, f9, f6, f8, f7);
        }
    }

    public void a(ColorMatrix colorMatrix) {
        if (colorMatrix == null) {
            this.ar.reset();
        } else {
            this.ar.set(colorMatrix);
        }
        this.ar.preConcat(this.as);
    }

    public void a(RenderTarget renderTarget) {
        this.ah = renderTarget;
        NexEditor a2 = EditorGlobal.a();
        if (a2 != null) {
            switch (renderTarget) {
                case Mask:
                    a2.h(o().id);
                    break;
                case Normal:
                    a2.i(o().id);
                    break;
                default:
                    throw new IllegalStateException();
            }
        }
    }

    public void a(boolean z2) {
        this.ai = z2;
    }

    public float b() {
        return (float) this.d;
    }

    public void b(float f2, float f3) {
        Matrix.scaleM(this.g, 0, f2, f3, 1.0f);
    }

    /* access modifiers changed from: 0000 */
    public void b(int i2, int i3) {
        this.e = i2;
        this.f = i3;
    }

    public void b(Bitmap bitmap, int i2) {
        if (bitmap != null) {
            h b2 = b(bitmap);
            int i3 = (-b2.b) / 2;
            int i4 = (-b2.c) / 2;
            int i5 = b2.b / 2;
            int i6 = b2.c / 2;
            if ((i2 & 1) == 1) {
                int intValue = ((Integer) a((T) Integer.valueOf(i6), (T) Integer.valueOf(i4))).intValue();
                i6 = i4;
                i4 = intValue;
            }
            if ((i2 & 2) == 2) {
                i5 = i3;
                i3 = ((Integer) a((T) Integer.valueOf(i5), (T) Integer.valueOf(i3))).intValue();
            }
            a(b2, (float) i3, (float) i4, (float) i5, (float) i6);
        }
    }

    public void b(boolean z2) {
        this.ak = z2;
    }

    public float c() {
        return this.j;
    }

    public void c(boolean z2) {
        this.al = z2;
    }

    public float d() {
        return this.k;
    }

    /* access modifiers changed from: 0000 */
    public void d(boolean z2) {
        if (z2) {
            this.r = this.n;
            this.s = this.o;
            this.x = this.t;
            this.y = this.u;
            this.E = this.A;
            this.D = this.C;
            this.N = this.M;
            this.Q = this.P;
            this.T = this.S;
            this.H = this.G;
            this.K = this.J;
            this.W = this.V;
            this.Z = this.Y;
            this.ac = this.ab;
            this.af = this.ae;
            this.ag = this.E;
        } else {
            this.r = this.p;
            this.s = this.q;
            this.x = this.v;
            this.y = this.w;
            this.E = this.z;
            this.D = this.B;
            this.N = this.L;
            this.Q = this.O;
            this.T = this.R;
            this.H = this.F;
            this.K = this.I;
            this.W = this.U;
            this.Z = this.X;
            this.ac = this.aa;
            this.af = this.ad;
            this.ag = this.E;
        }
        this.az = z2 ? RenderMode.Export : RenderMode.Preview;
        NexEditor a2 = EditorGlobal.a();
        if (a2 != null) {
            int g2 = a2.g(this.az.id);
            this.af.a(g2);
            this.Z.a(g2);
            this.ac.a(g2);
            this.H.a(g2);
            this.W.a(g2);
            ((w) this.Q).a(g2);
            ((x) this.T).a(g2);
        }
    }

    public int e() {
        return this.al ? 1 : 0;
    }

    public float f() {
        return this.i;
    }

    public int g() {
        return this.b;
    }

    public void h() {
        RenderTarget renderTarget = this.ah;
        if (this.ah != RenderTarget.Mask) {
            a(RenderTarget.Mask);
        }
        GLES20.glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
        GLES20.glClear(16640);
        if (this.ah != renderTarget) {
            a(renderTarget);
        }
    }

    public void i() {
        if (this.l >= this.m.length) {
            z[] zVarArr = new z[(this.m.length + 16)];
            System.arraycopy(this.m, 0, zVarArr, 0, this.m.length);
            this.m = zVarArr;
        }
        if (this.m[this.l] == null) {
            this.m[this.l] = new z();
        }
        this.m[this.l].a(this.g, this.h, this.b, this.ar, this.ah, this.ai);
        this.l++;
    }

    public void j() {
        if (this.l >= 1) {
            this.l--;
            System.arraycopy(this.m[this.l].a(), 0, this.g, 0, this.g.length);
            this.h = this.m[this.l].c();
            this.b = this.m[this.l].d();
            this.ar.set(this.m[this.l].b());
            a(this.m[this.l].e());
            a(this.m[this.l].f());
            return;
        }
        throw new IllegalStateException("Restore call without matching save");
    }

    public float k() {
        return this.h;
    }

    public void l() {
        GLES20.glEnable(3042);
        r();
        GLES20.glDisable(2884);
        r();
        GLES20.glDisable(2929);
        r();
        GLES20.glBlendFunc(1, 771);
        r();
    }

    /* access modifiers changed from: 0000 */
    public void m() {
        r();
        this.h = 1.0f;
        s();
        t();
        Matrix.setIdentityM(this.g, 0);
        this.l = 0;
        this.ar.reset();
        this.ar.preConcat(this.as);
        float f2 = ((float) this.c) * 0.5f;
        float f3 = ((float) this.d) * 0.5f;
        Matrix.perspectiveM(this.g, 0, 45.0f, ((float) this.c) / ((float) this.d), 0.01f, 3000.0f);
        float f4 = (this.g[0] * f2) - 10.0f;
        Matrix.scaleM(this.g, 0, 1.0f, -1.0f, 1.0f);
        Matrix.translateM(this.g, 0, -f2, -f3, -f4);
        this.aw.rewind();
        this.aw.put(ax);
        this.aw.rewind();
        l();
    }

    /* access modifiers changed from: 0000 */
    public void n() {
        s();
        t();
    }

    public RenderMode o() {
        return this.az;
    }
}
