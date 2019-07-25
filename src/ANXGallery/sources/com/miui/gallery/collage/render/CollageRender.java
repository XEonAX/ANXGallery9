package com.miui.gallery.collage.render;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Path;
import android.graphics.Path.Direction;
import android.graphics.RectF;
import android.graphics.Region;
import android.graphics.Region.Op;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import com.miui.gallery.R;
import com.miui.gallery.collage.BitmapManager;
import com.miui.gallery.collage.ClipType;
import com.miui.gallery.collage.core.layout.LayoutItemModel;
import com.miui.gallery.collage.core.layout.LayoutModel;
import com.miui.gallery.collage.core.poster.CollagePositionModel;
import com.miui.gallery.collage.core.poster.PosterModel;
import com.miui.gallery.collage.widget.CollageImageView;
import com.miui.gallery.collage.widget.CollageLayout;
import com.miui.gallery.collage.widget.PosterLayout;
import com.miui.gallery.util.Log;
import java.util.Arrays;

public class CollageRender {

    public static class BitmapRenderData {
        public Bitmap bitmap;
        public final RectF bitmapInsideRect = new RectF();
        public Drawable maskDrawable;
        public boolean mirror;
        public float radius;
        public int rotate;
        public boolean transition;

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("BitmapRenderData{bitmap=");
            sb.append(this.bitmap);
            sb.append(", rotate=");
            sb.append(this.rotate);
            sb.append(", mirror=");
            sb.append(this.mirror);
            sb.append(", transition=");
            sb.append(this.transition);
            sb.append(", bitmapInsideRect=");
            sb.append(this.bitmapInsideRect);
            sb.append('}');
            return sb.toString();
        }
    }

    public static class ImageLocation {
        /* access modifiers changed from: private */
        public int mBottom;
        final float[] mClipArray;
        final ClipType mClipType;
        /* access modifiers changed from: private */
        public int mLeft;
        final Path mPathForClip = new Path();
        final Region mPathRegion = new Region();
        /* access modifiers changed from: private */
        public int mRight;
        /* access modifiers changed from: private */
        public int mTop;

        public ImageLocation(ClipType clipType, float[] fArr) {
            this.mClipType = clipType;
            this.mClipArray = fArr;
        }

        public int getBottom() {
            return this.mBottom;
        }

        public int getLeft() {
            return this.mLeft;
        }

        public Path getPathForClip() {
            return this.mPathForClip;
        }

        public Region getPathRegion() {
            return this.mPathRegion;
        }

        public int getRight() {
            return this.mRight;
        }

        public int getTop() {
            return this.mTop;
        }
    }

    public static class ImageLocationProcessor {
        private float[] mClipArray;
        private ImageLocation mImageLocation;
        private Matrix mMatrix = new Matrix();
        private RectF mPathRectF = new RectF();
        private Region mPathRegion = new Region();

        private void enableMargin(float f, float f2, float f3, boolean z) {
            boolean z2;
            float f4;
            float f5 = 0.0f;
            if (f != 0.0f) {
                Path path = this.mImageLocation.mPathForClip;
                int i = 2;
                char c = 0;
                char c2 = 1;
                switch (this.mImageLocation.mClipType) {
                    case CIRCLE:
                        path.reset();
                        path.addOval(new RectF(this.mClipArray[0] + f, this.mClipArray[1] + f, this.mClipArray[2] - f, this.mClipArray[3] - f), Direction.CW);
                        path.offset((float) Math.round(f), (float) Math.round(f));
                        path.computeBounds(this.mPathRectF, true);
                        this.mPathRegion.setEmpty();
                        this.mPathRegion.setPath(path, new Region((int) this.mPathRectF.left, (int) this.mPathRectF.top, (int) this.mPathRectF.right, (int) this.mPathRectF.bottom));
                        break;
                    case PATH:
                        Path path2 = new Path();
                        RectF rectF = new RectF();
                        Region region = new Region();
                        int i2 = 0;
                        while (i2 < this.mClipArray.length) {
                            float[] fArr = new float[i];
                            float[] fArr2 = new float[i];
                            fArr[c] = this.mClipArray[i2];
                            fArr[c2] = this.mClipArray[i2 + 1];
                            if (i2 == this.mClipArray.length - i) {
                                fArr2[c] = this.mClipArray[c];
                                fArr2[c2] = this.mClipArray[c2];
                            } else {
                                fArr2[c] = this.mClipArray[i2 + 2];
                                fArr2[c2] = this.mClipArray[i2 + 3];
                            }
                            float f6 = fArr[c];
                            float f7 = fArr[c2];
                            float f8 = fArr2[c];
                            float f9 = fArr2[c2];
                            if (f6 == f8) {
                                z2 = f6 == f5 || f6 == f2;
                            } else {
                                z2 = f7 == f9 && (f7 == f5 || f7 == f3);
                            }
                            if (z2) {
                                f4 = z ? 0.0f : 2.0f * f;
                            } else {
                                f4 = f;
                            }
                            Region region2 = region;
                            int i3 = i2;
                            double degrees = Math.toDegrees(Math.atan2((double) (fArr2[c2] - fArr[c2]), (double) (fArr2[c] - fArr[c])));
                            Log.d("CollageRender", "xStart:%f yStart:%f xEnd:%f yEnd:%f degree：%f", Float.valueOf(fArr[0]), Float.valueOf(fArr[1]), Float.valueOf(fArr2[0]), Float.valueOf(fArr2[1]), Double.valueOf(degrees));
                            this.mMatrix.reset();
                            this.mMatrix.postRotate((float) (-degrees));
                            this.mMatrix.postTranslate(0.0f, -f4);
                            this.mMatrix.postRotate((float) degrees);
                            this.mMatrix.mapPoints(fArr);
                            this.mMatrix.mapPoints(fArr2);
                            Log.d("CollageRender", "xStart:%f yStart:%f", Float.valueOf(fArr[0]), Float.valueOf(fArr[1]));
                            path2.reset();
                            path2.moveTo(f6, f7);
                            path2.lineTo(f8, f9);
                            path2.lineTo(fArr2[0], fArr2[1]);
                            path2.lineTo(fArr[0], fArr[1]);
                            path2.close();
                            path2.computeBounds(rectF, true);
                            region2.setEmpty();
                            Region region3 = region2;
                            region3.setPath(path2, new Region((int) rectF.left, (int) rectF.top, (int) rectF.right, (int) rectF.bottom));
                            this.mPathRegion.op(region3, Op.DIFFERENCE);
                            i2 = i3 + 2;
                            region = region3;
                            f5 = 0.0f;
                            i = 2;
                            c = 0;
                            c2 = 1;
                        }
                        path.reset();
                        this.mPathRegion.getBoundaryPath(path);
                        path.computeBounds(this.mPathRectF, true);
                        break;
                }
            }
        }

        private void generateClipArrayBySize(float f, float f2) {
            float[] fArr = this.mImageLocation.mClipArray;
            this.mClipArray = new float[fArr.length];
            for (int i = 0; i < fArr.length; i += 2) {
                this.mClipArray[i] = fArr[i] * f;
                int i2 = i + 1;
                this.mClipArray[i2] = fArr[i2] * f2;
            }
        }

        private void generateLayoutSizeByRect() {
            this.mImageLocation.mLeft = Math.round(this.mPathRectF.left);
            this.mImageLocation.mTop = Math.round(this.mPathRectF.top);
            this.mImageLocation.mRight = Math.round(this.mPathRectF.right);
            this.mImageLocation.mBottom = Math.round(this.mPathRectF.bottom);
            this.mImageLocation.mPathRegion.set(this.mPathRegion);
        }

        private void generatePath() {
            Path path = this.mImageLocation.mPathForClip;
            path.reset();
            if (AnonymousClass1.$SwitchMap$com$miui$gallery$collage$ClipType[this.mImageLocation.mClipType.ordinal()] != 1) {
                for (int i = 0; i < this.mClipArray.length; i += 2) {
                    float f = this.mClipArray[i];
                    float f2 = this.mClipArray[i + 1];
                    if (path.isEmpty()) {
                        path.moveTo(f, f2);
                    } else {
                        path.lineTo(f, f2);
                    }
                }
                path.close();
            } else {
                path.addOval(new RectF(this.mClipArray[0], this.mClipArray[1], this.mClipArray[2], this.mClipArray[3]), Direction.CW);
            }
            path.computeBounds(this.mPathRectF, true);
            this.mPathRegion.setEmpty();
            this.mPathRegion.setPath(path, new Region((int) this.mPathRectF.left, (int) this.mPathRectF.top, (int) this.mPathRectF.right, (int) this.mPathRectF.bottom));
        }

        public void processorImageLocation(ImageLocation imageLocation, float f, float f2, float f3, boolean z) {
            this.mImageLocation = imageLocation;
            if (f3 > 0.0f) {
                generateClipArrayBySize(f, f2);
                generatePath();
                enableMargin(f3, f, f2, z);
            } else {
                generateClipArrayBySize(f, f2);
                generatePath();
            }
            generateLayoutSizeByRect();
        }
    }

    public static class RenderData {
        public BitmapRenderData[] bitmapRenders;
        public boolean igonreMarginEdge;
        public int imageHeight;
        public int imageWidth;
        public LayoutModel layoutModel;
        public float margin;
        public PosterElementRender posterElementRender;
        public PosterModel posterModel;
        public float scaleOffset = 1.0f;

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("RenderData{imageWidth=");
            sb.append(this.imageWidth);
            sb.append(", imageHeight=");
            sb.append(this.imageHeight);
            sb.append(", scaleOffset=");
            sb.append(this.scaleOffset);
            sb.append(", margin=");
            sb.append(this.margin);
            sb.append(", bitmapRenders=");
            sb.append(Arrays.toString(this.bitmapRenders));
            sb.append('}');
            return sb.toString();
        }
    }

    public static void doRender(Canvas canvas, RenderData renderData, BitmapManager bitmapManager) {
        int width = canvas.getWidth();
        int height = canvas.getHeight();
        RectF rectF = new RectF();
        float[] fArr = renderData.posterModel != null ? CollagePositionModel.getCollagePositionModelByImageSize(renderData.posterModel.collagePositions, renderData.bitmapRenders.length).position : PosterLayout.DEFAULT_LAYOUT_PARAMS;
        float f = (float) width;
        float f2 = (float) height;
        rectF.set((float) ((int) (fArr[0] * f)), (float) ((int) (fArr[1] * f2)), (float) ((int) (f * fArr[2])), (float) ((int) (f2 * fArr[3])));
        canvas.drawColor(-1);
        drawBitmap(canvas, renderData, rectF, bitmapManager);
        PosterElementRender posterElementRender = renderData.posterElementRender;
        if (posterElementRender != null) {
            posterElementRender.draw(canvas);
        }
    }

    private static void drawBitmap(Canvas canvas, RenderData renderData, RectF rectF, BitmapManager bitmapManager) {
        LayoutModel layoutModel;
        int i;
        Canvas canvas2 = canvas;
        RenderData renderData2 = renderData;
        RectF rectF2 = rectF;
        BitmapManager bitmapManager2 = bitmapManager;
        LayoutModel layoutModel2 = renderData2.layoutModel;
        float f = renderData2.margin;
        BitmapRenderData[] bitmapRenderDataArr = renderData2.bitmapRenders;
        ImageLocationProcessor imageLocationProcessor = new ImageLocationProcessor();
        RectF rectF3 = new RectF();
        BitmapItemRender bitmapItemRender = new BitmapItemRender();
        int i2 = 0;
        while (i2 < layoutModel2.items.length) {
            if (i2 >= bitmapRenderDataArr.length) {
                layoutModel = layoutModel2;
                i = i2;
            } else {
                LayoutItemModel layoutItemModel = layoutModel2.items[i2];
                ImageLocation imageLocation = new ImageLocation(layoutItemModel.clipType, layoutItemModel.data);
                float f2 = f * renderData2.scaleOffset;
                ImageLocation imageLocation2 = imageLocation;
                layoutModel = layoutModel2;
                ImageLocation imageLocation3 = imageLocation;
                float f3 = f2;
                i = i2;
                imageLocationProcessor.processorImageLocation(imageLocation2, rectF.width(), rectF.height(), f3, renderData2.igonreMarginEdge);
                canvas.save();
                canvas2.translate(rectF2.left, rectF2.top);
                canvas2.clipPath(imageLocation3.mPathForClip);
                rectF3.set((float) imageLocation3.mLeft, (float) imageLocation3.mTop, (float) imageLocation3.mRight, (float) imageLocation3.mBottom);
                BitmapRenderData bitmapRenderData = bitmapRenderDataArr[i];
                Bitmap bitmap = bitmapRenderData.bitmap;
                if (bitmapManager2 != null) {
                    bitmapRenderData.bitmap = bitmapManager2.loadSuitableBitmapBySize(renderData2.imageWidth, renderData2.imageHeight, bitmapManager2.getOriginUriByBitmap(bitmapRenderData.bitmap));
                }
                bitmapItemRender.drawBitmapItem(bitmapRenderData, rectF3, canvas2, renderData2.scaleOffset);
                bitmapRenderData.bitmap = bitmap;
                canvas.restore();
            }
            i2 = i + 1;
            layoutModel2 = layoutModel;
        }
    }

    public static RenderData generateRenderData(Context context, PosterModel posterModel, LayoutModel layoutModel, CollageLayout collageLayout, int i) {
        int childCount = collageLayout.getChildCount();
        BitmapRenderData[] bitmapRenderDataArr = new BitmapRenderData[childCount];
        for (int i2 = 0; i2 < childCount; i2++) {
            bitmapRenderDataArr[i2] = ((CollageImageView) collageLayout.getChildAt(i2)).generateBitmapRenderData();
        }
        RenderData generateRenderData = generateRenderData(context.getResources(), posterModel, layoutModel, bitmapRenderDataArr);
        generateRenderData.scaleOffset = ((float) generateRenderData.imageWidth) / ((float) i);
        generateRenderData.margin = collageLayout.getMargin();
        generateRenderData.igonreMarginEdge = collageLayout.isIgnoreEdgeMargin();
        if (posterModel != null) {
            generateRenderData.posterElementRender = new PosterElementRender();
        }
        return generateRenderData;
    }

    private static RenderData generateRenderData(Resources resources, PosterModel posterModel, LayoutModel layoutModel, BitmapRenderData[] bitmapRenderDataArr) {
        float f;
        RenderData renderData = new RenderData();
        if (posterModel != null && posterModel.ratio != 0.0f) {
            f = posterModel.ratio;
        } else if (layoutModel == null || layoutModel.ratio == 0.0f) {
            TypedValue typedValue = new TypedValue();
            resources.getValue(R.dimen.poster_image_ratio, typedValue, true);
            f = typedValue.getFloat();
        } else {
            f = layoutModel.ratio;
        }
        renderData.imageWidth = 2160;
        renderData.imageHeight = Math.round(((float) renderData.imageWidth) / f);
        renderData.posterModel = posterModel;
        renderData.layoutModel = layoutModel;
        renderData.bitmapRenders = bitmapRenderDataArr;
        return renderData;
    }

    public static void initBitmapMatrix(RectF rectF, Matrix matrix, RectF rectF2, RectF rectF3) {
        initBitmapMatrix(rectF, matrix, rectF2, false, 0, rectF3);
    }

    public static void initBitmapMatrix(RectF rectF, Matrix matrix, RectF rectF2, boolean z, int i, RectF rectF3) {
        matrix.reset();
        matrix.setRectToRect(rectF, rectF2, ScaleToFit.CENTER);
        rectF3.set(rectF);
        matrix.mapRect(rectF3);
        if (z) {
            matrix.postScale(-1.0f, 1.0f, rectF3.centerX(), rectF3.centerY());
        }
        matrix.postRotate((float) i, rectF3.centerX(), rectF3.centerY());
        rectF3.set(rectF);
        matrix.mapRect(rectF3);
        float max = Math.max(rectF2.width() / rectF3.width(), rectF2.height() / rectF3.height());
        if (max != 1.0f) {
            matrix.postScale(max, max, rectF2.centerX(), rectF2.centerY());
            rectF3.set(rectF);
            matrix.mapRect(rectF3);
        }
    }
}
