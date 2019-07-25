package com.miui.gallery.search.transitions;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.v4.app.SharedElementCallback;
import android.util.SparseArray;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.util.StringUtils;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SearchSharedElementCallback extends SharedElementCallback {
    private SparseArray<Map<String, Object>> mOriginalSharedElementStates;

    private Map<String, Object> onCaptureSharedElementStates(View view) {
        HashMap hashMap = new HashMap();
        if (view instanceof ImageView) {
            Drawable drawable = ((ImageView) view).getDrawable();
            if (drawable != null) {
                hashMap.put("searchSharedElement:snapshot:image_drawable", drawable);
            }
        } else if (view instanceof TextView) {
            TextView textView = (TextView) view;
            hashMap.put("searchSharedElement:snapshot:textview_text", StringUtils.nullToEmpty(textView.getText()));
            hashMap.put("searchSharedElement:snapshot:textview_hint", StringUtils.nullToEmpty(textView.getHint()));
            hashMap.put("searchSharedElement:snapshot:textview_text_color", textView.getTextColors());
            hashMap.put("searchSharedElement:snapshot:textview_hint_color", textView.getHintTextColors());
        }
        Drawable background = view.getBackground();
        if (background != null) {
            hashMap.put("searchSharedElement:snapshot:view_background", background);
        }
        return hashMap;
    }

    public Parcelable onCaptureSharedElementSnapshot(View view, Matrix matrix, RectF rectF) {
        Bundle bundle = new Bundle();
        if (view != null) {
            bundle.putString("searchSharedElement:snapshot:view_class", view.getClass().getName());
            boolean z = view instanceof TextView;
            if (z) {
                TextView textView = (TextView) view;
                bundle.putString("searchSharedElement:snapshot:textview_text", StringUtils.nullToEmpty(textView.getText()));
                bundle.putString("searchSharedElement:snapshot:textview_hint", StringUtils.nullToEmpty(textView.getHint()));
                bundle.putInt("searchSharedElement:snapshot:textview_text_color", textView.getCurrentTextColor());
                bundle.putInt("searchSharedElement:snapshot:textview_hint_color", textView.getCurrentHintTextColor());
                textView.setText(null);
                textView.setHint(null);
            }
            Parcelable onCaptureSharedElementSnapshot = super.onCaptureSharedElementSnapshot(view, matrix, rectF);
            if (onCaptureSharedElementSnapshot != null) {
                bundle.putParcelable("searchSharedElement:snapshot:parent", onCaptureSharedElementSnapshot);
            }
            if (z) {
                TextView textView2 = (TextView) view;
                textView2.setText(bundle.getString("searchSharedElement:snapshot:textview_text"));
                textView2.setHint(bundle.getString("searchSharedElement:snapshot:textview_hint"));
            }
        }
        return bundle;
    }

    /* JADX WARNING: type inference failed for: r0v1, types: [android.view.View] */
    /* JADX WARNING: type inference failed for: r0v5 */
    /* JADX WARNING: type inference failed for: r0v6, types: [android.view.View] */
    /* JADX WARNING: type inference failed for: r0v10, types: [android.view.View] */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 2 */
    public View onCreateSnapshotView(Context context, Parcelable parcelable) {
        ImageView imageView;
        if (parcelable instanceof Bundle) {
            Bundle bundle = (Bundle) parcelable;
            View onCreateSnapshotView = super.onCreateSnapshotView(context, bundle.getParcelable("searchSharedElement:snapshot:parent"));
            if (ImageView.class.getName().equals(bundle.getString("searchSharedElement:snapshot:view_class"))) {
                imageView = new ImageView(context);
                if (onCreateSnapshotView instanceof ImageView) {
                    ImageView imageView2 = (ImageView) onCreateSnapshotView;
                    imageView.setImageDrawable(imageView2.getDrawable());
                    imageView.setScaleType(imageView2.getScaleType());
                    imageView.setImageMatrix(imageView2.getImageMatrix());
                } else if (onCreateSnapshotView != 0) {
                    imageView.setImageDrawable(onCreateSnapshotView.getBackground());
                }
            } else {
                if (TextView.class.getName().equals(bundle.getString("searchSharedElement:snapshot:view_class"))) {
                    TextView textView = new TextView(context);
                    textView.setText(bundle.getString("searchSharedElement:snapshot:textview_text"));
                    textView.setHint(bundle.getString("searchSharedElement:snapshot:textview_hint"));
                    textView.setTextColor(bundle.getInt("searchSharedElement:snapshot:textview_text_color"));
                    textView.setHintTextColor(bundle.getInt("searchSharedElement:snapshot:textview_hint_color"));
                    imageView = textView;
                } else if (onCreateSnapshotView != 0) {
                    imageView = onCreateSnapshotView;
                } else {
                    SearchLog.e("SearchSharedElementCallback", "What? Invalid params, %s", bundle);
                    imageView = new View(context);
                }
                if (onCreateSnapshotView instanceof ImageView) {
                    imageView.setBackground(((ImageView) onCreateSnapshotView).getDrawable());
                } else if (onCreateSnapshotView != 0) {
                    imageView.setBackground(onCreateSnapshotView.getBackground());
                }
            }
        } else {
            imageView = parcelable instanceof Bitmap ? super.onCreateSnapshotView(context, parcelable) : 0;
        }
        if (imageView != 0) {
            return imageView;
        }
        SearchLog.e("SearchSharedElementCallback", "What? Invalid snapshot, %s", parcelable);
        return new View(context);
    }

    public void onSharedElementEnd(List<String> list, List<View> list2, List<View> list3) {
        super.onSharedElementEnd(list, list2, list3);
        if (this.mOriginalSharedElementStates != null) {
            for (int i = 0; i < list2.size(); i++) {
                View view = (View) list2.get(i);
                if (view != null) {
                    Map map = (Map) this.mOriginalSharedElementStates.get(view.getId());
                    if (map != null) {
                        if (view instanceof ImageView) {
                            ((ImageView) view).setImageDrawable((Drawable) map.get("searchSharedElement:snapshot:image_drawable"));
                        } else if (view instanceof TextView) {
                            TextView textView = (TextView) view;
                            textView.setText((String) map.get("searchSharedElement:snapshot:textview_text"));
                            textView.setHint((String) map.get("searchSharedElement:snapshot:textview_hint"));
                            textView.setTextColor((ColorStateList) map.get("searchSharedElement:snapshot:textview_text_color"));
                            textView.setHintTextColor((ColorStateList) map.get("searchSharedElement:snapshot:textview_hint_color"));
                        }
                        view.setBackground((Drawable) map.get("searchSharedElement:snapshot:view_background"));
                    }
                }
            }
            this.mOriginalSharedElementStates = null;
        }
    }

    public void onSharedElementStart(List<String> list, List<View> list2, List<View> list3) {
        super.onSharedElementStart(list, list2, list3);
        int min = Math.min(list2.size(), list3.size());
        this.mOriginalSharedElementStates = new SparseArray<>(min);
        for (int i = 0; i < min; i++) {
            View view = (View) list2.get(i);
            View view2 = (View) list3.get(i);
            if (!(view == null || view2 == null)) {
                Map onCaptureSharedElementStates = onCaptureSharedElementStates(view);
                if (onCaptureSharedElementStates != null) {
                    this.mOriginalSharedElementStates.put(view.getId(), onCaptureSharedElementStates);
                }
                if ((view instanceof ImageView) && (view2 instanceof ImageView)) {
                    ((ImageView) view).setImageDrawable(((ImageView) view2).getDrawable());
                } else if ((view instanceof TextView) && (view2 instanceof TextView)) {
                    TextView textView = (TextView) view;
                    TextView textView2 = (TextView) view2;
                    textView.setText(textView2.getText());
                    textView.setHint(textView2.getHint());
                    textView.setTextColor(textView2.getCurrentTextColor());
                    textView.setHintTextColor(textView2.getCurrentHintTextColor());
                }
                view.setBackground(view2.getBackground());
            }
        }
    }
}
