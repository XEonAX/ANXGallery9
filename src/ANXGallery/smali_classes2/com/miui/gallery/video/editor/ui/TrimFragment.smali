.class public Lcom/miui/gallery/video/editor/ui/TrimFragment;
.super Lcom/miui/gallery/video/editor/ui/MenuFragment;
.source "TrimFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/editor/ui/TrimFragment$MyStateChangeListener;
    }
.end annotation


# instance fields
.field private mCancelView:Landroid/view/View;

.field private mHasCliped:Z

.field private mIsModified:Z

.field private mOkView:Landroid/view/View;

.field private mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

.field private mSavedEndRange:I

.field private mSavedStartRange:I

.field private mStateChangeListener:Lcom/miui/gallery/video/editor/ui/TrimFragment$MyStateChangeListener;

.field private mTitleView:Landroid/widget/TextView;

.field private mTvVideoTime:Landroid/widget/TextView;

.field private needResetTrimInfo:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mSavedStartRange:I

    iput v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mSavedEndRange:I

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->needResetTrimInfo:Z

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mIsModified:Z

    new-instance v0, Lcom/miui/gallery/video/editor/ui/TrimFragment$MyStateChangeListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/video/editor/ui/TrimFragment$MyStateChangeListener;-><init>(Lcom/miui/gallery/video/editor/ui/TrimFragment;Lcom/miui/gallery/video/editor/ui/TrimFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mStateChangeListener:Lcom/miui/gallery/video/editor/ui/TrimFragment$MyStateChangeListener;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/video/editor/ui/TrimFragment;)Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    return-object p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/video/editor/ui/TrimFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->needResetTrimInfo:Z

    return p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/video/editor/ui/TrimFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mSavedStartRange:I

    return p0
.end method

.method static synthetic access$302(Lcom/miui/gallery/video/editor/ui/TrimFragment;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mSavedStartRange:I

    return p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/video/editor/ui/TrimFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mSavedEndRange:I

    return p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/video/editor/ui/TrimFragment;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mSavedEndRange:I

    return p1
.end method

.method static synthetic access$502(Lcom/miui/gallery/video/editor/ui/TrimFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mIsModified:Z

    return p1
.end method

.method private getCurrentVideoTime(I)Ljava/lang/String;
    .locals 4

    const v0, 0xea60

    div-int v0, p1, v0

    mul-int/lit8 v1, v0, 0x3c

    mul-int/lit16 v1, v1, 0x3e8

    sub-int/2addr p1, v1

    div-int/lit16 p1, p1, 0x3e8

    const/16 v1, 0xa

    if-lt v0, v1, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ""

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    if-lez v0, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v0, "00"

    :goto_0
    if-lt p1, v1, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ":"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_2
    const/4 v1, 0x1

    if-lt p1, v1, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ":0"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ":01"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_1
    return-object p1
.end method

.method private initListener()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mOkView:Landroid/view/View;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/-$$Lambda$TrimFragment$pYXNIwyE-w5r5x-29PlBzhnLJHY;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/-$$Lambda$TrimFragment$pYXNIwyE-w5r5x-29PlBzhnLJHY;-><init>(Lcom/miui/gallery/video/editor/ui/TrimFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mCancelView:Landroid/view/View;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/-$$Lambda$TrimFragment$prEj4F8kL63lxwetFho6Rl0MqZg;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/-$$Lambda$TrimFragment$prEj4F8kL63lxwetFho6Rl0MqZg;-><init>(Lcom/miui/gallery/video/editor/ui/TrimFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public static synthetic lambda$initListener$106(Lcom/miui/gallery/video/editor/ui/TrimFragment;Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/TrimFragment;->doApply()Z

    return-void
.end method

.method public static synthetic lambda$initListener$107(Lcom/miui/gallery/video/editor/ui/TrimFragment;Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/TrimFragment;->doCancel()Z

    return-void
.end method

.method private updateAutoTrimView()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mCallback:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mCallback:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;

    invoke-interface {v0}, Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;->updateAutoTrimView()V

    :cond_0
    return-void
.end method


# virtual methods
.method public doApply()Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->isTouching()Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-nez v0, :cond_1

    const-string v0, "TrimFragment"

    const-string v2, "doApply: videoEditor is null."

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getStartRange()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getEndRange()I

    move-result v1

    if-ge v0, v1, :cond_2

    sub-int v2, v1, v0

    const/16 v3, 0x3e8

    if-le v2, v3, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v2, v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->setTrimInfo(II)V

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    new-instance v3, Lcom/miui/gallery/video/editor/ui/TrimFragment$4;

    invoke-direct {v3, p0, v0, v1}, Lcom/miui/gallery/video/editor/ui/TrimFragment$4;-><init>(Lcom/miui/gallery/video/editor/ui/TrimFragment;II)V

    invoke-virtual {v2, v0, v1, v3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->lockRangeTo(IILcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f100746

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/TrimFragment;->onExitMode()V

    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public doCancel()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "TrimFragment"

    const-string v2, "doCancel: videoEditor is null."

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->isZooming()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->isTouching()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mHasCliped:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget v1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mSavedStartRange:I

    iget v2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mSavedEndRange:I

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/video/editor/VideoEditor;->setTrimInfo(II)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/TrimFragment$5;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/TrimFragment$5;-><init>(Lcom/miui/gallery/video/editor/ui/TrimFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    move-result v0

    return v0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/TrimFragment;->onExitMode()V

    const/4 v0, 0x1

    return v0

    :cond_3
    :goto_0
    return v1
.end method

.method public getCurrentEffect()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public getEffectId()I
    .locals 1

    const v0, 0x7f09033e

    return v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Lcom/miui/gallery/video/editor/ui/menu/TrimView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/video/editor/ui/menu/TrimView;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public onDestroyView()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->onDestroyView()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mStateChangeListener:Lcom/miui/gallery/video/editor/ui/TrimFragment$MyStateChangeListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->removeStateChangeListener(Lcom/miui/gallery/video/editor/VideoEditor$StateChangeListener;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/TrimFragment;->updateAutoTrimView()V

    return-void
.end method

.method public onPlayButtonClicked()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->getState()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mIsModified:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getStartRange()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getEndRange()I

    move-result v1

    if-ge v0, v1, :cond_1

    sub-int v2, v1, v0

    const/16 v3, 0x3e8

    if-le v2, v3, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v2, v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->setTrimInfo(II)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/TrimFragment$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/TrimFragment$3;-><init>(Lcom/miui/gallery/video/editor/ui/TrimFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mIsModified:Z

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mContext:Landroid/content/Context;

    const v1, 0x7f100746

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onProgressChanged(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;IIZ)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getEndRange()I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getStartRange()I

    move-result p2

    sub-int/2addr p1, p2

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    const-string p4, "00:01"

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/ui/TrimFragment;->getCurrentVideoTime(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    invoke-virtual {p2, p4}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->setStopSlide(Z)V

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget-object p4, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p4}, Lcom/miui/gallery/video/editor/VideoEditor;->getVideoStartTime()I

    move-result p4

    add-int/2addr p4, p3

    const/4 p3, 0x0

    invoke-virtual {p2, p4, p3}, Lcom/miui/gallery/video/editor/VideoEditor;->seek(ILcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mIsModified:Z

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {p3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->hideProgressBar()V

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mTvVideoTime:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/ui/TrimFragment;->getCurrentVideoTime(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iput-boolean p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mHasCliped:Z

    return-void
.end method

.method public onProgressPreview(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;IIZ)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/VideoEditor;->getVideoTotalTime()I

    move-result p1

    int-to-double p1, p1

    iget-object p4, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p4}, Lcom/miui/gallery/video/editor/VideoEditor;->getProjectTotalTime()I

    move-result p4

    int-to-double v0, p4

    int-to-double p3, p3

    invoke-static {p3, p4}, Ljava/lang/Double;->isNaN(D)Z

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double p3, p3, v0

    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr p3, p1

    double-to-int p1, p3

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    const/4 p3, 0x0

    invoke-virtual {p2, p1, p3}, Lcom/miui/gallery/video/editor/VideoEditor;->seek(ILcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;II)V
    .locals 1

    iget-boolean p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->needResetTrimInfo:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    const/4 p3, 0x0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->getVideoTotalTime()I

    move-result v0

    invoke-virtual {p1, p3, v0}, Lcom/miui/gallery/video/editor/VideoEditor;->setTrimInfo(II)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    new-instance p3, Lcom/miui/gallery/video/editor/ui/TrimFragment$6;

    invoke-direct {p3, p0, p2}, Lcom/miui/gallery/video/editor/ui/TrimFragment$6;-><init>(Lcom/miui/gallery/video/editor/ui/TrimFragment;I)V

    invoke-virtual {p1, p3}, Lcom/miui/gallery/video/editor/VideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/TrimFragment;->recordEventWithEffectChanged()V

    return-void
.end method

.method public onVideoLoadCompleted()V
    .locals 4

    invoke-super {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->onVideoLoadCompleted()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/VideoEditor;->getVideoTotalTime()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->setTotal(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/VideoEditor;->getProjectTotalTime()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->setMax(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->getVideoTotalTime()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mSavedEndRange:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mSavedStartRange:I

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->setStartRange(I)V

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v2}, Lcom/miui/gallery/video/editor/VideoEditor;->getVideoTotalTime()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->setEndRange(I)V

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v2}, Lcom/miui/gallery/video/editor/VideoEditor;->getVideoTotalTime()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->lockRangeTo(IILcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mTvVideoTime:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/VideoEditor;->getProjectTotalTime()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/miui/gallery/video/editor/ui/TrimFragment;->getCurrentVideoTime(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    const-string v1, "00:01"

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v2}, Lcom/miui/gallery/video/editor/VideoEditor;->getVideoTotalTime()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/miui/gallery/video/editor/ui/TrimFragment;->getCurrentVideoTime(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->setStopSlide(Z)V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/TrimFragment;->updateAutoTrimView()V

    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f090073

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mCancelView:Landroid/view/View;

    const p2, 0x7f0901f9

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mOkView:Landroid/view/View;

    const p2, 0x7f0902fa

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mTitleView:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mTitleView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f100773

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const p2, 0x7f09033f

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {p2, p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->setOnSeekBarChangeListener(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;)V

    const p2, 0x7f09030c

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mTvVideoTime:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/VideoEditor;->getVideoTotalTime()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->setTotal(I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/VideoEditor;->getProjectTotalTime()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->setMax(I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getStartRange()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mSavedStartRange:I

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getEndRange()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mSavedEndRange:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->needResetTrimInfo:Z

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mTvVideoTime:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/VideoEditor;->getProjectTotalTime()I

    move-result p2

    invoke-direct {p0, p2}, Lcom/miui/gallery/video/editor/ui/TrimFragment;->getCurrentVideoTime(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    new-instance p2, Lcom/miui/gallery/video/editor/ui/TrimFragment$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/video/editor/ui/TrimFragment$1;-><init>(Lcom/miui/gallery/video/editor/ui/TrimFragment;)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->setBitmapProvider(Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable$BitmapProvider;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/VideoEditor;->getCurrentDisplayRatio()F

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->setThumbnailAspectRatio(F)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mStateChangeListener:Lcom/miui/gallery/video/editor/ui/TrimFragment$MyStateChangeListener;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/VideoEditor;->addStateChangeListener(Lcom/miui/gallery/video/editor/VideoEditor$StateChangeListener;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    new-instance p2, Lcom/miui/gallery/video/editor/ui/TrimFragment$2;

    invoke-direct {p2, p0}, Lcom/miui/gallery/video/editor/ui/TrimFragment$2;-><init>(Lcom/miui/gallery/video/editor/ui/TrimFragment;)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/VideoEditor;->setOnVideoThumbnailChangedListener(Lcom/miui/gallery/video/editor/VideoEditor$OnVideoThumbnailChangedListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/TrimFragment;->updateAutoTrimView()V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/TrimFragment;->initListener()V

    return-void
.end method

.method public onViewStateRestored(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->onViewStateRestored(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->getVideoTotalTime()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->setTotal(I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->getProjectTotalTime()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->setMax(I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getStartRange()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mSavedStartRange:I

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mRangeSeekBar:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getEndRange()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/editor/ui/TrimFragment;->mSavedEndRange:I

    return-void
.end method
