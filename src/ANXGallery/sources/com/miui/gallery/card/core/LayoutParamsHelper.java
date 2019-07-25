package com.miui.gallery.card.core;

import android.content.res.Resources;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import java.util.ArrayList;
import java.util.List;

public class LayoutParamsHelper {
    private int mItemMaxHeight;
    private int mItemMinHeight;
    private List<Size> mLayoutSizes = new ArrayList();

    public static class Size {
        public int mHeight;
        public int mWidth;

        public Size() {
            this(0, 0);
        }

        public Size(int i, int i2) {
            this.mWidth = i;
            this.mHeight = i2;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("Size:");
            sb.append(this.mWidth);
            sb.append("X");
            sb.append(this.mHeight);
            return sb.toString();
        }
    }

    public LayoutParamsHelper() {
        Resources resources = GalleryApp.sGetAndroidContext().getResources();
        this.mItemMinHeight = resources.getDimensionPixelOffset(R.dimen.story_item_min_height);
        this.mItemMaxHeight = resources.getDimensionPixelOffset(R.dimen.story_item_max_height);
    }

    private Size getImageSizeGuaranteed(List<Size> list, int i, int i2, int i3) {
        Size size = (!MiscUtil.isValid(list) || i < 0 || i >= list.size()) ? null : (Size) list.get(i);
        if (size == null) {
            size = new Size(0, 0);
        }
        if (size.mWidth <= 0 || size.mHeight <= 0) {
            size.mWidth = (i2 - i3) / 2;
            size.mHeight = size.mWidth;
        }
        return size;
    }

    private float getRatio(Size size) {
        float f = 1.0f;
        try {
            float f2 = ((float) size.mWidth) / ((float) size.mHeight);
            try {
                if (Float.compare(f2, 0.0f) == 0) {
                    f2 = 1.0f;
                }
                return f2;
            } catch (Exception e) {
                Object obj = e;
                f = f2;
                e = obj;
                StringBuilder sb = new StringBuilder();
                sb.append("getRatio error:");
                sb.append(e);
                Log.e("LayoutParamsHelper", sb.toString());
                return f;
            }
        } catch (Exception e2) {
            e = e2;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("getRatio error:");
            sb2.append(e);
            Log.e("LayoutParamsHelper", sb2.toString());
            return f;
        }
    }

    public ImageSize getLayoutSize(int i) {
        if (i < 0 || i >= this.mLayoutSizes.size()) {
            return null;
        }
        return new ImageSize(((Size) this.mLayoutSizes.get(i)).mWidth, ((Size) this.mLayoutSizes.get(i)).mHeight);
    }

    public void updateLayoutSizes(List<Size> list, int i, int i2) {
        this.mLayoutSizes.clear();
        if (MiscUtil.isValid(list)) {
            int i3 = 0;
            int i4 = 0;
            while (true) {
                if (i3 >= list.size()) {
                    break;
                }
                StringBuilder sb = new StringBuilder();
                sb.append("Row index:");
                sb.append(i4);
                Log.d("LayoutParamsHelper", sb.toString());
                i4++;
                Size size = new Size();
                Size size2 = new Size();
                Size size3 = new Size();
                Size imageSizeGuaranteed = getImageSizeGuaranteed(list, i3, i, i2);
                size.mWidth = i;
                size.mHeight = (int) (((float) size.mWidth) / getRatio(imageSizeGuaranteed));
                if (((float) size.mHeight) < ((float) this.mItemMinHeight) * 1.0f) {
                    size.mHeight = (int) (((float) this.mItemMinHeight) * 1.0f);
                    this.mLayoutSizes.add(size);
                    Log.d("LayoutParamsHelper", (Object) size);
                } else {
                    int i5 = i3 + 1;
                    if (i5 == list.size()) {
                        if (size.mHeight > this.mItemMaxHeight) {
                            size.mHeight = this.mItemMaxHeight;
                        }
                        this.mLayoutSizes.add(size);
                        Log.d("LayoutParamsHelper", (Object) size);
                    } else {
                        Size imageSizeGuaranteed2 = getImageSizeGuaranteed(list, i5, i, i2);
                        float ratio = getRatio(imageSizeGuaranteed);
                        float ratio2 = getRatio(imageSizeGuaranteed2);
                        float f = ratio + ratio2;
                        int i6 = (int) (((float) (i - i2)) / f);
                        float f2 = (float) i6;
                        if (f2 < ((float) this.mItemMinHeight) * 1.1f) {
                            size.mHeight = size.mHeight > this.mItemMaxHeight ? this.mItemMaxHeight : size.mHeight;
                            this.mLayoutSizes.add(size);
                            i3 = i5 - 1;
                            Log.d("LayoutParamsHelper", (Object) size);
                        } else {
                            size.mHeight = i6;
                            size.mWidth = (int) (f2 * ratio);
                            size2.mHeight = i6;
                            size2.mWidth = (int) (f2 * ratio2);
                            i3 = i5 + 1;
                            if (i3 == list.size()) {
                                if (size.mHeight > this.mItemMaxHeight) {
                                    size.mHeight = this.mItemMaxHeight;
                                    size2.mHeight = this.mItemMaxHeight;
                                }
                                this.mLayoutSizes.add(size);
                                this.mLayoutSizes.add(size2);
                                Log.d("LayoutParamsHelper", (Object) size);
                                Log.d("LayoutParamsHelper", (Object) size2);
                            } else {
                                float ratio3 = getRatio(getImageSizeGuaranteed(list, i3, i, i2));
                                int i7 = (int) (((float) (i - (i2 * 2))) / (f + ratio3));
                                float f3 = (float) i7;
                                if (f3 < ((float) this.mItemMinHeight) * 1.2f) {
                                    if (size.mHeight > this.mItemMaxHeight) {
                                        size.mHeight = this.mItemMaxHeight;
                                        size2.mHeight = this.mItemMaxHeight;
                                    }
                                    this.mLayoutSizes.add(size);
                                    this.mLayoutSizes.add(size2);
                                    i3--;
                                    Log.d("LayoutParamsHelper", (Object) size);
                                    Log.d("LayoutParamsHelper", (Object) size2);
                                } else {
                                    if (i7 > this.mItemMaxHeight) {
                                        size.mHeight = this.mItemMaxHeight;
                                        size2.mHeight = this.mItemMaxHeight;
                                        size3.mHeight = this.mItemMaxHeight;
                                    } else {
                                        size.mHeight = i7;
                                        size2.mHeight = i7;
                                        size3.mHeight = i7;
                                    }
                                    size.mWidth = (int) (ratio * f3);
                                    size2.mWidth = (int) (ratio2 * f3);
                                    size3.mWidth = (int) (f3 * ratio3);
                                    this.mLayoutSizes.add(size);
                                    this.mLayoutSizes.add(size2);
                                    this.mLayoutSizes.add(size3);
                                    Log.d("LayoutParamsHelper", (Object) size);
                                    Log.d("LayoutParamsHelper", (Object) size2);
                                    Log.d("LayoutParamsHelper", (Object) size3);
                                }
                            }
                        }
                    }
                }
                i3++;
            }
        }
    }
}
