.class Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;
.super Ljava/lang/Object;
.source "FilterFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;->this$1:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$OnItemClick$94(Lio/reactivex/ObservableEmitter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {}, Lcom/xiaomi/skytransfer/SkyTranFilter;->getInstance()Lcom/xiaomi/skytransfer/SkyTranFilter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/skytransfer/SkyTranFilter;->waitSegment()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p0, v0}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$OnItemClick$95(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;ILjava/lang/Boolean;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;->this$1:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$1502(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;Z)Z

    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p5

    if-nez p5, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->hideProgressView()V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;->this$1:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    invoke-static {p1, p2, p3, p4}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->access$1200(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;I)V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CheckResult"
        }
    .end annotation

    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;->onItemClick(Landroid/support/v7/widget/RecyclerView;I)V

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;

    invoke-virtual {v4, p3}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->getItemData(I)Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const/4 p1, 0x1

    if-nez v3, :cond_0

    const-string p2, "FilterFragment"

    const-string v0, "FilterAdapter get filterData null:pos is %d"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {p2, v0, p3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return p1

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;->this$1:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$900(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    move-result-object p2

    invoke-virtual {v3, p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_2

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->isInEditMode()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->exitEditMode()V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;->this$1:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->showTopPanel(Z)V

    goto/16 :goto_0

    :cond_1
    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->isNone()Z

    move-result p2

    if-nez p2, :cond_6

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->enterEditMode()V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;->this$1:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$1000(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Landroid/widget/SeekBar;

    move-result-object p2

    iget p3, v3, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->progress:I

    invoke-virtual {p2, p3}, Landroid/widget/SeekBar;->setProgress(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;->this$1:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->showTopPanel(Z)V

    goto :goto_0

    :cond_2
    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->isNone()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->isInEditMode()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->exitEditMode()V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;->this$1:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->showTopPanel(Z)V

    :cond_3
    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->isSkyTransfer()Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;->isNone()Z

    move-result p2

    if-nez p2, :cond_5

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;->this$1:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$1100(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Z

    move-result p2

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;->this$1:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    invoke-static {p2, v3, v4, p3}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->access$1200(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;I)V

    goto :goto_0

    :cond_4
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;->this$1:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$1300(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p2

    move-object v2, p2

    check-cast v2, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->showProgressView()V

    sget-object p2, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$FilterPagerAdapter$1$6f9ZM2CW3zNM58eDglT7_IlvAI8;->INSTANCE:Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$FilterPagerAdapter$1$6f9ZM2CW3zNM58eDglT7_IlvAI8;

    invoke-static {p2}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object p2

    sget-object v0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Lio/reactivex/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p2, v0}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p2

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p2, v0}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p2

    new-instance v6, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$FilterPagerAdapter$1$aeGQDIOWUFJvmflXMUUgvNglQ1M;

    move-object v0, v6

    move-object v1, p0

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$FilterPagerAdapter$1$aeGQDIOWUFJvmflXMUUgvNglQ1M;-><init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;I)V

    invoke-virtual {p2, v6}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    goto :goto_0

    :cond_5
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;->this$1:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;

    invoke-static {p2, v3, v4, p3}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;->access$1400(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;I)V

    :cond_6
    :goto_0
    return p1
.end method
