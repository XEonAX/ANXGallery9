.class abstract Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;
.super Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "TransitionEditorManager"
.end annotation


# instance fields
.field private mEverStartedEditor:Z

.field private mOnLoadTimeOut:Ljava/lang/Runnable;

.field private mStartTransition:J

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mEverStartedEditor:Z

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mOnLoadTimeOut:Ljava/lang/Runnable;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    return-void
.end method

.method static synthetic access$6400(Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->finishTransition()V

    return-void
.end method

.method private finishTransition()V
    .locals 6

    const-string v0, "PhotoPageFragment"

    const-string v1, "editor transition delay %s"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mStartTransition:J

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mOnLoadTimeOut:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/compat/app/ActivityCompat;->startPostponedEnterTransition(Landroid/app/Activity;)V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mTargetFilePath:Ljava/lang/String;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mTargetId:J

    return-void
.end method

.method private hasExportedMeasure(Landroid/content/Intent;)Z
    .locals 1

    if-eqz p1, :cond_0

    const-string v0, "photo_edit_exported_width"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "photo_edit_exported_height"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isCurrentImageOverDisplayArea()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->getCurItemDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->isImageOverDisplayArea(FF)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isExportedImageOverDisplayArea(Landroid/content/Intent;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    const-string v1, "photo_edit_exported_width"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const-string v2, "photo_edit_exported_height"

    invoke-virtual {p1, v2, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    int-to-float v0, v1

    int-to-float p1, p1

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->isImageOverDisplayArea(FF)Z

    move-result p1

    return p1
.end method

.method private isImageOverDisplayArea(FF)Z
    .locals 5

    const/4 v0, 0x0

    cmpg-float v1, p1, v0

    const/4 v2, 0x0

    if-lez v1, :cond_4

    cmpg-float v1, p2, v0

    if-lez v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2000(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    move-result-object v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    div-float/2addr p2, p1

    const p1, 0x3fab851f    # 1.34f

    cmpg-float p1, p2, p1

    if-gtz p1, :cond_1

    return v2

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/ViewPager;->getWidth()I

    move-result p1

    int-to-float p1, p1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getHeight()I

    move-result v1

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2000(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->getSplitBarHeight()I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2000(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->getTopBarHeight()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    sub-int/2addr v1, v3

    int-to-float v1, v1

    cmpl-float v3, p1, v0

    if-lez v3, :cond_3

    cmpl-float v0, v1, v0

    if-lez v0, :cond_3

    div-float/2addr v1, p1

    cmpl-float p1, p2, v1

    if-lez p1, :cond_2

    const/4 v2, 0x1

    :cond_2
    return v2

    :cond_3
    return v2

    :cond_4
    :goto_0
    return v2
.end method


# virtual methods
.method protected abstract handleEditorResult(Landroid/content/Intent;)Z
.end method

.method public onActivityReenter(Landroid/content/Intent;)V
    .locals 3

    const-string v0, "PhotoPageFragment"

    const-string v1, "Transition onActivityReenter %s"

    iget-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mEverStartedEditor:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->hasExportedMeasure(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->isExportedImageOverDisplayArea(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$6200(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$6300(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    :cond_1
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mTargetFilePath:Ljava/lang/String;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mTargetId:J

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->resume()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->handleEditorResult(Landroid/content/Intent;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mResultHandled:Z

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x17

    if-gt p1, v0, :cond_2

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mEverStartedEditor:Z

    if-nez p1, :cond_2

    const-string p1, "PhotoPageFragment"

    const-string v0, "Transition stop, because activity restart."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mResultHandled:Z

    if-eqz p1, :cond_3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mStartTransition:J

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p1}, Lcom/miui/gallery/compat/app/ActivityCompat;->postponeEnterTransition(Landroid/app/Activity;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mOnLoadTimeOut:Ljava/lang/Runnable;

    const-wide/16 v1, 0x7d0

    invoke-virtual {p1, v0, v1, v2}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_3
    return-void
.end method

.method public onActivityResult(ILandroid/content/Intent;)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->onActivityResult(ILandroid/content/Intent;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$6300(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2300(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2300(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->onActivityResult()V

    :cond_0
    const/4 v0, -0x1

    if-ne p1, v0, :cond_2

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mResultHandled:Z

    if-nez p1, :cond_1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->handleEditorResult(Landroid/content/Intent;)Z

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mTargetFilePath:Ljava/lang/String;

    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mTargetId:J

    :cond_1
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mResultHandled:Z

    goto :goto_0

    :cond_2
    if-nez p1, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->onCanceled()V

    :cond_3
    :goto_0
    return-void
.end method

.method protected onCanceled()V
    .locals 0

    return-void
.end method

.method public onImageLoadFinish(Ljava/lang/String;)V
    .locals 5

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->onImageLoadFinish(Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mTargetId:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->finishTransition()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mTargetFilePath:Ljava/lang/String;

    if-eqz v0, :cond_3

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mTargetFilePath:Ljava/lang/String;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->finishTransition()V

    :cond_2
    return-void

    :cond_3
    :goto_0
    return-void
.end method

.method public onStartEditor()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->onStartEditor()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mEverStartedEditor:Z

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->isCurrentImageOverDisplayArea()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$6200(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->onActivityTransition()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2300(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2300(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->onActivityTransition()V

    :cond_2
    return-void
.end method

.method public release()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->release()V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->mOnLoadTimeOut:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method
