package com.miui.gallery.ui;

import android.app.LoaderManager.LoaderCallbacks;
import android.content.Loader;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.activity.BaseActivity;
import com.miui.gallery.adapter.SlideShowAdapter;
import com.miui.gallery.adapter.SlideShowAdapter.ShowItem;
import com.miui.gallery.loader.PhotoLoaderManager;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.model.BaseDataSet;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.preference.GalleryPreferences.SlideShow;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureListener;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.SystemUiUtil;
import com.miui.gallery.widget.SlideShowView;
import com.nexstreaming.nexeditorsdk.nexProject;

public class SlideShowFragment extends BaseFragment {
    /* access modifiers changed from: private */
    public SlideShowAdapter mAdapter;
    private int mLoadDuration = nexProject.kAutoThemeTransitionDuration;
    private SlideLoaderCallBack mLoaderCallBack;
    /* access modifiers changed from: private */
    public Handler mSlideHandler = new Handler() {
        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    SlideShowFragment.this.loadNextBitmap();
                    return;
                case 2:
                    SlideShowFragment.this.showPendingItem(message.obj == null ? null : (ShowItem) message.obj);
                    return;
                default:
                    return;
            }
        }
    };
    private SlideShowView mSlideView;

    private class SlideLoaderCallBack implements LoaderCallbacks {
        private SlideLoaderCallBack() {
        }

        public Loader onCreateLoader(int i, Bundle bundle) {
            return PhotoLoaderManager.getInstance().getPhotoDataSet(SlideShowFragment.this.getActivity(), Uri.parse(bundle.getString("photo_uri")), bundle);
        }

        public void onLoadFinished(Loader loader, Object obj) {
            SlideShowFragment.this.mAdapter.changeDataSet((BaseDataSet) obj, SlideShowFragment.this.mAdapter.getShowIndex() == 0 ? SlideShowFragment.this.getArguments().getInt("photo_init_position", 0) : SlideShowFragment.this.mAdapter.getShowIndex());
        }

        public void onLoaderReset(Loader loader) {
        }
    }

    private int getSlideDuration() {
        int max = Math.max(3500, SlideShow.getSlideShowInterval() * 1000);
        this.mLoadDuration = max - 500;
        return max;
    }

    /* access modifiers changed from: private */
    public void loadNextBitmap() {
        this.mAdapter.nextBitmap(new FutureListener<ShowItem>() {
            public void onFutureDone(Future<ShowItem> future) {
                if (!future.isCancelled()) {
                    SlideShowFragment.this.mSlideHandler.obtainMessage(2, future.get()).sendToTarget();
                }
            }
        });
    }

    private void setResult(ShowItem showItem) {
        Log.i("SlideShowFragment", "setResult %d", (Object) Integer.valueOf(showItem.getIndex()));
        BaseDataItem baseDataItem = this.mAdapter.getBaseDataItem(showItem.getIndex());
        if (baseDataItem != null) {
            ImageLoadParams imageLoadParams = new ImageLoadParams(baseDataItem.getKey(), baseDataItem.getPathDisplayBetter(), ThumbConfig.get().sMicroTargetSize, (RectF) null, showItem.getIndex(), baseDataItem.getMimeType(), baseDataItem.getSecretKey(), -1);
            getArguments().putParcelable("photo_transition_data", imageLoadParams);
        }
        getArguments().putInt("photo_init_position", showItem.getIndex());
        getArguments().putInt("photo_count", this.mAdapter.getCount());
    }

    /* access modifiers changed from: private */
    public void showPendingItem(ShowItem showItem) {
        if (showItem == null || !showItem.isValid()) {
            if (isAdded() && isResumed()) {
                finish();
            }
            return;
        }
        this.mSlideView.next(showItem.getBitmap(), 0);
        setResult(showItem);
        this.mSlideHandler.sendEmptyMessageDelayed(1, (long) this.mLoadDuration);
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.ui.SlideShowFragment, android.app.Fragment] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.ui.SlideShowFragment, android.app.Fragment]
  assigns: [com.miui.gallery.ui.SlideShowFragment]
  uses: [com.miui.gallery.ui.SlideShowFragment, android.app.Fragment]
  mth insns count: 4
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public static void showSlideShowFragment(BaseActivity baseActivity, Bundle bundle) {
        ? slideShowFragment = new SlideShowFragment();
        slideShowFragment.setArguments(bundle);
        baseActivity.startFragment(slideShowFragment, null, true, false);
    }

    public String getPageName() {
        return "slide_show";
    }

    /* access modifiers changed from: protected */
    public int getThemeRes() {
        return 0;
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        this.mLoaderCallBack = new SlideLoaderCallBack();
        getLoaderManager().initLoader("SlideShowFragment".hashCode(), getArguments(), this.mLoaderCallBack);
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.slide_show_page, viewGroup, false);
        this.mSlideView = (SlideShowView) inflate.findViewById(R.id.slide);
        this.mAdapter = new SlideShowAdapter((ImageLoadParams) getArguments().getParcelable("photo_transition_data"), getArguments().getInt("photo_init_position", 0));
        this.mSlideView.setSlideDuration(getSlideDuration());
        this.mSlideView.setOnTouchListener(new OnTouchListener() {
            public boolean onTouch(View view, MotionEvent motionEvent) {
                if (motionEvent.getAction() == 1 && SlideShowFragment.this.isResumed()) {
                    SlideShowFragment.this.finish();
                }
                return true;
            }
        });
        return inflate;
    }

    public void onPause() {
        super.onPause();
        SystemUiUtil.showSystemBars(getActivity().getWindow().getDecorView());
    }

    public void onResume() {
        super.onResume();
        SystemUiUtil.hideSystemBars(getActivity().getWindow().getDecorView());
    }

    public void onStart() {
        super.onStart();
        if (this.mActivity.getWindow() != null) {
            this.mActivity.getWindow().addFlags(128);
        }
        this.mAdapter.resume();
        loadNextBitmap();
    }

    public void onStop() {
        super.onStop();
        if (this.mActivity.getWindow() != null) {
            this.mActivity.getWindow().clearFlags(128);
        }
        this.mAdapter.pause();
        this.mSlideView.release();
        this.mSlideHandler.removeCallbacksAndMessages(null);
    }
}
