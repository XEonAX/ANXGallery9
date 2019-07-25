.class public Lcom/miui/gallery/ui/SearchFeedbackTaskController;
.super Ljava/lang/Object;
.source "SearchFeedbackTaskController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/SearchFeedbackTaskController$FeedbackInfoQueryTask;
    }
.end annotation


# instance fields
.field private mFragment:Lmiui/app/Fragment;

.field private mIndicator:Landroid/view/View;

.field private mProgress:Landroid/widget/TextView;

.field private mResumed:Z

.field private mTaskStatus:I


# direct methods
.method public constructor <init>(Lmiui/app/Fragment;Landroid/view/View;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mTaskStatus:I

    iput-object p1, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mFragment:Lmiui/app/Fragment;

    iput-object p2, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mIndicator:Landroid/view/View;

    iget-object p1, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mIndicator:Landroid/view/View;

    const p2, 0x7f090123

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mProgress:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mIndicator:Landroid/view/View;

    new-instance p2, Lcom/miui/gallery/ui/SearchFeedbackTaskController$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/ui/SearchFeedbackTaskController$1;-><init>(Lcom/miui/gallery/ui/SearchFeedbackTaskController;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->hideIndicator()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/SearchFeedbackTaskController;II)I
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->getFeedbackTaskStatus(II)I

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/SearchFeedbackTaskController;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mResumed:Z

    return p0
.end method

.method static synthetic access$302(Lcom/miui/gallery/ui/SearchFeedbackTaskController;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mTaskStatus:I

    return p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/SearchFeedbackTaskController;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->updateIndicatorUI(II)V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/SearchFeedbackTaskController;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->hideIndicator()V

    return-void
.end method

.method private getFeedbackTaskStatus(II)I
    .locals 0

    if-gtz p1, :cond_0

    const-string p1, "SearchFeedbackTaskController"

    const-string p2, "Something wrong may happened, invalid feedback task num"

    invoke-static {p1, p2}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x1

    return p1

    :cond_0
    if-lt p2, p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private hideIndicator()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mIndicator:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private updateIndicatorUI(II)V
    .locals 4

    iget v0, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mTaskStatus:I

    if-gez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->hideIndicator()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mIndicator:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget v0, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mTaskStatus:I

    packed-switch v0, :pswitch_data_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->hideIndicator()V

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mProgress:Landroid/widget/TextView;

    const p2, 0x7f10061d

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mProgress:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mFragment:Lmiui/app/Fragment;

    const v3, 0x7f10061e

    invoke-virtual {v2, v3}, Lmiui/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v3, v1

    const/4 p2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, p2

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public onPause()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mResumed:Z

    return-void
.end method

.method public onResume()V
    .locals 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/SearchFeedbackTaskController;->mResumed:Z

    new-instance v0, Lcom/miui/gallery/ui/SearchFeedbackTaskController$FeedbackInfoQueryTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/SearchFeedbackTaskController$FeedbackInfoQueryTask;-><init>(Lcom/miui/gallery/ui/SearchFeedbackTaskController;Lcom/miui/gallery/ui/SearchFeedbackTaskController$1;)V

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/SearchFeedbackTaskController$FeedbackInfoQueryTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
