.class Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SmartVideoGuideManager"
.end annotation


# instance fields
.field private mGuideView:Lmiui/widget/GuidePopupWindow;

.field private mLastHFRVideoPath:Ljava/lang/String;

.field private mShowGuidanceRunnable:Ljava/lang/Runnable;

.field private mSmartVideoGuideHelper:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;

.field private mVideoPath:Ljava/lang/String;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;

    invoke-direct {p1}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mSmartVideoGuideHelper:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mSmartVideoGuideHelper:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->setSmartVideoGuideListener(Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideListener;)V

    return-void
.end method

.method static synthetic access$5100(Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;)Lmiui/widget/GuidePopupWindow;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mGuideView:Lmiui/widget/GuidePopupWindow;

    return-object p0
.end method

.method static synthetic access$5200(Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mLastHFRVideoPath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$5300(Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mVideoPath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$5400(Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->doShowGuidance()V

    return-void
.end method

.method private dismissGuidance()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mShowGuidanceRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mShowGuidanceRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mGuideView:Lmiui/widget/GuidePopupWindow;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mGuideView:Lmiui/widget/GuidePopupWindow;

    invoke-virtual {v0}, Lmiui/widget/GuidePopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mGuideView:Lmiui/widget/GuidePopupWindow;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lmiui/widget/GuidePopupWindow;->dismiss(Z)V

    :cond_1
    return-void
.end method

.method private doShowGuidance()V
    .locals 3

    new-instance v0, Lmiui/widget/GuidePopupWindow;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v1}, Lmiui/widget/GuidePopupWindow;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mGuideView:Lmiui/widget/GuidePopupWindow;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mGuideView:Lmiui/widget/GuidePopupWindow;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lmiui/widget/GuidePopupWindow;->setArrowMode(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mGuideView:Lmiui/widget/GuidePopupWindow;

    const v2, 0x7f1003a8

    invoke-virtual {v0, v2}, Lmiui/widget/GuidePopupWindow;->setGuideText(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    const v2, 0x7f09000d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mGuideView:Lmiui/widget/GuidePopupWindow;

    invoke-virtual {v2, v0, v1}, Lmiui/widget/GuidePopupWindow;->show(Landroid/view/View;Z)V

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->setHasGuided(Z)V

    :cond_0
    return-void
.end method

.method private getShowGuidanceRunnable()Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mShowGuidanceRunnable:Ljava/lang/Runnable;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mShowGuidanceRunnable:Ljava/lang/Runnable;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mShowGuidanceRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method private preventGuide(Lcom/miui/gallery/model/BaseDataItem;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1200(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method


# virtual methods
.method public onActionBarVisibilityChanged(Z)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->updateItem(Lcom/miui/gallery/model/BaseDataItem;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->dismissGuidance()V

    :goto_0
    return-void
.end method

.method public release()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mSmartVideoGuideHelper:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mSmartVideoGuideHelper:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->release()V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->dismissGuidance()V

    return-void
.end method

.method public showGuideView(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mGuideView:Lmiui/widget/GuidePopupWindow;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1200(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mVideoPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mLastHFRVideoPath:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mShowGuidanceRunnable:Ljava/lang/Runnable;

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mShowGuidanceRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_1
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->getShowGuidanceRunnable()Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v1, 0x17c

    invoke-virtual {p1, v0, v1, v2}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method public updateItem(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->hasGuided()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->preventGuide(Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mLastHFRVideoPath:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->dismissGuidance()V

    goto :goto_0

    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mVideoPath:Ljava/lang/String;

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mSmartVideoGuideHelper:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;

    if-eqz v0, :cond_3

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->preventGuide(Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mSmartVideoGuideHelper:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SmartVideoGuideManager;->mVideoPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->handleHighFrameRate(Ljava/lang/String;)V

    :cond_3
    :goto_0
    return-void
.end method
