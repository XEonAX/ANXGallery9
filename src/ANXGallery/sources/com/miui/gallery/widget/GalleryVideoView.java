package com.miui.gallery.widget;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.SurfaceTexture;
import android.media.AudioAttributes;
import android.media.AudioAttributes.Builder;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnBufferingUpdateListener;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnInfoListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.media.MediaPlayer.OnVideoSizeChangedListener;
import android.net.Uri;
import android.os.Build.VERSION;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.Surface;
import android.view.TextureView;
import android.view.TextureView.SurfaceTextureListener;
import android.view.View.MeasureSpec;
import com.miui.gallery.util.Log;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Map;

public class GalleryVideoView extends TextureView {
    private AudioAttributes mAudioAttributes;
    /* access modifiers changed from: private */
    public int mAudioFocusType;
    /* access modifiers changed from: private */
    public AudioManager mAudioManager;
    private int mAudioSession;
    private OnBufferingUpdateListener mBufferingUpdateListener;
    private OnCompletionListener mCompletionListener;
    private Context mContext;
    /* access modifiers changed from: private */
    public int mCurrentBufferPercentage;
    /* access modifiers changed from: private */
    public int mCurrentState;
    private int mDefaultHeight;
    private int mDefaultWidth;
    private OnErrorListener mErrorListener;
    private long mFileLength;
    private long mFileOffset;
    private String mFilePath;
    private Map<String, String> mHeaders;
    private OnInfoListener mInfoListener;
    /* access modifiers changed from: private */
    public MediaPlayer mMediaPlayer;
    /* access modifiers changed from: private */
    public OnCompletionListener mOnCompletionListener;
    /* access modifiers changed from: private */
    public OnErrorListener mOnErrorListener;
    /* access modifiers changed from: private */
    public OnInfoListener mOnInfoListener;
    /* access modifiers changed from: private */
    public OnPreparedListener mOnPreparedListener;
    OnPreparedListener mPreparedListener;
    /* access modifiers changed from: private */
    public int mSeekWhenPrepared;
    OnVideoSizeChangedListener mSizeChangedListener;
    /* access modifiers changed from: private */
    public SurfaceTexture mSurfaceTexture;
    SurfaceTextureListener mSurfaceTextureListener;
    /* access modifiers changed from: private */
    public int mTargetState;
    private boolean mTransformApply;
    private Uri mUri;
    /* access modifiers changed from: private */
    public int mVideoHeight;
    /* access modifiers changed from: private */
    public int mVideoWidth;
    private float mVolume;

    public GalleryVideoView(Context context) {
        this(context, null);
    }

    public GalleryVideoView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public GalleryVideoView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mCurrentState = 0;
        this.mTargetState = 0;
        this.mMediaPlayer = null;
        this.mAudioFocusType = 1;
        this.mVolume = -1.0f;
        this.mSizeChangedListener = new OnVideoSizeChangedListener() {
            public void onVideoSizeChanged(MediaPlayer mediaPlayer, int i, int i2) {
                GalleryVideoView.this.mVideoWidth = mediaPlayer.getVideoWidth();
                GalleryVideoView.this.mVideoHeight = mediaPlayer.getVideoHeight();
                if (GalleryVideoView.this.mVideoWidth != 0 && GalleryVideoView.this.mVideoHeight != 0) {
                    GalleryVideoView.this.requestLayout();
                }
            }
        };
        this.mPreparedListener = new OnPreparedListener() {
            public void onPrepared(MediaPlayer mediaPlayer) {
                GalleryVideoView.this.mCurrentState = 2;
                if (GalleryVideoView.this.mOnPreparedListener != null) {
                    GalleryVideoView.this.mOnPreparedListener.onPrepared(GalleryVideoView.this.mMediaPlayer);
                }
                GalleryVideoView.this.mVideoWidth = mediaPlayer.getVideoWidth();
                GalleryVideoView.this.mVideoHeight = mediaPlayer.getVideoHeight();
                int access$500 = GalleryVideoView.this.mSeekWhenPrepared;
                if (access$500 != 0) {
                    GalleryVideoView.this.seekTo(access$500);
                }
                if (GalleryVideoView.this.mTargetState == 3) {
                    GalleryVideoView.this.start();
                }
            }
        };
        this.mCompletionListener = new OnCompletionListener() {
            public void onCompletion(MediaPlayer mediaPlayer) {
                GalleryVideoView.this.mCurrentState = 5;
                GalleryVideoView.this.mTargetState = 5;
                if (GalleryVideoView.this.mOnCompletionListener != null) {
                    GalleryVideoView.this.mOnCompletionListener.onCompletion(GalleryVideoView.this.mMediaPlayer);
                }
                if (GalleryVideoView.this.mAudioFocusType != 0) {
                    GalleryVideoView.this.mAudioManager.abandonAudioFocus(null);
                }
            }
        };
        this.mInfoListener = new OnInfoListener() {
            public boolean onInfo(MediaPlayer mediaPlayer, int i, int i2) {
                if (GalleryVideoView.this.mOnInfoListener != null) {
                    GalleryVideoView.this.mOnInfoListener.onInfo(mediaPlayer, i, i2);
                }
                return true;
            }
        };
        this.mErrorListener = new OnErrorListener() {
            public boolean onError(MediaPlayer mediaPlayer, int i, int i2) {
                StringBuilder sb = new StringBuilder();
                sb.append("Error: ");
                sb.append(i);
                sb.append(",");
                sb.append(i2);
                Log.d("GalleryVideoView", sb.toString());
                GalleryVideoView.this.mCurrentState = -1;
                GalleryVideoView.this.mTargetState = -1;
                return (GalleryVideoView.this.mOnErrorListener == null || GalleryVideoView.this.mOnErrorListener.onError(GalleryVideoView.this.mMediaPlayer, i, i2)) ? true : true;
            }
        };
        this.mBufferingUpdateListener = new OnBufferingUpdateListener() {
            public void onBufferingUpdate(MediaPlayer mediaPlayer, int i) {
                GalleryVideoView.this.mCurrentBufferPercentage = i;
            }
        };
        this.mSurfaceTextureListener = new SurfaceTextureListener() {
            public void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i, int i2) {
                GalleryVideoView.this.mSurfaceTexture = surfaceTexture;
                GalleryVideoView.this.openVideo();
            }

            public boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
                GalleryVideoView.this.mSurfaceTexture = null;
                GalleryVideoView.this.release(true);
                Log.d("GalleryVideoView", "surfaceDestroyed");
                return true;
            }

            public void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i, int i2) {
            }

            public void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
            }
        };
        this.mVideoWidth = 0;
        this.mVideoHeight = 0;
        this.mContext = context;
        this.mAudioManager = (AudioManager) this.mContext.getSystemService("audio");
        if (VERSION.SDK_INT >= 21) {
            this.mAudioAttributes = new Builder().setUsage(1).setContentType(3).build();
        }
        setSurfaceTextureListener(this.mSurfaceTextureListener);
        this.mCurrentState = 0;
        this.mTargetState = 0;
    }

    private boolean isInPlaybackState() {
        return (this.mMediaPlayer == null || this.mCurrentState == -1 || this.mCurrentState == 0 || this.mCurrentState == 1) ? false : true;
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x0114 A[SYNTHETIC, Splitter:B:51:0x0114] */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x0147 A[SYNTHETIC, Splitter:B:61:0x0147] */
    /* JADX WARNING: Removed duplicated region for block: B:67:0x0156 A[SYNTHETIC, Splitter:B:67:0x0156] */
    public void openVideo() {
        if ((this.mUri != null || !TextUtils.isEmpty(this.mFilePath)) && this.mSurfaceTexture != null) {
            release(false);
            FileInputStream fileInputStream = null;
            if (this.mAudioFocusType != 0) {
                this.mAudioManager.requestAudioFocus(null, 3, this.mAudioFocusType);
            }
            try {
                this.mMediaPlayer = new MediaPlayer();
                if (this.mAudioSession != 0) {
                    this.mMediaPlayer.setAudioSessionId(this.mAudioSession);
                } else {
                    this.mAudioSession = this.mMediaPlayer.getAudioSessionId();
                }
                this.mMediaPlayer.setOnPreparedListener(this.mPreparedListener);
                this.mMediaPlayer.setOnVideoSizeChangedListener(this.mSizeChangedListener);
                this.mMediaPlayer.setOnCompletionListener(this.mCompletionListener);
                this.mMediaPlayer.setOnErrorListener(this.mErrorListener);
                this.mMediaPlayer.setOnInfoListener(this.mInfoListener);
                this.mMediaPlayer.setOnBufferingUpdateListener(this.mBufferingUpdateListener);
                this.mCurrentBufferPercentage = 0;
                if (this.mUri != null) {
                    this.mMediaPlayer.setDataSource(this.mContext, this.mUri, this.mHeaders);
                } else if (!TextUtils.isEmpty(this.mFilePath)) {
                    FileInputStream fileInputStream2 = new FileInputStream(this.mFilePath);
                    try {
                        this.mMediaPlayer.setDataSource(fileInputStream2.getFD(), this.mFileOffset, this.mFileLength);
                        fileInputStream = fileInputStream2;
                    } catch (IOException e) {
                        FileInputStream fileInputStream3 = fileInputStream2;
                        e = e;
                        fileInputStream = fileInputStream3;
                        String str = "GalleryVideoView";
                        StringBuilder sb = new StringBuilder();
                        sb.append("Unable to open content: ");
                        sb.append(this.mUri);
                        Log.w(str, sb.toString(), e);
                        this.mCurrentState = -1;
                        this.mTargetState = -1;
                        this.mErrorListener.onError(this.mMediaPlayer, 1, 0);
                        if (fileInputStream != null) {
                        }
                    } catch (IllegalArgumentException e2) {
                        FileInputStream fileInputStream4 = fileInputStream2;
                        e = e2;
                        fileInputStream = fileInputStream4;
                        String str2 = "GalleryVideoView";
                        try {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("Unable to open content: ");
                            sb2.append(this.mUri);
                            Log.w(str2, sb2.toString(), e);
                            this.mCurrentState = -1;
                            this.mTargetState = -1;
                            this.mErrorListener.onError(this.mMediaPlayer, 1, 0);
                            if (fileInputStream != null) {
                            }
                        } catch (Throwable th) {
                            th = th;
                            if (fileInputStream != null) {
                                try {
                                    fileInputStream.close();
                                } catch (IOException e3) {
                                    Log.w("GalleryVideoView", "close stream error", e3);
                                }
                            }
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        fileInputStream = fileInputStream2;
                        if (fileInputStream != null) {
                        }
                        throw th;
                    }
                }
                this.mMediaPlayer.setSurface(new Surface(this.mSurfaceTexture));
                if (VERSION.SDK_INT >= 21) {
                    this.mMediaPlayer.setAudioAttributes(this.mAudioAttributes);
                }
                this.mMediaPlayer.setScreenOnWhilePlaying(true);
                if (this.mVolume >= 0.0f) {
                    this.mMediaPlayer.setVolume(this.mVolume, this.mVolume);
                }
                this.mMediaPlayer.prepareAsync();
                this.mCurrentState = 1;
                if (fileInputStream != null) {
                    try {
                        fileInputStream.close();
                    } catch (IOException e4) {
                        Log.w("GalleryVideoView", "close stream error", e4);
                    }
                }
            } catch (IOException e5) {
                e = e5;
                String str3 = "GalleryVideoView";
                StringBuilder sb3 = new StringBuilder();
                sb3.append("Unable to open content: ");
                sb3.append(this.mUri);
                Log.w(str3, sb3.toString(), e);
                this.mCurrentState = -1;
                this.mTargetState = -1;
                this.mErrorListener.onError(this.mMediaPlayer, 1, 0);
                if (fileInputStream != null) {
                    try {
                        fileInputStream.close();
                    } catch (IOException e6) {
                        Log.w("GalleryVideoView", "close stream error", e6);
                    }
                }
            } catch (IllegalArgumentException e7) {
                e = e7;
                String str22 = "GalleryVideoView";
                StringBuilder sb22 = new StringBuilder();
                sb22.append("Unable to open content: ");
                sb22.append(this.mUri);
                Log.w(str22, sb22.toString(), e);
                this.mCurrentState = -1;
                this.mTargetState = -1;
                this.mErrorListener.onError(this.mMediaPlayer, 1, 0);
                if (fileInputStream != null) {
                    try {
                        fileInputStream.close();
                    } catch (IOException e8) {
                        Log.w("GalleryVideoView", "close stream error", e8);
                    }
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void release(boolean z) {
        if (this.mMediaPlayer != null) {
            this.mMediaPlayer.reset();
            this.mMediaPlayer.release();
            this.mMediaPlayer = null;
            this.mCurrentState = 0;
            if (z) {
                this.mTargetState = 0;
            }
            if (this.mAudioFocusType != 0) {
                this.mAudioManager.abandonAudioFocus(null);
            }
        }
    }

    public CharSequence getAccessibilityClassName() {
        return GalleryVideoView.class.getName();
    }

    public int getAudioSessionId() {
        if (this.mAudioSession == 0) {
            MediaPlayer mediaPlayer = new MediaPlayer();
            this.mAudioSession = mediaPlayer.getAudioSessionId();
            mediaPlayer.release();
        }
        return this.mAudioSession;
    }

    public int getBufferPercentage() {
        if (this.mMediaPlayer != null) {
            return this.mCurrentBufferPercentage;
        }
        return 0;
    }

    public int getCurrentPosition() {
        if (isInPlaybackState()) {
            return this.mMediaPlayer.getCurrentPosition();
        }
        return 0;
    }

    public int getDuration() {
        if (isInPlaybackState()) {
            return this.mMediaPlayer.getDuration();
        }
        return -1;
    }

    public boolean isPlaying() {
        return isInPlaybackState() && this.mMediaPlayer.isPlaying();
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        int i3;
        int i4;
        int i5;
        int i6 = this.mDefaultWidth;
        int i7 = this.mDefaultHeight;
        if (this.mVideoWidth > 0 && this.mVideoHeight > 0) {
            i6 = this.mVideoWidth;
            i7 = this.mVideoHeight;
        }
        int defaultSize = getDefaultSize(i6, i);
        int defaultSize2 = getDefaultSize(i7, i2);
        if (i6 <= 0 || i7 <= 0 || this.mTransformApply) {
            i4 = defaultSize;
        } else {
            int mode = MeasureSpec.getMode(i);
            i4 = MeasureSpec.getSize(i);
            int mode2 = MeasureSpec.getMode(i2);
            i3 = MeasureSpec.getSize(i2);
            if (mode == 1073741824 && mode2 == 1073741824) {
                int i8 = i6 * i3;
                int i9 = i4 * i7;
                if (i8 < i9) {
                    i4 = i8 / i7;
                } else if (i8 > i9) {
                    defaultSize2 = i9 / i6;
                }
                setMeasuredDimension(i4, i3);
            }
            if (mode == 1073741824) {
                int i10 = (i7 * i4) / i6;
                if (mode2 != Integer.MIN_VALUE || i10 <= i3) {
                    i3 = i10;
                }
            } else if (mode2 == 1073741824) {
                int i11 = (i6 * i3) / i7;
                if (mode != Integer.MIN_VALUE || i11 <= i4) {
                    i4 = i11;
                }
            } else {
                if (mode2 != Integer.MIN_VALUE || i7 <= i3) {
                    i5 = i6;
                    i3 = i7;
                } else {
                    i5 = (i3 * i6) / i7;
                }
                if (mode != Integer.MIN_VALUE || i5 <= i4) {
                    i4 = i5;
                } else {
                    defaultSize2 = (i7 * i4) / i6;
                }
            }
            setMeasuredDimension(i4, i3);
        }
        i3 = defaultSize2;
        setMeasuredDimension(i4, i3);
    }

    public void pause() {
        if (isInPlaybackState() && this.mMediaPlayer.isPlaying()) {
            this.mMediaPlayer.pause();
            this.mCurrentState = 4;
        }
        this.mTargetState = 4;
    }

    public void requestAudioFocus(int i) {
        setAudioFocusRequest(i);
        if (i != 0) {
            this.mAudioManager.requestAudioFocus(null, 3, i);
        }
    }

    public void seekTo(int i) {
        if (isInPlaybackState()) {
            this.mMediaPlayer.seekTo(i);
            this.mSeekWhenPrepared = 0;
            return;
        }
        this.mSeekWhenPrepared = i;
    }

    public void setAudioAttributes(AudioAttributes audioAttributes) {
        if (audioAttributes != null) {
            this.mAudioAttributes = audioAttributes;
            return;
        }
        throw new IllegalArgumentException("Illegal null AudioAttributes");
    }

    public void setAudioFocusRequest(int i) {
        if (i == 0 || i == 1 || i == 2 || i == 3 || i == 4) {
            this.mAudioFocusType = i;
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Illegal audio focus type ");
        sb.append(i);
        throw new IllegalArgumentException(sb.toString());
    }

    public void setOnCompletionListener(OnCompletionListener onCompletionListener) {
        this.mOnCompletionListener = onCompletionListener;
    }

    public void setOnErrorListener(OnErrorListener onErrorListener) {
        this.mOnErrorListener = onErrorListener;
    }

    public void setOnInfoListener(OnInfoListener onInfoListener) {
        this.mOnInfoListener = onInfoListener;
    }

    public void setOnPreparedListener(OnPreparedListener onPreparedListener) {
        this.mOnPreparedListener = onPreparedListener;
    }

    public void setTransform(Matrix matrix) {
        if (matrix == null || matrix.isIdentity()) {
            this.mTransformApply = false;
            return;
        }
        super.setTransform(matrix);
        this.mTransformApply = true;
    }

    public void setVideoFilePath(String str) {
        setVideoFilePath(str, 0, 576460752303423487L);
    }

    public void setVideoFilePath(String str, long j) {
        setVideoFilePath(str, j, 576460752303423487L);
    }

    public void setVideoFilePath(String str, long j, long j2) {
        this.mFilePath = str;
        this.mFileOffset = j;
        this.mFileLength = j2;
        this.mSeekWhenPrepared = 0;
        openVideo();
        requestLayout();
        invalidate();
    }

    public void setVideoPath(String str) {
        setVideoURI(Uri.parse(str));
    }

    public void setVideoURI(Uri uri) {
        setVideoURI(uri, null);
    }

    public void setVideoURI(Uri uri, Map<String, String> map) {
        this.mUri = uri;
        this.mHeaders = map;
        this.mSeekWhenPrepared = 0;
        openVideo();
        requestLayout();
        invalidate();
    }

    public void setVolume(float f) {
        this.mVolume = f;
        if (f >= 0.0f && this.mMediaPlayer != null) {
            this.mMediaPlayer.setVolume(f, f);
        }
    }

    public void start() {
        if (isInPlaybackState()) {
            this.mMediaPlayer.start();
            this.mCurrentState = 3;
        }
        this.mTargetState = 3;
    }

    public void stopPlayback() {
        if (this.mMediaPlayer != null) {
            this.mMediaPlayer.stop();
            this.mMediaPlayer.release();
            this.mMediaPlayer = null;
            this.mCurrentState = 0;
            this.mTargetState = 0;
            this.mAudioManager.abandonAudioFocus(null);
        }
    }
}
