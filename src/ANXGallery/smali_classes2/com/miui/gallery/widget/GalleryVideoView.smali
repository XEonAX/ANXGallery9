.class public Lcom/miui/gallery/widget/GalleryVideoView;
.super Landroid/view/TextureView;
.source "GalleryVideoView.java"


# instance fields
.field private mAudioAttributes:Landroid/media/AudioAttributes;

.field private mAudioFocusType:I

.field private mAudioManager:Landroid/media/AudioManager;

.field private mAudioSession:I

.field private mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

.field private mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mContext:Landroid/content/Context;

.field private mCurrentBufferPercentage:I

.field private mCurrentState:I

.field private mDefaultHeight:I

.field private mDefaultWidth:I

.field private mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mFileLength:J

.field private mFileOffset:J

.field private mFilePath:Ljava/lang/String;

.field private mHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mOnInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

.field private mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field private mSeekWhenPrepared:I

.field mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

.field private mTargetState:I

.field private mTransformApply:Z

.field private mUri:Landroid/net/Uri;

.field private mVideoHeight:I

.field private mVideoWidth:I

.field private mVolume:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/GalleryVideoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/GalleryVideoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    iput p2, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentState:I

    iput p2, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mTargetState:I

    const/4 p3, 0x0

    iput-object p3, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 p3, 0x1

    iput p3, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioFocusType:I

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mVolume:F

    new-instance v0, Lcom/miui/gallery/widget/GalleryVideoView$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/GalleryVideoView$1;-><init>(Lcom/miui/gallery/widget/GalleryVideoView;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    new-instance v0, Lcom/miui/gallery/widget/GalleryVideoView$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/GalleryVideoView$2;-><init>(Lcom/miui/gallery/widget/GalleryVideoView;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    new-instance v0, Lcom/miui/gallery/widget/GalleryVideoView$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/GalleryVideoView$3;-><init>(Lcom/miui/gallery/widget/GalleryVideoView;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    new-instance v0, Lcom/miui/gallery/widget/GalleryVideoView$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/GalleryVideoView$4;-><init>(Lcom/miui/gallery/widget/GalleryVideoView;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    new-instance v0, Lcom/miui/gallery/widget/GalleryVideoView$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/GalleryVideoView$5;-><init>(Lcom/miui/gallery/widget/GalleryVideoView;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    new-instance v0, Lcom/miui/gallery/widget/GalleryVideoView$6;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/GalleryVideoView$6;-><init>(Lcom/miui/gallery/widget/GalleryVideoView;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    new-instance v0, Lcom/miui/gallery/widget/GalleryVideoView$7;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/GalleryVideoView$7;-><init>(Lcom/miui/gallery/widget/GalleryVideoView;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    iput p2, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mVideoWidth:I

    iput p2, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mVideoHeight:I

    iput-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mContext:Landroid/content/Context;

    iget-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mContext:Landroid/content/Context;

    const-string v0, "audio"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/AudioManager;

    iput-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioManager:Landroid/media/AudioManager;

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x15

    if-lt p1, v0, :cond_0

    new-instance p1, Landroid/media/AudioAttributes$Builder;

    invoke-direct {p1}, Landroid/media/AudioAttributes$Builder;-><init>()V

    invoke-virtual {p1, p3}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object p1

    const/4 p3, 0x3

    invoke-virtual {p1, p3}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioAttributes:Landroid/media/AudioAttributes;

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/GalleryVideoView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    iput p2, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentState:I

    iput p2, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mTargetState:I

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/GalleryVideoView;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mVideoWidth:I

    return p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/widget/GalleryVideoView;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mVideoWidth:I

    return p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/GalleryVideoView;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mVideoHeight:I

    return p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/widget/GalleryVideoView;)Landroid/media/MediaPlayer$OnInfoListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mOnInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    return-object p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/widget/GalleryVideoView;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mVideoHeight:I

    return p1
.end method

.method static synthetic access$1100(Lcom/miui/gallery/widget/GalleryVideoView;)Landroid/media/MediaPlayer$OnErrorListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    return-object p0
.end method

.method static synthetic access$1202(Lcom/miui/gallery/widget/GalleryVideoView;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentBufferPercentage:I

    return p1
.end method

.method static synthetic access$1302(Lcom/miui/gallery/widget/GalleryVideoView;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object p1
.end method

.method static synthetic access$1400(Lcom/miui/gallery/widget/GalleryVideoView;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryVideoView;->openVideo()V

    return-void
.end method

.method static synthetic access$1500(Lcom/miui/gallery/widget/GalleryVideoView;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/GalleryVideoView;->release(Z)V

    return-void
.end method

.method static synthetic access$202(Lcom/miui/gallery/widget/GalleryVideoView;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentState:I

    return p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/widget/GalleryVideoView;)Landroid/media/MediaPlayer$OnPreparedListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/widget/GalleryVideoView;)Landroid/media/MediaPlayer;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/widget/GalleryVideoView;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mSeekWhenPrepared:I

    return p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/widget/GalleryVideoView;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mTargetState:I

    return p0
.end method

.method static synthetic access$602(Lcom/miui/gallery/widget/GalleryVideoView;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mTargetState:I

    return p1
.end method

.method static synthetic access$700(Lcom/miui/gallery/widget/GalleryVideoView;)Landroid/media/MediaPlayer$OnCompletionListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/widget/GalleryVideoView;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioFocusType:I

    return p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/widget/GalleryVideoView;)Landroid/media/AudioManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioManager:Landroid/media/AudioManager;

    return-object p0
.end method

.method private isInPlaybackState()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentState:I

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    iget v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentState:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentState:I

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private openVideo()V
    .locals 13

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mUri:Landroid/net/Uri;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mFilePath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-nez v0, :cond_2

    :cond_1
    return-void

    :cond_2
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/GalleryVideoView;->release(Z)V

    iget v1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioFocusType:I

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioManager:Landroid/media/AudioManager;

    const/4 v3, 0x3

    iget v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioFocusType:I

    invoke-virtual {v1, v2, v3, v4}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    :cond_3
    const/4 v1, 0x1

    const/4 v3, -0x1

    :try_start_0
    new-instance v4, Landroid/media/MediaPlayer;

    invoke-direct {v4}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioSession:I

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget v5, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioSession:I

    invoke-virtual {v4, v5}, Landroid/media/MediaPlayer;->setAudioSessionId(I)V

    goto :goto_0

    :cond_4
    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v4}, Landroid/media/MediaPlayer;->getAudioSessionId()I

    move-result v4

    iput v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioSession:I

    :goto_0
    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v5, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    invoke-virtual {v4, v5}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v5, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    invoke-virtual {v4, v5}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v5, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    invoke-virtual {v4, v5}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v5, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    invoke-virtual {v4, v5}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v5, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    invoke-virtual {v4, v5}, Landroid/media/MediaPlayer;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v5, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    invoke-virtual {v4, v5}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    iput v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentBufferPercentage:I

    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mUri:Landroid/net/Uri;

    if-eqz v4, :cond_5

    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v5, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mUri:Landroid/net/Uri;

    iget-object v7, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mHeaders:Ljava/util/Map;

    invoke-virtual {v4, v5, v6, v7}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;Ljava/util/Map;)V

    goto :goto_1

    :cond_5
    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mFilePath:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_6

    new-instance v4, Ljava/io/FileInputStream;

    iget-object v5, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mFilePath:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v6, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v4}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v7

    iget-wide v8, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mFileOffset:J

    iget-wide v10, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mFileLength:J

    invoke-virtual/range {v6 .. v11}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v2, v4

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object v2, v4

    goto/16 :goto_7

    :catch_0
    move-exception v2

    move-object v12, v4

    move-object v4, v2

    move-object v2, v12

    goto :goto_3

    :catch_1
    move-exception v2

    move-object v12, v4

    move-object v4, v2

    move-object v2, v12

    goto/16 :goto_5

    :cond_6
    :goto_1
    :try_start_2
    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v5, Landroid/view/Surface;

    iget-object v6, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-direct {v5, v6}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    invoke-virtual {v4, v5}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x15

    if-lt v4, v5, :cond_7

    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v5, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioAttributes:Landroid/media/AudioAttributes;

    invoke-virtual {v4, v5}, Landroid/media/MediaPlayer;->setAudioAttributes(Landroid/media/AudioAttributes;)V

    :cond_7
    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v4, v1}, Landroid/media/MediaPlayer;->setScreenOnWhilePlaying(Z)V

    iget v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mVolume:F

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_8

    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget v5, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mVolume:F

    iget v6, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mVolume:F

    invoke-virtual {v4, v5, v6}, Landroid/media/MediaPlayer;->setVolume(FF)V

    :cond_8
    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v4}, Landroid/media/MediaPlayer;->prepareAsync()V

    iput v1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentState:I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v2, :cond_9

    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_2

    :catch_2
    move-exception v0

    const-string v1, "GalleryVideoView"

    const-string v2, "close stream error"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_9
    :goto_2
    return-void

    :catchall_1
    move-exception v0

    goto :goto_7

    :catch_3
    move-exception v4

    :goto_3
    :try_start_4
    const-string v5, "GalleryVideoView"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to open content: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mUri:Landroid/net/Uri;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v4}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iput v3, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentState:I

    iput v3, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mTargetState:I

    iget-object v3, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-interface {v3, v4, v1, v0}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v2, :cond_a

    :try_start_5
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_4

    :catch_4
    move-exception v0

    const-string v1, "GalleryVideoView"

    const-string v2, "close stream error"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_a
    :goto_4
    return-void

    :catch_5
    move-exception v4

    :goto_5
    :try_start_6
    const-string v5, "GalleryVideoView"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to open content: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mUri:Landroid/net/Uri;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v4}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iput v3, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentState:I

    iput v3, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mTargetState:I

    iget-object v3, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    iget-object v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-interface {v3, v4, v1, v0}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-eqz v2, :cond_b

    :try_start_7
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6

    goto :goto_6

    :catch_6
    move-exception v0

    const-string v1, "GalleryVideoView"

    const-string v2, "close stream error"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_b
    :goto_6
    return-void

    :goto_7
    if-eqz v2, :cond_c

    :try_start_8
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_7

    goto :goto_8

    :catch_7
    move-exception v1

    const-string v2, "GalleryVideoView"

    const-string v3, "close stream error"

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_c
    :goto_8
    throw v0
.end method

.method private release(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    iput v1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentState:I

    if-eqz p1, :cond_0

    iput v1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mTargetState:I

    :cond_0
    iget p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioFocusType:I

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    :cond_1
    return-void
.end method


# virtual methods
.method public getAccessibilityClassName()Ljava/lang/CharSequence;
    .locals 1

    const-class v0, Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAudioSessionId()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioSession:I

    if-nez v0, :cond_0

    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getAudioSessionId()I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioSession:I

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    :cond_0
    iget v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioSession:I

    return v0
.end method

.method public getBufferPercentage()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentBufferPercentage:I

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getCurrentPosition()I
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getDuration()I
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public isPlaying()Z
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected onMeasure(II)V
    .locals 6

    iget v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mDefaultWidth:I

    iget v1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mDefaultHeight:I

    iget v2, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mVideoWidth:I

    if-lez v2, :cond_0

    iget v2, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mVideoHeight:I

    if-lez v2, :cond_0

    iget v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mVideoWidth:I

    iget v1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mVideoHeight:I

    :cond_0
    invoke-static {v0, p1}, Lcom/miui/gallery/widget/GalleryVideoView;->getDefaultSize(II)I

    move-result v2

    invoke-static {v1, p2}, Lcom/miui/gallery/widget/GalleryVideoView;->getDefaultSize(II)I

    move-result v3

    if-lez v0, :cond_9

    if-lez v1, :cond_9

    iget-boolean v4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mTransformApply:Z

    if-nez v4, :cond_9

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    const/high16 v4, 0x40000000    # 2.0f

    if-ne v2, v4, :cond_2

    if-ne v3, v4, :cond_2

    mul-int v2, v0, p2

    mul-int v3, p1, v1

    if-ge v2, v3, :cond_1

    div-int/2addr v2, v1

    move p1, v2

    goto :goto_2

    :cond_1
    if-le v2, v3, :cond_a

    div-int/2addr v3, v0

    goto :goto_1

    :cond_2
    const/high16 v5, -0x80000000

    if-ne v2, v4, :cond_4

    mul-int v1, v1, p1

    div-int v0, v1, v0

    if-ne v3, v5, :cond_3

    if-le v0, p2, :cond_3

    goto :goto_2

    :cond_3
    move p2, v0

    goto :goto_2

    :cond_4
    if-ne v3, v4, :cond_6

    mul-int v0, v0, p2

    div-int/2addr v0, v1

    if-ne v2, v5, :cond_5

    if-le v0, p1, :cond_5

    goto :goto_2

    :cond_5
    move p1, v0

    goto :goto_2

    :cond_6
    if-ne v3, v5, :cond_7

    if-le v1, p2, :cond_7

    mul-int v3, p2, v0

    div-int/2addr v3, v1

    goto :goto_0

    :cond_7
    move v3, v0

    move p2, v1

    :goto_0
    if-ne v2, v5, :cond_8

    if-le v3, p1, :cond_8

    mul-int v1, v1, p1

    div-int v3, v1, v0

    goto :goto_1

    :cond_8
    move p1, v3

    goto :goto_2

    :cond_9
    move p1, v2

    :goto_1
    move p2, v3

    :cond_a
    :goto_2
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/widget/GalleryVideoView;->setMeasuredDimension(II)V

    return-void
.end method

.method public pause()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryVideoView;->isInPlaybackState()Z

    move-result v0

    const/4 v1, 0x4

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    iput v1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentState:I

    :cond_0
    iput v1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mTargetState:I

    return-void
.end method

.method public requestAudioFocus(I)V
    .locals 3

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/GalleryVideoView;->setAudioFocusRequest(I)V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioManager:Landroid/media/AudioManager;

    const/4 v1, 0x0

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2, p1}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    :cond_0
    return-void
.end method

.method public seekTo(I)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mSeekWhenPrepared:I

    goto :goto_0

    :cond_0
    iput p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mSeekWhenPrepared:I

    :goto_0
    return-void
.end method

.method public setAudioAttributes(Landroid/media/AudioAttributes;)V
    .locals 1

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioAttributes:Landroid/media/AudioAttributes;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Illegal null AudioAttributes"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setAudioFocusRequest(I)V
    .locals 3

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Illegal audio focus type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    iput p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioFocusType:I

    return-void
.end method

.method public setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    return-void
.end method

.method public setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    return-void
.end method

.method public setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mOnInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    return-void
.end method

.method public setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    return-void
.end method

.method public setTransform(Landroid/graphics/Matrix;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/view/TextureView;->setTransform(Landroid/graphics/Matrix;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mTransformApply:Z

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mTransformApply:Z

    :goto_0
    return-void
.end method

.method public setVideoFilePath(Ljava/lang/String;)V
    .locals 6

    const-wide/16 v2, 0x0

    const-wide v4, 0x7ffffffffffffffL

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/widget/GalleryVideoView;->setVideoFilePath(Ljava/lang/String;JJ)V

    return-void
.end method

.method public setVideoFilePath(Ljava/lang/String;J)V
    .locals 6

    const-wide v4, 0x7ffffffffffffffL

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/widget/GalleryVideoView;->setVideoFilePath(Ljava/lang/String;JJ)V

    return-void
.end method

.method public setVideoFilePath(Ljava/lang/String;JJ)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mFilePath:Ljava/lang/String;

    iput-wide p2, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mFileOffset:J

    iput-wide p4, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mFileLength:J

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mSeekWhenPrepared:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryVideoView;->openVideo()V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/GalleryVideoView;->requestLayout()V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/GalleryVideoView;->invalidate()V

    return-void
.end method

.method public setVideoPath(Ljava/lang/String;)V
    .locals 0

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/GalleryVideoView;->setVideoURI(Landroid/net/Uri;)V

    return-void
.end method

.method public setVideoURI(Landroid/net/Uri;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/widget/GalleryVideoView;->setVideoURI(Landroid/net/Uri;Ljava/util/Map;)V

    return-void
.end method

.method public setVideoURI(Landroid/net/Uri;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mUri:Landroid/net/Uri;

    iput-object p2, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mHeaders:Ljava/util/Map;

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mSeekWhenPrepared:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryVideoView;->openVideo()V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/GalleryVideoView;->requestLayout()V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/GalleryVideoView;->invalidate()V

    return-void
.end method

.method public setVolume(F)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mVolume:F

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1, p1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    :cond_0
    return-void
.end method

.method public start()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryVideoView;->isInPlaybackState()Z

    move-result v0

    const/4 v1, 0x3

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    iput v1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentState:I

    :cond_0
    iput v1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mTargetState:I

    return-void
.end method

.method public stopPlayback()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    iput v1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mCurrentState:I

    iput v1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mTargetState:I

    iget-object v1, p0, Lcom/miui/gallery/widget/GalleryVideoView;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, v0}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    :cond_0
    return-void
.end method
