package com.nexstreaming.nexeditorsdk;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import android.media.FaceDetector;
import android.media.FaceDetector.Face;
import android.util.Log;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.nexstreaming.kminternal.kinemaster.utils.facedetect.a;
import com.nexstreaming.nexeditorsdk.nexSaveDataFormat.nexCropOf;
import java.io.File;

public final class nexCrop implements Cloneable {
    public static final int ABSTRACT_DIMENSION = 100000;
    static final String TAG = "nexCrop";
    private int clip_druation = 0;
    private int facedetect_speed = BaiduSceneResult.SHOOTING;
    private boolean m_endLock = false;
    private float[] m_endMatrix;
    int m_endPositionBottom = 0;
    int m_endPositionLeft = 0;
    int m_endPositionRight = 0;
    int m_endPositionTop = 0;
    private float m_faceBounds_bottom;
    private float m_faceBounds_left;
    private float m_faceBounds_right;
    private boolean m_faceBounds_set;
    private float m_faceBounds_top;
    int m_facePositionBottom = 0;
    int m_facePositionLeft = 0;
    int m_facePositionRight = 0;
    int m_facePositionTop = 0;
    private int m_height = 0;
    private final String m_mediaPath;
    int m_rotatedEndPositionBottom = 0;
    int m_rotatedEndPositionLeft = 0;
    int m_rotatedEndPositionRight = 0;
    int m_rotatedEndPositionTop = 0;
    int m_rotatedFacePositionBottom = 0;
    int m_rotatedFacePositionLeft = 0;
    int m_rotatedFacePositionRight = 0;
    int m_rotatedFacePositionTop = 0;
    int m_rotatedStartPositionBottom = 0;
    int m_rotatedStartPositionLeft = 0;
    int m_rotatedStartPositionRight = 0;
    int m_rotatedStartPositionTop = 0;
    int m_rotation = 0;
    private boolean m_startLock = false;
    private float[] m_startMatrix;
    int m_startPositionBottom = 0;
    int m_startPositionLeft = 0;
    int m_startPositionRight = 0;
    int m_startPositionTop = 0;
    private int m_width = 0;

    public enum CropMode {
        FIT,
        FILL,
        PAN_RAND,
        PAN_FACE,
        NONE,
        PANORAMA
    }

    nexCrop(String str, int i, int i2, int i3, int i4) {
        this.m_mediaPath = str;
        this.m_width = i;
        this.m_height = i2;
        this.m_rotation = i3;
        this.clip_druation = i4;
        randomizeStartEndPosition(false, CropMode.PAN_RAND);
    }

    nexCrop(String str, nexCropOf nexcropof) {
        this.m_startPositionLeft = nexcropof.m_startPositionLeft;
        this.m_startPositionBottom = nexcropof.m_startPositionBottom;
        this.m_startPositionRight = nexcropof.m_startPositionRight;
        this.m_startPositionTop = nexcropof.m_startPositionTop;
        this.m_endPositionLeft = nexcropof.m_endPositionLeft;
        this.m_endPositionBottom = nexcropof.m_endPositionBottom;
        this.m_endPositionRight = nexcropof.m_endPositionRight;
        this.m_endPositionTop = nexcropof.m_endPositionTop;
        this.m_rotatedStartPositionLeft = nexcropof.m_rotatedStartPositionLeft;
        this.m_rotatedStartPositionBottom = nexcropof.m_rotatedStartPositionBottom;
        this.m_rotatedStartPositionRight = nexcropof.m_rotatedStartPositionRight;
        this.m_rotatedStartPositionTop = nexcropof.m_rotatedStartPositionTop;
        this.m_rotatedEndPositionLeft = nexcropof.m_rotatedEndPositionLeft;
        this.m_rotatedEndPositionBottom = nexcropof.m_rotatedEndPositionBottom;
        this.m_rotatedEndPositionRight = nexcropof.m_rotatedEndPositionRight;
        this.m_rotatedEndPositionTop = nexcropof.m_rotatedEndPositionTop;
        this.m_facePositionLeft = nexcropof.m_facePositionLeft;
        this.m_facePositionTop = nexcropof.m_facePositionTop;
        this.m_facePositionRight = nexcropof.m_facePositionRight;
        this.m_facePositionBottom = nexcropof.m_facePositionBottom;
        this.m_rotatedFacePositionLeft = nexcropof.m_rotatedFacePositionLeft;
        this.m_rotatedFacePositionTop = nexcropof.m_rotatedFacePositionTop;
        this.m_rotatedFacePositionRight = nexcropof.m_rotatedFacePositionRight;
        this.m_rotatedFacePositionBottom = nexcropof.m_rotatedFacePositionBottom;
        this.m_rotation = nexcropof.m_rotation;
        this.m_width = nexcropof.m_width;
        this.m_height = nexcropof.m_height;
        this.m_mediaPath = str;
        this.m_faceBounds_left = nexcropof.m_faceBounds_left;
        this.m_faceBounds_top = nexcropof.m_faceBounds_top;
        this.m_faceBounds_right = nexcropof.m_faceBounds_right;
        this.m_faceBounds_bottom = nexcropof.m_faceBounds_bottom;
        this.m_faceBounds_set = nexcropof.m_faceBounds_set;
    }

    private void calculateFaceBounds() {
        float f;
        int i;
        if (!this.m_faceBounds_set) {
            Bitmap loadImageForFaceRecognition = loadImageForFaceRecognition();
            if (loadImageForFaceRecognition != null) {
                Face[] faceArr = new Face[32];
                int findFaces = new FaceDetector(loadImageForFaceRecognition.getWidth(), loadImageForFaceRecognition.getHeight(), 32).findFaces(loadImageForFaceRecognition, faceArr);
                RectF rectF = new RectF();
                RectF rectF2 = new RectF();
                PointF pointF = new PointF();
                float width = (float) getWidth();
                float height = (float) getHeight();
                float f2 = width / 30.0f;
                float f3 = height / 30.0f;
                int i2 = 0;
                while (i2 < findFaces) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("face : ");
                    sb.append(i2);
                    sb.append(" c=");
                    sb.append(faceArr[i2].confidence());
                    sb.append(" e=");
                    sb.append(faceArr[i2].eyesDistance());
                    sb.append(" faceMinWidth=");
                    sb.append(f2);
                    sb.append(" faceMinHeight=");
                    sb.append(f3);
                    Log.d(str, sb.toString());
                    if (((double) faceArr[i2].confidence()) >= 0.4d) {
                        faceArr[i2].getMidPoint(pointF);
                        float eyesDistance = faceArr[i2].eyesDistance();
                        if (eyesDistance >= f2 && eyesDistance >= f3) {
                            float f4 = eyesDistance / 2.0f;
                            float f5 = eyesDistance / 3.0f;
                            i = findFaces;
                            rectF2.set((pointF.x - f4) / width, (pointF.y - f5) / height, (pointF.x + f4) / width, (pointF.y + (f5 * 2.0f)) / height);
                            rectF.union(rectF2);
                            i2++;
                            findFaces = i;
                        }
                    }
                    i = findFaces;
                    i2++;
                    findFaces = i;
                }
                loadImageForFaceRecognition.recycle();
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("face bounds : ");
                sb2.append(rectF);
                Log.d(str2, sb2.toString());
                if (!rectF.isEmpty()) {
                    float width2 = 0.6f - rectF.width();
                    float height2 = 0.6f - rectF.height();
                    if (width2 > 0.0f) {
                        f = 2.0f;
                        float f6 = width2 / 2.0f;
                        rectF.left -= f6;
                        rectF.right += f6;
                    } else {
                        f = 2.0f;
                    }
                    if (height2 > 0.0f) {
                        float f7 = height2 / f;
                        rectF.top -= f7;
                        rectF.bottom += f7;
                    }
                }
                String str3 = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("face bounds (final) : ");
                sb3.append(rectF);
                Log.d(str3, sb3.toString());
                this.m_faceBounds_set = true;
                this.m_faceBounds_left = Math.max(0.0f, rectF.left);
                this.m_faceBounds_top = Math.max(0.0f, rectF.top);
                this.m_faceBounds_right = Math.min(rectF.right, 1.0f);
                this.m_faceBounds_bottom = Math.min(rectF.bottom, 1.0f);
            }
        }
    }

    protected static nexCrop clone(nexCrop nexcrop) {
        try {
            return (nexCrop) nexcrop.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
            return null;
        }
    }

    static void enhancedCrop(Rect rect, int i, int i2, float f, float f2) {
        int i3 = rect.left;
        int i4 = rect.top;
        int i5 = rect.right;
        int i6 = rect.bottom;
        if (rect.top != 0) {
            float f3 = (float) (i6 - i4);
            float f4 = f3 / f2;
            float f5 = 1.0f;
            float f6 = f4 / ((1.0f / ((float) i2)) * 100000.0f);
            int abs = (int) (((float) Math.abs(i4)) / f4);
            int i7 = (int) (((float) abs) / 10.0f);
            int i8 = abs + i7;
            int i9 = abs - i7;
            int i10 = i9;
            while (i9 < i8) {
                double d = (double) (((float) i9) * f6);
                double ceil = Math.ceil(d);
                Double.isNaN(d);
                double d2 = ceil - d;
                double floor = Math.floor(d);
                Double.isNaN(d);
                float min = (float) Math.min(d2, d - floor);
                if (f5 > min) {
                    i10 = i9;
                    f5 = min;
                }
                i9++;
            }
            int round = Math.round(f4 * ((float) i10)) * -1;
            rect.set(i3, round, i5, (int) (f3 + ((float) round)));
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("enhancedCrop() highQuality=");
            sb.append(i10);
            sb.append(", q=");
            sb.append(rect.toString());
            Log.d(str, sb.toString());
        }
    }

    private static Rect getFitRwaPosition(int i, int i2, float f, float f2, boolean z) {
        Rect rect = new Rect(0, 0, i, i2);
        float f3 = f / f2;
        if (((float) rect.width()) / ((float) rect.height()) < f3) {
            int height = (int) (((float) rect.height()) * f3);
            rect.left = rect.centerX() - (height / 2);
            rect.right = rect.left + height;
        } else {
            int width = (int) (((float) rect.width()) / f3);
            rect.top = rect.centerY() - (width / 2);
            rect.bottom = rect.top + width;
        }
        int i3 = (rect.left * ABSTRACT_DIMENSION) / i;
        int i4 = (rect.right * ABSTRACT_DIMENSION) / i;
        int i5 = (rect.top * ABSTRACT_DIMENSION) / i2;
        rect.set(i3, i5, i4, (rect.bottom * ABSTRACT_DIMENSION) / i2);
        if (i5 == 0) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("getFitRwaPosition() raw=");
            sb.append(rect.toString());
            Log.d(str, sb.toString());
            return rect;
        }
        if (z) {
            enhancedCrop(rect, i, i2, f, f2);
        }
        return rect;
    }

    private boolean isSolid() {
        return this.m_mediaPath != null && this.m_mediaPath.startsWith("@solid:") && this.m_mediaPath.endsWith(".jpg");
    }

    private Bitmap loadImageForFaceRecognition() {
        Options options = new Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(this.m_mediaPath, options);
        options.inJustDecodeBounds = false;
        options.inPreferredConfig = Config.RGB_565;
        if (options.outWidth < 1 || options.outHeight < 1) {
            return null;
        }
        int i = (options.outHeight * 720) / options.outWidth;
        options.inSampleSize = 1;
        while (true) {
            double d = (double) (options.outHeight / options.inSampleSize);
            double d2 = (double) i;
            Double.isNaN(d2);
            if (d <= d2 * 1.5d) {
                double d3 = (double) (options.outWidth / options.inSampleSize);
                double d4 = (double) 720;
                Double.isNaN(d4);
                if (d3 <= d4 * 1.5d) {
                    break;
                }
            }
            options.inSampleSize *= 2;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("loadImageForFaceRecognition:   bounds decoded : width,height=");
        sb.append(options.outWidth);
        sb.append(",");
        sb.append(options.outHeight);
        sb.append("; target w,h=");
        sb.append(720);
        sb.append(",");
        sb.append(i);
        sb.append("; sampleSize=");
        sb.append(options.inSampleSize);
        Log.d(str, sb.toString());
        Bitmap decodeFile = BitmapFactory.decodeFile(this.m_mediaPath, options);
        if (decodeFile == null) {
            return null;
        }
        if (decodeFile.getConfig() != Config.RGB_565) {
            Bitmap createBitmap = Bitmap.createBitmap(decodeFile.getWidth(), decodeFile.getHeight(), Config.RGB_565);
            new Canvas(createBitmap).drawBitmap(decodeFile, 0.0f, 0.0f, null);
            decodeFile.recycle();
            decodeFile = createBitmap;
        }
        return decodeFile;
    }

    private Matrix matrixForRect(float f, float f2, float f3, float f4) {
        Matrix matrix = new Matrix();
        matrix.postTranslate(-f, -f2);
        matrix.postScale(1.7777778f / (f3 - f), 1.0f / (f4 - f2));
        return matrix;
    }

    private Matrix matrixForRect(Rect rect) {
        return matrixForRect((float) rect.left, (float) rect.top, (float) rect.right, (float) rect.bottom);
    }

    public void applyCropSpeed(Rect rect, Rect rect2, int i, int i2, int i3, int i4) {
        if (!getEndPosionLock() && !rect2.intersect(0, 0, i, i2)) {
            rect2.set(0, 0, (i * 2) / 3, (i2 * 2) / 3);
            double d = (double) i;
            double random = Math.random();
            Double.isNaN(d);
            int i5 = (int) ((d * random) / 3.0d);
            double d2 = (double) i2;
            double random2 = Math.random();
            Double.isNaN(d2);
            rect2.offset(i5, (int) ((d2 * random2) / 3.0d));
        }
        double d3 = (double) i3;
        double d4 = (double) ((float) i4);
        Double.isNaN(d4);
        double d5 = (d4 * 0.5d) / 1000.0d;
        Double.isNaN(d3);
        int i6 = (int) (d3 * d5);
        if (i3 < 101) {
            int i7 = (i * i6) / 1000;
            int i8 = (i6 * i2) / 1000;
            rect.set(rect2.left - i7, rect2.top - i8, rect2.right + i7, rect2.bottom + (i8 * 3));
        } else {
            int i9 = i / 4;
            int i10 = i2 / 4;
            rect.set(rect2.left - i9, rect2.top - i10, rect2.right + i9, rect2.bottom + i10);
        }
        if (!rect.intersect(0, 0, i, i2)) {
            rect.set(0, 0, (i * 3) / 4, (i2 * 3) / 4);
            double d6 = (double) i;
            double random3 = Math.random();
            Double.isNaN(d6);
            int i11 = (int) ((d6 * random3) / 4.0d);
            double d7 = (double) i2;
            double random4 = Math.random();
            Double.isNaN(d7);
            rect.offset(i11, (int) ((d7 * random4) / 4.0d));
        }
    }

    /* access modifiers changed from: 0000 */
    public void fitStartEndPosition(int i, int i2) {
        int width = getWidth();
        int height = getHeight();
        if (this.m_rotation == 90 || this.m_rotation == 270) {
            width = getHeight();
            height = getWidth();
        }
        Rect rect = new Rect(0, 0, width, height);
        growToAspect(rect, ((float) i) / ((float) i2));
        setStartPosition(rect);
        setEndPosition(rect);
    }

    public int getClipDuration() {
        return this.clip_druation;
    }

    public boolean getEndPosionLock() {
        return this.m_endLock;
    }

    public void getEndPosition(Rect rect) {
        if (this.m_rotation == 90 || this.m_rotation == 270) {
            rect.bottom = (this.m_rotatedEndPositionBottom * this.m_width) / ABSTRACT_DIMENSION;
            rect.left = (this.m_rotatedEndPositionLeft * this.m_height) / ABSTRACT_DIMENSION;
            rect.right = (this.m_rotatedEndPositionRight * this.m_height) / ABSTRACT_DIMENSION;
            rect.top = (this.m_rotatedEndPositionTop * this.m_width) / ABSTRACT_DIMENSION;
            return;
        }
        rect.bottom = (this.m_endPositionBottom * this.m_height) / ABSTRACT_DIMENSION;
        rect.left = (this.m_endPositionLeft * this.m_width) / ABSTRACT_DIMENSION;
        rect.right = (this.m_endPositionRight * this.m_width) / ABSTRACT_DIMENSION;
        rect.top = (this.m_endPositionTop * this.m_height) / ABSTRACT_DIMENSION;
    }

    public void getEndPositionRaw(Rect rect) {
        if (this.m_rotation == 90 || this.m_rotation == 270) {
            rect.bottom = this.m_rotatedEndPositionBottom;
            rect.left = this.m_rotatedEndPositionLeft;
            rect.right = this.m_rotatedEndPositionRight;
            rect.top = this.m_rotatedEndPositionTop;
            return;
        }
        rect.bottom = this.m_endPositionBottom;
        rect.left = this.m_endPositionLeft;
        rect.right = this.m_endPositionRight;
        rect.top = this.m_endPositionTop;
    }

    public void getFaceBounds(Rect rect, Context context) {
        a a = a.a(this.m_mediaPath);
        if (a == null) {
            Log.d(TAG, "Second face detection with use filter");
            a = new a(new File(this.m_mediaPath), true, context);
        }
        if (a != null) {
            RectF rectF = new RectF();
            a.a(rectF);
            float width = (float) getWidth();
            float height = (float) getHeight();
            rect.set((int) (rectF.left * width), (int) (rectF.top * height), (int) (rectF.right * width), (int) (rectF.bottom * height));
            return;
        }
        calculateFaceBounds();
        if (!this.m_faceBounds_set) {
            rect.setEmpty();
            return;
        }
        float width2 = (float) getWidth();
        float height2 = (float) getHeight();
        rect.set((int) (this.m_faceBounds_left * width2), (int) (this.m_faceBounds_top * height2), (int) (this.m_faceBounds_right * width2), (int) (this.m_faceBounds_bottom * height2));
    }

    public int getFaceDetectSpeed() {
        return this.facedetect_speed;
    }

    public void getFacePositionRaw(Rect rect) {
        if (this.m_rotation == 90 || this.m_rotation == 270) {
            rect.left = this.m_rotatedFacePositionLeft;
            rect.top = this.m_rotatedFacePositionTop;
            rect.right = this.m_rotatedFacePositionRight;
            rect.bottom = this.m_rotatedFacePositionBottom;
            return;
        }
        rect.left = this.m_facePositionLeft;
        rect.top = this.m_facePositionTop;
        rect.right = this.m_facePositionRight;
        rect.bottom = this.m_facePositionBottom;
    }

    public int getHeight() {
        return this.m_height;
    }

    public int getRotate() {
        return this.m_rotation;
    }

    /* access modifiers changed from: 0000 */
    public nexCropOf getSaveData() {
        nexCropOf nexcropof = new nexCropOf();
        nexcropof.m_startPositionLeft = this.m_startPositionLeft;
        nexcropof.m_startPositionBottom = this.m_startPositionBottom;
        nexcropof.m_startPositionRight = this.m_startPositionRight;
        nexcropof.m_startPositionTop = this.m_startPositionTop;
        nexcropof.m_endPositionLeft = this.m_endPositionLeft;
        nexcropof.m_endPositionBottom = this.m_endPositionBottom;
        nexcropof.m_endPositionRight = this.m_endPositionRight;
        nexcropof.m_endPositionTop = this.m_endPositionTop;
        nexcropof.m_rotatedStartPositionLeft = this.m_rotatedStartPositionLeft;
        nexcropof.m_rotatedStartPositionBottom = this.m_rotatedStartPositionBottom;
        nexcropof.m_rotatedStartPositionRight = this.m_rotatedStartPositionRight;
        nexcropof.m_rotatedStartPositionTop = this.m_rotatedStartPositionTop;
        nexcropof.m_rotatedEndPositionLeft = this.m_rotatedEndPositionLeft;
        nexcropof.m_rotatedEndPositionBottom = this.m_rotatedEndPositionBottom;
        nexcropof.m_rotatedEndPositionRight = this.m_rotatedEndPositionRight;
        nexcropof.m_rotatedEndPositionTop = this.m_rotatedEndPositionTop;
        nexcropof.m_facePositionLeft = this.m_facePositionLeft;
        nexcropof.m_facePositionTop = this.m_facePositionTop;
        nexcropof.m_facePositionRight = this.m_facePositionRight;
        nexcropof.m_facePositionBottom = this.m_facePositionBottom;
        nexcropof.m_rotatedFacePositionLeft = this.m_rotatedFacePositionLeft;
        nexcropof.m_rotatedFacePositionTop = this.m_rotatedFacePositionTop;
        nexcropof.m_rotatedFacePositionRight = this.m_rotatedFacePositionRight;
        nexcropof.m_rotatedFacePositionBottom = this.m_rotatedFacePositionBottom;
        nexcropof.m_rotation = this.m_rotation;
        nexcropof.m_width = this.m_width;
        nexcropof.m_height = this.m_height;
        nexcropof.m_faceBounds_left = this.m_faceBounds_left;
        nexcropof.m_faceBounds_top = this.m_faceBounds_top;
        nexcropof.m_faceBounds_right = this.m_faceBounds_right;
        nexcropof.m_faceBounds_bottom = this.m_faceBounds_bottom;
        nexcropof.m_faceBounds_set = this.m_faceBounds_set;
        return nexcropof;
    }

    public boolean getStartPosionLock() {
        return this.m_startLock;
    }

    public void getStartPosition(Rect rect) {
        if (this.m_rotation == 90 || this.m_rotation == 270) {
            rect.bottom = (this.m_rotatedStartPositionBottom * this.m_width) / ABSTRACT_DIMENSION;
            rect.left = (this.m_rotatedStartPositionLeft * this.m_height) / ABSTRACT_DIMENSION;
            rect.right = (this.m_rotatedStartPositionRight * this.m_height) / ABSTRACT_DIMENSION;
            rect.top = (this.m_rotatedStartPositionTop * this.m_width) / ABSTRACT_DIMENSION;
            return;
        }
        rect.bottom = (this.m_startPositionBottom * this.m_height) / ABSTRACT_DIMENSION;
        rect.left = (this.m_startPositionLeft * this.m_width) / ABSTRACT_DIMENSION;
        rect.right = (this.m_startPositionRight * this.m_width) / ABSTRACT_DIMENSION;
        rect.top = (this.m_startPositionTop * this.m_height) / ABSTRACT_DIMENSION;
    }

    public void getStartPositionRaw(Rect rect) {
        if (this.m_rotation == 90 || this.m_rotation == 270) {
            rect.bottom = this.m_rotatedStartPositionBottom;
            rect.left = this.m_rotatedStartPositionLeft;
            rect.right = this.m_rotatedStartPositionRight;
            rect.top = this.m_rotatedStartPositionTop;
            return;
        }
        rect.bottom = this.m_startPositionBottom;
        rect.left = this.m_startPositionLeft;
        rect.right = this.m_startPositionRight;
        rect.top = this.m_startPositionTop;
    }

    public int getWidth() {
        return this.m_width;
    }

    public void growToAspect(Rect rect, float f) {
        if (((float) rect.width()) / ((float) rect.height()) < f) {
            int height = (int) (((float) rect.height()) * f);
            rect.left = rect.centerX() - (height / 2);
            rect.right = rect.left + height;
            return;
        }
        int width = (int) (((float) rect.width()) / f);
        rect.top = rect.centerY() - (width / 2);
        rect.bottom = rect.top + width;
    }

    public void randomizeStartEndPosition(boolean z, CropMode cropMode) {
        int i;
        int i2;
        Rect rect = new Rect();
        Rect rect2 = new Rect();
        getStartPosition(rect);
        getEndPosition(rect2);
        if (this.m_rotation == 90 || this.m_rotation == 270) {
            i = getHeight();
            i2 = getWidth();
        } else {
            i = getWidth();
            i2 = getHeight();
        }
        int i3 = i;
        int i4 = i2;
        if (i3 >= 1 && i4 >= 1) {
            if (isSolid()) {
                Rect rect3 = new Rect(2, 2, i3 - 2, i4 - 2);
                setStartPosition(rect3);
                setEndPosition(rect3);
            } else if (cropMode == CropMode.FILL) {
                Rect rect4 = new Rect(0, 0, i3, i4);
                shrinkToAspect(rect4, nexApplicationConfig.getAspectRatio());
                setStartPosition(rect4);
                setEndPosition(rect4);
            } else if (cropMode == CropMode.FIT) {
                Rect rect5 = new Rect(0, 0, i3, i4);
                growToAspect(rect5, nexApplicationConfig.getAspectRatio());
                setStartPosition(rect5);
                setEndPosition(rect5);
            } else if (cropMode == CropMode.PANORAMA) {
                float f = (float) (i3 / i4);
                if (f < nexApplicationConfig.getAspectRatio()) {
                    int aspectRatio = (int) (((float) i3) / nexApplicationConfig.getAspectRatio());
                    Rect rect6 = new Rect(0, 0, i3, aspectRatio);
                    Rect rect7 = new Rect(0, i4 - aspectRatio, i3, i4);
                    if (Math.random() < 0.5d) {
                        setStartPosition(rect6);
                        setEndPosition(rect7);
                    } else {
                        setStartPosition(rect7);
                        setEndPosition(rect6);
                    }
                } else if (f > nexApplicationConfig.getAspectRatio()) {
                    int aspectRatio2 = (int) (((float) i4) * nexApplicationConfig.getAspectRatio());
                    Rect rect8 = new Rect(0, 0, aspectRatio2, i4);
                    Rect rect9 = new Rect(i3 - aspectRatio2, 0, i3, i4);
                    if (Math.random() < 0.5d) {
                        setStartPosition(rect8);
                        setEndPosition(rect9);
                    } else {
                        setStartPosition(rect9);
                        setEndPosition(rect8);
                    }
                } else {
                    Rect rect10 = new Rect(0, 0, i3, i4);
                    shrinkToAspect(rect10, nexApplicationConfig.getAspectRatio());
                    setStartPosition(rect10);
                    setEndPosition(rect10);
                }
            } else {
                Rect rect11 = new Rect();
                if (rect11.isEmpty()) {
                    rect11.set(0, 0, (i3 * 3) / 4, (i4 * 3) / 4);
                    double d = (double) i3;
                    double random = Math.random();
                    Double.isNaN(d);
                    int i5 = (int) ((d * random) / 4.0d);
                    double d2 = (double) i4;
                    double random2 = Math.random();
                    Double.isNaN(d2);
                    rect11.offset(i5, (int) ((d2 * random2) / 4.0d));
                } else {
                    int width = (i3 / 4) - rect11.width();
                    if (width >= 2) {
                        int i6 = width / 2;
                        rect11.left -= i6;
                        rect11.right += i6;
                    }
                    int height = (i4 / 4) - rect11.height();
                    if (height >= 2) {
                        int i7 = height / 2;
                        rect11.top -= i7;
                        rect11.bottom += i7;
                    }
                    growToAspect(rect11, nexApplicationConfig.getAspectRatio());
                    if (!rect11.intersect(0, 0, i3, i4)) {
                        rect11.set(0, 0, (i3 * 2) / 3, (i4 * 2) / 3);
                        double d3 = (double) i3;
                        double random3 = Math.random();
                        Double.isNaN(d3);
                        int i8 = (int) ((d3 * random3) / 3.0d);
                        double d4 = (double) i4;
                        double random4 = Math.random();
                        Double.isNaN(d4);
                        rect11.offset(i8, (int) ((d4 * random4) / 3.0d));
                    }
                }
                shrinkToAspect(rect11, nexApplicationConfig.getAspectRatio());
                Rect rect12 = new Rect(0, 0, i3, i4);
                applyCropSpeed(rect12, rect11, i3, i4, getFaceDetectSpeed(), getClipDuration());
                shrinkToAspect(rect12, nexApplicationConfig.getAspectRatio());
                shrinkToAspect(rect11, nexApplicationConfig.getAspectRatio());
                if (!rect11.isEmpty()) {
                    if (Math.random() < 0.5d) {
                        setStartPosition(rect12);
                        setEndPosition(rect11);
                    } else {
                        setStartPosition(rect11);
                        setEndPosition(rect12);
                    }
                }
                Math.random();
            }
        }
    }

    public void randomizeStartEndPosition(boolean z, CropMode cropMode, float f) {
        int i;
        int i2;
        Rect rect = new Rect();
        Rect rect2 = new Rect();
        getStartPosition(rect);
        getEndPosition(rect2);
        if (this.m_rotation == 90 || this.m_rotation == 270) {
            i = getHeight();
            i2 = getWidth();
        } else {
            i = getWidth();
            i2 = getHeight();
        }
        int i3 = i;
        int i4 = i2;
        if (i3 >= 1 && i4 >= 1) {
            if (isSolid()) {
                Rect rect3 = new Rect(2, 2, i3 - 2, i4 - 2);
                setStartPosition(rect3);
                setEndPosition(rect3);
            } else if (cropMode == CropMode.FILL) {
                Rect rect4 = new Rect(0, 0, i3, i4);
                shrinkToAspect(rect4, f);
                setStartPosition(rect4);
                setEndPosition(rect4);
            } else if (cropMode == CropMode.FIT) {
                Rect rect5 = new Rect(0, 0, i3, i4);
                growToAspect(rect5, f);
                setStartPosition(rect5);
                setEndPosition(rect5);
            } else if (cropMode == CropMode.PANORAMA) {
                float f2 = (float) (i3 / i4);
                if (f2 < f) {
                    int i5 = (int) (((float) i3) / f);
                    Rect rect6 = new Rect(0, 0, i3, i5);
                    Rect rect7 = new Rect(0, i4 - i5, i3, i4);
                    if (Math.random() < 0.5d) {
                        setStartPosition(rect6);
                        setEndPosition(rect7);
                    } else {
                        setStartPosition(rect7);
                        setEndPosition(rect6);
                    }
                } else if (f2 > f) {
                    int i6 = (int) (((float) i4) * f);
                    Rect rect8 = new Rect(0, 0, i6, i4);
                    Rect rect9 = new Rect(i3 - i6, 0, i3, i4);
                    if (Math.random() < 0.5d) {
                        setStartPosition(rect8);
                        setEndPosition(rect9);
                    } else {
                        setStartPosition(rect9);
                        setEndPosition(rect8);
                    }
                } else {
                    Rect rect10 = new Rect(0, 0, i3, i4);
                    shrinkToAspect(rect10, f);
                    setStartPosition(rect10);
                    setEndPosition(rect10);
                }
            } else {
                Rect rect11 = new Rect();
                if (rect11.isEmpty()) {
                    rect11.set(0, 0, (i3 * 3) / 4, (i4 * 3) / 4);
                    double d = (double) i3;
                    double random = Math.random();
                    Double.isNaN(d);
                    int i7 = (int) ((d * random) / 4.0d);
                    double d2 = (double) i4;
                    double random2 = Math.random();
                    Double.isNaN(d2);
                    rect11.offset(i7, (int) ((d2 * random2) / 4.0d));
                } else {
                    int width = (i3 / 4) - rect11.width();
                    if (width >= 2) {
                        int i8 = width / 2;
                        rect11.left -= i8;
                        rect11.right += i8;
                    }
                    int height = (i4 / 4) - rect11.height();
                    if (height >= 2) {
                        int i9 = height / 2;
                        rect11.top -= i9;
                        rect11.bottom += i9;
                    }
                    growToAspect(rect11, f);
                    if (!rect11.intersect(0, 0, i3, i4)) {
                        rect11.set(0, 0, (i3 * 2) / 3, (i4 * 2) / 3);
                        double d3 = (double) i3;
                        double random3 = Math.random();
                        Double.isNaN(d3);
                        int i10 = (int) ((d3 * random3) / 3.0d);
                        double d4 = (double) i4;
                        double random4 = Math.random();
                        Double.isNaN(d4);
                        rect11.offset(i10, (int) ((d4 * random4) / 3.0d));
                    }
                }
                shrinkToAspect(rect11, f);
                Rect rect12 = new Rect(0, 0, i3, i4);
                applyCropSpeed(rect12, rect11, i3, i4, getFaceDetectSpeed(), this.clip_druation);
                shrinkToAspect(rect12, nexApplicationConfig.getAspectRatio());
                shrinkToAspect(rect11, nexApplicationConfig.getAspectRatio());
                if (!rect11.isEmpty()) {
                    if (Math.random() < 0.5d) {
                        setStartPosition(rect12);
                        setEndPosition(rect11);
                    } else {
                        setStartPosition(rect11);
                        setEndPosition(rect12);
                    }
                }
                Math.random();
            }
        }
    }

    public void resetStartEndPosition() {
        this.m_startPositionLeft = 0;
        this.m_startPositionBottom = ABSTRACT_DIMENSION;
        this.m_startPositionRight = ABSTRACT_DIMENSION;
        this.m_startPositionTop = 0;
        this.m_endPositionLeft = 0;
        this.m_endPositionBottom = ABSTRACT_DIMENSION;
        this.m_endPositionRight = ABSTRACT_DIMENSION;
        this.m_endPositionTop = 0;
        this.m_rotatedStartPositionLeft = 0;
        this.m_rotatedStartPositionBottom = ABSTRACT_DIMENSION;
        this.m_rotatedStartPositionRight = ABSTRACT_DIMENSION;
        this.m_rotatedStartPositionTop = 0;
        this.m_rotatedEndPositionLeft = 0;
        this.m_rotatedEndPositionBottom = ABSTRACT_DIMENSION;
        this.m_rotatedEndPositionRight = ABSTRACT_DIMENSION;
        this.m_rotatedEndPositionTop = 0;
    }

    public void setClipDuration(int i) {
        this.clip_druation = i;
    }

    public void setEndPosition(Rect rect) {
        if (this.m_rotation == 90 || this.m_rotation == 270) {
            this.m_rotatedEndPositionBottom = (rect.bottom * ABSTRACT_DIMENSION) / this.m_width;
            this.m_rotatedEndPositionLeft = (rect.left * ABSTRACT_DIMENSION) / this.m_height;
            this.m_rotatedEndPositionRight = (rect.right * ABSTRACT_DIMENSION) / this.m_height;
            this.m_rotatedEndPositionTop = (rect.top * ABSTRACT_DIMENSION) / this.m_width;
        } else {
            this.m_endPositionBottom = (rect.bottom * ABSTRACT_DIMENSION) / this.m_height;
            this.m_endPositionLeft = (rect.left * ABSTRACT_DIMENSION) / this.m_width;
            this.m_endPositionRight = (rect.right * ABSTRACT_DIMENSION) / this.m_width;
            this.m_endPositionTop = (rect.top * ABSTRACT_DIMENSION) / this.m_height;
        }
        if (this.m_endMatrix == null) {
            this.m_endMatrix = new float[9];
        }
        matrixForRect(rect).setValues(this.m_endMatrix);
    }

    public void setEndPositionLock(boolean z) {
        this.m_endLock = z;
    }

    public void setEndPositionRaw(Rect rect) {
        if (this.m_rotation == 90 || this.m_rotation == 270) {
            this.m_rotatedEndPositionBottom = rect.bottom;
            this.m_rotatedEndPositionLeft = rect.left;
            this.m_rotatedEndPositionRight = rect.right;
            this.m_rotatedEndPositionTop = rect.top;
            return;
        }
        this.m_endPositionBottom = rect.bottom;
        this.m_endPositionLeft = rect.left;
        this.m_endPositionRight = rect.right;
        this.m_endPositionTop = rect.top;
    }

    public void setFaceDetectSpeed(int i) {
        this.facedetect_speed = i;
    }

    public void setFacePosition(Rect rect) {
        if (this.m_rotation == 90 || this.m_rotation == 270) {
            this.m_rotatedFacePositionBottom = (rect.bottom * ABSTRACT_DIMENSION) / this.m_width;
            this.m_rotatedFacePositionLeft = (rect.left * ABSTRACT_DIMENSION) / this.m_height;
            this.m_rotatedFacePositionRight = (rect.right * ABSTRACT_DIMENSION) / this.m_height;
            this.m_rotatedFacePositionTop = (rect.top * ABSTRACT_DIMENSION) / this.m_width;
            return;
        }
        this.m_facePositionBottom = (rect.bottom * ABSTRACT_DIMENSION) / this.m_height;
        this.m_facePositionLeft = (rect.left * ABSTRACT_DIMENSION) / this.m_width;
        this.m_facePositionRight = (rect.right * ABSTRACT_DIMENSION) / this.m_width;
        this.m_facePositionTop = (rect.top * ABSTRACT_DIMENSION) / this.m_height;
    }

    /* access modifiers changed from: 0000 */
    public void setRotate(int i) {
        if (i != this.m_rotation) {
            this.m_rotation = i;
            if (this.m_rotation == 90 || this.m_rotation == 270) {
                if (this.m_rotatedStartPositionLeft == 0 && this.m_rotatedStartPositionBottom == 0 && this.m_rotatedStartPositionRight == 0 && this.m_rotatedStartPositionTop == 0) {
                    randomizeStartEndPosition(false, CropMode.PAN_RAND);
                }
            } else if (this.m_startPositionLeft == 0 && this.m_startPositionBottom == 0 && this.m_startPositionRight == 0 && this.m_startPositionTop == 0) {
                randomizeStartEndPosition(false, CropMode.PAN_RAND);
            }
        }
    }

    public void setStartPosition(Rect rect) {
        if (this.m_rotation == 90 || this.m_rotation == 270) {
            this.m_rotatedStartPositionBottom = (rect.bottom * ABSTRACT_DIMENSION) / this.m_width;
            this.m_rotatedStartPositionLeft = (rect.left * ABSTRACT_DIMENSION) / this.m_height;
            this.m_rotatedStartPositionRight = (rect.right * ABSTRACT_DIMENSION) / this.m_height;
            this.m_rotatedStartPositionTop = (rect.top * ABSTRACT_DIMENSION) / this.m_width;
        } else {
            this.m_startPositionBottom = (rect.bottom * ABSTRACT_DIMENSION) / this.m_height;
            this.m_startPositionLeft = (rect.left * ABSTRACT_DIMENSION) / this.m_width;
            this.m_startPositionRight = (rect.right * ABSTRACT_DIMENSION) / this.m_width;
            this.m_startPositionTop = (rect.top * ABSTRACT_DIMENSION) / this.m_height;
        }
        if (this.m_startMatrix == null) {
            this.m_startMatrix = new float[9];
        }
        matrixForRect(rect).setValues(this.m_startMatrix);
    }

    public void setStartPositionLock(boolean z) {
        this.m_startLock = z;
    }

    public void setStartPositionRaw(Rect rect) {
        if (this.m_rotation == 90 || this.m_rotation == 270) {
            this.m_rotatedStartPositionBottom = rect.bottom;
            this.m_rotatedStartPositionLeft = rect.left;
            this.m_rotatedStartPositionRight = rect.right;
            this.m_rotatedStartPositionTop = rect.top;
            return;
        }
        this.m_startPositionBottom = rect.bottom;
        this.m_startPositionLeft = rect.left;
        this.m_startPositionRight = rect.right;
        this.m_startPositionTop = rect.top;
    }

    public void shrinkToAspect(Rect rect, float f) {
        if (((float) rect.width()) / ((float) rect.height()) < f) {
            int width = (int) (((float) rect.width()) / f);
            rect.top = rect.centerY() - (width / 2);
            rect.bottom = rect.top + width;
            return;
        }
        int height = (int) (((float) rect.height()) * f);
        rect.left = rect.centerX() - (height / 2);
        rect.right = rect.left + height;
    }
}
