.class Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PhotoMaskManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;,
        Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;
    }
.end annotation


# instance fields
.field private final OUT_OF_VIEWPORT_SLOP:I

.field private mActionBarHeight:I

.field private mBarDividerRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;

.field private mBarMaskRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;

.field private mMaskView:Lcom/miui/gallery/ui/PhotoPageMaskView;

.field private mSplitBarHeight:I

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->OUT_OF_VIEWPORT_SLOP:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mActionBarHeight:I

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mSplitBarHeight:I

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mMaskView:Lcom/miui/gallery/ui/PhotoPageMaskView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mMaskView:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageMaskView;->setHost(Lcom/miui/gallery/app/BottomMenuFragment;)V

    :cond_0
    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;)Lcom/miui/gallery/ui/PhotoPageMaskView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mMaskView:Lcom/miui/gallery/ui/PhotoPageMaskView;

    return-object p0
.end method

.method private removeRefreshDividerRunnable()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarDividerRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarDividerRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarDividerRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;

    :cond_0
    return-void
.end method

.method private removeRefreshMaskRunnable()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarMaskRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarMaskRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarMaskRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;

    :cond_0
    return-void
.end method


# virtual methods
.method public getSplitBarHeight()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mSplitBarHeight:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getMenuCollapsedHeight()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mSplitBarHeight:I

    :cond_0
    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mSplitBarHeight:I

    if-gtz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->getDefaultSplitActionBarHeight(Landroid/content/Context;)I

    move-result v0

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mSplitBarHeight:I

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/compat/view/ViewCompat;->getSystemWindowInsetBottom(Landroid/view/View;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getTopBarHeight()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mActionBarHeight:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1100(Lcom/miui/gallery/ui/PhotoPageFragment;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mActionBarHeight:I

    :cond_0
    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mActionBarHeight:I

    return v0
.end method

.method public hideMaskImmediately()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mMaskView:Lcom/miui/gallery/ui/PhotoPageMaskView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mMaskView:Lcom/miui/gallery/ui/PhotoPageMaskView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageMaskView;->setActionBarDividerVisible(Z)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mMaskView:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageMaskView;->setSplitBarDividerVisible(Z)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mMaskView:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-virtual {v0, v1, v1}, Lcom/miui/gallery/ui/PhotoPageMaskView;->setActionBarMaskVisible(ZZ)Z

    return-void
.end method

.method public refreshMask(Z)V
    .locals 12

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mMaskView:Lcom/miui/gallery/ui/PhotoPageMaskView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->getCurItemDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_1

    iget v4, v0, Landroid/graphics/RectF;->top:F

    add-float/2addr v4, v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->getTopBarHeight()I

    move-result v5

    int-to-float v5, v5

    cmpg-float v4, v4, v5

    if-gez v4, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    :goto_0
    if-eqz v0, :cond_2

    iget v5, v0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v5, v1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->getSplitBarHeight()I

    move-result v6

    sub-int/2addr v1, v6

    int-to-float v1, v1

    cmpl-float v1, v5, v1

    if-lez v1, :cond_2

    const/4 v1, 0x1

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    iget-object v5, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v5}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1200(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v5

    if-eqz v5, :cond_3

    if-eqz v4, :cond_3

    const/4 v6, 0x1

    goto :goto_2

    :cond_3
    const/4 v6, 0x0

    :goto_2
    if-eqz v5, :cond_4

    if-eqz v1, :cond_4

    const/4 v7, 0x1

    goto :goto_3

    :cond_4
    const/4 v7, 0x0

    :goto_3
    if-eqz v5, :cond_7

    if-nez v6, :cond_5

    if-eqz v7, :cond_7

    :cond_5
    iget-object v8, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarDividerRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;

    if-eqz v8, :cond_7

    iget-object v8, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarDividerRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;

    iget-boolean v8, v8, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;->isShowTopDivider:Z

    if-nez v8, :cond_6

    iget-object v8, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarDividerRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;

    iget-boolean v8, v8, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;->isShowBottomDivider:Z

    if-eqz v8, :cond_7

    :cond_6
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v8

    iget-object v9, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarDividerRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;

    invoke-virtual {v8, v9}, Lcom/android/internal/CompatHandler;->hasCallbacksCompat(Ljava/lang/Runnable;)Z

    move-result v8

    if-eqz v8, :cond_7

    const/4 v8, 0x1

    goto :goto_4

    :cond_7
    const/4 v8, 0x0

    :goto_4
    const v9, 0x7f0a002b

    if-nez v8, :cond_9

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->removeRefreshDividerRunnable()V

    new-instance v8, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;

    invoke-direct {v8, p0, v6, v7}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;ZZ)V

    iput-object v8, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarDividerRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;

    if-eqz v5, :cond_8

    if-eqz p1, :cond_8

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v6

    iget-object v7, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarDividerRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;

    iget-object v8, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v8}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v8

    int-to-long v10, v8

    invoke-virtual {v6, v7, v10, v11}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_5

    :cond_8
    iget-object v6, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarDividerRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;

    invoke-virtual {v6}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarDividerRunnable;->run()V

    :cond_9
    :goto_5
    if-eqz v0, :cond_b

    if-nez v4, :cond_b

    if-eqz v1, :cond_a

    goto :goto_6

    :cond_a
    const/4 v0, 0x0

    goto :goto_7

    :cond_b
    :goto_6
    const/4 v0, 0x1

    :goto_7
    if-eqz p1, :cond_d

    if-nez v0, :cond_c

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->isExiting()Z

    move-result v1

    if-eqz v1, :cond_d

    :cond_c
    const/4 v1, 0x1

    goto :goto_8

    :cond_d
    const/4 v1, 0x0

    :goto_8
    if-eqz v5, :cond_f

    if-nez v0, :cond_f

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarMaskRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;

    if-eqz v4, :cond_e

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarMaskRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;

    iget-boolean v4, v4, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;->isShowMask:Z

    if-eqz v4, :cond_e

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v4

    iget-object v6, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarMaskRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;

    invoke-virtual {v4, v6}, Lcom/android/internal/CompatHandler;->hasCallbacksCompat(Ljava/lang/Runnable;)Z

    move-result v4

    if-eqz v4, :cond_e

    goto :goto_9

    :cond_e
    const/4 v2, 0x0

    :goto_9
    if-eqz v2, :cond_f

    return-void

    :cond_f
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->removeRefreshMaskRunnable()V

    new-instance v2, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;

    invoke-direct {v2, p0, v5, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;ZZ)V

    iput-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarMaskRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;

    if-eqz v5, :cond_10

    if-nez v0, :cond_10

    if-eqz p1, :cond_10

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarMaskRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v9}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_a

    :cond_10
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mBarMaskRunnable:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;->run()V

    :goto_a
    return-void
.end method

.method public release()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->removeRefreshDividerRunnable()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->removeRefreshMaskRunnable()V

    return-void
.end method

.method public showMaskImmediately()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mMaskView:Lcom/miui/gallery/ui/PhotoPageMaskView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mMaskView:Lcom/miui/gallery/ui/PhotoPageMaskView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageMaskView;->setActionBarDividerVisible(Z)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mMaskView:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageMaskView;->setSplitBarDividerVisible(Z)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->mMaskView:Lcom/miui/gallery/ui/PhotoPageMaskView;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/PhotoPageMaskView;->setActionBarMaskVisible(ZZ)Z

    return-void
.end method
