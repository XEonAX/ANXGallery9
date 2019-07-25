package com.miui.gallery.editor.photo.app;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Paint;
import android.graphics.RectF;
import android.text.TextUtils;
import android.util.Xml;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMeta;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.common.model.IPositionChangeData;
import com.miui.gallery.editor.photo.utils.IoUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.XmpHelper;
import com.miui.os.Rom;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.util.List;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class XmpExtraManager {
    private int mOriginHeight;
    private int mOriginRotationDegree;
    private int mOriginWidth;
    private SubImage mSubImage;

    private static class SubImage {
        public int height;
        public int length;
        public int offset;
        public int paddingX;
        public int paddingY;
        public Bitmap renderBitmap;
        public int width;

        private SubImage() {
        }
    }

    private float calculateIntersectPercent(RectF rectF, RectF rectF2) {
        RectF rectF3 = new RectF(rectF);
        if (rectF3.intersect(rectF2)) {
            return ((rectF3.height() * rectF3.width()) / rectF.width()) / rectF.height();
        }
        return 0.0f;
    }

    private void extraSubImageData(XmlPullParser xmlPullParser) {
        char c;
        this.mSubImage = new SubImage();
        int attributeCount = xmlPullParser.getAttributeCount();
        for (int i = 0; i < attributeCount; i++) {
            String attributeName = xmlPullParser.getAttributeName(i);
            switch (attributeName.hashCode()) {
                case -1221029593:
                    if (attributeName.equals(nexExportFormat.TAG_FORMAT_HEIGHT)) {
                        c = 5;
                        break;
                    }
                case -1106363674:
                    if (attributeName.equals("length")) {
                        c = 1;
                        break;
                    }
                case -1019779949:
                    if (attributeName.equals("offset")) {
                        c = 0;
                        break;
                    }
                case 113126854:
                    if (attributeName.equals(nexExportFormat.TAG_FORMAT_WIDTH)) {
                        c = 4;
                        break;
                    }
                case 773277319:
                    if (attributeName.equals("paddingx")) {
                        c = 2;
                        break;
                    }
                case 773277320:
                    if (attributeName.equals("paddingy")) {
                        c = 3;
                        break;
                    }
                default:
                    c = 65535;
                    break;
            }
            switch (c) {
                case 0:
                    this.mSubImage.offset = Integer.parseInt(xmlPullParser.getAttributeValue(i));
                    break;
                case 1:
                    this.mSubImage.length = Integer.parseInt(xmlPullParser.getAttributeValue(i));
                    break;
                case 2:
                    this.mSubImage.paddingX = Integer.parseInt(xmlPullParser.getAttributeValue(i));
                    break;
                case 3:
                    this.mSubImage.paddingY = Integer.parseInt(xmlPullParser.getAttributeValue(i));
                    break;
                case 4:
                    this.mSubImage.width = Integer.parseInt(xmlPullParser.getAttributeValue(i));
                    break;
                case 5:
                    this.mSubImage.height = Integer.parseInt(xmlPullParser.getAttributeValue(i));
                    break;
            }
        }
    }

    private void extraXmlMetaData(String str) {
        if (!TextUtils.isEmpty(str)) {
            XmlPullParser newPullParser = Xml.newPullParser();
            try {
                newPullParser.setInput(new StringReader(str));
                for (int eventType = newPullParser.getEventType(); eventType != 1; eventType = newPullParser.next()) {
                    if (eventType == 2) {
                        String name = newPullParser.getName();
                        if (!TextUtils.isEmpty(name)) {
                            char c = 65535;
                            if (name.hashCode() == -2070555877) {
                                if (name.equals("subimage")) {
                                    c = 0;
                                }
                            }
                            if (c == 0) {
                                extraSubImageData(newPullParser);
                            }
                        }
                    }
                }
            } catch (XmlPullParserException e) {
                e.printStackTrace();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

    private void extraXmpMetaData(XMPMeta xMPMeta) {
        try {
            extraXmlMetaData(xMPMeta.getPropertyString("http://ns.xiaomi.com/photos/1.0/camera/", "XMPMeta"));
        } catch (XMPException e) {
            e.printStackTrace();
        }
    }

    public void decodeXmpData(InputStream inputStream, int i, int i2, int i3) {
        if (!Rom.IS_STABLE) {
            this.mOriginWidth = i;
            this.mOriginHeight = i2;
            this.mOriginRotationDegree = i3;
            XMPMeta extractXMPMeta = XmpHelper.extractXMPMeta(inputStream);
            if (extractXMPMeta != null) {
                extraXmpMetaData(extractXMPMeta);
            }
        }
    }

    public RectF getWatermarkRect(int i, int i2) {
        RectF rectF = new RectF(0.0f, 0.0f, (float) this.mOriginWidth, (float) this.mOriginHeight);
        RectF rectF2 = new RectF((float) this.mSubImage.paddingX, (float) this.mSubImage.paddingY, (float) (this.mSubImage.paddingX + this.mSubImage.width), (float) (this.mSubImage.paddingY + this.mSubImage.height));
        Matrix matrix = new Matrix();
        matrix.postRotate((float) this.mOriginRotationDegree);
        matrix.mapRect(rectF);
        matrix.mapRect(rectF2);
        matrix.setRectToRect(rectF, new RectF(0.0f, 0.0f, (float) i, (float) i2), ScaleToFit.FILL);
        matrix.mapRect(rectF2);
        Log.d("XmpExtraManager", "watermarkRect :%s", (Object) rectF2.toString());
        return rectF2;
    }

    public boolean isRemoveWatermarkEnable() {
        return this.mSubImage != null;
    }

    public boolean isRemoveWatermarkShow(Bitmap bitmap, List<RenderData> list) {
        boolean z = false;
        if (!isRemoveWatermarkEnable()) {
            return false;
        }
        RectF watermarkRect = getWatermarkRect(bitmap.getWidth(), bitmap.getHeight());
        RectF rectF = new RectF(0.0f, 0.0f, (float) bitmap.getWidth(), (float) bitmap.getHeight());
        float f = 1.0f;
        for (RenderData renderData : list) {
            if (renderData instanceof IPositionChangeData) {
                ((IPositionChangeData) renderData).refreshTargetAreaPosition(rectF, watermarkRect);
                f = calculateIntersectPercent(watermarkRect, rectF);
                Log.d("XmpExtraManager", "intersectPercent:%f", (Object) Float.valueOf(f));
            }
        }
        if (f > 0.4f) {
            z = true;
        }
        return z;
    }

    public void sweepImage(Bitmap bitmap, InputStream inputStream) {
        if (this.mSubImage != null) {
            if (this.mSubImage.renderBitmap == null) {
                try {
                    inputStream.skip((long) (inputStream.available() - this.mSubImage.offset));
                    this.mSubImage.renderBitmap = BitmapFactory.decodeStream(inputStream);
                } catch (IOException e) {
                    Log.e("XmpExtraManager", (Throwable) e);
                } catch (Throwable th) {
                    IoUtils.close("XmpExtraManager", inputStream);
                    throw th;
                }
                IoUtils.close("XmpExtraManager", inputStream);
            } else {
                IoUtils.close("XmpExtraManager", inputStream);
            }
            if (this.mSubImage.renderBitmap != null) {
                RectF rectF = new RectF(0.0f, 0.0f, (float) this.mSubImage.renderBitmap.getWidth(), (float) this.mSubImage.renderBitmap.getHeight());
                RectF rectF2 = new RectF(0.0f, 0.0f, (float) this.mSubImage.width, (float) this.mSubImage.height);
                RectF rectF3 = new RectF(0.0f, 0.0f, (float) this.mOriginWidth, (float) this.mOriginHeight);
                RectF rectF4 = new RectF(0.0f, 0.0f, (float) bitmap.getWidth(), (float) bitmap.getHeight());
                Matrix matrix = new Matrix();
                matrix.postRotate((float) this.mOriginRotationDegree);
                matrix.mapRect(rectF3);
                Matrix matrix2 = new Matrix();
                matrix2.setRectToRect(rectF, rectF2, ScaleToFit.FILL);
                Matrix matrix3 = new Matrix();
                matrix3.setRectToRect(rectF3, rectF4, ScaleToFit.FILL);
                matrix3.preConcat(matrix);
                matrix3.preTranslate((float) this.mSubImage.paddingX, (float) this.mSubImage.paddingY);
                matrix3.preConcat(matrix2);
                new Canvas(bitmap).drawBitmap(this.mSubImage.renderBitmap, matrix3, new Paint(3));
            }
        }
    }
}
