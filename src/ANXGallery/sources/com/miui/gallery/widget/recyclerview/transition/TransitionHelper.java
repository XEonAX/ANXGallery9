package com.miui.gallery.widget.recyclerview.transition;

import android.graphics.Bitmap;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.text.TextUtils;
import android.util.LongSparseArray;
import android.view.View;
import android.view.animation.Interpolator;
import android.widget.ImageView.ScaleType;
import android.widget.Scroller;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.util.Log;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.NonViewAware;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import miui.view.animation.CubicEaseInOutInterpolator;
import miui.view.animation.CubicEaseOutInterpolator;

public class TransitionHelper implements OnScaleListener {
    /* access modifiers changed from: private */
    public TransitionAnchor mAnchor;
    private float mCurScale = 1.0f;
    /* access modifiers changed from: private */
    public TransitionDecoration mDecoration;
    private boolean mIsFastScale = false;
    private List<DecorViewAware> mNeedLoadItems = new LinkedList();
    private float mScaleBeginFactor = 1.0f;
    /* access modifiers changed from: private */
    public int mState = -1;
    /* access modifiers changed from: private */
    public WeakReference<RecyclerView> mTransitingFrom;
    /* access modifiers changed from: private */
    public WeakReference<RecyclerView> mTransitingTo;
    private Transition mTransition;
    /* access modifiers changed from: private */
    public TransitionListener mTransitionListener;
    private Map<RecyclerView, ScaleTouchListener> mViewScaleMapping = new WeakHashMap();

    private static class DecorViewAware extends NonViewAware {
        /* access modifiers changed from: private */
        public DecorItem mDecorItem;

        public DecorViewAware(DecorItem decorItem) {
            super(new ImageSize((int) decorItem.mFromFrame.width(), (int) decorItem.mFromFrame.height()), ViewScaleType.CROP);
            this.mDecorItem = decorItem;
        }

        public int getId() {
            return this.mDecorItem.mLocalPath.hashCode();
        }

        public boolean setImageBitmap(Bitmap bitmap) {
            return setImageDrawable(new BitmapDrawable(this.mDecorItem.mHost.get() != null ? ((View) this.mDecorItem.mHost.get()).getResources() : null, bitmap));
        }

        public boolean setImageDrawable(Drawable drawable) {
            this.mDecorItem.updateDrawable(drawable);
            return true;
        }
    }

    private static final class FakeTransitionalItem extends ItemWrapper {
        private final RectF mFakeFrame;

        public FakeTransitionalItem(TransitionalItem transitionalItem) {
            super(transitionalItem, -1, -1);
            this.mFakeFrame = new RectF(transitionalItem.getTransitFrame());
        }

        public Drawable getTransitDrawable() {
            return null;
        }

        public RectF getTransitFrame() {
            return this.mFakeFrame;
        }

        public long getTransitId() {
            return -2147483648L;
        }

        public String getTransitPath() {
            return null;
        }

        public ScaleType getTransitScaleType() {
            return null;
        }
    }

    private static class ItemWrapper implements TransitionalItem {
        protected final TransitionalItem mItem;
        /* access modifiers changed from: private */
        public final int mSpanGroupIndex;
        private final int mSpanIndex;

        public ItemWrapper(TransitionalItem transitionalItem, int i, int i2) {
            this.mItem = transitionalItem;
            this.mSpanGroupIndex = i;
            this.mSpanIndex = i2;
        }

        public boolean equals(Object obj) {
            return obj != null && (obj instanceof ItemWrapper) && getTransitId() == ((ItemWrapper) obj).getTransitId();
        }

        public Drawable getTransitDrawable() {
            return this.mItem.getTransitDrawable();
        }

        public RectF getTransitFrame() {
            return this.mItem.getTransitFrame();
        }

        public long getTransitId() {
            return this.mItem.getTransitId();
        }

        public String getTransitPath() {
            return this.mItem.getTransitPath();
        }

        public ScaleType getTransitScaleType() {
            return this.mItem.getTransitScaleType();
        }

        public int hashCode() {
            return (int) getTransitId();
        }
    }

    private static class Transition implements Runnable {
        private WeakReference<View> mDriveView;
        private int mDuration;
        private Scroller mScroller;
        private OnUpdateListener mUpdateListener;

        private interface OnUpdateListener {
            void onUpdate(float f, float f2);
        }

        public Transition(View view, OnUpdateListener onUpdateListener, int i, Interpolator interpolator, int i2) {
            this.mDriveView = new WeakReference<>(view);
            this.mUpdateListener = onUpdateListener;
            this.mScroller = new Scroller(view.getContext(), interpolator);
            this.mDuration = i2;
        }

        private void drive() {
            View driveView = getDriveView();
            if (driveView != null) {
                driveView.postOnAnimation(this);
            }
        }

        private View getDriveView() {
            return (View) this.mDriveView.get();
        }

        public void run() {
            if (this.mScroller.computeScrollOffset()) {
                float currX = (((float) this.mScroller.getCurrX()) * 1.0f) / 1.0E8f;
                if (this.mUpdateListener != null) {
                    this.mUpdateListener.onUpdate(currX, (((float) this.mScroller.getFinalX()) * 1.0f) / 1.0E8f);
                }
                drive();
            }
        }

        public void start(float f, float f2) {
            stop();
            this.mScroller.startScroll((int) (f * 1.0E8f), 0, (int) ((f2 - f) * 1.0E8f), 0, this.mDuration);
            drive();
        }

        public void stop() {
            this.mScroller.forceFinished(true);
            View driveView = getDriveView();
            if (driveView != null) {
                driveView.removeCallbacks(this);
            }
        }
    }

    public TransitionHelper(TransitionListener transitionListener) {
        this.mTransitionListener = transitionListener;
    }

    private static List<DecorItem> calculateDecorItems(RecyclerView recyclerView, RecyclerView recyclerView2, int i, long j, long j2) {
        ItemWrapper itemWrapper;
        ItemWrapper itemWrapper2;
        RecyclerView recyclerView3 = recyclerView;
        List parseTransitionalItems = parseTransitionalItems(recyclerView);
        List parseTransitionalItems2 = parseTransitionalItems(recyclerView2);
        if (parseTransitionalItems == null || parseTransitionalItems2 == null) {
            Log.e("TransitionHelper", "parse transitional items error");
            return null;
        }
        ItemWrapper findItem = findItem(parseTransitionalItems, j);
        ItemWrapper findItem2 = findItem(parseTransitionalItems2, j2);
        if (findItem == null || findItem2 == null) {
            Log.e("TransitionHelper", "find anchor error");
            return null;
        }
        if (i == 2 && findItem.mSpanGroupIndex > findItem2.mSpanGroupIndex) {
            findItem = (ItemWrapper) ((List) parseTransitionalItems.get(0)).get(0);
            findItem2 = (ItemWrapper) ((List) parseTransitionalItems2.get(0)).get(0);
            Log.d("TransitionHelper", "rematch the first item as anchor");
        }
        float parseItemGap = parseItemGap(parseTransitionalItems);
        float parseItemGap2 = parseItemGap(parseTransitionalItems2);
        LongSparseArray longSparseArray = new LongSparseArray();
        LongSparseArray longSparseArray2 = new LongSparseArray();
        LinkedList linkedList = new LinkedList();
        List parseDecorItems = parseDecorItems(recyclerView3, (List) parseTransitionalItems.get(findItem.mSpanGroupIndex), (List) parseTransitionalItems2.get(findItem2.mSpanGroupIndex), parseItemGap, parseItemGap2);
        linkedList.addAll(parseDecorItems);
        longSparseArray.put((long) findItem.mSpanGroupIndex, parseDecorItems);
        longSparseArray2.put((long) findItem2.mSpanGroupIndex, parseDecorItems);
        FakeTransitionalItem fakeTransitionalItem = new FakeTransitionalItem((TransitionalItem) ((List) parseTransitionalItems2.get(0)).get(0));
        ArrayList arrayList = new ArrayList(0);
        int access$1000 = findItem.mSpanGroupIndex - 1;
        while (access$1000 > -1) {
            int access$10002 = findItem2.mSpanGroupIndex - (findItem.mSpanGroupIndex - access$1000);
            if (access$10002 > -1) {
                List parseDecorItems2 = parseDecorItems(recyclerView3, (List) parseTransitionalItems.get(access$1000), (List) parseTransitionalItems2.get(access$10002), parseItemGap, parseItemGap2);
                linkedList.addAll(parseDecorItems2);
                itemWrapper2 = findItem;
                itemWrapper = findItem2;
                longSparseArray.put((long) access$1000, parseDecorItems2);
                longSparseArray2.put((long) access$10002, parseDecorItems2);
            } else {
                itemWrapper2 = findItem;
                itemWrapper = findItem2;
                fakeTransitionalItem.getTransitFrame().offset(0.0f, -fakeTransitionalItem.getTransitFrame().height());
                arrayList.clear();
                arrayList.add(fakeTransitionalItem);
                List parseDecorItems3 = parseDecorItems(recyclerView3, (List) parseTransitionalItems.get(access$1000), arrayList, parseItemGap, parseItemGap2);
                linkedList.addAll(parseDecorItems3);
                FakeTransitionalItem fakeTransitionalItem2 = new FakeTransitionalItem(fakeTransitionalItem);
                longSparseArray.put((long) access$1000, parseDecorItems3);
                fakeTransitionalItem = fakeTransitionalItem2;
            }
            access$1000--;
            findItem = itemWrapper2;
            findItem2 = itemWrapper;
        }
        ItemWrapper itemWrapper3 = findItem;
        ItemWrapper itemWrapper4 = findItem2;
        FakeTransitionalItem fakeTransitionalItem3 = new FakeTransitionalItem((TransitionalItem) ((List) parseTransitionalItems2.get(parseTransitionalItems2.size() - 1)).get(0));
        for (int access$10003 = itemWrapper3.mSpanGroupIndex + 1; access$10003 < parseTransitionalItems.size(); access$10003++) {
            int access$10004 = itemWrapper4.mSpanGroupIndex + (access$10003 - itemWrapper3.mSpanGroupIndex);
            if (access$10004 < parseTransitionalItems2.size()) {
                List parseDecorItems4 = parseDecorItems(recyclerView3, (List) parseTransitionalItems.get(access$10003), (List) parseTransitionalItems2.get(access$10004), parseItemGap, parseItemGap2);
                linkedList.addAll(parseDecorItems4);
                longSparseArray.put((long) access$10003, parseDecorItems4);
                longSparseArray2.put((long) access$10004, parseDecorItems4);
            } else {
                fakeTransitionalItem3.getTransitFrame().offset(0.0f, fakeTransitionalItem3.getTransitFrame().height());
                arrayList.clear();
                arrayList.add(fakeTransitionalItem3);
                List parseDecorItems5 = parseDecorItems(recyclerView3, (List) parseTransitionalItems.get(access$10003), arrayList, parseItemGap, parseItemGap2);
                linkedList.addAll(parseDecorItems5);
                FakeTransitionalItem fakeTransitionalItem4 = new FakeTransitionalItem(fakeTransitionalItem3);
                longSparseArray.put((long) access$10003, parseDecorItems5);
                fakeTransitionalItem3 = fakeTransitionalItem4;
            }
        }
        FakeTransitionalItem fakeTransitionalItem5 = new FakeTransitionalItem((TransitionalItem) ((List) parseTransitionalItems.get(0)).get(0));
        int access$10005 = (itemWrapper4.mSpanGroupIndex - itemWrapper3.mSpanGroupIndex) - 1;
        while (access$10005 > -1) {
            fakeTransitionalItem5.getTransitFrame().offset(0.0f, -fakeTransitionalItem5.getTransitFrame().height());
            arrayList.clear();
            arrayList.add(fakeTransitionalItem5);
            List parseDecorItems6 = parseDecorItems(recyclerView3, arrayList, (List) parseTransitionalItems2.get(access$10005), parseItemGap, parseItemGap2);
            linkedList.addAll(parseDecorItems6);
            FakeTransitionalItem fakeTransitionalItem6 = new FakeTransitionalItem(fakeTransitionalItem5);
            longSparseArray2.put((long) access$10005, parseDecorItems6);
            access$10005--;
            fakeTransitionalItem5 = fakeTransitionalItem6;
        }
        FakeTransitionalItem fakeTransitionalItem7 = new FakeTransitionalItem((TransitionalItem) ((List) parseTransitionalItems.get(parseTransitionalItems.size() - 1)).get(0));
        int access$10006 = itemWrapper4.mSpanGroupIndex + (parseTransitionalItems.size() - itemWrapper3.mSpanGroupIndex);
        while (access$10006 < parseTransitionalItems2.size()) {
            fakeTransitionalItem7.getTransitFrame().offset(0.0f, fakeTransitionalItem7.getTransitFrame().height());
            arrayList.clear();
            arrayList.add(fakeTransitionalItem7);
            List parseDecorItems7 = parseDecorItems(recyclerView3, arrayList, (List) parseTransitionalItems2.get(access$10006), parseItemGap, parseItemGap2);
            linkedList.addAll(parseDecorItems7);
            FakeTransitionalItem fakeTransitionalItem8 = new FakeTransitionalItem(fakeTransitionalItem7);
            longSparseArray2.put((long) access$10006, parseDecorItems7);
            access$10006++;
            fakeTransitionalItem7 = fakeTransitionalItem8;
        }
        int i2 = 0;
        while (true) {
            float f = 1.0f;
            int i3 = 255;
            if (i2 >= recyclerView.getItemDecorationCount()) {
                break;
            }
            ItemDecoration itemDecorationAt = recyclerView3.getItemDecorationAt(i2);
            if (itemDecorationAt == null) {
                break;
            }
            if (itemDecorationAt instanceof TransitionalView) {
                List<TransitionalItem> transitionalItems = ((TransitionalView) itemDecorationAt).getTransitionalItems();
                if (transitionalItems != null) {
                    for (TransitionalItem transitionalItem : transitionalItems) {
                        Builder toAlpha = new Builder(recyclerView3).setDrawable(transitionalItem.getTransitDrawable()).setFromFrame(transitionalItem.getTransitFrame()).setToFrame(transitionalItem.getTransitFrame()).setScaleType(transitionalItem.getTransitScaleType()).setFromAlpha(i3).setToAlpha(0);
                        int parseItemDecorationBindGroupIndex = parseItemDecorationBindGroupIndex(parseTransitionalItems, transitionalItem.getTransitFrame());
                        List list = (List) longSparseArray.get((long) parseItemDecorationBindGroupIndex);
                        List list2 = (List) longSparseArray.get((long) (parseItemDecorationBindGroupIndex + 1));
                        if (!(list == null || list2 == null)) {
                            RectF transitFrame = transitionalItem.getTransitFrame();
                            toAlpha.setToFrame(new RectF(transitFrame.left, ((DecorItem) list.get(0)).mToFrame.bottom, transitFrame.left + (transitFrame.width() * (((((DecorItem) list2.get(0)).mToFrame.top - ((DecorItem) list.get(0)).mToFrame.bottom) * f) / transitFrame.height())), ((DecorItem) list2.get(0)).mToFrame.top));
                        }
                        linkedList.add(toAlpha.build());
                        f = 1.0f;
                        i3 = 255;
                    }
                }
            }
            i2++;
        }
        for (int i4 = 0; i4 < recyclerView2.getItemDecorationCount(); i4++) {
            ItemDecoration itemDecorationAt2 = recyclerView2.getItemDecorationAt(i4);
            if (itemDecorationAt2 == null) {
                break;
            }
            if (itemDecorationAt2 instanceof TransitionalView) {
                List<TransitionalItem> transitionalItems2 = ((TransitionalView) itemDecorationAt2).getTransitionalItems();
                if (transitionalItems2 != null) {
                    for (TransitionalItem transitionalItem2 : transitionalItems2) {
                        Builder toAlpha2 = new Builder(recyclerView3).setDrawable(transitionalItem2.getTransitDrawable()).setFromFrame(transitionalItem2.getTransitFrame()).setToFrame(transitionalItem2.getTransitFrame()).setScaleType(transitionalItem2.getTransitScaleType()).setFromAlpha(0).setToAlpha(255);
                        int parseItemDecorationBindGroupIndex2 = parseItemDecorationBindGroupIndex(parseTransitionalItems2, transitionalItem2.getTransitFrame());
                        List list3 = (List) longSparseArray2.get((long) parseItemDecorationBindGroupIndex2);
                        List list4 = (List) longSparseArray2.get((long) (parseItemDecorationBindGroupIndex2 + 1));
                        if (list3 != null && list4 != null) {
                            RectF transitFrame2 = transitionalItem2.getTransitFrame();
                            toAlpha2.setFromFrame(new RectF(transitFrame2.left, ((DecorItem) list3.get(0)).mFromFrame.bottom, transitFrame2.left + (transitFrame2.width() * (((((DecorItem) list4.get(0)).mFromFrame.top - ((DecorItem) list3.get(0)).mFromFrame.bottom) * 1.0f) / transitFrame2.height())), ((DecorItem) list4.get(0)).mFromFrame.top));
                        }
                        linkedList.add(toAlpha2.build());
                    }
                }
            }
        }
        return linkedList;
    }

    private void cancelLoadTask() {
        for (DecorViewAware cancelDisplayTask : this.mNeedLoadItems) {
            ImageLoader.getInstance().cancelDisplayTask((ImageAware) cancelDisplayTask);
        }
        this.mNeedLoadItems.clear();
    }

    private void clearTransitingViews() {
        if (this.mTransitingFrom != null) {
            this.mTransitingFrom.clear();
        }
        if (this.mTransitingTo != null) {
            this.mTransitingTo.clear();
        }
    }

    public static double distance(RectF rectF, float f, float f2) {
        if (rectF == null) {
            return -1.0d;
        }
        return Math.hypot((double) (f - rectF.centerX()), (double) (f2 - rectF.centerY()));
    }

    private void doScale(RecyclerView recyclerView, RecyclerView recyclerView2, int i, float f) {
        this.mCurScale *= f;
        if (i == 2) {
            this.mCurScale = Math.min(1.0f, Math.max(0.0f, this.mCurScale));
        }
        if (i == 1) {
            this.mCurScale = Math.min(2.0f, Math.max(1.0f, this.mCurScale));
        }
        float translateProgress = translateProgress();
        this.mDecoration.updateProgress(recyclerView, translateProgress);
        this.mTransitionListener.onTransitionUpdate(recyclerView, recyclerView2, translateProgress);
    }

    public static View findClosestViewUnder(RecyclerView recyclerView, float f, float f2) {
        View findViewUnder = findViewUnder(recyclerView, f, f2);
        if (findViewUnder != null && (findViewUnder instanceof TransitionalView)) {
            return findViewUnder;
        }
        LayoutManager layoutManager = recyclerView.getLayoutManager();
        int childCount = layoutManager.getChildCount();
        RectF rectF = new RectF();
        double d = 2.147483647E9d;
        int i = 0;
        for (int i2 = 0; i2 < childCount; i2++) {
            View childAt = layoutManager.getChildAt(i2);
            if (childAt instanceof TransitionalView) {
                getViewFrame(childAt, rectF);
                double distance = distance(rectF, f, f2);
                if (distance > 0.0d && distance < d) {
                    i = i2;
                    d = distance;
                }
            }
        }
        return layoutManager.getChildAt(i);
    }

    private static ItemWrapper findItem(List<List<ItemWrapper>> list, long j) {
        int size = list.size();
        for (int i = 0; i < size; i++) {
            for (ItemWrapper itemWrapper : (List) list.get(i)) {
                if (itemWrapper.getTransitId() == j) {
                    return itemWrapper;
                }
            }
        }
        return null;
    }

    public static View findViewUnder(RecyclerView recyclerView, float f, float f2) {
        return recyclerView.findChildViewUnder(f, f2);
    }

    private static void getViewFrame(View view, RectF rectF) {
        float translationX = view.getTranslationX();
        float translationY = view.getTranslationY();
        rectF.set(((float) view.getLeft()) + translationX, ((float) view.getTop()) + translationY, ((float) view.getRight()) + translationX, ((float) view.getBottom()) + translationY);
    }

    private void loadDrawable() {
        Log.d("TransitionHelper", "need load count %d", (Object) Integer.valueOf(this.mNeedLoadItems.size()));
        for (DecorViewAware decorViewAware : this.mNeedLoadItems) {
            ImageLoader.getInstance().displayImage(Scheme.FILE.wrap(decorViewAware.mDecorItem.mLocalPath), decorViewAware, ThumbConfig.get().MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT, ThumbConfig.get().sMicroTargetSize, null, null);
        }
    }

    private static boolean needLoad(DecorItem decorItem) {
        return decorItem.mDrawable == null && !TextUtils.isEmpty(decorItem.mLocalPath);
    }

    private static List<DecorItem> parseDecorItems(RecyclerView recyclerView, List<ItemWrapper> list, List<ItemWrapper> list2, float f, float f2) {
        RecyclerView recyclerView2 = recyclerView;
        List<ItemWrapper> list3 = list;
        List<ItemWrapper> list4 = list2;
        LinkedList linkedList = new LinkedList();
        RectF rectF = null;
        int i = 0;
        while (i < list.size()) {
            ItemWrapper itemWrapper = (ItemWrapper) list3.get(i);
            ItemWrapper itemWrapper2 = i < list2.size() ? (ItemWrapper) list4.get(i) : null;
            RectF transitFrame = itemWrapper2 != null ? itemWrapper2.getTransitFrame() : null;
            if (transitFrame == null) {
                int size = list2.size() - 1;
                float width = (((ItemWrapper) list4.get(size)).getTransitFrame().width() * 1.0f) / ((ItemWrapper) list3.get(size)).getTransitFrame().width();
                RectF rectF2 = new RectF(itemWrapper.getTransitFrame());
                scaleFrame(rectF2, width);
                float f3 = rectF.right + f2;
                float f4 = rectF.top;
                rectF2.set(f3, f4, rectF2.width() + f3, rectF2.height() + f4);
                rectF = rectF2;
            } else {
                rectF = transitFrame;
            }
            linkedList.add(new Builder(recyclerView2).setLocalPath(itemWrapper.getTransitPath()).setDrawable(itemWrapper.getTransitDrawable()).setFromFrame(itemWrapper.getTransitFrame()).setScaleType(itemWrapper.getTransitScaleType()).setFromAlpha(255).setToFrame(rectF).setToAlpha(itemWrapper.equals(itemWrapper2) ? 255 : 0).build());
            i++;
        }
        RectF rectF3 = null;
        int i2 = 0;
        while (i2 < list2.size()) {
            ItemWrapper itemWrapper3 = (ItemWrapper) list4.get(i2);
            ItemWrapper itemWrapper4 = i2 < list.size() ? (ItemWrapper) list3.get(i2) : null;
            if (itemWrapper3.equals(itemWrapper4)) {
                rectF3 = itemWrapper4.getTransitFrame();
            } else {
                RectF transitFrame2 = itemWrapper4 != null ? itemWrapper4.getTransitFrame() : null;
                if (transitFrame2 == null) {
                    int size2 = list.size() - 1;
                    float width2 = (((ItemWrapper) list3.get(size2)).getTransitFrame().width() * 1.0f) / ((ItemWrapper) list4.get(size2)).getTransitFrame().width();
                    transitFrame2 = new RectF(itemWrapper3.getTransitFrame());
                    scaleFrame(transitFrame2, width2);
                    float f5 = rectF3.right + f;
                    float f6 = rectF3.top;
                    transitFrame2.set(f5, f6, transitFrame2.width() + f5, transitFrame2.height() + f6);
                }
                linkedList.add(new Builder(recyclerView2).setLocalPath(itemWrapper3.getTransitPath()).setDrawable(itemWrapper3.getTransitDrawable()).setFromFrame(transitFrame2).setScaleType(itemWrapper3.getTransitScaleType()).setFromAlpha(0).setToFrame(itemWrapper3.getTransitFrame()).setToAlpha(255).build());
                rectF3 = transitFrame2;
            }
            i2++;
        }
        return linkedList;
    }

    private static int parseItemDecorationBindGroupIndex(List<List<ItemWrapper>> list, RectF rectF) {
        int i;
        int size = list.size();
        int i2 = (int) rectF.top;
        int i3 = (int) rectF.bottom;
        int i4 = 0;
        while (true) {
            i = size - 1;
            if (i4 >= i) {
                break;
            }
            int i5 = i4 + 1;
            int i6 = (int) ((ItemWrapper) ((List) list.get(i4)).get(0)).getTransitFrame().bottom;
            int i7 = (int) ((ItemWrapper) ((List) list.get(i5)).get(0)).getTransitFrame().top;
            if (i6 <= i2 && i7 >= i3) {
                return i4;
            }
            if (i6 > i2) {
                break;
            }
            i4 = i5;
        }
        if (((int) ((ItemWrapper) ((List) list.get(i)).get(0)).getTransitFrame().bottom) <= i2) {
            return i;
        }
        return -1;
    }

    private static float parseItemGap(List<List<ItemWrapper>> list) {
        for (List list2 : list) {
            if (list2.size() > 1) {
                return ((ItemWrapper) list2.get(1)).getTransitFrame().left - ((ItemWrapper) list2.get(0)).getTransitFrame().right;
            }
        }
        return 0.0f;
    }

    private static List<List<ItemWrapper>> parseTransitionalItems(RecyclerView recyclerView) {
        LinkedList linkedList = new LinkedList();
        LayoutManager layoutManager = recyclerView.getLayoutManager();
        int childCount = layoutManager.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = layoutManager.getChildAt(i);
            if (childAt instanceof TransitionalView) {
                List transitionalItems = ((TransitionalView) childAt).getTransitionalItems();
                if (transitionalItems != null) {
                    linkedList.addAll(transitionalItems);
                }
            }
        }
        if (linkedList.isEmpty()) {
            return null;
        }
        TransitionalItem[] transitionalItemArr = (TransitionalItem[]) linkedList.toArray(new TransitionalItem[linkedList.size()]);
        Arrays.sort(transitionalItemArr, new Comparator<TransitionalItem>() {
            public int compare(TransitionalItem transitionalItem, TransitionalItem transitionalItem2) {
                float f;
                float f2;
                RectF transitFrame = transitionalItem.getTransitFrame();
                RectF transitFrame2 = transitionalItem2.getTransitFrame();
                if (Float.compare(transitFrame.top, transitFrame2.top) == 0) {
                    f = transitFrame.left;
                    f2 = transitFrame2.left;
                } else {
                    f = transitFrame.top;
                    f2 = transitFrame2.top;
                }
                return (int) (f - f2);
            }
        });
        ArrayList arrayList = new ArrayList();
        int length = transitionalItemArr.length;
        List list = null;
        int i2 = 0;
        int i3 = -1;
        int i4 = -1;
        while (i2 < length) {
            TransitionalItem transitionalItem = transitionalItemArr[i2];
            if (list == null || ((ItemWrapper) list.get(0)).getTransitFrame().top != transitionalItem.getTransitFrame().top) {
                list = new ArrayList();
                arrayList.add(list);
                i3++;
                i4 = 0;
            }
            int i5 = i4 + 1;
            list.add(new ItemWrapper(transitionalItem, i3, i4));
            i2++;
            i4 = i5;
        }
        return arrayList;
    }

    /* access modifiers changed from: private */
    public boolean prepareTransition(RecyclerView recyclerView, RecyclerView recyclerView2, int i, long j, long j2) {
        if (this.mDecoration == null) {
            this.mDecoration = new TransitionDecoration();
        }
        recyclerView.addItemDecoration(this.mDecoration);
        cancelLoadTask();
        List<DecorItem> calculateDecorItems = calculateDecorItems(recyclerView, recyclerView2, i, j, j2);
        if (calculateDecorItems == null) {
            return false;
        }
        this.mDecoration.updateItems(recyclerView, calculateDecorItems);
        for (DecorItem decorItem : calculateDecorItems) {
            if (needLoad(decorItem)) {
                this.mNeedLoadItems.add(new DecorViewAware(decorItem));
            }
        }
        loadDrawable();
        return true;
    }

    private void saveTransitingViews(RecyclerView recyclerView, RecyclerView recyclerView2) {
        this.mTransitingFrom = new WeakReference<>(recyclerView);
        this.mTransitingTo = new WeakReference<>(recyclerView2);
    }

    private static void scaleFrame(RectF rectF, float f) {
        if (f != 1.0f) {
            rectF.left *= f;
            rectF.top *= f;
            rectF.right *= f;
            rectF.bottom *= f;
        }
    }

    public static void setRecycleChildVisibility(RecyclerView recyclerView, int i) {
        for (int i2 = 0; i2 < recyclerView.getChildCount(); i2++) {
            recyclerView.getChildAt(i2).setVisibility(i);
        }
    }

    /* access modifiers changed from: private */
    public void setState(int i) {
        this.mState = i;
    }

    /* access modifiers changed from: private */
    public void startAutoTransition(float f, float f2, int i) {
        Transition transition = new Transition((View) this.mTransitingFrom.get(), new OnUpdateListener() {
            public void onUpdate(float f, float f2) {
                RecyclerView recyclerView = (RecyclerView) TransitionHelper.this.mTransitingFrom.get();
                boolean z = false;
                if (recyclerView == null) {
                    Log.w("TransitionHelper", "from view released while updating transition");
                    TransitionHelper.this.stopTransitionInternal(false);
                    return;
                }
                TransitionHelper.this.mDecoration.updateProgress(recyclerView, f);
                if (Float.compare(f, f2) == 0) {
                    TransitionHelper transitionHelper = TransitionHelper.this;
                    if (f2 > 0.99f) {
                        z = true;
                    }
                    transitionHelper.stopTransitionInternal(z);
                } else {
                    TransitionHelper.this.mTransitionListener.onTransitionUpdate((RecyclerView) TransitionHelper.this.mTransitingFrom.get(), (RecyclerView) TransitionHelper.this.mTransitingTo.get(), f);
                }
            }
        }, i, f > 0.1f ? new CubicEaseOutInterpolator() : new CubicEaseInOutInterpolator(), f > 0.1f ? 350 : 400);
        this.mTransition = transition;
        this.mTransition.start(f, f2);
    }

    private void stopTransition() {
        stopTransitionInternal(false);
    }

    /* access modifiers changed from: private */
    public void stopTransitionInternal(boolean z) {
        RecyclerView recyclerView = this.mTransitingFrom != null ? (RecyclerView) this.mTransitingFrom.get() : null;
        if (recyclerView != null) {
            if (this.mDecoration != null) {
                List<DecorItem> decorItems = this.mDecoration.getDecorItems();
                this.mDecoration.updateItems(recyclerView, null);
                recyclerView.removeItemDecoration(this.mDecoration);
                if (decorItems != null) {
                    for (DecorItem decorItem : decorItems) {
                        if (!(decorItem.mDrawable == null || decorItem.mDrawable.getAlpha() == 255)) {
                            decorItem.mDrawable.setAlpha(255);
                        }
                    }
                }
            }
            this.mTransitionListener.onTransitionEnd((RecyclerView) this.mTransitingFrom.get(), (RecyclerView) this.mTransitingTo.get(), z);
        }
        if (this.mTransition != null) {
            this.mTransition.stop();
        }
        cancelLoadTask();
        this.mAnchor = null;
        this.mIsFastScale = false;
        this.mScaleBeginFactor = 1.0f;
        setState(-1);
        clearTransitingViews();
    }

    private float translateProgress() {
        return Math.abs(this.mCurScale - 1.0f);
    }

    public void bindTransition(RecyclerView recyclerView, RecyclerView recyclerView2, int i) {
        ScaleTouchListener scaleTouchListener = (ScaleTouchListener) this.mViewScaleMapping.get(recyclerView);
        if (scaleTouchListener == null) {
            scaleTouchListener = new ScaleTouchListener(recyclerView, this);
            this.mViewScaleMapping.put(recyclerView, scaleTouchListener);
        }
        recyclerView.removeOnItemTouchListener(scaleTouchListener);
        recyclerView.addOnItemTouchListener(scaleTouchListener);
        scaleTouchListener.bindZoomView(recyclerView2, i);
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x0068  */
    /* JADX WARNING: Removed duplicated region for block: B:17:0x006c  */
    public boolean onScale(RecyclerView recyclerView, RecyclerView recyclerView2, int i, float f) {
        int i2 = i;
        if (this.mState != 0) {
            Log.w("TransitionHelper", "onScale current state %s, does onScaleBegin hasn't called?", Integer.valueOf(this.mState));
            return false;
        }
        boolean z = !this.mIsFastScale;
        if (this.mAnchor != null) {
            long currentTimeMillis = System.currentTimeMillis();
            boolean prepareTransition = prepareTransition(recyclerView, recyclerView2, i, this.mAnchor.mFromAnchorId, this.mAnchor.mToAnchorId);
            Log.d("TransitionHelper", "prepare transition cost %s", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
            if (!prepareTransition) {
                Log.e("TransitionHelper", "prepare transition error");
                stopTransitionInternal(false);
                return false;
            }
            this.mAnchor = null;
            if (z) {
                doScale(recyclerView, recyclerView2, i2, this.mScaleBeginFactor);
                if (!z) {
                    doScale(recyclerView, recyclerView2, i, f);
                    return true;
                }
                setState(1);
                startAutoTransition(0.0f, 1.0f, i2);
                return false;
            }
        }
        RecyclerView recyclerView3 = recyclerView;
        RecyclerView recyclerView4 = recyclerView2;
        if (!z) {
        }
    }

    public boolean onScaleBegin(RecyclerView recyclerView, RecyclerView recyclerView2, int i, float f, float f2, float f3) {
        boolean z = false;
        if (this.mState != -1) {
            Log.w("TransitionHelper", "current state %s doesn't support manual scale", Integer.valueOf(this.mState));
            return false;
        }
        TransitionAnchor onTransitionPrepare = this.mTransitionListener.onTransitionPrepare(recyclerView, recyclerView2, i, f2, f3);
        saveTransitingViews(recyclerView, recyclerView2);
        if (onTransitionPrepare == null || !onTransitionPrepare.isValid()) {
            stopTransitionInternal(false);
            return false;
        }
        this.mAnchor = onTransitionPrepare;
        setState(0);
        this.mCurScale = 1.0f;
        this.mScaleBeginFactor = f;
        if (Math.abs(f - 1.0f) > 0.05f) {
            z = true;
        }
        this.mIsFastScale = z;
        return true;
    }

    public void onScaleEnd(RecyclerView recyclerView, RecyclerView recyclerView2, int i, float f) {
        if (this.mState != 0) {
            Log.w("TransitionHelper", "onScaleEnd current state %s, does onScaleBegin have been called?", Integer.valueOf(this.mState));
            return;
        }
        this.mCurScale *= f;
        float translateProgress = translateProgress();
        float f2 = 0.0f;
        if (translateProgress > 0.0f) {
            f2 = 1.0f;
        }
        boolean z = true;
        if (this.mDecoration == null) {
            Log.w("TransitionHelper", "does prepareTransition have been called?");
            if (f2 <= 0.99f) {
                z = false;
            }
            stopTransitionInternal(z);
            return;
        }
        setState(1);
        if (f2 <= 0.99f) {
            i = i == 1 ? 2 : 1;
        }
        startAutoTransition(translateProgress, f2, i);
    }

    public void startTransition(RecyclerView recyclerView, RecyclerView recyclerView2, final int i, float f, float f2) {
        if (this.mState != -1) {
            stopTransition();
        }
        TransitionAnchor onTransitionPrepare = this.mTransitionListener.onTransitionPrepare(recyclerView, recyclerView2, i, f, f2);
        saveTransitingViews(recyclerView, recyclerView2);
        if (onTransitionPrepare == null || !onTransitionPrepare.isValid()) {
            Log.e("TransitionHelper", "invalid anchor %s", (Object) onTransitionPrepare);
            stopTransitionInternal(false);
            return;
        }
        this.mAnchor = onTransitionPrepare;
        recyclerView.post(new Runnable() {
            public void run() {
                if (TransitionHelper.this.mState != -1) {
                    Log.w("TransitionHelper", "cur state %s doesn't support auto transition", Integer.valueOf(TransitionHelper.this.mState));
                    return;
                }
                if (TransitionHelper.this.prepareTransition((RecyclerView) TransitionHelper.this.mTransitingFrom.get(), (RecyclerView) TransitionHelper.this.mTransitingTo.get(), i, TransitionHelper.this.mAnchor.mFromAnchorId, TransitionHelper.this.mAnchor.mToAnchorId)) {
                    TransitionHelper.this.setState(1);
                    TransitionHelper.this.startAutoTransition(0.0f, 1.0f, i);
                } else {
                    TransitionHelper.this.stopTransitionInternal(false);
                }
            }
        });
    }
}
