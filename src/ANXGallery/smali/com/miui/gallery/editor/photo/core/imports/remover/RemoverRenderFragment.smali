.class public Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;
.super Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;
.source "RemoverRenderFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/app/RenderRecord;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$ProgressRunnable;,
        Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$CustomCallback;
    }
.end annotation


# instance fields
.field private mCallback:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$RemoverCallback;

.field private mCanBackToOrigin:Z

.field private mCompareButton:Landroid/widget/Button;

.field private mCurrIterator:Ljava/util/ListIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ListIterator<",
            "Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mMenuUpdateListener:Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;

.field private mPaintSize:F

.field private mProgressBar:Landroid/widget/ProgressBar;

.field private mProgressRunnable:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$ProgressRunnable;

.field private mRecordCurr:I

.field private mRecordHead:I

.field private mRecordListTail:I

.field private mRecordTail:I

.field private mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

.field private mRemoverPaintData:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;

.field private mRemoverPaintDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverPaintDataList:Ljava/util/List;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverPaintDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCurrIterator:Ljava/util/ListIterator;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordHead:I

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    new-instance v0, Landroid/os/Handler;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$CustomCallback;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$CustomCallback;-><init>(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;)V

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$ProgressRunnable;

    invoke-direct {v0, p0, v2}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$ProgressRunnable;-><init>(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mProgressRunnable:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$ProgressRunnable;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCanBackToOrigin:Z

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCallback:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$RemoverCallback;

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Landroid/widget/Button;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCompareButton:Landroid/widget/Button;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mMenuUpdateListener:Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$ProgressRunnable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mProgressRunnable:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment$ProgressRunnable;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)Landroid/widget/ProgressBar;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mProgressBar:Landroid/widget/ProgressBar;

    return-object p0
.end method

.method static synthetic access$702(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;)Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverPaintData:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;

    return-object p1
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    return p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordHead:I

    return p0
.end method

.method public static synthetic lambda$onCreateView$83(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v0, 0x1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->drawOrigin(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCompareButton:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setSelected(Z)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p2, "page"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mEffect:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/Effect;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "photo_editor"

    const-string v1, "compare_button_touch"

    invoke-static {p2, v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-eq v0, p1, :cond_1

    const/4 p1, 0x3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p2

    if-ne p1, p2, :cond_2

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->drawOrigin(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCompareButton:Landroid/widget/Button;

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setSelected(Z)V

    :cond_2
    :goto_0
    return v0
.end method


# virtual methods
.method public clear()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->onClear()V

    return-void
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverPaintDataList:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverPaintDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public nextRecord()V
    .locals 6

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    rem-int/lit8 v0, v0, 0xa

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCurrIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCurrIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCurrIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->previousIndex()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordListTail:I

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->renderNextBuffer()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mMenuUpdateListener:Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mMenuUpdateListener:Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordHead:I

    if-eq v3, v4, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    iget v5, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordTail:I

    if-eq v4, v5, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    invoke-interface {v0, v3, v1}, Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;->onMenuUpdated(ZZ)V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCompareButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/remover/Inpaint;->initialize()Z

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    const/4 p3, 0x0

    const v0, 0x7f0b0126

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    const p2, 0x7f090261

    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    const p2, 0x7f090232

    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ProgressBar;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mProgressBar:Landroid/widget/ProgressBar;

    const p2, 0x7f0900aa

    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCompareButton:Landroid/widget/Button;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCallback:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$RemoverCallback;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->setRemoverCallback(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$RemoverCallback;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mPaintSize:F

    float-to-int v0, v0

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->setStrokeSize(I)Z

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCompareButton:Landroid/widget/Button;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/remover/-$$Lambda$RemoverRenderFragment$tulFd60_c7y3lD-cYOraMrLJqxM;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/-$$Lambda$RemoverRenderFragment$tulFd60_c7y3lD-cYOraMrLJqxM;-><init>(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;)V

    invoke-virtual {p2, v0}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCanBackToOrigin:Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-static {p2}, Lcom/android/internal/WindowCompat;->isNotch(Landroid/app/Activity;)Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-static {p2}, Lcom/android/internal/WindowCompat;->getTopNotchHeight(Landroid/app/Activity;)I

    move-result p3

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/miui/gallery/util/MiscUtil;->checkNavigationBarShow(Landroid/content/Context;Landroid/view/Window;)Z

    move-result p2

    if-nez p2, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->isNear3V4()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0601be

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0601ba

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0601bf

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0601bb

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->isNear3V4()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0601c0

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0601bc

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0601c1

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0601bd

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCompareButton:Landroid/widget/Button;

    invoke-virtual {v1}, Landroid/widget/Button;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    add-int/2addr p2, p3

    iput p2, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCompareButton:Landroid/widget/Button;

    invoke-virtual {p2, v1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object p1
.end method

.method protected onExport()Lcom/miui/gallery/editor/photo/core/RenderData;
    .locals 3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverPaintDataList:Ljava/util/List;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverPaintDataList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordListTail:I

    if-gt v1, v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverPaintDataList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderData;

    invoke-direct {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderData;-><init>(Ljava/util/List;)V

    return-object v1
.end method

.method protected onSample()Ljava/util/List;
    .locals 2
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

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordListTail:I

    add-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public previousRecord()V
    .locals 6

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    rem-int/lit8 v0, v0, 0xa

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    if-gez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    add-int/lit8 v0, v0, 0xa

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    :cond_0
    const-string v0, "RemoverRenderFragment"

    const-string v2, "previousRecord  mRecordCurr : %d"

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCurrIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCurrIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCurrIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->previousIndex()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordListTail:I

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->renderPreviousBuffer()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mMenuUpdateListener:Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mMenuUpdateListener:Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordHead:I

    const/4 v4, 0x0

    if-eq v2, v3, :cond_2

    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_0
    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    iget v5, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordTail:I

    if-eq v3, v5, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :goto_1
    invoke-interface {v0, v2, v1}, Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;->onMenuUpdated(ZZ)V

    :cond_4
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCanBackToOrigin:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCompareButton:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    :cond_5
    return-void
.end method

.method public recordCurrent()V
    .locals 4

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    add-int/lit8 v0, v0, 0x1

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCanBackToOrigin:Z

    :cond_0
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    add-int/lit8 v0, v0, 0x1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordTail:I

    const-string v0, "RemoverRenderFragment"

    const-string v2, "recordCurrent  mRecordCurr : %d"

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordHead:I

    if-ne v0, v2, :cond_1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordCurr:I

    add-int/lit8 v0, v0, 0x1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordHead:I

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCurrIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCurrIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCurrIterator:Ljava/util/ListIterator;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverPaintData:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;

    invoke-interface {v0, v1}, Ljava/util/ListIterator;->set(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCurrIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->previousIndex()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordListTail:I

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCurrIterator:Ljava/util/ListIterator;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverPaintData:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;

    invoke-interface {v0, v1}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mCurrIterator:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->previousIndex()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRecordListTail:I

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->writeRecordFile()V

    return-void
.end method

.method public setMenuUpdateListener(Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mMenuUpdateListener:Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;

    return-void
.end method

.method public setPaintSize(F)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mPaintSize:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    float-to-int p1, p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->setStrokeSize(I)Z

    :cond_0
    return-void
.end method

.method public setRemoverData(Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget v0, p1, Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;->mType:I

    if-nez v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$ElementType;->FREE:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$ElementType;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->setElementType(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$ElementType;)Z

    goto :goto_0

    :cond_1
    iget p1, p1, Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;->mType:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->mRemoverGestureView:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$ElementType;->LINE:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$ElementType;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->setElementType(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$ElementType;)Z

    :cond_2
    :goto_0
    return-void
.end method
