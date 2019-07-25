.class public Lcom/miui/gallery/ui/MonthViewTipFragment;
.super Lcom/miui/gallery/ui/RichTipDialogFragment;
.source "MonthViewTipFragment.java"


# instance fields
.field private mVideoView:Landroid/widget/VideoView;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/RichTipDialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/MonthViewTipFragment;)Landroid/widget/VideoView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/MonthViewTipFragment;->mVideoView:Landroid/widget/VideoView;

    return-object p0
.end method

.method private initPlayer()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "android.resource://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthViewTipFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const v1, 0x7f0f0002

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/MonthViewTipFragment;->mVideoView:Landroid/widget/VideoView;

    invoke-virtual {v1, v0}, Landroid/widget/VideoView;->setVideoURI(Landroid/net/Uri;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthViewTipFragment;->mVideoView:Landroid/widget/VideoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->setAudioFocusRequest(I)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/MonthViewTipFragment;->mVideoView:Landroid/widget/VideoView;

    new-instance v1, Lcom/miui/gallery/ui/MonthViewTipFragment$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/MonthViewTipFragment$1;-><init>(Lcom/miui/gallery/ui/MonthViewTipFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    return-void
.end method

.method private updateLayoutParams(Landroid/content/res/Configuration;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthViewTipFragment;->mVideoView:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    const/4 v1, -0x2

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthViewTipFragment;->mVideoView:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v2, 0x11

    invoke-direct {v0, v1, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    :goto_0
    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x2

    if-ne p1, v2, :cond_1

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result p1

    int-to-float p1, p1

    const v1, 0x3f147ae1    # 0.58f

    mul-float p1, p1, v1

    float-to-int p1, p1

    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    iget p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    int-to-float p1, p1

    const v1, 0x3f820c4a    # 1.016f

    mul-float p1, p1, v1

    float-to-int p1, p1

    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/ui/MonthViewTipFragment;->mVideoView:Landroid/widget/VideoView;

    invoke-virtual {p1, v0}, Landroid/widget/VideoView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/RichTipDialogFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/MonthViewTipFragment;->updateLayoutParams(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthViewTipFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f100476

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/MonthViewTipFragment;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthViewTipFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f100475

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/MonthViewTipFragment;->setSubTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthViewTipFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f100474

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/MonthViewTipFragment;->setPositiveButton(Ljava/lang/CharSequence;)V

    new-instance v0, Landroid/widget/VideoView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthViewTipFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/VideoView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/MonthViewTipFragment;->mVideoView:Landroid/widget/VideoView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthViewTipFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/MonthViewTipFragment;->updateLayoutParams(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthViewTipFragment;->mVideoView:Landroid/widget/VideoView;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/MonthViewTipFragment;->setContentView(Landroid/view/View;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/MonthViewTipFragment;->initPlayer()V

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthViewTipFragment;->mVideoView:Landroid/widget/VideoView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->setZOrderOnTop(Z)V

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/RichTipDialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDestroyView()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/RichTipDialogFragment;->onDestroyView()V

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthViewTipFragment;->mVideoView:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->stopPlayback()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/MonthViewTipFragment;->mVideoView:Landroid/widget/VideoView;

    return-void
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/RichTipDialogFragment;->onPause()V

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthViewTipFragment;->mVideoView:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->pause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/RichTipDialogFragment;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthViewTipFragment;->mVideoView:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->start()V

    return-void
.end method
