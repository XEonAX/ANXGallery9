package com.miui.gallery.movie.ui.fragment;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.app.Fragment;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.widgets.overscroll.HorizontalOverScrollBounceEffectDecorator;
import com.miui.gallery.editor.photo.widgets.recyclerview.ScrollControlLinearLayoutManager;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.listener.SingleClickListener;
import com.miui.gallery.movie.core.MovieManager;
import com.miui.gallery.movie.entity.AudioResource;
import com.miui.gallery.movie.entity.MovieInfo;
import com.miui.gallery.movie.entity.MovieResource;
import com.miui.gallery.movie.entity.TemplateResource;
import com.miui.gallery.movie.net.AudioResourceRequest;
import com.miui.gallery.movie.net.TemplateResourceRequest;
import com.miui.gallery.movie.ui.activity.MovieStoryPickActivity;
import com.miui.gallery.movie.ui.adapter.AudioAdapter;
import com.miui.gallery.movie.ui.adapter.BaseAdapter;
import com.miui.gallery.movie.ui.adapter.BaseAdapter.BaseHolder;
import com.miui.gallery.movie.ui.adapter.BaseAdapter.ItemSelectChangeListener;
import com.miui.gallery.movie.ui.adapter.EditAdapter;
import com.miui.gallery.movie.ui.adapter.EditAdapter.OnActionListener;
import com.miui.gallery.movie.ui.adapter.TemplateAdapter;
import com.miui.gallery.movie.ui.factory.AudioFactory;
import com.miui.gallery.movie.ui.factory.TemplateFactory;
import com.miui.gallery.movie.ui.listener.MenuActivityListener;
import com.miui.gallery.movie.ui.listener.MenuFragmentListener;
import com.miui.gallery.movie.ui.listener.MovieDownloadListener;
import com.miui.gallery.movie.utils.MovieDownloadManager;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.movie.utils.MovieUtils;
import com.miui.gallery.net.NetApi;
import com.miui.gallery.util.ConvertFilepathUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.OptionalResult;
import com.miui.gallery.util.ToastUtils;
import io.reactivex.Observable;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Predicate;
import io.reactivex.schedulers.Schedulers;
import java.util.ArrayList;
import java.util.List;
import miui.view.animation.QuarticEaseOutInterpolator;

public class MovieEditorMenuFragment extends Fragment implements MenuActivityListener {
    /* access modifiers changed from: private */
    public AudioAdapter mAudioAdapter;
    private AudioResourceRequest mAudioResourceRequest;
    /* access modifiers changed from: private */
    public Context mContext;
    /* access modifiers changed from: private */
    public int mCurrentTabPos;
    /* access modifiers changed from: private */
    public boolean mDeleteClicked;
    private RadioGroup mDurationRadioGroup;
    /* access modifiers changed from: private */
    public EditAdapter mEditAdapter;
    private boolean mIsShortVideo;
    private RadioButton mLongRadioButton;
    /* access modifiers changed from: private */
    public MenuFragmentListener mMenuFragmentListener;
    /* access modifiers changed from: private */
    public MovieInfo mMovieInfo;
    /* access modifiers changed from: private */
    public MovieManager mMovieManager;
    /* access modifiers changed from: private */
    public SimpleRecyclerView[] mRecyclerViews;
    private RadioButton mShortRadioButton;
    private SingleClickListener mSingleClickListener = new SingleClickListener() {
        /* access modifiers changed from: protected */
        public void onSingleClick(View view) {
            switch (view.getId()) {
                case R.id.btn_movie_return /*2131296365*/:
                    MovieEditorMenuFragment.this.mMenuFragmentListener.returnClick();
                    return;
                case R.id.btn_movie_save /*2131296366*/:
                    MovieEditorMenuFragment.this.mMenuFragmentListener.export(false);
                    return;
                default:
                    return;
            }
        }
    };
    /* access modifiers changed from: private */
    public long mStoryMovieCardId;
    /* access modifiers changed from: private */
    public TemplateAdapter mTemplateAdapter;
    private TemplateResourceRequest mTemplateResourceRequest;
    private ViewPager mViewPager;

    private class ControllerPagerAdapter extends PagerAdapter {
        private List<BaseAdapter> mAdapters = new ArrayList(3);

        public ControllerPagerAdapter() {
            this.mAdapters.add(MovieEditorMenuFragment.this.mTemplateAdapter);
            this.mAdapters.add(MovieEditorMenuFragment.this.mAudioAdapter);
            this.mAdapters.add(MovieEditorMenuFragment.this.mEditAdapter);
        }

        public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
            viewGroup.removeView(MovieEditorMenuFragment.this.mRecyclerViews[i]);
        }

        public int getCount() {
            return this.mAdapters.size();
        }

        /* JADX WARNING: Removed duplicated region for block: B:15:0x00fe  */
        public Object instantiateItem(ViewGroup viewGroup, int i) {
            int i2;
            int i3;
            int dimension;
            int dimensionPixelSize;
            SimpleRecyclerView simpleRecyclerView = MovieEditorMenuFragment.this.mRecyclerViews[i];
            if (simpleRecyclerView == null) {
                simpleRecyclerView = new SimpleRecyclerView(viewGroup.getContext());
                ScrollControlLinearLayoutManager scrollControlLinearLayoutManager = new ScrollControlLinearLayoutManager(MovieEditorMenuFragment.this.mContext);
                int i4 = 0;
                scrollControlLinearLayoutManager.setOrientation(0);
                simpleRecyclerView.setLayoutManager(scrollControlLinearLayoutManager);
                if (i == 0) {
                    ((BaseAdapter) this.mAdapters.get(i)).setItemSelectChangeListener(new MyTemplateItemSelectChangeListener());
                    HorizontalOverScrollBounceEffectDecorator.setOverScrollEffect(simpleRecyclerView);
                    dimension = (int) MovieEditorMenuFragment.this.getResources().getDimension(R.dimen.photo_movie_edit_template_item_start);
                    dimensionPixelSize = MovieEditorMenuFragment.this.getResources().getDimensionPixelSize(R.dimen.photo_movie_edit_template_item_horizontal_interval);
                } else if (i == 1) {
                    ((BaseAdapter) this.mAdapters.get(i)).setItemSelectChangeListener(new MyAudioItemSelectChangeListener());
                    HorizontalOverScrollBounceEffectDecorator.setOverScrollEffect(simpleRecyclerView);
                    dimension = (int) MovieEditorMenuFragment.this.getResources().getDimension(R.dimen.photo_movie_edit_template_item_start);
                    dimensionPixelSize = MovieEditorMenuFragment.this.getResources().getDimensionPixelSize(R.dimen.photo_movie_edit_audio_item_horizontal_interval);
                } else if (i == 2) {
                    ((BaseAdapter) this.mAdapters.get(i)).setItemSelectChangeListener(new MyEditItemSelectChangeListener());
                    HorizontalOverScrollBounceEffectDecorator.setOverScrollEffect(simpleRecyclerView, MovieEditorMenuFragment.this.mEditAdapter.getCallback());
                    simpleRecyclerView.setItemAnimator(new DefaultItemAnimator());
                    dimension = (int) MovieEditorMenuFragment.this.getResources().getDimension(R.dimen.photo_movie_edit_square_board_item_start);
                    dimensionPixelSize = MovieEditorMenuFragment.this.getResources().getDimensionPixelSize(R.dimen.photo_movie_edit_square_board_item_horizontal_interval);
                } else {
                    i3 = 0;
                    i2 = 0;
                    MovieEditorMenuFragment.this.mRecyclerViews[i] = simpleRecyclerView;
                    BlankDivider blankDivider = new BlankDivider(i3, i3, i2, 0, 0, 0);
                    simpleRecyclerView.addItemDecoration(blankDivider);
                    simpleRecyclerView.setAdapter((Adapter) this.mAdapters.get(i));
                    if (MovieEditorMenuFragment.this.mCurrentTabPos != i) {
                        i4 = 4;
                    }
                    simpleRecyclerView.setVisibility(i4);
                }
                i3 = dimension;
                i2 = dimensionPixelSize;
                MovieEditorMenuFragment.this.mRecyclerViews[i] = simpleRecyclerView;
                BlankDivider blankDivider2 = new BlankDivider(i3, i3, i2, 0, 0, 0);
                simpleRecyclerView.addItemDecoration(blankDivider2);
                simpleRecyclerView.setAdapter((Adapter) this.mAdapters.get(i));
                if (MovieEditorMenuFragment.this.mCurrentTabPos != i) {
                }
                simpleRecyclerView.setVisibility(i4);
            }
            viewGroup.addView(simpleRecyclerView, new LayoutParams(-1, -1));
            return simpleRecyclerView;
        }

        public boolean isViewFromObject(View view, Object obj) {
            return obj == view;
        }
    }

    private class MyAudioItemSelectChangeListener implements ItemSelectChangeListener {
        private MyAudioItemSelectChangeListener() {
        }

        public boolean onItemSelect(RecyclerView recyclerView, BaseHolder baseHolder, int i, boolean z) {
            AudioResource audioResource = (AudioResource) MovieEditorMenuFragment.this.mAudioAdapter.getItemData(i);
            if (audioResource != null) {
                if (audioResource.getResType() == 2) {
                    Intent intent = new Intent();
                    intent.setType("audio/*");
                    intent.setAction("android.intent.action.GET_CONTENT");
                    intent.setPackage("com.miui.player");
                    try {
                        MovieEditorMenuFragment.this.startActivityForResult(intent, 1000);
                    } catch (ActivityNotFoundException unused) {
                        Log.e("MovieEditorMenuFragment", "com.miui.player not found,try all picker");
                        try {
                            Intent intent2 = new Intent();
                            intent2.setType("audio/*");
                            intent2.setAction("android.intent.action.GET_CONTENT");
                            MovieEditorMenuFragment.this.startActivityForResult(intent2, 1000);
                        } catch (ActivityNotFoundException unused2) {
                            Log.e("MovieEditorMenuFragment", "picker not found");
                        }
                    }
                    return false;
                } else if (z) {
                    int downloadState = audioResource.getDownloadState();
                    if (downloadState == 17 || downloadState == 0) {
                        ScrollControlLinearLayoutManager.onItemClick(recyclerView, i);
                        MovieEditorMenuFragment.this.mMovieInfo.audio = audioResource.nameKey;
                        MovieEditorMenuFragment.this.mMovieManager.setAudio(audioResource);
                        MovieStatUtils.statItemChoose(audioResource);
                        MovieEditorMenuFragment.this.resetMovieShareData();
                        return true;
                    } else if (downloadState != 19 && downloadState != 20) {
                        return false;
                    } else {
                        MovieEditorMenuFragment.this.downloadResource(audioResource);
                        return false;
                    }
                }
            }
            return false;
        }
    }

    private class MyEditItemSelectChangeListener implements ItemSelectChangeListener {
        private MyEditItemSelectChangeListener() {
        }

        public boolean onItemSelect(RecyclerView recyclerView, BaseHolder baseHolder, int i, boolean z) {
            if (MovieEditorMenuFragment.this.mEditAdapter.isAddItem(i)) {
                if (MovieEditorMenuFragment.this.mMovieInfo.isFromStory) {
                    if (MovieEditorMenuFragment.this.mDeleteClicked) {
                        MovieEditorMenuFragment.this.mMenuFragmentListener.updateStorySha1Data();
                        MovieEditorMenuFragment.this.mDeleteClicked = false;
                    }
                    Intent intent = new Intent(MovieEditorMenuFragment.this.getActivity(), MovieStoryPickActivity.class);
                    intent.putExtra("card_id", MovieEditorMenuFragment.this.mStoryMovieCardId);
                    intent.putStringArrayListExtra("pick_sha1", MovieEditorMenuFragment.this.mMenuFragmentListener.getStoryMovieSha1());
                    intent.putExtra("pick-upper-bound", 20);
                    intent.putExtra("pick-lower-bound", 3);
                    MovieEditorMenuFragment.this.startActivityForResult(intent, 1);
                } else if (MovieEditorMenuFragment.this.mEditAdapter.getListSize() >= 20) {
                    ToastUtils.makeText((Context) MovieEditorMenuFragment.this.getActivity(), (int) R.string.movie_add_disable);
                } else {
                    Intent intent2 = new Intent("android.intent.action.GET_CONTENT");
                    intent2.setType("image/*");
                    intent2.putExtra("pick-upper-bound", 20 - MovieEditorMenuFragment.this.mEditAdapter.getList().size());
                    intent2.setPackage("com.miui.gallery");
                    MovieEditorMenuFragment.this.startActivityForResult(intent2, 7);
                }
            } else if (z) {
                ScrollControlLinearLayoutManager.onItemClick(recyclerView, i);
                MovieEditorMenuFragment.this.mMenuFragmentListener.seekToIndex(i);
                MovieEditorMenuFragment.this.mMenuFragmentListener.setDeleteVisible(true);
                return true;
            }
            return false;
        }
    }

    private class MyTemplateItemSelectChangeListener implements ItemSelectChangeListener {
        private MyTemplateItemSelectChangeListener() {
        }

        public boolean onItemSelect(RecyclerView recyclerView, BaseHolder baseHolder, int i, boolean z) {
            if (!z) {
                return false;
            }
            TemplateResource templateResource = (TemplateResource) MovieEditorMenuFragment.this.mTemplateAdapter.getItemData(i);
            int downloadState = templateResource.getDownloadState();
            if (downloadState == 17 || downloadState == 0) {
                ScrollControlLinearLayoutManager.onItemClick(recyclerView, i);
                MovieEditorMenuFragment.this.mAudioAdapter.setSelectedItemPosition(-1);
                MovieStatUtils.statItemChoose(templateResource);
                MovieEditorMenuFragment.this.mMovieInfo.template = templateResource.nameKey;
                MovieEditorMenuFragment.this.mMovieManager.setTemplate(templateResource);
                MovieEditorMenuFragment.this.resetMovieShareData();
                MovieEditorMenuFragment.this.mMenuFragmentListener.showLoadingView();
                return true;
            } else if (downloadState != 19 && downloadState != 20) {
                return false;
            } else {
                MovieEditorMenuFragment.this.downloadResource(templateResource);
                return false;
            }
        }
    }

    private boolean checkChangeLongVideo() {
        return this.mMovieInfo.imageList.size() > 5 && this.mMovieInfo.isShortVideo;
    }

    /* access modifiers changed from: private */
    public void downloadResource(final MovieResource movieResource) {
        MovieDownloadManager.getInstance().downloadResourceWithCheck(getActivity(), movieResource, new MovieDownloadListener() {
            public void onCompleted(boolean z) {
                MovieStatUtils.statDownloadResult(movieResource, z);
                movieResource.downloadState = z ? 0 : 20;
                if (!z) {
                    ToastUtils.makeText(MovieEditorMenuFragment.this.mContext, (int) R.string.movie_download_failed);
                }
                MovieEditorMenuFragment.this.notifyResourceAdapter(movieResource);
            }

            public void onStart() {
                MovieStatUtils.statDownload(movieResource);
                movieResource.downloadState = 18;
                MovieEditorMenuFragment.this.notifyResourceAdapter(movieResource);
            }
        });
    }

    private void initView(View view) {
        this.mContext = view.getContext();
        this.mTemplateAdapter = new TemplateAdapter(this.mContext);
        this.mTemplateAdapter.setList(TemplateFactory.getLocalTemplateEntities());
        int i = R.id.radio_button_video_short;
        this.mShortRadioButton = (RadioButton) view.findViewById(R.id.radio_button_video_short);
        this.mLongRadioButton = (RadioButton) view.findViewById(R.id.radio_button_video_long);
        this.mRecyclerViews = new SimpleRecyclerView[3];
        this.mAudioAdapter = new AudioAdapter(this.mContext);
        this.mAudioAdapter.setList(AudioFactory.getAllLocalAudios());
        this.mEditAdapter = new EditAdapter(this.mContext);
        refreshEditAdapter();
        this.mEditAdapter.setOnActionListener(new OnActionListener() {
            public final void onMove(int i, int i2) {
                MovieEditorMenuFragment.lambda$initView$120(MovieEditorMenuFragment.this, i, i2);
            }
        });
        this.mViewPager = (ViewPager) view.findViewById(R.id.view_pager);
        this.mViewPager.setAdapter(new ControllerPagerAdapter());
        ((RadioGroup) view.findViewById(R.id.radio_group_controller)).setOnCheckedChangeListener(new OnCheckedChangeListener() {
            public final void onCheckedChanged(RadioGroup radioGroup, int i) {
                MovieEditorMenuFragment.lambda$initView$121(MovieEditorMenuFragment.this, radioGroup, i);
            }
        });
        this.mDurationRadioGroup = (RadioGroup) view.findViewById(R.id.duration_group_controller);
        RadioGroup radioGroup = this.mDurationRadioGroup;
        if (!this.mMovieInfo.isShortVideo) {
            i = R.id.radio_button_video_long;
        }
        radioGroup.check(i);
        refreshRadioButtonState(this.mMovieInfo.isShortVideo);
        this.mDurationRadioGroup.setOnCheckedChangeListener(new OnCheckedChangeListener() {
            public final void onCheckedChanged(RadioGroup radioGroup, int i) {
                MovieEditorMenuFragment.lambda$initView$122(MovieEditorMenuFragment.this, radioGroup, i);
            }
        });
        onTabSelect(this.mCurrentTabPos);
        view.findViewById(R.id.btn_movie_save).setOnClickListener(this.mSingleClickListener);
        view.findViewById(R.id.btn_movie_return).setOnClickListener(this.mSingleClickListener);
        loadTemplate();
        loadAudio();
    }

    public static /* synthetic */ void lambda$initView$120(MovieEditorMenuFragment movieEditorMenuFragment, int i, int i2) {
        MovieStatUtils.statEditorMove(movieEditorMenuFragment.mMovieInfo.imageList.size());
        movieEditorMenuFragment.mMovieManager.moveImage(i, i2);
    }

    public static /* synthetic */ void lambda$initView$121(MovieEditorMenuFragment movieEditorMenuFragment, RadioGroup radioGroup, int i) {
        boolean z = true;
        int i2 = 0;
        if (i == R.id.radio_button_template) {
            movieEditorMenuFragment.onTabSelect(0);
        } else if (i == R.id.radio_button_music) {
            movieEditorMenuFragment.onTabSelect(1);
        } else if (i == R.id.radio_button_edit) {
            movieEditorMenuFragment.onTabSelect(2);
        }
        MenuFragmentListener menuFragmentListener = movieEditorMenuFragment.mMenuFragmentListener;
        if (i != R.id.radio_button_edit) {
            z = false;
        }
        menuFragmentListener.setShowDeleteMode(z);
        RadioGroup radioGroup2 = movieEditorMenuFragment.mDurationRadioGroup;
        if (i != R.id.radio_button_template) {
            i2 = 4;
        }
        radioGroup2.setVisibility(i2);
    }

    public static /* synthetic */ void lambda$initView$122(MovieEditorMenuFragment movieEditorMenuFragment, RadioGroup radioGroup, int i) {
        if (i == R.id.radio_button_video_short) {
            if (!movieEditorMenuFragment.mIsShortVideo) {
                MovieStatUtils.statDurationClick(movieEditorMenuFragment.mMovieInfo, false, true);
                movieEditorMenuFragment.mIsShortVideo = true;
                if (movieEditorMenuFragment.mMovieInfo.changeToShortVideo()) {
                    movieEditorMenuFragment.refreshEditAdapter();
                    movieEditorMenuFragment.mMovieManager.resetImage(movieEditorMenuFragment.mMovieInfo.imageList, true);
                } else {
                    movieEditorMenuFragment.mMovieManager.setIsShortVideo(true);
                }
                movieEditorMenuFragment.mMovieManager.replay();
                if (movieEditorMenuFragment.mMovieInfo.isFromStory) {
                    movieEditorMenuFragment.mMenuFragmentListener.updateStorySha1Data();
                }
                movieEditorMenuFragment.refreshRadioButtonState(true);
            }
        } else if (i == R.id.radio_button_video_long && movieEditorMenuFragment.mIsShortVideo) {
            MovieStatUtils.statDurationClick(movieEditorMenuFragment.mMovieInfo, false, false);
            movieEditorMenuFragment.mIsShortVideo = false;
            if (movieEditorMenuFragment.mMovieInfo.backToLongVideo()) {
                movieEditorMenuFragment.refreshEditAdapter();
                movieEditorMenuFragment.mMovieManager.resetImage(movieEditorMenuFragment.mMovieInfo.imageList, false);
            } else {
                movieEditorMenuFragment.mMovieManager.setIsShortVideo(false);
            }
            movieEditorMenuFragment.mMovieManager.replay();
            if (movieEditorMenuFragment.mMovieInfo.isFromStory) {
                movieEditorMenuFragment.mMenuFragmentListener.updateStorySha1Data();
            }
            movieEditorMenuFragment.refreshRadioButtonState(false);
        }
    }

    static /* synthetic */ List lambda$loadAudio$128(OptionalResult optionalResult) throws Exception {
        List list = (List) optionalResult.getIncludeNull();
        ArrayList allLocalAudios = AudioFactory.getAllLocalAudios();
        if (list != null) {
            MovieUtils.checkResourceExist(list);
            allLocalAudios.addAll(1, list);
        }
        return allLocalAudios;
    }

    public static /* synthetic */ void lambda$loadAudio$129(MovieEditorMenuFragment movieEditorMenuFragment, List list) throws Exception {
        movieEditorMenuFragment.mAudioAdapter.setList(list);
        movieEditorMenuFragment.mAudioAdapter.notifyDataSetChanged();
    }

    static /* synthetic */ List lambda$loadTemplate$123(OptionalResult optionalResult) throws Exception {
        List list = (List) optionalResult.getIncludeNull();
        List localTemplateEntities = TemplateFactory.getLocalTemplateEntities();
        if (list != null) {
            MovieUtils.checkResourceExist(list);
            localTemplateEntities.addAll(list);
        }
        return localTemplateEntities;
    }

    public static /* synthetic */ void lambda$loadTemplate$127(MovieEditorMenuFragment movieEditorMenuFragment, List list) throws Exception {
        Observable.fromIterable(list).filter(new Predicate() {
            public final boolean test(Object obj) {
                return MovieEditorMenuFragment.lambda$null$124(MovieEditorMenuFragment.this, (TemplateResource) obj);
            }
        }).filter(new Predicate() {
            public final boolean test(Object obj) {
                return MovieEditorMenuFragment.lambda$null$125(MovieEditorMenuFragment.this, (TemplateResource) obj);
            }
        }).subscribe((Consumer<? super T>) new Consumer(list) {
            private final /* synthetic */ List f$1;

            {
                this.f$1 = r2;
            }

            public final void accept(Object obj) {
                MovieEditorMenuFragment.lambda$null$126(MovieEditorMenuFragment.this, this.f$1, (TemplateResource) obj);
            }
        });
        movieEditorMenuFragment.mTemplateAdapter.setList(list);
        movieEditorMenuFragment.mTemplateAdapter.notifyDataSetChanged();
    }

    public static /* synthetic */ void lambda$notifyResourceAdapter$130(MovieEditorMenuFragment movieEditorMenuFragment, MovieResource movieResource) {
        if (movieResource instanceof TemplateResource) {
            movieEditorMenuFragment.mTemplateAdapter.notifyItemRangeChanged(0, movieEditorMenuFragment.mTemplateAdapter.getItemCount(), new Object());
        } else {
            movieEditorMenuFragment.mAudioAdapter.notifyItemRangeChanged(0, movieEditorMenuFragment.mAudioAdapter.getItemCount(), new Object());
        }
    }

    public static /* synthetic */ boolean lambda$null$124(MovieEditorMenuFragment movieEditorMenuFragment, TemplateResource templateResource) throws Exception {
        return movieEditorMenuFragment.mMovieInfo.template != null && !TextUtils.equals(movieEditorMenuFragment.mMovieInfo.template, MovieStatUtils.FROM_NORMAL);
    }

    public static /* synthetic */ boolean lambda$null$125(MovieEditorMenuFragment movieEditorMenuFragment, TemplateResource templateResource) throws Exception {
        return templateResource.pathKey != null && movieEditorMenuFragment.mMovieInfo.template.contains(templateResource.pathKey);
    }

    public static /* synthetic */ void lambda$null$126(MovieEditorMenuFragment movieEditorMenuFragment, List list, TemplateResource templateResource) throws Exception {
        templateResource.pathKey = movieEditorMenuFragment.mMovieInfo.template;
        movieEditorMenuFragment.mTemplateAdapter.setSelectedItemPositionWithoutNotify(list.indexOf(templateResource));
    }

    private void loadAudio() {
        this.mAudioResourceRequest = new AudioResourceRequest();
        NetApi.create(this.mAudioResourceRequest).observeOn(Schedulers.io()).map($$Lambda$MovieEditorMenuFragment$JlMwHyXObiT00VVMxPR2txIxHsg.INSTANCE).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer() {
            public final void accept(Object obj) {
                MovieEditorMenuFragment.lambda$loadAudio$129(MovieEditorMenuFragment.this, (List) obj);
            }
        });
    }

    private void loadTemplate() {
        this.mTemplateResourceRequest = new TemplateResourceRequest();
        NetApi.create(this.mTemplateResourceRequest).observeOn(Schedulers.io()).map($$Lambda$MovieEditorMenuFragment$23jZtsJVOf0_yBGkkiGpAr6Yo10.INSTANCE).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer() {
            public final void accept(Object obj) {
                MovieEditorMenuFragment.lambda$loadTemplate$127(MovieEditorMenuFragment.this, (List) obj);
            }
        });
    }

    /* access modifiers changed from: private */
    public void notifyResourceAdapter(MovieResource movieResource) {
        AndroidSchedulers.mainThread().createWorker().schedule(new Runnable(movieResource) {
            private final /* synthetic */ MovieResource f$1;

            {
                this.f$1 = r2;
            }

            public final void run() {
                MovieEditorMenuFragment.lambda$notifyResourceAdapter$130(MovieEditorMenuFragment.this, this.f$1);
            }
        });
    }

    private void onTabSelect(int i) {
        this.mCurrentTabPos = i;
        boolean z = false;
        int i2 = 0;
        while (i2 < this.mRecyclerViews.length) {
            if (this.mRecyclerViews[i2] != null) {
                this.mRecyclerViews[i2].setVisibility(i == i2 ? 0 : 4);
            }
            i2++;
        }
        this.mViewPager.setCurrentItem(i);
        ViewPager viewPager = this.mViewPager;
        if (i != 2) {
            z = true;
        }
        viewPager.setClipChildren(z);
    }

    private void refreshEditAdapter() {
        this.mEditAdapter.setList(this.mMovieInfo.imageList);
        this.mEditAdapter.notifyDataSetChanged();
        this.mIsShortVideo = this.mMovieInfo.isShortVideo;
    }

    private void refreshRadioButtonState(boolean z) {
        this.mShortRadioButton.setSelected(z);
        this.mLongRadioButton.setSelected(!z);
    }

    /* access modifiers changed from: private */
    public void resetMovieShareData() {
        if (this.mMenuFragmentListener != null) {
            this.mMenuFragmentListener.resetShareData();
        }
    }

    public void clearEditorAdapterSelected() {
        if (isAdded()) {
            this.mEditAdapter.setSelectedItemPosition(-1);
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        String str;
        super.onActivityResult(i, i2, intent);
        if (i == 7 && i2 == -1) {
            List imageFromClipData = MovieUtils.getImageFromClipData(this.mContext, intent);
            this.mMovieInfo.imageList.addAll(imageFromClipData);
            if (checkChangeLongVideo()) {
                this.mMovieInfo.discardToLongVideo();
                this.mIsShortVideo = false;
                this.mDurationRadioGroup.check(R.id.radio_button_video_long);
                ToastUtils.makeText(this.mContext, (int) R.string.movie_change_to_long_video);
                this.mMovieManager.resetImage(this.mMovieInfo.imageList, false);
                this.mMovieManager.replay();
            } else {
                this.mMovieManager.addImage(imageFromClipData);
            }
            this.mEditAdapter.setList(this.mMovieInfo.imageList);
            this.mEditAdapter.notifyDataSetChanged();
            this.mEditAdapter.setSelectedItemPosition(-1);
            resetMovieShareData();
        } else if (i == 1000 && i2 == -1) {
            ClipData clipData = intent.getClipData();
            if (clipData == null) {
                str = ConvertFilepathUtil.getPath(getActivity(), intent.getData());
            } else {
                str = ConvertFilepathUtil.getPath(getActivity(), clipData.getItemAt(0).getUri());
            }
            if (!TextUtils.isEmpty(str)) {
                if (this.mMovieManager.isSupportVideo(str)) {
                    AudioResource audioResource = new AudioResource(str);
                    this.mMovieInfo.audio = audioResource.nameKey;
                    this.mMovieManager.setAudio(audioResource);
                    this.mAudioAdapter.setSelectedItemPosition(this.mAudioAdapter.getItemCount() - 1);
                } else {
                    ToastUtils.makeText((Context) getActivity(), (int) R.string.video_editor_unsupport_audio_file);
                }
            }
            resetMovieShareData();
        } else if (i == 1 && i2 == -1) {
            List imageFromClipData2 = MovieUtils.getImageFromClipData(this.mContext, intent);
            this.mMovieInfo.imageList.clear();
            this.mMovieInfo.imageList.addAll(imageFromClipData2);
            if (this.mMovieInfo.imageList.size() > 5) {
                if (this.mIsShortVideo) {
                    ToastUtils.makeText(this.mContext, (int) R.string.movie_change_to_long_video);
                }
                this.mMovieInfo.discardToLongVideo();
                this.mDurationRadioGroup.check(R.id.radio_button_video_long);
                this.mMovieManager.resetImage(this.mMovieInfo.imageList, false);
            } else {
                this.mMovieInfo.discardToShortVideo();
                this.mMovieManager.resetImage(this.mMovieInfo.imageList, true);
            }
            refreshEditAdapter();
            this.mEditAdapter.setSelectedItemPosition(-1);
            resetMovieShareData();
            this.mMenuFragmentListener.updateStorySha1Data();
            this.mMovieManager.replay();
        }
    }

    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof MenuFragmentListener) {
            this.mMenuFragmentListener = (MenuFragmentListener) context;
            this.mMovieManager = this.mMenuFragmentListener.getMovieManager();
            this.mMovieInfo = this.mMenuFragmentListener.getMovieInfo();
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (this.mMovieInfo.isFromStory) {
            Bundle arguments = getArguments();
            long j = 0;
            if (arguments != null) {
                j = arguments.getLong("card_id", 0);
            }
            this.mStoryMovieCardId = j;
        }
    }

    public Animator onCreateAnimator(int i, boolean z, int i2) {
        ObjectAnimator objectAnimator = new ObjectAnimator();
        int dimensionPixelSize = getActivity().getResources().getDimensionPixelSize(R.dimen.movie_controller_height);
        if (z) {
            objectAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{(float) dimensionPixelSize, 0.0f})});
            objectAnimator.setInterpolator(new QuarticEaseOutInterpolator());
            objectAnimator.setStartDelay((long) getResources().getInteger(R.integer.movie_editor_appear_delay));
            objectAnimator.setDuration((long) getResources().getInteger(R.integer.movie_editor_appear_duration));
            getView().setAlpha(0.0f);
            objectAnimator.addListener(new AnimatorListenerAdapter() {
                public void onAnimationStart(Animator animator) {
                    MovieEditorMenuFragment.this.getView().setAlpha(1.0f);
                }
            });
        } else {
            objectAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{0.0f, (float) dimensionPixelSize})});
            objectAnimator.setInterpolator(new QuarticEaseOutInterpolator());
            objectAnimator.setDuration((long) getResources().getInteger(R.integer.movie_editor_disappear_duration));
        }
        return objectAnimator;
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        MovieEditMenuView movieEditMenuView = new MovieEditMenuView(viewGroup.getContext());
        initView(movieEditMenuView);
        return movieEditMenuView;
    }

    public void onDeleteClick() {
        if (this.mEditAdapter.getItemCount() - 1 <= 3) {
            ToastUtils.makeText(this.mContext, (int) R.string.movie_delete_disable);
            return;
        }
        int selectedItemPosition = this.mEditAdapter.getSelectedItemPosition();
        if (selectedItemPosition >= 0 && selectedItemPosition < this.mMovieInfo.imageList.size()) {
            this.mMovieInfo.imageList.remove(selectedItemPosition);
            this.mMenuFragmentListener.getMovieManager().removeImageAtIndex(selectedItemPosition);
            this.mEditAdapter.setSelectedItemPosition(-1);
            this.mEditAdapter.notifyDataSetChanged();
            resetMovieShareData();
            this.mDeleteClicked = true;
        }
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mTemplateResourceRequest != null) {
            this.mTemplateResourceRequest.cancel();
        }
        if (this.mAudioResourceRequest != null) {
            this.mAudioResourceRequest.cancel();
        }
        MovieDownloadManager.getInstance().cancelAll();
        this.mMovieManager = null;
    }

    public void onHiddenChanged(boolean z) {
        super.onHiddenChanged(z);
        if (!z) {
            if (this.mIsShortVideo != this.mMovieInfo.isShortVideo) {
                refreshEditAdapter();
                this.mDurationRadioGroup.check(this.mMovieInfo.isShortVideo ? R.id.radio_button_video_short : R.id.radio_button_video_long);
            }
            if (this.mDeleteClicked) {
                refreshEditAdapter();
                this.mDeleteClicked = false;
            }
        }
    }

    public void onResumeClick() {
        this.mEditAdapter.setSelectedItemPosition(-1);
    }
}
