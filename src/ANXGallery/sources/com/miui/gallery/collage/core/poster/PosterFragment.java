package com.miui.gallery.collage.core.poster;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.constraint.ConstraintLayout;
import android.util.Log;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.collage.CollageUtils;
import com.miui.gallery.collage.app.common.AbstractPosterFragment;
import com.miui.gallery.collage.core.RenderData;
import com.miui.gallery.collage.core.layout.LayoutItemModel;
import com.miui.gallery.collage.core.layout.LayoutModel;
import com.miui.gallery.collage.render.CollageRender;
import com.miui.gallery.collage.render.PosterElementRender;
import com.miui.gallery.collage.render.PosterElementRender.LoadDataListener;
import com.miui.gallery.collage.widget.CollageImageView;
import com.miui.gallery.collage.widget.CollageLayout;
import com.miui.gallery.collage.widget.CollageLayout.BitmapExchangeListener;
import com.miui.gallery.collage.widget.CollageLayout.LayoutParams;
import com.miui.gallery.collage.widget.PosterLayout;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class PosterFragment extends AbstractPosterFragment {
    private BitmapExchangeListener mBitmapExchangeListener = new BitmapExchangeListener() {
        public void onBitmapExchange(Bitmap bitmap, Bitmap bitmap2) {
            CollageImageView collageImageView = (CollageImageView) PosterFragment.this.mImageViewMap.get(bitmap);
            PosterFragment.this.mImageViewMap.put(bitmap, (CollageImageView) PosterFragment.this.mImageViewMap.get(bitmap2));
            PosterFragment.this.mImageViewMap.put(bitmap2, collageImageView);
        }
    };
    /* access modifiers changed from: private */
    public CollageLayout mCollageLayout;
    private float mDefaultRatio;
    /* access modifiers changed from: private */
    public Map<Bitmap, CollageImageView> mImageViewMap = new HashMap();
    private boolean mInit = false;
    private LayoutModel mLayoutModel;
    private boolean mModelReady = false;
    /* access modifiers changed from: private */
    public PosterLayout mPosterLayout;
    private PosterModel mPosterModel;
    private ViewGroup mRootView;
    private boolean mViewReady = false;

    private void generateCollageLayout(LayoutModel layoutModel) {
        this.mCollageLayout.removeAllViews();
        LayoutItemModel[] layoutItemModelArr = layoutModel.items;
        for (int i = 0; i < layoutItemModelArr.length; i++) {
            Bitmap bitmap = this.mBitmaps[i];
            LayoutItemModel layoutItemModel = layoutItemModelArr[i];
            CollageImageView collageImageView = new CollageImageView(getActivity());
            if (i < this.mBitmaps.length) {
                collageImageView.setBitmap(bitmap);
                this.mImageViewMap.put(bitmap, collageImageView);
            }
            this.mCollageLayout.addView(collageImageView, new LayoutParams(layoutItemModel.clipType, layoutItemModel.data));
        }
    }

    private static float getResourceFloat(Resources resources, int i, float f) {
        TypedValue typedValue = new TypedValue();
        try {
            resources.getValue(i, typedValue, true);
            return typedValue.getFloat();
        } catch (Exception unused) {
            StringBuilder sb = new StringBuilder();
            sb.append("Missing resource ");
            sb.append(Integer.toHexString(i));
            Log.e("PosterFragment", sb.toString());
            return f;
        }
    }

    private void refreshCollageLayout(LayoutModel layoutModel) {
        LayoutItemModel[] layoutItemModelArr = layoutModel.items;
        int childCount = this.mCollageLayout.getChildCount();
        for (int i = 0; i < Math.min(layoutItemModelArr.length, childCount); i++) {
            LayoutItemModel layoutItemModel = layoutItemModelArr[i];
            this.mCollageLayout.getChildAt(i).setLayoutParams(new LayoutParams(layoutItemModel.clipType, layoutItemModel.data));
        }
    }

    private void refreshCollagePosition(PosterModel posterModel) {
        final Drawable[] drawableArr;
        final CollagePositionModel collagePositionModelByImageSize = CollagePositionModel.getCollagePositionModelByImageSize(posterModel.collagePositions, this.mBitmaps.length);
        this.mCollageLayout.setLayoutParams(new PosterLayout.LayoutParams(collagePositionModelByImageSize.position));
        this.mCollageLayout.setCollageMargin(collagePositionModelByImageSize.margin, collagePositionModelByImageSize.ignoreEdgeMargin);
        String[] strArr = collagePositionModelByImageSize.masks;
        if (strArr == null || strArr.length <= 0) {
            drawableArr = null;
        } else {
            drawableArr = new Drawable[strArr.length];
            for (int i = 0; i < drawableArr.length; i++) {
                Resources resources = getResources();
                StringBuilder sb = new StringBuilder();
                sb.append(collagePositionModelByImageSize.relativePath);
                sb.append(File.separator);
                sb.append(strArr[i]);
                drawableArr[i] = CollageUtils.getDrawableByAssets(resources, sb.toString());
            }
        }
        this.mCollageLayout.post(new Runnable() {
            public void run() {
                PosterFragment.this.mCollageLayout.setMasks(drawableArr);
                PosterFragment.this.mCollageLayout.setRadius(collagePositionModelByImageSize.radius);
            }
        });
    }

    private void refreshLayout() {
        if (this.mInit) {
            refreshCollageLayout(this.mLayoutModel);
            refreshCollagePosition(this.mPosterModel);
            setPosterModelToPosterLayout(this.mPosterModel);
        } else if (this.mModelReady && this.mBitmapReady && this.mViewReady) {
            generateCollageLayout(this.mLayoutModel);
            refreshCollagePosition(this.mPosterModel);
            setPosterModelToPosterLayout(this.mPosterModel);
            this.mCollageLayout.setReplaceImageListener(this.mReplaceImageListener);
            this.mCollageLayout.setBitmapExchangeListener(this.mBitmapExchangeListener);
            this.mInit = true;
        }
    }

    private void setPosterModelToPosterLayout(final PosterModel posterModel) {
        float f = posterModel.ratio;
        if (f == 0.0f) {
            f = this.mDefaultRatio;
        }
        ConstraintLayout.LayoutParams layoutParams = (ConstraintLayout.LayoutParams) this.mPosterLayout.getLayoutParams();
        if (Float.compare(f, Float.parseFloat(layoutParams.dimensionRatio)) != 0) {
            layoutParams.dimensionRatio = String.valueOf(f);
            this.mPosterLayout.requestLayout();
        }
        this.mPosterLayout.post(new Runnable() {
            public void run() {
                int width = PosterFragment.this.mPosterLayout.getWidth();
                int height = PosterFragment.this.mPosterLayout.getHeight();
                final PosterElementRender posterElementRender = new PosterElementRender();
                posterElementRender.initializeAsync(posterModel, width, height, PosterFragment.this.getActivity(), new LoadDataListener() {
                    public void onLoadFinish() {
                        PosterFragment.this.mPosterLayout.setRenderData(posterElementRender);
                    }
                });
            }
        });
    }

    public void dismissControlWindow() {
        if (this.mCollageLayout != null) {
            this.mCollageLayout.dismissControlWindow();
        }
    }

    public RenderData export() {
        return new PosterRenderData(CollageRender.generateRenderData(getActivity(), this.mPosterModel, this.mLayoutModel, this.mCollageLayout, this.mPosterLayout.getWidth()));
    }

    public boolean isActivating() {
        return this.mCollageLayout != null && this.mCollageLayout.isActivating();
    }

    public void onBitmapReplace(Bitmap bitmap, Bitmap bitmap2) {
        CollageImageView collageImageView = (CollageImageView) this.mImageViewMap.get(bitmap);
        if (collageImageView != null) {
            collageImageView.setBitmap(bitmap2);
            this.mImageViewMap.remove(bitmap);
            this.mImageViewMap.put(bitmap2, collageImageView);
        }
    }

    /* access modifiers changed from: protected */
    public void onBitmapsReceive() {
        refreshLayout();
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.collage_poster_render, viewGroup, false);
    }

    public void onSelectModel(PosterModel posterModel, LayoutModel layoutModel) {
        this.mPosterModel = posterModel;
        this.mLayoutModel = layoutModel;
        this.mModelReady = true;
        refreshLayout();
    }

    public HashMap<String, String> onSimple() {
        HashMap<String, String> hashMap = new HashMap<>();
        String str = this.mPosterModel == null ? null : this.mPosterModel.name;
        if (str != null && str.length() > 3) {
            str = str.substring(3);
        }
        hashMap.put("collage_save_type", "Poster");
        hashMap.put("collage_image_size", String.valueOf(this.mBitmaps == null ? 0 : this.mBitmaps.length));
        hashMap.put("Poster", str);
        return hashMap;
    }

    public void onViewCreated(View view, Bundle bundle) {
        this.mRootView = (ViewGroup) view;
        this.mPosterLayout = (PosterLayout) view.findViewById(R.id.poster_layout);
        this.mCollageLayout = (CollageLayout) view.findViewById(R.id.collage_layout);
        this.mViewReady = true;
        this.mDefaultRatio = getResourceFloat(getResources(), R.dimen.poster_image_ratio, 0.75f);
        refreshLayout();
    }
}
