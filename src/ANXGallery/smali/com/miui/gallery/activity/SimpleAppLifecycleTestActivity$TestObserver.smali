.class Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestObserver;
.super Ljava/lang/Object;
.source "SimpleAppLifecycleTestActivity.java"

# interfaces
.implements Landroid/arch/lifecycle/LifecycleObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TestObserver"
.end annotation


# instance fields
.field private mType:Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestEventType;


# direct methods
.method constructor <init>(Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestEventType;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestObserver;->mType:Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestEventType;

    return-void
.end method


# virtual methods
.method onEvent(Landroid/arch/lifecycle/LifecycleOwner;Landroid/arch/lifecycle/Lifecycle$Event;)V
    .locals 2
    .annotation runtime Landroid/arch/lifecycle/OnLifecycleEvent;
        value = .enum Landroid/arch/lifecycle/Lifecycle$Event;->ON_ANY:Landroid/arch/lifecycle/Lifecycle$Event;
    .end annotation

    sget-object p1, Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity;->sCollectedEvents:Ljava/util/List;

    new-instance v0, Landroid/util/Pair;

    iget-object v1, p0, Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestObserver;->mType:Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestEventType;

    invoke-direct {v0, v1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p1, Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity;->sLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
