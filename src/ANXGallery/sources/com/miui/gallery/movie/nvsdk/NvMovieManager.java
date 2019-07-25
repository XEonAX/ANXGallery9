package com.miui.gallery.movie.nvsdk;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.text.TextUtils;
import com.meicam.sdk.NvsAudioResolution;
import com.meicam.sdk.NvsLiveWindowExt;
import com.meicam.sdk.NvsMultiThumbnailSequenceView.ThumbnailSequenceDesc;
import com.meicam.sdk.NvsRational;
import com.meicam.sdk.NvsStreamingContext;
import com.meicam.sdk.NvsStreamingContext.CompileCallback;
import com.meicam.sdk.NvsStreamingContext.CompileCallback2;
import com.meicam.sdk.NvsTimeline;
import com.meicam.sdk.NvsVideoResolution;
import com.meicam.themehelper.NvsImageFileDesc;
import com.meicam.themehelper.NvsThemeHelper;
import com.miui.core.SdkHelper;
import com.miui.gallery.movie.core.MovieManager;
import com.miui.gallery.movie.core.MovieManager.EncodeStateInterface;
import com.miui.gallery.movie.core.MovieManager.StateChangeListener;
import com.miui.gallery.movie.entity.AudioResource;
import com.miui.gallery.movie.entity.ImageEntity;
import com.miui.gallery.movie.entity.MovieAspectRatio;
import com.miui.gallery.movie.entity.MovieInfo;
import com.miui.gallery.movie.entity.TemplateResource;
import com.miui.gallery.movie.ui.factory.TemplateFactory;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.util.BaseFileUtils;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MovieLibraryLoaderHelper;
import com.miui.gallery.util.ScreenUtils;
import com.miui.os.Rom;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class NvMovieManager extends MovieManager {
    private static final String[] sCompileRateBlackList = {"grus", "pyxis", "davinci", "davinciin", "vela"};
    private static boolean sIsPaused;
    private Context mContext;
    /* access modifiers changed from: private */
    public EncodeStateInterface mExportListener;
    private NvsLiveWindowExt mLiveWindow;
    private NvStateController mMovieController;
    private int mSeekIndex;
    private NvsStreamingContext mStreamingContext;
    private boolean mThemeEnable;
    private NvsThemeHelper mThemeHelper = new NvsThemeHelper();
    private NvsTimeline mTimeline;
    private int mVideoHeight;

    private void applyThemeAsset(String str) {
        this.mThemeHelper.applyTimelineTheme(str, false, TextUtils.equals(MovieStatUtils.FROM_NORMAL, str));
    }

    private boolean applyThemeFile(String str) {
        boolean z = false;
        if (FileUtils.isFileExist(str)) {
            z = this.mThemeHelper.applyTimelineTheme(str, true, false);
            if (!z) {
                Log.e("NvMovieManager", "failed to apply theme, delete file: %s,", (Object) str);
                BaseFileUtils.deleteFile(new File(str));
            }
        }
        if (!z) {
            applyThemeAsset(MovieStatUtils.FROM_NORMAL);
        }
        return z;
    }

    private void initTimeLine(Context context) {
        if (this.mStreamingContext == null) {
            Log.e("NvMovieManager", "streamingContext is null!");
            return;
        }
        NvsVideoResolution nvsVideoResolution = new NvsVideoResolution();
        nvsVideoResolution.imageWidth = ScreenUtils.getScreenWidth();
        nvsVideoResolution.imageHeight = (int) (((float) nvsVideoResolution.imageWidth) * MovieAspectRatio.getFitRatio((((float) ScreenUtils.getFullScreenHeight((Activity) context)) * 1.0f) / ((float) nvsVideoResolution.imageWidth)).getRatio());
        Log.d("NvMovieManager", "initTimeLine in size: %d:%d", Integer.valueOf(nvsVideoResolution.imageHeight), Integer.valueOf(nvsVideoResolution.imageWidth));
        this.mVideoHeight = nvsVideoResolution.imageHeight;
        nvsVideoResolution.imagePAR = new NvsRational(1, 1);
        NvsRational nvsRational = new NvsRational(25, 1);
        NvsAudioResolution nvsAudioResolution = new NvsAudioResolution();
        nvsAudioResolution.sampleRate = 44100;
        nvsAudioResolution.channelCount = 2;
        this.mTimeline = this.mStreamingContext.createTimeline(nvsVideoResolution, nvsRational, nvsAudioResolution);
        if (this.mTimeline == null) {
            Log.e("NvMovieManager", "mTimeline is null!");
            return;
        }
        this.mMovieController = new NvStateController(this.mStreamingContext, this.mTimeline);
        this.mStreamingContext.connectTimelineWithLiveWindowExt(this.mTimeline, this.mLiveWindow);
        this.mStreamingContext.setStreamingEngineCallback(this.mMovieController);
        this.mStreamingContext.setPlaybackCallback(this.mMovieController);
        this.mStreamingContext.setPlaybackCallback2(this.mMovieController);
        sIsPaused = false;
    }

    private boolean isDisableCompileRate() {
        for (String equals : sCompileRateBlackList) {
            if (equals.equals(Build.DEVICE)) {
                return true;
            }
        }
        return false;
    }

    public static /* synthetic */ void lambda$export$144(NvMovieManager nvMovieManager, NvsTimeline nvsTimeline, boolean z) {
        if (nvMovieManager.mExportListener == null) {
            return;
        }
        if (z) {
            nvMovieManager.mExportListener.onEncodeEnd(false, true, 0);
        } else {
            nvMovieManager.mExportListener.onEncodeEnd(true, false, 0);
        }
    }

    private ArrayList<NvsImageFileDesc> parseClipFromFile(List<ImageEntity> list) {
        ArrayList<NvsImageFileDesc> arrayList = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            NvsImageFileDesc nvsImageFileDesc = new NvsImageFileDesc();
            nvsImageFileDesc.filePath = ((ImageEntity) list.get(i)).image;
            nvsImageFileDesc.hasFace = false;
            nvsImageFileDesc.show = true;
            arrayList.add(nvsImageFileDesc);
        }
        return arrayList;
    }

    public void addImage(List<ImageEntity> list) {
        this.mThemeHelper.insertClip(parseClipFromFile(list));
        replay();
    }

    public void addStateChangeListener(StateChangeListener stateChangeListener) {
        this.mMovieController.addStateChangeListener(stateChangeListener);
    }

    public void cancelExport() {
        this.mMovieController.cancelExport();
    }

    public void destroy() {
        if (sIsPaused) {
            this.mStreamingContext.removeTimeline(this.mTimeline);
            this.mStreamingContext.clearCachedResources(false);
            NvsStreamingContext.close();
        }
        this.mExportListener = null;
        this.mLiveWindow = null;
        super.destroy();
    }

    public void export(String str, EncodeStateInterface encodeStateInterface) {
        if (!this.mThemeEnable) {
            long timelineCurrentPosition = this.mStreamingContext.getTimelineCurrentPosition(this.mTimeline);
            setThemeEnable(true);
            this.mMovieController.seek((int) (timelineCurrentPosition / 1000));
        }
        this.mExportListener = encodeStateInterface;
        this.mExportListener.onEncodeStart();
        this.mStreamingContext.setCompileCallback2(new CompileCallback2() {
            public final void onCompileCompleted(NvsTimeline nvsTimeline, boolean z) {
                NvMovieManager.lambda$export$144(NvMovieManager.this, nvsTimeline, z);
            }
        });
        this.mStreamingContext.setCompileCallback(new CompileCallback() {
            public void onCompileFailed(NvsTimeline nvsTimeline) {
                if (NvMovieManager.this.mExportListener != null) {
                    NvMovieManager.this.mExportListener.onEncodeEnd(false, false, 0);
                }
            }

            public void onCompileFinished(NvsTimeline nvsTimeline) {
            }

            public void onCompileProgress(NvsTimeline nvsTimeline, int i) {
                if (NvMovieManager.this.mExportListener != null) {
                    NvMovieManager.this.mExportListener.onEncodeProgress(i);
                }
            }
        });
        this.mStreamingContext.setCustomCompileVideoHeight(this.mVideoHeight);
        this.mStreamingContext.compileTimeline(this.mTimeline, 0, this.mTimeline.getDuration(), str, 256, 2, isDisableCompileRate() ? 6 : 4);
    }

    public ArrayList<ThumbnailSequenceDesc> getThumbnailImages() {
        return this.mThemeHelper.getThumbnailImages();
    }

    public int getTotalTime() {
        return (int) (this.mTimeline.getDuration() / 1000);
    }

    public void init(Context context) {
        this.mContext = context.getApplicationContext();
        NvsStreamingContext.setNativeLibraryDirPath(MovieLibraryLoaderHelper.getInstance().getLibraryDirPath());
        this.mStreamingContext = NvsStreamingContext.init((Activity) context, "assets:/nv/nvsdk.lic", 18);
        this.mLiveWindow = new NvsLiveWindowExt(this.mContext);
        this.mDisplayView = this.mLiveWindow;
        int i = 1;
        if (SdkHelper.IS_MIUI) {
            if (!Rom.IS_STABLE) {
                i = 3;
            }
            NvsStreamingContext.setDebugLevel(i);
        } else {
            NvsStreamingContext.setDebugLevel(1);
        }
        initTimeLine(context);
    }

    public boolean isSupportVideo(String str) {
        return this.mStreamingContext.getAVFileInfo(str) != null;
    }

    public void moveImage(int i, int i2) {
        this.mThemeHelper.moveClip(i, i2);
        replay();
    }

    public void onPause() {
        this.mMovieController.onPause();
        sIsPaused = true;
        super.onPause();
    }

    public void onResume() {
        if (sIsPaused) {
            this.mLiveWindow.repaintVideoFrame();
        }
        this.mMovieController.onResume();
        super.onResume();
    }

    public void pause() {
        this.mMovieController.pause();
    }

    public void pauseOrResume() {
        if (!this.mMovieController.isResume()) {
            this.mMovieController.pause();
        } else if (!this.mThemeEnable) {
            setThemeEnable(true);
            this.mMovieController.play(this.mThemeHelper.getTimelinePosition(this.mSeekIndex));
        } else {
            this.mMovieController.resume();
        }
    }

    public void play() {
        if (!this.mThemeEnable) {
            setThemeEnable(true);
            this.mMovieController.play(this.mThemeHelper.getTimelinePosition(this.mSeekIndex));
            return;
        }
        this.mMovieController.play();
    }

    public void removeImageAtIndex(int i) {
        this.mThemeHelper.deleteClip(i);
        replay();
    }

    public void removeStateChangeListener(StateChangeListener stateChangeListener) {
        this.mMovieController.removeStateChangeListener(stateChangeListener);
    }

    public void replay() {
        if (!this.mThemeEnable) {
            setThemeEnable(true);
        }
        this.mMovieController.replay();
    }

    public void resetImage(List<ImageEntity> list, boolean z) {
        this.mThemeHelper.changeTimelineDuration(z);
        this.mThemeHelper.resetClip(parseClipFromFile(list));
    }

    public void resume() {
        if (!this.mThemeEnable) {
            setThemeEnable(true);
            this.mMovieController.play(this.mThemeHelper.getTimelinePosition(this.mSeekIndex));
            return;
        }
        this.mMovieController.resume();
    }

    public void seek(int i) {
        if (!this.mThemeEnable) {
            setThemeEnable(true);
        }
        this.mMovieController.seek(i);
    }

    public int seekToIndex(int i) {
        this.mSeekIndex = i;
        setThemeEnable(false);
        int timelinePosition = (int) (this.mThemeHelper.getTimelinePosition(i) / 1000);
        this.mMovieController.seek(timelinePosition);
        return timelinePosition;
    }

    public void setAudio(AudioResource audioResource) {
        if (audioResource == null || audioResource.getResType() == 1) {
            this.mThemeHelper.changeMusic(null, -1);
        } else if (audioResource.getResType() == 2) {
            this.mThemeHelper.changeMusic(audioResource.getDownloadSrcPath(), 1);
        } else {
            this.mThemeHelper.changeMusic(audioResource.getDownloadSrcPath(), 2);
        }
        replay();
    }

    public void setInfo(MovieInfo movieInfo) {
        this.mThemeHelper.initHelper(this.mContext, this.mTimeline, parseClipFromFile(movieInfo.imageList));
        this.mThemeHelper.setDefaultRhythmPath("assets:/nv/defaultRhythm.json", "assets:/nv/defaultRhythm10s.json");
        this.mThemeHelper.changeCaptionText(movieInfo.title, 0);
        this.mThemeHelper.changeCaptionText(movieInfo.subTitle, 1);
        if (TextUtils.isEmpty(movieInfo.template)) {
            movieInfo.template = MovieStatUtils.FROM_NORMAL;
            applyThemeAsset(MovieStatUtils.FROM_NORMAL);
        } else if (movieInfo.template.contains("Assets")) {
            applyThemeAsset(movieInfo.template);
        } else if (!applyThemeFile(TemplateFactory.getTemplateDir(movieInfo.template))) {
            movieInfo.template = MovieStatUtils.FROM_NORMAL;
        }
        if (!movieInfo.isShortVideo) {
            this.mThemeHelper.changeTimelineDuration(false);
        }
        replay();
    }

    public void setIsShortVideo(boolean z) {
        this.mThemeHelper.changeTimelineDuration(z);
    }

    public void setTemplate(TemplateResource templateResource) {
        String srcPath = templateResource.getSrcPath();
        if (TextUtils.equals(MovieStatUtils.FROM_NORMAL, srcPath)) {
            applyThemeAsset(srcPath);
        } else {
            applyThemeFile(srcPath);
        }
        replay();
    }

    public void setThemeEnable(boolean z) {
        this.mThemeEnable = z;
        this.mThemeHelper.setThemeEnabled(z);
    }
}
