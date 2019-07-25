.class public Lcom/miui/gallery/projection/ProjectionVideoController;
.super Landroid/widget/RelativeLayout;
.source "ProjectionVideoController.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Lcom/miui/gallery/projection/ConnectController$MediaPlayListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/projection/ProjectionVideoController$OnFinishListener;
    }
.end annotation


# instance fields
.field private mConnectControl:Lcom/miui/gallery/projection/ConnectController;

.field private mDragging:Z

.field private mFinishListener:Lcom/miui/gallery/projection/ProjectionVideoController$OnFinishListener;

.field private mHandler:Landroid/os/Handler;

.field private mIvPause:Landroid/widget/ImageView;

.field private mLayoutQuit:Landroid/widget/LinearLayout;

.field private mSbSeek:Landroid/widget/SeekBar;

.field private mTvCurPos:Landroid/widget/TextView;

.field private mTvDuration:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    new-instance p1, Lcom/miui/gallery/projection/ProjectionVideoController$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/projection/ProjectionVideoController$1;-><init>(Lcom/miui/gallery/projection/ProjectionVideoController;)V

    iput-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Lcom/miui/gallery/projection/ProjectionVideoController$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/projection/ProjectionVideoController$1;-><init>(Lcom/miui/gallery/projection/ProjectionVideoController;)V

    iput-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lcom/miui/gallery/projection/ProjectionVideoController$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/projection/ProjectionVideoController$1;-><init>(Lcom/miui/gallery/projection/ProjectionVideoController;)V

    iput-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/projection/ProjectionVideoController;)I
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->showProgress()I

    move-result p0

    return p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/projection/ProjectionVideoController;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mDragging:Z

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/projection/ProjectionVideoController;)Lcom/miui/gallery/projection/ConnectController;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    return-object p0
.end method

.method private showProgress()I
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mDragging:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    invoke-virtual {v0}, Lcom/miui/gallery/projection/ConnectController;->getCurrentPosition()I

    move-result v0

    iget-object v2, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    invoke-virtual {v2}, Lcom/miui/gallery/projection/ConnectController;->getDuration()I

    move-result v2

    invoke-virtual {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->updateStatus()V

    const-string v3, "RemoteVideoControl"

    const-string v4, "position %d, duration %d"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v3, v4, v5, v6}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    return v1

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mSbSeek:Landroid/widget/SeekBar;

    if-eqz v1, :cond_2

    if-lez v2, :cond_2

    const-wide/16 v3, 0x64

    int-to-long v5, v0

    mul-long v5, v5, v3

    int-to-long v3, v2

    div-long/2addr v5, v3

    iget-object v1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mSbSeek:Landroid/widget/SeekBar;

    long-to-int v3, v5

    invoke-virtual {v1, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    const-string v1, "RemoteVideoControl"

    const-string v3, "seek set %d"

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v1, v3, v4}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    if-nez v2, :cond_3

    return v0

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mTvDuration:Landroid/widget/TextView;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mTvDuration:Landroid/widget/TextView;

    div-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    invoke-static {v2, v3}, Lcom/miui/gallery/util/FormatUtil;->formatVideoDuration(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mTvCurPos:Landroid/widget/TextView;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mTvCurPos:Landroid/widget/TextView;

    div-int/lit16 v2, v0, 0x3e8

    int-to-long v2, v2

    invoke-static {v2, v3}, Lcom/miui/gallery/util/FormatUtil;->formatVideoDuration(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_5
    return v0

    :cond_6
    :goto_0
    return v1
.end method


# virtual methods
.method protected clearStatus()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mTvDuration:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mTvDuration:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mTvCurPos:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mTvCurPos:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mSbSeek:Landroid/widget/SeekBar;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mSbSeek:Landroid/widget/SeekBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->updateStatus()V

    return-void
.end method

.method protected getPauseImageResId()I
    .locals 1

    const v0, 0x7f070229

    return v0
.end method

.method protected getPlayImageResId()I
    .locals 1

    const v0, 0x7f07022a

    return v0
.end method

.method public initView()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    const v0, 0x7f09019c

    invoke-virtual {p0, v0}, Lcom/miui/gallery/projection/ProjectionVideoController;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mLayoutQuit:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mLayoutQuit:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f090191

    invoke-virtual {p0, v0}, Lcom/miui/gallery/projection/ProjectionVideoController;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mIvPause:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mIvPause:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f09030e

    invoke-virtual {p0, v0}, Lcom/miui/gallery/projection/ProjectionVideoController;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mTvCurPos:Landroid/widget/TextView;

    const v0, 0x7f09030f

    invoke-virtual {p0, v0}, Lcom/miui/gallery/projection/ProjectionVideoController;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mTvDuration:Landroid/widget/TextView;

    const v0, 0x7f090274

    invoke-virtual {p0, v0}, Lcom/miui/gallery/projection/ProjectionVideoController;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    iput-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mSbSeek:Landroid/widget/SeekBar;

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mSbSeek:Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mLayoutQuit:Landroid/widget/LinearLayout;

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->stopPlay()V

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mIvPause:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    invoke-virtual {p1}, Lcom/miui/gallery/projection/ConnectController;->isPlaying()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    invoke-virtual {p1}, Lcom/miui/gallery/projection/ConnectController;->pause()V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    invoke-virtual {p1}, Lcom/miui/gallery/projection/ConnectController;->resume()V

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->updateStatus()V

    :cond_2
    :goto_1
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->stopPlay()V

    invoke-super {p0}, Landroid/widget/RelativeLayout;->onDetachedFromWindow()V

    return-void
.end method

.method public onLoading()V
    .locals 0

    return-void
.end method

.method public onPaused()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->updateStatus()V

    return-void
.end method

.method public onPlaying()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->updateStatus()V

    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mSbSeek:Landroid/widget/SeekBar;

    if-ne p1, v0, :cond_1

    if-nez p3, :cond_0

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    invoke-virtual {p1}, Lcom/miui/gallery/projection/ConnectController;->getCurrentPosition()I

    iget-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    invoke-virtual {p1}, Lcom/miui/gallery/projection/ConnectController;->getDuration()I

    move-result p1

    int-to-long v0, p1

    int-to-long p1, p2

    mul-long v0, v0, p1

    const-wide/16 p1, 0x64

    div-long/2addr v0, p1

    iget-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    long-to-int p2, v0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/projection/ConnectController;->seekTo(I)V

    iget-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mTvCurPos:Landroid/widget/TextView;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mTvCurPos:Landroid/widget/TextView;

    const-wide/16 p2, 0x3e8

    div-long/2addr v0, p2

    invoke-static {v0, v1}, Lcom/miui/gallery/util/FormatUtil;->formatVideoDuration(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mSbSeek:Landroid/widget/SeekBar;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mDragging:Z

    iget-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    invoke-virtual {p1}, Lcom/miui/gallery/projection/ConnectController;->pause()V

    invoke-virtual {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->updateStatus()V

    :cond_0
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mSbSeek:Landroid/widget/SeekBar;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mDragging:Z

    iget-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    invoke-virtual {p1}, Lcom/miui/gallery/projection/ConnectController;->resume()V

    invoke-virtual {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->updateStatus()V

    :cond_0
    return-void
.end method

.method public onStopped()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->updateStatus()V

    invoke-virtual {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->stopPlay()V

    return-void
.end method

.method public setOnFinishListener(Lcom/miui/gallery/projection/ProjectionVideoController$OnFinishListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mFinishListener:Lcom/miui/gallery/projection/ProjectionVideoController$OnFinishListener;

    return-void
.end method

.method public startPlay(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->clearStatus()V

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/projection/ConnectController;->playVideo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    invoke-virtual {p1}, Lcom/miui/gallery/projection/ConnectController;->resume()V

    iget-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/projection/ConnectController;->registMediaPlayListener(Lcom/miui/gallery/projection/ConnectController$MediaPlayListener;)V

    iget-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mHandler:Landroid/os/Handler;

    const/16 p2, 0x64

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeMessages(I)V

    iget-object p1, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public stopPlay()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    invoke-virtual {v0}, Lcom/miui/gallery/projection/ConnectController;->stop()V

    invoke-virtual {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->clearStatus()V

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mFinishListener:Lcom/miui/gallery/projection/ProjectionVideoController$OnFinishListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mFinishListener:Lcom/miui/gallery/projection/ProjectionVideoController$OnFinishListener;

    invoke-interface {v0}, Lcom/miui/gallery/projection/ProjectionVideoController$OnFinishListener;->onFinish()V

    :cond_0
    return-void
.end method

.method public updateStatus()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mConnectControl:Lcom/miui/gallery/projection/ConnectController;

    invoke-virtual {v0}, Lcom/miui/gallery/projection/ConnectController;->isPlaying()Z

    move-result v0

    const/16 v1, 0x64

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mIvPause:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->getPauseImageResId()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mIvPause:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/miui/gallery/projection/ProjectionVideoController;->getPlayImageResId()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ProjectionVideoController;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    :goto_0
    return-void
.end method
