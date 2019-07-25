package com.miui.gallery.ui;

import android.app.Fragment;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Process;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.cloudcontrol.strategies.ComponentsStrategy.Priority;
import com.miui.gallery.threadpool.PriorityThreadFactory;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.Numbers;
import com.miui.gallery.util.ShareComponentSorter;
import com.miui.gallery.util.ShareComponentSorter.OnInitializedListener;
import com.miui.gallery.widget.CircleImageView;
import com.miui.gallery.widget.PagerAdapter;
import com.miui.gallery.widget.ViewPager;
import com.miui.gallery.widget.ViewPager.OnPageChangeListener;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class ChooserFragment extends Fragment implements OnPageChangeListener {
    /* access modifiers changed from: private */
    public ResolverAdapter mAdapter;
    /* access modifiers changed from: private */
    public OnIntentSelectedListener mListener;
    private PagerPoint mPoint;
    private OnInitializedListener mSorterInitializedListener;
    private ViewPager mViewPager;

    private static class Component {
        String mClassName;
        int mHashCode;
        String mPackageName;

        public Component() {
        }

        Component(ResolveInfo resolveInfo) {
            init(resolveInfo.activityInfo.packageName, resolveInfo.activityInfo.name);
        }

        private void init(String str, String str2) {
            this.mPackageName = str;
            this.mClassName = str2;
            StringBuilder sb = new StringBuilder();
            sb.append(this.mPackageName);
            sb.append(this.mClassName);
            this.mHashCode = sb.toString().hashCode();
        }

        public boolean equals(Object obj) {
            if (obj instanceof Component) {
                Component component = (Component) obj;
                if (this.mPackageName.equals(component.mPackageName) && this.mClassName.equals(component.mClassName)) {
                    return true;
                }
            }
            return false;
        }

        public int hashCode() {
            return this.mHashCode;
        }

        /* access modifiers changed from: 0000 */
        public Component wrap(ResolveInfo resolveInfo) {
            init(resolveInfo.activityInfo.packageName, resolveInfo.activityInfo.name);
            return this;
        }
    }

    public interface OnIntentSelectedListener {
        void onIntentSelected(Intent intent);
    }

    private static class PagerPoint {
        private Drawable mActiveDrawable;
        private int mActivePoint = 0;
        private Drawable mNormalDrawable;
        private LinearLayout mPointLayout;
        private int mPointMargin;

        PagerPoint(LinearLayout linearLayout, Drawable drawable, Drawable drawable2) {
            this.mPointLayout = linearLayout;
            this.mPointMargin = linearLayout.getContext().getResources().getDimensionPixelOffset(R.dimen.pager_point_margin);
            this.mNormalDrawable = drawable;
            this.mActiveDrawable = drawable2;
        }

        private ImageView generatorPoint() {
            ImageView imageView = new ImageView(this.mPointLayout.getContext());
            LayoutParams layoutParams = new LayoutParams(-2, -2);
            layoutParams.leftMargin = this.mPointMargin;
            layoutParams.rightMargin = this.mPointMargin;
            imageView.setLayoutParams(layoutParams);
            return imageView;
        }

        private void setImageDrawable(ImageView imageView, Drawable drawable) {
            if (imageView != null) {
                imageView.setImageDrawable(drawable);
            }
        }

        public void notifyActivePointChanged(int i) {
            int childCount = this.mPointLayout.getChildCount();
            if (i > -1 && i < childCount) {
                setImageDrawable((ImageView) this.mPointLayout.getChildAt(this.mActivePoint), this.mNormalDrawable);
                setImageDrawable((ImageView) this.mPointLayout.getChildAt(i), this.mActiveDrawable);
                this.mActivePoint = i;
            }
        }

        public void notifyPointCountChanged(int i, int i2) {
            this.mPointLayout.removeAllViews();
            int i3 = 0;
            while (i3 < i) {
                ImageView generatorPoint = generatorPoint();
                setImageDrawable(generatorPoint, i2 == i3 ? this.mActiveDrawable : this.mNormalDrawable);
                this.mPointLayout.addView(generatorPoint, i3);
                i3++;
            }
            this.mActivePoint = i2;
        }
    }

    private static class PriorityComparator implements Comparator<ResolveInfo> {
        /* access modifiers changed from: private */
        public Comparator<ResolveInfo> mNormal;
        private HashMap<Component, Integer> mPriority;
        private Component mTemp;

        private PriorityComparator() {
            this.mPriority = new HashMap<>();
            this.mTemp = new Component();
        }

        /* access modifiers changed from: 0000 */
        public void build(List<Priority> list, List<ResolveInfo> list2) {
            int i;
            Log.d("ChooserFragment", "build priority: %s", (Object) list);
            for (ResolveInfo resolveInfo : list2) {
                this.mTemp.wrap(resolveInfo);
                if (this.mPriority.get(this.mTemp) == null) {
                    Iterator it = list.iterator();
                    while (true) {
                        boolean z = 0;
                        if (!it.hasNext()) {
                            i = z;
                            break;
                        }
                        Priority priority = (Priority) it.next();
                        String str = resolveInfo.activityInfo.packageName;
                        String str2 = resolveInfo.activityInfo.name;
                        if ((resolveInfo.activityInfo.applicationInfo.flags & 1) != 0) {
                            z = 1;
                        }
                        if (priority.match(str, str2, z)) {
                            i = priority.value;
                            break;
                        }
                    }
                    this.mPriority.put(new Component(resolveInfo), Integer.valueOf(i));
                    Log.d("ChooserFragment", "assign priority of %s, %s by %d", this.mTemp.mPackageName, this.mTemp.mClassName, Integer.valueOf(i));
                }
            }
            Log.d("ChooserFragment", "build finish");
        }

        public int compare(ResolveInfo resolveInfo, ResolveInfo resolveInfo2) {
            int compare = this.mNormal.compare(resolveInfo, resolveInfo2);
            if (compare != 0) {
                return compare;
            }
            int i = 0;
            int unbox = Numbers.unbox((Integer) this.mPriority.get(this.mTemp.wrap(resolveInfo)), 0);
            int unbox2 = Numbers.unbox((Integer) this.mPriority.get(this.mTemp.wrap(resolveInfo2)), 0);
            if (unbox < unbox2) {
                i = 1;
            } else if (unbox != unbox2) {
                i = -1;
            }
            return i;
        }
    }

    private static class ResolverAdapter extends PagerAdapter {
        private LinkedList<WeakReference<View>> mCachedViews = new LinkedList<>();
        private Context mContext;
        private List<DisplayResolvedInfo> mData = new ArrayList();
        private boolean mIsCrop;
        /* access modifiers changed from: private */
        public OnIntentSelectedListener mListener;
        private ResolveInfoLoader mLoader;
        private PackageManager mPm;
        private PriorityComparator mPriorityComparator = new PriorityComparator();
        private boolean mResumed = false;
        private Intent mTarIntent;
        private int mTheme;

        private class CellHolder implements OnClickListener {
            public ImageView mIcon;
            public DisplayResolvedInfo mInfo;
            public TextView mText;

            private CellHolder() {
            }

            public boolean needRefresh(DisplayResolvedInfo displayResolvedInfo) {
                return !displayResolvedInfo.equals(this.mInfo) || this.mIcon.getDrawable() == null;
            }

            public void onClick(View view) {
                ShareComponentSorter.getInstance().touch(this.mInfo.mResolveInfo.activityInfo.packageName, this.mInfo.mResolveInfo.activityInfo.name);
                if (ResolverAdapter.this.mListener != null) {
                    ResolverAdapter.this.mListener.onIntentSelected(new Intent(this.mInfo.getResolvedIntent()));
                }
                ShareComponentSorter.getInstance().save();
            }
        }

        private class DisplayResolvedInfo {
            /* access modifiers changed from: private */
            public ResolveInfo mResolveInfo;
            private Intent mResolvedIntent;

            public DisplayResolvedInfo(Intent intent, ResolveInfo resolveInfo) {
                this.mResolveInfo = resolveInfo;
                this.mResolvedIntent = new Intent(intent);
                ActivityInfo activityInfo = this.mResolveInfo.activityInfo;
                this.mResolvedIntent.setComponent(new ComponentName(activityInfo.applicationInfo.packageName, activityInfo.name));
            }

            public boolean equals(Object obj) {
                if (obj == null || !(obj instanceof DisplayResolvedInfo)) {
                    return false;
                }
                return ResolverAdapter.isSameResolvedComponent(getResolveInfo(), ((DisplayResolvedInfo) obj).getResolveInfo());
            }

            public ResolveInfo getResolveInfo() {
                return this.mResolveInfo;
            }

            public Intent getResolvedIntent() {
                return this.mResolvedIntent;
            }

            public int hashCode() {
                StringBuilder sb = new StringBuilder();
                sb.append(this.mResolveInfo.activityInfo.packageName);
                sb.append(this.mResolveInfo.activityInfo.name);
                return sb.toString().hashCode();
            }
        }

        private static class ResolveInfoLoader {
            private Map<Integer, String> mCacheKey = Collections.synchronizedMap(new HashMap());
            private Map<String, LoadResult> mCacheResult = new HashMap();
            private ThreadPoolExecutor mExecutor;

            private class IconResult {
                final Drawable drawable;
                final boolean isCustomIcon;

                public IconResult(Drawable drawable2, boolean z) {
                    this.drawable = drawable2;
                    this.isCustomIcon = z;
                }
            }

            private static class LoadResult {
                final Drawable mIcon;
                final boolean mIsCustomIcon;
                final CharSequence mLabel;
                LoadingInfo mLoadingInfo;

                public LoadResult(Drawable drawable, CharSequence charSequence, boolean z) {
                    this.mIcon = drawable;
                    this.mLabel = charSequence;
                    this.mIsCustomIcon = z;
                }

                /* access modifiers changed from: 0000 */
                public LoadResult setLoadingInfo(LoadingInfo loadingInfo) {
                    this.mLoadingInfo = loadingInfo;
                    return this;
                }
            }

            private class LoadTask extends AsyncTask<LoadingInfo, Void, LoadResult> {
                private WeakReference<Context> mContextRef;

                LoadTask(Context context) {
                    this.mContextRef = new WeakReference<>(context);
                }

                private IconResult loadIcon(LoadingInfo loadingInfo) {
                    Drawable drawable;
                    Drawable drawable2 = null;
                    boolean z = true;
                    try {
                        ResolveInfo resolveInfo = loadingInfo.mResolve;
                        Context context = (Context) this.mContextRef.get();
                        if (context != null) {
                            if (loadingInfo.mUseCustomIcon) {
                                String str = resolveInfo.activityInfo.name;
                                String str2 = resolveInfo.activityInfo.packageName;
                                Resources resources = context.getResources();
                                if (TextUtils.equals(str, "com.tencent.mm.ui.tools.ShareImgUI")) {
                                    drawable = resources.getDrawable(R.drawable.ic_share_wechat);
                                } else if (TextUtils.equals(str, "com.tencent.mm.ui.tools.ShareToTimeLineUI")) {
                                    drawable = resources.getDrawable(R.drawable.ic_share_wechat_moments);
                                } else if (TextUtils.equals(str, "com.tencent.mobileqq.activity.JumpActivity") && TextUtils.equals(str2, "com.tencent.mobileqq")) {
                                    drawable = resources.getDrawable(R.drawable.ic_share_qq);
                                } else if (TextUtils.equals(str, "com.sina.weibo.composerinde.ComposerDispatchActivity")) {
                                    drawable = resources.getDrawable(R.drawable.ic_share_weibo);
                                } else if (TextUtils.equals(str2, "com.qzone")) {
                                    drawable = resources.getDrawable(R.drawable.ic_share_qzone);
                                }
                                drawable2 = drawable;
                            }
                            if (drawable2 == null) {
                                z = false;
                                drawable2 = resolveInfo.loadIcon(context.getPackageManager());
                            }
                        }
                    } catch (Exception e) {
                        Log.e("ChooserFragment", (Throwable) e);
                    }
                    return new IconResult(drawable2, z);
                }

                private CharSequence loadLabel(ResolveInfo resolveInfo) {
                    Context context = (Context) this.mContextRef.get();
                    if (context == null) {
                        return null;
                    }
                    try {
                        Resources resources = context.getResources();
                        StringBuilder sb = new StringBuilder();
                        sb.append(resolveInfo.activityInfo.packageName);
                        sb.append("_");
                        sb.append(resolveInfo.activityInfo.name);
                        int identifier = resources.getIdentifier(sb.toString(), "string", context.getPackageName());
                        if (identifier != 0) {
                            return resources.getString(identifier);
                        }
                    } catch (Exception unused) {
                    }
                    return resolveInfo.loadLabel(context.getPackageManager());
                }

                /* access modifiers changed from: protected */
                public LoadResult doInBackground(LoadingInfo... loadingInfoArr) {
                    LoadingInfo loadingInfo = loadingInfoArr[0];
                    if (loadingInfo == null) {
                        return null;
                    }
                    IconResult loadIcon = loadIcon(loadingInfo);
                    return new LoadResult(loadIcon.drawable, loadLabel(loadingInfo.mResolve), loadIcon.isCustomIcon).setLoadingInfo(loadingInfo);
                }

                /* access modifiers changed from: protected */
                public void onPostExecute(LoadResult loadResult) {
                    ResolveInfoLoader.this.setResult(loadResult);
                }
            }

            private static class LoadingInfo {
                final WeakReference<ImageView> mIcon;
                final WeakReference<TextView> mLabel;
                final ResolveInfo mResolve;
                final boolean mUseCustomIcon;

                public LoadingInfo(ImageView imageView, TextView textView, ResolveInfo resolveInfo, boolean z) {
                    this.mIcon = new WeakReference<>(imageView);
                    this.mLabel = new WeakReference<>(textView);
                    this.mResolve = resolveInfo;
                    this.mUseCustomIcon = z;
                }

                public ImageView getIconView() {
                    if (this.mIcon != null) {
                        return (ImageView) this.mIcon.get();
                    }
                    return null;
                }

                public TextView getLabelView() {
                    if (this.mLabel != null) {
                        return (TextView) this.mLabel.get();
                    }
                    return null;
                }

                public int getViewId() {
                    ImageView iconView = getIconView();
                    if (iconView != null) {
                        return iconView.hashCode();
                    }
                    return 0;
                }
            }

            public ResolveInfoLoader() {
                ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(1, 2, 1, TimeUnit.SECONDS, new LinkedBlockingQueue(), new PriorityThreadFactory("thread-pool", 10));
                this.mExecutor = threadPoolExecutor;
            }

            private static String generateKey(ResolveInfo resolveInfo) {
                StringBuilder sb = new StringBuilder();
                if (resolveInfo != null) {
                    sb.append(resolveInfo.activityInfo.packageName);
                    sb.append("#");
                    sb.append(resolveInfo.activityInfo.name);
                }
                return sb.toString();
            }

            private boolean needApplyResult(LoadResult loadResult) {
                if (loadResult == null || loadResult.mLoadingInfo == null) {
                    return false;
                }
                this.mCacheResult.put(generateKey(loadResult.mLoadingInfo.mResolve), loadResult);
                return TextUtils.equals(generateKey(loadResult.mLoadingInfo.mResolve), (CharSequence) this.mCacheKey.get(Integer.valueOf(loadResult.mLoadingInfo.getViewId())));
            }

            /* access modifiers changed from: private */
            public void setResult(LoadResult loadResult) {
                if (needApplyResult(loadResult)) {
                    ImageView iconView = loadResult.mLoadingInfo.getIconView();
                    if (iconView != null) {
                        if (iconView instanceof CircleImageView) {
                            ((CircleImageView) iconView).setDrawableInset(loadResult.mIsCustomIcon ? 0 : -10, false);
                        }
                        iconView.setImageDrawable(loadResult.mIcon);
                    }
                    TextView labelView = loadResult.mLoadingInfo.getLabelView();
                    if (labelView != null) {
                        labelView.setText(loadResult.mLabel);
                    }
                    this.mCacheKey.remove(generateKey(loadResult.mLoadingInfo.mResolve));
                }
            }

            private void submit(Context context, LoadingInfo loadingInfo) {
                new LoadTask(context).executeOnExecutor(this.mExecutor, new LoadingInfo[]{loadingInfo});
            }

            public void loadInfo(Context context, ImageView imageView, TextView textView, ResolveInfo resolveInfo, boolean z) {
                if (resolveInfo != null) {
                    String generateKey = generateKey(resolveInfo);
                    LoadingInfo loadingInfo = new LoadingInfo(imageView, textView, resolveInfo, z);
                    this.mCacheKey.put(Integer.valueOf(loadingInfo.getViewId()), generateKey);
                    LoadResult loadResult = (LoadResult) this.mCacheResult.get(generateKey);
                    if (loadResult != null) {
                        loadResult.setLoadingInfo(loadingInfo);
                        setResult(loadResult);
                        Log.d("ChooserFragment", "load from cache");
                    } else {
                        Log.d("ChooserFragment", "load from file");
                        submit(context, loadingInfo);
                    }
                }
            }

            public void release() {
                try {
                    this.mCacheKey.clear();
                    this.mCacheResult.clear();
                    this.mExecutor.shutdownNow();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        ResolverAdapter(Context context, Intent intent, int i, boolean z, boolean z2) {
            this.mContext = context;
            this.mPm = context.getPackageManager();
            this.mTarIntent = intent;
            this.mTheme = i;
            this.mIsCrop = z;
            this.mLoader = new ResolveInfoLoader();
            reBuildList();
            this.mResumed = z2;
        }

        private void addResolveListDedupe(List<ResolveInfo> list, List<ResolveInfo> list2) {
            boolean z;
            int size = list2.size();
            int size2 = list.size();
            for (int i = 0; i < size; i++) {
                ResolveInfo resolveInfo = (ResolveInfo) list2.get(i);
                int i2 = 0;
                while (true) {
                    if (i2 >= size2) {
                        z = false;
                        break;
                    } else if (isSameResolvedComponent(resolveInfo, (ResolveInfo) list.get(i))) {
                        z = true;
                        break;
                    } else {
                        i2++;
                    }
                }
                if (!z) {
                    list.add(resolveInfo);
                }
            }
        }

        private ResolveInfo contains(com.miui.gallery.cloudcontrol.strategies.ComponentsStrategy.Component component, List<ResolveInfo> list) {
            ListIterator listIterator = list.listIterator();
            ResolveInfo resolveInfo = null;
            while (listIterator.hasNext()) {
                ResolveInfo resolveInfo2 = (ResolveInfo) listIterator.next();
                if (TextUtils.equals(resolveInfo2.activityInfo.packageName, component.getPackageName())) {
                    if (TextUtils.equals(resolveInfo2.activityInfo.name, component.getClassName())) {
                        return resolveInfo2;
                    }
                    resolveInfo = resolveInfo2;
                }
            }
            return resolveInfo;
        }

        private int conversePos(int i, int i2) {
            return (i * 5) + i2;
        }

        private void filterResolveInfoList(List<ResolveInfo> list) {
            if (list != null) {
                int i = 0;
                while (i < list.size()) {
                    ResolveInfo resolveInfo = (ResolveInfo) list.get(i);
                    if (!resolveInfo.activityInfo.exported) {
                        list.remove(i);
                        i--;
                    } else {
                        String str = resolveInfo.activityInfo.permission;
                        if (!TextUtils.isEmpty(str) && this.mContext.checkPermission(str, Process.myPid(), Process.myUid()) != 0) {
                            list.remove(i);
                            i--;
                        }
                    }
                    i++;
                }
            }
        }

        private View generatorChooserItem(ViewGroup viewGroup) {
            View view;
            while (!this.mCachedViews.isEmpty()) {
                WeakReference weakReference = (WeakReference) this.mCachedViews.remove();
                if (weakReference != null) {
                    view = (View) weakReference.get();
                    continue;
                } else {
                    view = null;
                    continue;
                }
                if (view != null) {
                    return view;
                }
            }
            LayoutInflater from = LayoutInflater.from(viewGroup.getContext());
            ViewGroup viewGroup2 = (ViewGroup) from.inflate(R.layout.chooser_item, viewGroup, false);
            for (int i = 0; i < 5; i++) {
                View inflate = from.inflate(R.layout.chooser_item_cell, viewGroup2, false);
                ViewGroup viewGroup3 = (ViewGroup) inflate.findViewById(R.id.image_container);
                TextView textView = (TextView) inflate.findViewById(R.id.chooser_text);
                int i2 = this.mTheme;
                int i3 = R.layout.chooser_item_cell_imageview;
                if (i2 == 0) {
                    if (this.mIsCrop) {
                        i3 = R.layout.chooser_item_cell_imageview_crop_light;
                    }
                    textView.setTextAppearance(this.mContext, 2131820572);
                } else {
                    if (this.mIsCrop) {
                        i3 = R.layout.chooser_item_cell_imageview_crop_dark;
                    }
                    textView.setTextAppearance(this.mContext, 2131820571);
                }
                from.inflate(i3, viewGroup3);
                viewGroup2.addView(inflate);
            }
            return viewGroup2;
        }

        /* access modifiers changed from: private */
        public static boolean isSameResolvedComponent(ResolveInfo resolveInfo, ResolveInfo resolveInfo2) {
            return TextUtils.equals(resolveInfo.activityInfo.packageName, resolveInfo2.activityInfo.packageName) && TextUtils.equals(resolveInfo.activityInfo.name, resolveInfo2.activityInfo.name);
        }

        /* access modifiers changed from: private */
        public void reBuildList() {
            this.mData.clear();
            long currentTimeMillis = System.currentTimeMillis();
            List queryIntentActivities = this.mPm.queryIntentActivities(this.mTarIntent, 65536);
            if (queryIntentActivities != null) {
                filterResolveInfoList(queryIntentActivities);
                LinkedList linkedList = new LinkedList();
                addResolveListDedupe(linkedList, queryIntentActivities);
                int size = linkedList.size();
                if (size > 0) {
                    ResolveInfo resolveInfo = (ResolveInfo) linkedList.get(0);
                    for (int i = 1; i < size; i++) {
                        ResolveInfo resolveInfo2 = (ResolveInfo) linkedList.get(i);
                        if (resolveInfo.priority != resolveInfo2.priority || resolveInfo.isDefault != resolveInfo2.isDefault) {
                            while (i < size) {
                                linkedList.remove(i);
                                size--;
                            }
                        }
                    }
                    long currentTimeMillis2 = System.currentTimeMillis();
                    Comparator createComparator = ShareComponentSorter.getInstance().createComparator();
                    this.mPriorityComparator.build(CloudControlStrategyHelper.getComponentPriority(), linkedList);
                    this.mPriorityComparator.mNormal = createComparator;
                    Collections.sort(linkedList, this.mPriorityComparator);
                    sortResolveList(linkedList);
                    Log.i("ChooserFragment", "sortResolveList cost %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis2));
                    for (int i2 = 0; i2 < size; i2++) {
                        this.mData.add(new DisplayResolvedInfo(this.mTarIntent, (ResolveInfo) linkedList.get(i2)));
                    }
                }
            }
            Log.i("ChooserFragment", "reBuildList cost %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        }

        private void sortResolveList(List<ResolveInfo> list) {
            List<com.miui.gallery.cloudcontrol.strategies.ComponentsStrategy.Component> shareComponents = CloudControlStrategyHelper.getShareComponents();
            LinkedList linkedList = new LinkedList();
            for (com.miui.gallery.cloudcontrol.strategies.ComponentsStrategy.Component contains : shareComponents) {
                ResolveInfo contains2 = contains(contains, list);
                if (contains2 != null) {
                    linkedList.add(contains2);
                    list.remove(contains2);
                }
            }
            linkedList.addAll(list);
            list.clear();
            list.addAll(linkedList);
        }

        public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
            View view = (View) obj;
            viewGroup.removeView(view);
            this.mCachedViews.add(new WeakReference(view));
        }

        public int getCount() {
            int size = this.mData.size();
            return size % 5 == 0 ? size / 5 : (size / 5) + 1;
        }

        public int getItemPosition(Object obj, int i) {
            return (i <= 0 || i >= getCount()) ? -2 : -3;
        }

        public Object instantiateItem(ViewGroup viewGroup, int i) {
            View generatorChooserItem = generatorChooserItem(viewGroup);
            refreshItem(generatorChooserItem, i);
            viewGroup.addView(generatorChooserItem);
            return generatorChooserItem;
        }

        public boolean isViewFromObject(View view, Object obj) {
            return view == obj;
        }

        public void pause() {
            this.mResumed = false;
        }

        public void refreshItem(Object obj, int i) {
            ViewGroup viewGroup = (ViewGroup) obj;
            viewGroup.setTag(R.id.tag_item_position, Integer.valueOf(i));
            if (this.mResumed) {
                int childCount = viewGroup.getChildCount();
                for (int i2 = 0; i2 < childCount; i2++) {
                    View childAt = viewGroup.getChildAt(i2);
                    CellHolder cellHolder = (CellHolder) childAt.getTag();
                    if (cellHolder == null) {
                        cellHolder = new CellHolder();
                        cellHolder.mIcon = (ImageView) childAt.findViewById(R.id.chooser_icon);
                        cellHolder.mText = (TextView) childAt.findViewById(R.id.chooser_text);
                        childAt.setTag(cellHolder);
                    }
                    int conversePos = conversePos(i, i2);
                    if (conversePos < 0 || conversePos >= this.mData.size()) {
                        childAt.setOnClickListener(null);
                        childAt.setVisibility(4);
                    } else {
                        DisplayResolvedInfo displayResolvedInfo = (DisplayResolvedInfo) this.mData.get(conversePos);
                        if (cellHolder.needRefresh(displayResolvedInfo)) {
                            cellHolder.mInfo = displayResolvedInfo;
                            this.mLoader.loadInfo(viewGroup.getContext(), cellHolder.mIcon, cellHolder.mText, cellHolder.mInfo.getResolveInfo(), this.mIsCrop);
                        } else {
                            cellHolder.mInfo = displayResolvedInfo;
                        }
                        childAt.setOnClickListener(cellHolder);
                        childAt.setVisibility(0);
                    }
                }
            }
        }

        public void release() {
            this.mLoader.release();
            this.mListener = null;
        }

        public boolean requery(Intent intent) {
            if (intent == null || intent.filterEquals(this.mTarIntent)) {
                return false;
            }
            this.mTarIntent = intent;
            reBuildList();
            notifyDataSetChanged();
            return true;
        }

        public void resume() {
            if (!this.mResumed) {
                this.mResumed = true;
                notifyDataSetChanged();
            }
        }

        public void setOnIntentSelectedListener(OnIntentSelectedListener onIntentSelectedListener) {
            this.mListener = onIntentSelectedListener;
        }
    }

    private class SortInitializeListener implements OnInitializedListener {
        private SortInitializeListener() {
        }

        public void onInitialized() {
            Log.d("ChooserFragment", "sorter initialized, rebuild cells");
            if (ChooserFragment.this.mAdapter != null) {
                ChooserFragment.this.mAdapter.reBuildList();
                ChooserFragment.this.mAdapter.notifyDataSetChanged();
            }
        }
    }

    public static ChooserFragment newInstance(Intent intent, int i, boolean z) {
        ChooserFragment chooserFragment = new ChooserFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelable("key_target_intent", intent);
        bundle.putInt("key_theme", i);
        bundle.putBoolean("init_visible", z);
        chooserFragment.setArguments(bundle);
        return chooserFragment;
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        Bundle arguments = getArguments();
        if (arguments != null) {
            Intent intent = (Intent) arguments.getParcelable("key_target_intent");
            if (intent != null) {
                int i = arguments.getInt("key_theme", 0);
                boolean z = getResources().getBoolean(R.bool.theme_crop_share_icon);
                boolean z2 = arguments.getBoolean("init_visible", true);
                View inflate = layoutInflater.inflate(R.layout.chooser_layout, viewGroup, false);
                this.mViewPager = (ViewPager) inflate.findViewById(R.id.chooser_pager);
                this.mViewPager.setRightOffscreenPageLimit(1);
                this.mViewPager.setLeftOffscreenPageLimit(1);
                this.mPoint = new PagerPoint((LinearLayout) inflate.findViewById(R.id.pager_point_layout), getResources().getDrawable((i != 0 || MiscUtil.isNightMode(getActivity())) ? R.drawable.unselected_point_dark : R.drawable.unselected_point_light), getResources().getDrawable(R.drawable.selected_point));
                ResolverAdapter resolverAdapter = new ResolverAdapter(getActivity(), intent, i, z, z2);
                this.mAdapter = resolverAdapter;
                this.mPoint.notifyPointCountChanged(this.mAdapter.getCount(), 0);
                this.mViewPager.setOnPageChangeListener(this);
                this.mViewPager.setAdapter(this.mAdapter);
                this.mAdapter.setOnIntentSelectedListener(new OnIntentSelectedListener() {
                    public void onIntentSelected(Intent intent) {
                        if (ChooserFragment.this.mListener != null) {
                            ChooserFragment.this.mListener.onIntentSelected(intent);
                        }
                    }
                });
                if (!ShareComponentSorter.getInstance().initialized()) {
                    Log.d("ChooserFragment", "sorter not initialized");
                    this.mSorterInitializedListener = new SortInitializeListener();
                    ShareComponentSorter.getInstance().registerOnInitializedListener(this.mSorterInitializedListener);
                    ShareComponentSorter.getInstance().initialize(getActivity().getApplicationContext());
                }
                return inflate;
            }
        }
        throw new IllegalArgumentException("target intent couldn't be null");
    }

    public void onDestroy() {
        this.mListener = null;
        if (this.mAdapter != null) {
            this.mAdapter.release();
        }
        super.onDestroy();
    }

    public void onDestroyView() {
        super.onDestroyView();
        if (this.mSorterInitializedListener != null) {
            ShareComponentSorter.getInstance().removeOnInitializedListener(this.mSorterInitializedListener);
        }
    }

    public void onPageScrollStateChanged(int i) {
    }

    public void onPageScrolled(int i, float f, int i2) {
    }

    public void onPageSelected(int i) {
        this.mPoint.notifyActivePointChanged(i);
    }

    public void onVisibilityChanged(boolean z) {
        if (this.mAdapter == null) {
            return;
        }
        if (z) {
            this.mAdapter.resume();
        } else {
            this.mAdapter.pause();
        }
    }

    public void requery(Intent intent) {
        if (this.mAdapter.requery(intent)) {
            this.mViewPager.setCurrentItem(0);
            this.mPoint.notifyPointCountChanged(this.mAdapter.getCount(), this.mViewPager.getCurrentItem());
        }
    }

    public void setOnIntentSelectedListener(OnIntentSelectedListener onIntentSelectedListener) {
        this.mListener = onIntentSelectedListener;
    }
}
