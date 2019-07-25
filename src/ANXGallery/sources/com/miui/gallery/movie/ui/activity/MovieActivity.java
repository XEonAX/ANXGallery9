package com.miui.gallery.movie.ui.activity;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentTransaction;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.transition.ChangeBounds;
import android.transition.TransitionManager;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.android.internal.WindowCompat;
import com.miui.gallery.R;
import com.miui.gallery.activity.BaseActivity;
import com.miui.gallery.listener.SingleClickListener;
import com.miui.gallery.movie.MovieConfig;
import com.miui.gallery.movie.core.MovieManager;
import com.miui.gallery.movie.entity.ImageEntity;
import com.miui.gallery.movie.entity.MovieInfo;
import com.miui.gallery.movie.entity.MovieShareData;
import com.miui.gallery.movie.ui.factory.MovieFactory;
import com.miui.gallery.movie.ui.fragment.MovieEditorMenuFragment;
import com.miui.gallery.movie.ui.fragment.MoviePreviewMenuFragment;
import com.miui.gallery.movie.ui.fragment.MovieSavingFragment;
import com.miui.gallery.movie.ui.fragment.MovieSavingFragment.OnSavingFinishListener;
import com.miui.gallery.movie.ui.listener.MenuActivityListener;
import com.miui.gallery.movie.ui.listener.MenuFragmentListener;
import com.miui.gallery.movie.ui.view.MovieControllerView;
import com.miui.gallery.movie.ui.view.MovieControllerView.DeleteIconVisibleListener;
import com.miui.gallery.movie.ui.view.MovieControllerView.ProgressChangeListener;
import com.miui.gallery.movie.utils.AudioFocusHelper;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.movie.utils.MovieUtils;
import com.miui.gallery.provider.GalleryOpenProvider;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.ScreenUtils;
import com.miui.gallery.util.SystemUiUtil;
import com.miui.gallery.util.ToastUtils;
import com.nostra13.universalimageloader.core.ImageLoader;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import miui.view.animation.CubicEaseInInterpolator;
import miui.view.animation.CubicEaseInOutInterpolator;
import miui.view.animation.CubicEaseOutInterpolator;
import miui.view.animation.QuarticEaseInOutInterpolator;
import miui.view.animation.QuarticEaseOutInterpolator;

public class MovieActivity extends BaseActivity implements OnClickListener, MenuFragmentListener {
    /* access modifiers changed from: private */
    public Activity mActivity;
    private AudioFocusHelper mAudioFocusHelper;
    private MovieEditorMenuFragment mEditorMenuFragment;
    private View mEditorMenuView;
    private LayoutParams mEditorMovieLps;
    private boolean mIsEditorPreview;
    private MenuActivityListener mMenuActivityListener;
    /* access modifiers changed from: private */
    public MovieInfo mMovieInfo;
    /* access modifiers changed from: private */
    public MovieManager mMovieManager;
    /* access modifiers changed from: private */
    public MovieSavingFragment mMovieSavingFragment;
    /* access modifiers changed from: private */
    public MovieShareData mMovieShareData;
    private MovieControllerView mMovieView;
    /* access modifiers changed from: private */
    public MoviePreviewMenuFragment mPreviewMenuFragment;
    private View mPreviewMenuView;
    private LayoutParams mPreviewMovieLps;
    private ViewGroup mRootView;
    /* access modifiers changed from: private */
    public int mShowMode = -1;
    private SingleClickListener mSingleClickListener = new SingleClickListener() {
        /* access modifiers changed from: protected */
        public void onSingleClick(View view) {
            switch (view.getId()) {
                case R.id.movie_share /*2131296742*/:
                    MovieActivity.this.mMovieManager.pause();
                    if (MovieActivity.this.mMovieShareData == null) {
                        MovieActivity.this.mMovieShareData = new MovieShareData();
                        MovieActivity.this.mMovieShareData.setShortVideo(MovieActivity.this.mMovieInfo.isShortVideo);
                    }
                    String videoPath = MovieActivity.this.mMovieShareData.getVideoPath();
                    if (TextUtils.isEmpty(videoPath)) {
                        if (MovieActivity.this.mMovieSavingFragment == null) {
                            MovieActivity.this.mMovieSavingFragment = new MovieSavingFragment();
                        }
                        MovieActivity.this.mMovieSavingFragment.showAndShare(MovieActivity.this.mActivity, MovieActivity.this.mMovieManager, MovieActivity.this.mMovieInfo);
                        return;
                    }
                    MovieActivity.this.handleShareEvent(videoPath);
                    return;
                case R.id.movie_title /*2131296743*/:
                    MovieActivity.this.finish();
                    return;
                default:
                    return;
            }
        }
    };
    private long mStoryMovieCardId;
    private ArrayList<String> mStorySha1List;

    private void configureActionBar() {
        this.mActionBar.setDisplayShowCustomEnabled(true);
        this.mActionBar.setDisplayShowHomeEnabled(false);
        this.mActionBar.setDisplayShowTitleEnabled(false);
        this.mActionBar.setHomeButtonEnabled(true);
        this.mActionBar.setCustomView(R.layout.movie_fragment_top);
        View customView = this.mActionBar.getCustomView();
        TextView textView = (TextView) customView.findViewById(R.id.movie_title);
        ImageView imageView = (ImageView) customView.findViewById(R.id.movie_share);
        textView.setOnClickListener(this);
        imageView.setOnClickListener(this.mSingleClickListener);
        this.mActionBar.hide();
    }

    private void doEditorPreviewChangeAnimal(final View view, boolean z) {
        AnimatorSet animatorSet = new AnimatorSet();
        int height = view.getHeight();
        if (z) {
            animatorSet.playTogether(new Animator[]{ObjectAnimator.ofFloat(view, View.TRANSLATION_Y, new float[]{(float) height, 0.0f})});
            animatorSet.addListener(new AnimatorListenerAdapter() {
                public void onAnimationStart(Animator animator) {
                    view.setVisibility(0);
                }
            });
        } else {
            animatorSet.playTogether(new Animator[]{ObjectAnimator.ofFloat(view, View.TRANSLATION_Y, new float[]{0.0f, (float) height})});
            animatorSet.addListener(new AnimatorListenerAdapter() {
                public void onAnimationEnd(Animator animator) {
                    view.setVisibility(4);
                    MovieActivity.this.mMovieManager.play();
                }
            });
            animatorSet.setupStartValues();
        }
        animatorSet.setInterpolator(new CubicEaseInOutInterpolator());
        animatorSet.setDuration((long) getResources().getInteger(R.integer.movie_editor_preview_duration));
        animatorSet.start();
    }

    private void doFullScreenChangeAnimal(final View view, boolean z) {
        AnimatorSet animatorSet = new AnimatorSet();
        int height = view.getHeight();
        if (z) {
            animatorSet.playTogether(new Animator[]{ObjectAnimator.ofFloat(view, View.TRANSLATION_Y, new float[]{(float) height, 0.0f})});
            animatorSet.setInterpolator(new CubicEaseOutInterpolator());
            animatorSet.setDuration((long) getResources().getInteger(R.integer.movie_background_appear_duration));
            animatorSet.addListener(new AnimatorListenerAdapter() {
                public void onAnimationStart(Animator animator) {
                    view.setVisibility(0);
                }
            });
        } else {
            animatorSet.playTogether(new Animator[]{ObjectAnimator.ofFloat(view, View.TRANSLATION_Y, new float[]{0.0f, (float) height})});
            animatorSet.setInterpolator(new CubicEaseInInterpolator());
            animatorSet.setDuration((long) getResources().getInteger(R.integer.movie_background_disappear_duration));
            animatorSet.addListener(new AnimatorListenerAdapter() {
                public void onAnimationEnd(Animator animator) {
                    view.setVisibility(8);
                }
            });
            animatorSet.setupStartValues();
        }
        animatorSet.start();
    }

    private void doShare(String str) {
        if (TextUtils.isEmpty(str)) {
            Log.e("MovieActivity", "share outFilePath is null");
            return;
        }
        Uri translateToContent = GalleryOpenProvider.translateToContent(str);
        Intent intent = new Intent();
        intent.setAction("android.intent.action.SEND");
        intent.setType("video/*");
        intent.putExtra("android.intent.extra.STREAM", translateToContent);
        intent.addFlags(268435456);
        intent.addFlags(1);
        intent.addFlags(134742016);
        List<ResolveInfo> queryIntentActivities = this.mActivity.getPackageManager().queryIntentActivities(intent, 65536);
        if (!MiscUtil.isValid(queryIntentActivities)) {
            Log.e("MovieActivity", "doShare: resInfoList is invalid.");
            return;
        }
        for (ResolveInfo resolveInfo : queryIntentActivities) {
            this.mActivity.grantUriPermission(resolveInfo.activityInfo.packageName, translateToContent, 1);
        }
        this.mActivity.startActivityForResult(Intent.createChooser(intent, this.mActivity.getString(R.string.movie_preview_share_title)), 1);
    }

    private void initMode() {
        if (this.mShowMode == -1) {
            this.mShowMode = this.mMovieInfo.isFromStory ? 1 : 3;
        }
        if (this.mShowMode == 3) {
            this.mEditorMenuFragment = (MovieEditorMenuFragment) getFragmentManager().findFragmentById(R.id.editor_panel);
            if (this.mEditorMenuFragment == null) {
                this.mEditorMenuFragment = new MovieEditorMenuFragment();
                getFragmentManager().beginTransaction().add(R.id.editor_panel, this.mEditorMenuFragment).commit();
            }
        } else {
            this.mPreviewMenuFragment = (MoviePreviewMenuFragment) getFragmentManager().findFragmentById(R.id.preview_panel);
            if (this.mPreviewMenuFragment == null) {
                this.mPreviewMenuFragment = new MoviePreviewMenuFragment();
                getFragmentManager().beginTransaction().add(R.id.preview_panel, this.mPreviewMenuFragment).commit();
            }
            if (this.mShowMode == 1) {
                this.mPreviewMenuView.setVisibility(4);
            }
        }
        setForMode();
    }

    /* JADX WARNING: type inference failed for: r7v0, types: [com.miui.gallery.movie.ui.activity.MovieActivity, android.app.Activity] */
    private void initMovieViewLayout() {
        int fullScreenHeight = ScreenUtils.getFullScreenHeight(this);
        int topNotchHeight = WindowCompat.getTopNotchHeight(this);
        float f = (float) fullScreenHeight;
        float screenWidth = (((float) ScreenUtils.getScreenWidth()) * 1.0f) / f;
        MovieConfig.setMovieRatio(screenWidth);
        int dimension = (int) ((((f - getResources().getDimension(R.dimen.movie_controller_height)) - getResources().getDimension(R.dimen.movie_editor_view_margin_top)) - getResources().getDimension(R.dimen.movie_editor_view_margin_bottom)) - ((float) topNotchHeight));
        this.mEditorMovieLps = new LayoutParams(this.mMovieView.getLayoutParams());
        this.mEditorMovieLps.width = (int) (((float) dimension) * screenWidth);
        this.mEditorMovieLps.height = dimension;
        this.mEditorMovieLps.topMargin = ((int) getResources().getDimension(R.dimen.movie_editor_view_margin_top)) + topNotchHeight;
        this.mEditorMovieLps.addRule(14);
        this.mPreviewMovieLps = new LayoutParams(this.mMovieView.getLayoutParams());
        this.mPreviewMovieLps.width = ScreenUtils.getScreenWidth();
        this.mPreviewMovieLps.height = fullScreenHeight;
        this.mPreviewMovieLps.topMargin = 0;
        this.mPreviewMovieLps.addRule(14);
        if (this.mShowMode == 3) {
            LayoutParams layoutParams = (LayoutParams) this.mMovieView.getLayoutParams();
            layoutParams.width = this.mEditorMovieLps.width;
            layoutParams.height = this.mEditorMovieLps.height;
            layoutParams.topMargin = this.mEditorMovieLps.topMargin;
            this.mMovieView.setLayoutParams(layoutParams);
            return;
        }
        LayoutParams layoutParams2 = (LayoutParams) this.mMovieView.getLayoutParams();
        layoutParams2.width = this.mPreviewMovieLps.width;
        layoutParams2.height = this.mPreviewMovieLps.height;
        layoutParams2.topMargin = this.mPreviewMovieLps.topMargin;
        this.mMovieView.setLayoutParams(layoutParams2);
    }

    private void initStoryAlbumData() {
        Intent intent = getIntent();
        if (this.mMovieInfo.isFromStory && intent != null) {
            this.mStoryMovieCardId = intent.getLongExtra("card_id", 0);
            if (this.mStorySha1List == null) {
                this.mStorySha1List = new ArrayList<>();
            }
            ClipData clipData = intent.getClipData();
            for (int i = 0; i < clipData.getItemCount(); i++) {
                String charSequence = clipData.getItemAt(i).getText().toString();
                if (!this.mStorySha1List.contains(charSequence)) {
                    this.mStorySha1List.add(charSequence);
                }
            }
        }
    }

    private void initView() {
        this.mMovieView = (MovieControllerView) findViewById(R.id.movie_controller_view);
        this.mMovieView.init(this.mMovieManager);
        this.mMovieView.setMovieInfo(this.mMovieInfo);
        this.mMovieView.setOnClickListener(new OnClickListener() {
            public final void onClick(View view) {
                MovieActivity.lambda$initView$138(MovieActivity.this, view);
            }
        });
        this.mMovieManager = this.mMovieView.getMovieManager();
        this.mPreviewMenuView = findViewById(R.id.preview_panel);
        this.mEditorMenuView = findViewById(R.id.editor_panel);
        this.mRootView = (ViewGroup) findViewById(R.id.movie_root);
        this.mMovieView.setIvPlayListener(new OnClickListener() {
            public final void onClick(View view) {
                MovieActivity.lambda$initView$139(MovieActivity.this, view);
            }
        });
        this.mMovieView.setProgressChangeListener(new ProgressChangeListener() {
            public void onChanged(float f, int i) {
                if (MovieActivity.this.mPreviewMenuFragment != null) {
                    MovieActivity.this.mPreviewMenuFragment.onProgressChange(f, i);
                }
            }

            public void onPlaybackEOF() {
                if (MovieActivity.this.mPreviewMenuFragment != null) {
                    MovieActivity.this.mPreviewMenuFragment.onPlaybackEOF();
                }
                if (MovieActivity.this.mShowMode == 1) {
                    MovieActivity.this.mShowMode = 2;
                    MovieActivity.this.changeFullScreen(false);
                }
            }

            public void onStateChanged(int i) {
                if (MovieActivity.this.mPreviewMenuFragment != null) {
                    MovieActivity.this.mPreviewMenuFragment.onStateChanged(i);
                }
            }
        });
        this.mMovieView.setDeleteVisibleListener(new DeleteIconVisibleListener() {
            public final void onChanged(boolean z) {
                MovieActivity.lambda$initView$140(MovieActivity.this, z);
            }
        });
        this.mMovieView.setPreviewBtnClickListener(new SingleClickListener() {
            /* access modifiers changed from: protected */
            public void onSingleClick(View view) {
                MovieActivity.this.changeEditorPreview();
            }
        });
    }

    public static /* synthetic */ void lambda$export$143(MovieActivity movieActivity, boolean z, boolean z2, String str) {
        if (movieActivity.isDestroyed()) {
            Log.w("MovieActivity", "movie activity is finish on saving finish");
            return;
        }
        if (!movieActivity.mMovieInfo.isFromStory) {
            movieActivity.setResult(-1);
            movieActivity.finish();
            MovieUtils.goDetail(movieActivity.mActivity, Uri.fromFile(new File(str)));
        } else {
            movieActivity.finish();
        }
    }

    public static /* synthetic */ void lambda$initView$138(MovieActivity movieActivity, View view) {
        if (movieActivity.mShowMode == 2) {
            movieActivity.mShowMode = 1;
            movieActivity.changeFullScreen(true);
        } else if (movieActivity.mShowMode == 1) {
            movieActivity.mShowMode = 2;
            movieActivity.changeFullScreen(false);
        } else if (movieActivity.mIsEditorPreview) {
            movieActivity.changeEditorPreview();
        } else {
            movieActivity.mMovieManager.pauseOrResume();
        }
    }

    public static /* synthetic */ void lambda$initView$139(MovieActivity movieActivity, View view) {
        movieActivity.mMovieManager.resume();
        movieActivity.mMovieView.showDeleteIcon(false);
        if (movieActivity.mMenuActivityListener != null) {
            movieActivity.mMenuActivityListener.onResumeClick();
        }
    }

    public static /* synthetic */ void lambda$initView$140(MovieActivity movieActivity, boolean z) {
        if (movieActivity.mMenuActivityListener != null) {
            movieActivity.mMenuActivityListener.clearEditorAdapterSelected();
        }
    }

    public static /* synthetic */ void lambda$setForMode$141(MovieActivity movieActivity, View view) {
        if (movieActivity.mMenuActivityListener != null) {
            movieActivity.mMenuActivityListener.onDeleteClick();
        }
    }

    /* JADX WARNING: type inference failed for: r5v0, types: [android.content.Context, com.miui.gallery.movie.ui.activity.MovieActivity] */
    private boolean parseIntent() {
        List imageFromClipData = MovieUtils.getImageFromClipData(this, getIntent());
        if (imageFromClipData == null || imageFromClipData.size() < 3) {
            ToastUtils.makeText((Context) this.mActivity, (int) R.string.movie_delete_disable);
            finish();
            return false;
        }
        if (this.mMovieInfo == null) {
            this.mMovieInfo = new MovieInfo(imageFromClipData);
            this.mMovieInfo.isFromStory = getIntent().getBooleanExtra("movie_extra_preview_mode", false);
            this.mMovieInfo.title = getIntent().getStringExtra("card_title");
            this.mMovieInfo.subTitle = getIntent().getStringExtra("card_sub_title");
            int intExtra = getIntent().getIntExtra("movie_extra_template", 0);
            this.mMovieInfo.template = MovieFactory.getTemplateNameById(intExtra);
            MovieStatUtils.statEnter(imageFromClipData.size(), this.mMovieInfo.isFromStory);
        }
        return true;
    }

    private void setForMode() {
        if (this.mShowMode == 3) {
            this.mMovieView.setPlayProgressVisible(true);
            this.mMovieView.setShowPlayBtnMode(true);
            this.mMovieView.setTouchAvailable(true);
            this.mMovieView.setDeleteClickListener(new OnClickListener() {
                public final void onClick(View view) {
                    MovieActivity.lambda$setForMode$141(MovieActivity.this, view);
                }
            });
            this.mMovieView.showPreviewBtn(true);
            return;
        }
        this.mMovieView.setTouchAvailable(false);
        this.mMovieView.setPlayProgressVisible(false);
        this.mMovieView.setShowPlayBtnMode(false);
        this.mMovieView.showPreviewBtn(false);
    }

    /* access modifiers changed from: private */
    public void setSystemBarVisible(boolean z) {
        if (z) {
            SystemUiUtil.showSystemBars(getWindow().getDecorView());
            this.mActionBar.show();
            return;
        }
        SystemUiUtil.hideSystemBars(getWindow().getDecorView());
        this.mActionBar.hide();
    }

    public static void startPicker(Context context) {
        Intent intent = new Intent("android.intent.action.GET_CONTENT");
        intent.setType("image/*");
        intent.putExtra("pick-upper-bound", 20);
        intent.putExtra("pick-lower-bound", 3);
        intent.putExtra("pick_intent", new Intent(context, MovieActivity.class));
        intent.putExtra("pick_close_type", 3);
        intent.setPackage("com.miui.gallery");
        context.startActivity(intent);
    }

    public void cancelExport() {
        this.mMovieManager.cancelExport();
    }

    public void changeEditor() {
        if (this.mShowMode == 3) {
            this.mShowMode = 2;
            FragmentTransaction beginTransaction = getFragmentManager().beginTransaction();
            beginTransaction.hide(this.mEditorMenuFragment);
            this.mPreviewMenuFragment = (MoviePreviewMenuFragment) getFragmentManager().findFragmentById(R.id.preview_panel);
            if (this.mPreviewMenuFragment == null) {
                this.mPreviewMenuFragment = new MoviePreviewMenuFragment();
                beginTransaction.add(R.id.preview_panel, this.mPreviewMenuFragment);
            } else {
                beginTransaction.show(this.mPreviewMenuFragment);
            }
            beginTransaction.commit();
            this.mMovieView.postDelayed(new Runnable() {
                public final void run() {
                    MovieActivity.this.setSystemBarVisible(true);
                }
            }, (long) getResources().getInteger(R.integer.movie_preview_appear_delay));
        } else {
            this.mShowMode = 3;
            FragmentTransaction beginTransaction2 = getFragmentManager().beginTransaction();
            beginTransaction2.hide(this.mPreviewMenuFragment);
            this.mEditorMenuFragment = (MovieEditorMenuFragment) getFragmentManager().findFragmentById(R.id.editor_panel);
            if (this.mEditorMenuFragment == null) {
                this.mEditorMenuFragment = new MovieEditorMenuFragment();
                beginTransaction2.add(R.id.editor_panel, this.mEditorMenuFragment);
                Bundle bundle = new Bundle();
                bundle.putLong("card_id", this.mStoryMovieCardId);
                this.mEditorMenuFragment.setArguments(bundle);
            } else {
                beginTransaction2.show(this.mEditorMenuFragment);
            }
            beginTransaction2.commit();
            setSystemBarVisible(false);
        }
        setForMode();
        ChangeBounds changeBounds = new ChangeBounds();
        changeBounds.setInterpolator(new QuarticEaseOutInterpolator());
        changeBounds.setStartDelay((long) getResources().getInteger(R.integer.movie_editor_appear_delay));
        changeBounds.setDuration((long) getResources().getInteger(R.integer.movie_editor_appear_duration));
        TransitionManager.beginDelayedTransition(this.mRootView, changeBounds);
        if (this.mShowMode == 3) {
            this.mMovieView.setLayoutParams(this.mEditorMovieLps);
        } else {
            this.mMovieView.setLayoutParams(this.mPreviewMovieLps);
        }
    }

    public void changeEditorPreview() {
        this.mIsEditorPreview = !this.mIsEditorPreview;
        ChangeBounds changeBounds = new ChangeBounds();
        changeBounds.setInterpolator(new QuarticEaseInOutInterpolator());
        changeBounds.setDuration((long) getResources().getInteger(R.integer.movie_editor_preview_duration));
        TransitionManager.beginDelayedTransition(this.mRootView, changeBounds);
        if (this.mIsEditorPreview) {
            doEditorPreviewChangeAnimal(this.mEditorMenuView, false);
            this.mMovieView.showExtraContent(false);
            this.mMovieView.setLoopPlay(true);
            this.mMovieView.setSeekDisable(true);
            this.mMovieView.setLayoutParams(this.mPreviewMovieLps);
            this.mMovieView.setTouchAvailable(false);
            this.mMovieManager.replay();
            return;
        }
        doEditorPreviewChangeAnimal(this.mEditorMenuView, true);
        this.mMovieView.showExtraContent(true);
        this.mMovieView.setLoopPlay(false);
        this.mMovieView.setSeekDisable(false);
        this.mMovieView.setLayoutParams(this.mEditorMovieLps);
        this.mMovieView.setTouchAvailable(true);
        this.mMovieManager.pause();
    }

    public void changeFullScreen(boolean z) {
        this.mShowMode = z ? 1 : 2;
        setSystemBarVisible(!z);
        if (z) {
            doFullScreenChangeAnimal(this.mPreviewMenuView, false);
        } else {
            doFullScreenChangeAnimal(this.mPreviewMenuView, true);
        }
    }

    public void export(boolean z) {
        if (this.mMovieSavingFragment == null) {
            this.mMovieSavingFragment = new MovieSavingFragment();
        }
        this.mMovieSavingFragment.show(this.mActivity, this.mMovieManager, this.mMovieInfo, z, new OnSavingFinishListener() {
            public final void onFinish(boolean z, boolean z2, String str) {
                MovieActivity.lambda$export$143(MovieActivity.this, z, z2, str);
            }
        });
    }

    public MovieInfo getMovieInfo() {
        return this.mMovieInfo;
    }

    public MovieManager getMovieManager() {
        return this.mMovieManager;
    }

    public ArrayList<String> getStoryMovieSha1() {
        return this.mStorySha1List;
    }

    public void handleShareEvent(String str) {
        if (this.mMovieShareData != null) {
            this.mMovieShareData.setVideoPath(str, this.mMovieInfo.isShortVideo);
        }
        doShare(str);
    }

    public void onAttachFragment(Fragment fragment) {
        super.onAttachFragment(fragment);
        if (fragment instanceof MenuActivityListener) {
            this.mMenuActivityListener = (MenuActivityListener) fragment;
        }
    }

    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        initMovieViewLayout();
        setSystemBarVisible(this.mShowMode == 2);
    }

    public void onBackPressed() {
        returnClick();
    }

    public void onClick(View view) {
        if (view.getId() == R.id.movie_title) {
            finish();
        }
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context, com.miui.gallery.movie.ui.activity.MovieActivity, android.app.Activity] */
    public void onCreate(Bundle bundle) {
        setTheme(2131820701);
        if (bundle != null) {
            this.mMovieInfo = (MovieInfo) bundle.getParcelable("bundle_movie_info");
            this.mShowMode = bundle.getInt("bundle_show_mode");
        }
        if (parseIntent()) {
            this.mMovieManager = MovieFactory.createMovieManager(this);
            super.onCreate(bundle);
            this.mActivity = this;
            SystemUiUtil.setLayoutFullScreen(getWindow().getDecorView(), true);
            WindowCompat.setCutoutModeShortEdges(getWindow());
            configureActionBar();
            initStoryAlbumData();
            setContentView(R.layout.movie_activity);
            initView();
            initMode();
            this.mAudioFocusHelper = new AudioFocusHelper(this);
        }
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
        this.mMovieShareData = null;
        if (this.mMovieManager != null) {
            this.mMovieManager.destroy();
            this.mMovieManager = null;
        }
    }

    public void onMultiWindowModeChanged(boolean z, Configuration configuration) {
        super.onMultiWindowModeChanged(z, configuration);
        if (!z) {
            initMovieViewLayout();
            setSystemBarVisible(this.mShowMode == 2);
        }
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        ImageLoader.getInstance().pause();
        if (this.mAudioFocusHelper != null) {
            this.mAudioFocusHelper.abandonAudioFocus();
        }
        if (this.mMovieView != null) {
            this.mMovieView.onPause();
        }
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        if (this.mMovieView != null) {
            this.mMovieView.onResume();
        }
        super.onResume();
        ImageLoader.getInstance().resume();
        if (this.mAudioFocusHelper != null) {
            this.mAudioFocusHelper.requestAudioFocus();
        }
    }

    /* access modifiers changed from: protected */
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putParcelable("bundle_movie_info", this.mMovieInfo);
        bundle.putInt("bundle_show_mode", this.mShowMode);
    }

    public void onWindowFocusChanged(boolean z) {
        super.onWindowFocusChanged(z);
        if (z) {
            setSystemBarVisible(this.mShowMode == 2);
        }
    }

    public void resetShareData() {
        if (this.mMovieShareData != null) {
            this.mMovieShareData.reset(this.mMovieInfo.isShortVideo);
        }
    }

    public void returnClick() {
        if (this.mIsEditorPreview) {
            changeEditorPreview();
        } else if (this.mShowMode != 3 || !this.mMovieInfo.isFromStory) {
            finish();
        } else {
            setShowDeleteMode(false);
            changeEditor();
            if (this.mMenuActivityListener != null) {
                this.mMenuActivityListener.clearEditorAdapterSelected();
            }
        }
    }

    public void seek(int i) {
        this.mMovieManager.seek(i);
        this.mMovieView.setCurrentPlayTime(i, ((float) i) / ((float) this.mMovieManager.getTotalTime()));
    }

    public void seekToIndex(int i) {
        int seekToIndex = this.mMovieManager.seekToIndex(i);
        float totalTime = ((float) seekToIndex) / ((float) this.mMovieManager.getTotalTime());
        this.mMovieView.setCurrentPlayTime(seekToIndex, totalTime);
        if (this.mPreviewMenuFragment != null) {
            this.mPreviewMenuFragment.onProgressChange(totalTime, seekToIndex);
        }
    }

    public void setDeleteVisible(boolean z) {
        this.mMovieView.setShowDeleteMode(true);
        this.mMovieView.setDeleteVisible(z);
    }

    public void setShowDeleteMode(boolean z) {
        this.mMovieView.setShowDeleteMode(z);
    }

    public void showLoadingView() {
        this.mMovieView.showLoadingView(true);
    }

    public void updateShareData(boolean z) {
        if (this.mMovieShareData != null) {
            this.mMovieShareData.setShortVideo(z);
        }
    }

    public void updateStorySha1Data() {
        if (this.mStorySha1List == null) {
            Log.e("MovieActivity", "mStorySha1List is null. ");
            return;
        }
        this.mStorySha1List.clear();
        for (int i = 0; i < this.mMovieInfo.imageList.size(); i++) {
            this.mStorySha1List.add(((ImageEntity) this.mMovieInfo.imageList.get(i)).sha1);
        }
    }
}
