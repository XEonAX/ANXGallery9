.class public Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;
.super Landroid/app/Fragment;
.source "VideoEditorFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/activity/VideoEditorActivity$OnBackPressedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;,
        Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$InitializeListener;,
        Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyVideoLoadCompletedListener;
    }
.end annotation


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mCurrentTime:I

.field private mData:Landroid/net/Uri;

.field private mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

.field private mIsLoadSuccess:Z

.field public mMenuFragmentCallBack:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;

.field private mMenuView:Landroid/view/View;

.field private mMyStateChangeListener:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;

.field mOnGlobalFocusChangeListener:Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;

.field private mPlayProgress:I

.field private mProgressingView:Landroid/widget/ProgressBar;

.field private mTopLine:Landroid/support/constraint/Guideline;

.field private mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

.field private mVideoEditorHelper:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mPlayProgress:I

    iput v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mCurrentTime:I

    new-instance v0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$1;-><init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mOnGlobalFocusChangeListener:Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;

    new-instance v0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$5;-><init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mMenuFragmentCallBack:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;

    return-void
.end method

.method private AutoTrimAction(Landroid/view/View;)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mIsLoadSuccess:Z

    if-nez v0, :cond_0

    const-string p1, "VideoEditorFragment"

    const-string v0, "the video has not load success."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->saveEditState()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;-><init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->resetProject(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Landroid/support/constraint/Guideline;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mTopLine:Landroid/support/constraint/Guideline;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Landroid/net/Uri;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mData:Landroid/net/Uri;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mActivity:Landroid/app/Activity;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Landroid/widget/ProgressBar;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mProgressingView:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->handleNotSupportVideoFile()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mMenuView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mCurrentTime:I

    return p0
.end method

.method static synthetic access$302(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mCurrentTime:I

    return p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mPlayProgress:I

    return p0
.end method

.method static synthetic access$502(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mPlayProgress:I

    return p1
.end method

.method static synthetic access$600(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/widget/DisplayWrapper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/util/VideoEditorHelper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditorHelper:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mIsLoadSuccess:Z

    return p0
.end method

.method static synthetic access$802(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mIsLoadSuccess:Z

    return p1
.end method

.method private handleNotSupportVideoFile()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mActivity:Landroid/app/Activity;

    const v1, 0x7f10074b

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mData:Landroid/net/Uri;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "file"

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mData:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "video_editor"

    const-string v2, "video_editor_not_support"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->exit()V

    return-void
.end method

.method private initListener()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mMyStateChangeListener:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->addStateChangeListener(Lcom/miui/gallery/video/editor/VideoEditor$StateChangeListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/-$$Lambda$VideoEditorFragment$hnFAd-rzbzODT-BcdoT6Uur0wd4;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/-$$Lambda$VideoEditorFragment$hnFAd-rzbzODT-BcdoT6Uur0wd4;-><init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->setIvPlayListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/-$$Lambda$VideoEditorFragment$iHm4jv35JazfEd5HwRwV1oF-5lk;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/-$$Lambda$VideoEditorFragment$iHm4jv35JazfEd5HwRwV1oF-5lk;-><init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->setAutoTrimListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$2;-><init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->addStateChangeListener(Lcom/miui/gallery/video/editor/VideoEditor$StateChangeListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/-$$Lambda$VideoEditorFragment$IA4Ykd1dmpagBnPmRAhN7Hw3K1Y;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/-$$Lambda$VideoEditorFragment$IA4Ykd1dmpagBnPmRAhN7Hw3K1Y;-><init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->setClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;-><init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->setIProgress(Lcom/miui/gallery/video/editor/widget/DisplayWrapper$IProgress;)V

    return-void
.end method

.method public static synthetic lambda$initListener$101(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->playVideoAction()V

    return-void
.end method

.method public static synthetic lambda$initListener$102(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->AutoTrimAction(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic lambda$initListener$103(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditorHelper:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->isWaterMarkEditMenu()Z

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/VideoEditor;->getState()I

    move-result p1

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/VideoEditor;->pause()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/VideoEditor;->getState()I

    move-result p1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/VideoEditor;->getState()I

    move-result p1

    if-nez p1, :cond_3

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/VideoEditor;->resume()V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/VideoEditor;->getState()I

    move-result p1

    if-ne p1, v0, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/VideoEditor;->pause()V

    :cond_3
    :goto_0
    return-void
.end method

.method private loadData()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mData:Landroid/net/Uri;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mData:Landroid/net/Uri;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mData:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mData:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$InitializeListener;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$InitializeListener;-><init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$1;)V

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/video/editor/VideoEditor;->load(Ljava/lang/String;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->handleNotSupportVideoFile()V

    :goto_0
    return-void
.end method

.method private playVideoAction()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mIsLoadSuccess:Z

    if-nez v0, :cond_0

    const-string v0, "VideoEditorFragment"

    const-string v1, "the video has not loaded success."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditorHelper:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->onPlayButtonClicked()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->getState()I

    move-result v0

    if-eqz v0, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->resume()V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->play()V

    :goto_0
    return-void
.end method


# virtual methods
.method public exit()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->isInit()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->release()V

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/video/editor/util/TempFileCollector;->deleteAllTempFile(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public getData()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mData:Landroid/net/Uri;

    return-object v0
.end method

.method public getEffectMenuContainerId()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mMenuView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mMenuView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getVideoEditor()Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-object v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Fragment;->onAttach(Landroid/app/Activity;)V

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mActivity:Landroid/app/Activity;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mActivity:Landroid/app/Activity;

    instance-of p1, p1, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mActivity:Landroid/app/Activity;

    check-cast p1, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->setOnBackPressedListener(Lcom/miui/gallery/video/editor/activity/VideoEditorActivity$OnBackPressedListener;)V

    :cond_0
    return-void
.end method

.method public onAttachMenuFragment(Landroid/app/Fragment;)V
    .locals 1

    instance-of v0, p1, Lcom/miui/gallery/video/editor/ui/MenuFragment;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/video/editor/ui/MenuFragment;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mMenuFragmentCallBack:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->setCallBack(Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;)V

    :cond_0
    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditorHelper:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->onBackPressed()Z

    move-result v0

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "nex"

    invoke-static {p1, v0}, Lcom/miui/gallery/video/editor/VideoEditor;->create(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const/4 p3, 0x0

    const v0, 0x7f0b0088

    invoke-virtual {p1, v0, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0900e0

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    const v0, 0x7f0901cd

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mMenuView:Landroid/view/View;

    const v0, 0x7f0900df

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/Guideline;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mTopLine:Landroid/support/constraint/Guideline;

    const v0, 0x7f090236

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mProgressingView:Landroid/widget/ProgressBar;

    new-instance v0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;

    invoke-direct {v0, p0, p3}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;-><init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mMyStateChangeListener:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {p3, v0}, Lcom/miui/gallery/video/editor/VideoEditor;->setDisplayWrapper(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->loadData()V

    new-instance p3, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p3, p2, p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;-><init>(Landroid/content/Context;Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V

    iput-object p3, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditorHelper:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditorHelper:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->showNavEditMenu()V

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mMenuView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p2

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mOnGlobalFocusChangeListener:Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;

    invoke-virtual {p2, p3}, Landroid/view/ViewTreeObserver;->addOnGlobalFocusChangeListener(Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->initListener()V

    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mMyStateChangeListener:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->removeStateChangeListener(Lcom/miui/gallery/video/editor/VideoEditor$StateChangeListener;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditorHelper:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditorHelper:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->onDestroy()V

    :cond_1
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/video/editor/util/TempFileCollector;->deleteAllTempFile(Landroid/content/Context;)V

    return-void
.end method

.method public onDetach()V
    .locals 2

    invoke-super {p0}, Landroid/app/Fragment;->onDetach()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mActivity:Landroid/app/Activity;

    instance-of v0, v0, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mActivity:Landroid/app/Activity;

    check-cast v0, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->setOnBackPressedListener(Lcom/miui/gallery/video/editor/activity/VideoEditorActivity$OnBackPressedListener;)V

    :cond_0
    iput-object v1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mActivity:Landroid/app/Activity;

    return-void
.end method

.method public onPause()V
    .locals 2

    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->pause()V

    :cond_0
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->pause()V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "video_editor"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageEnd(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->startPreview()V

    :cond_0
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->resume()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mVideoEditorHelper:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->updatePlayView()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mActivity:Landroid/app/Activity;

    const-string v1, "video_editor"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageStart(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method
