.class public Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity;
.super Lcom/miui/gallery/app/Activity;
.source "SimpleAppLifecycleTestActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestObserver;,
        Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestEventType;
    }
.end annotation


# static fields
.field static sCollectedEvents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestEventType;",
            "Landroid/arch/lifecycle/Lifecycle$Event;",
            ">;>;"
        }
    .end annotation
.end field

.field static sLatch:Ljava/util/concurrent/CountDownLatch;

.field private static sProcessObserver:Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestObserver;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity;->sCollectedEvents:Ljava/util/List;

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    sput-object v0, Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity;->sLatch:Ljava/util/concurrent/CountDownLatch;

    new-instance v0, Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestObserver;

    sget-object v1, Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestEventType;->PROCESS_EVENT:Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestEventType;

    invoke-direct {v0, v1}, Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestObserver;-><init>(Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestEventType;)V

    sput-object v0, Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity;->sProcessObserver:Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestObserver;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity;->getLifecycle()Landroid/arch/lifecycle/Lifecycle;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestObserver;

    sget-object v1, Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestEventType;->ACTIVITY_EVENT:Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestEventType;

    invoke-direct {v0, v1}, Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestObserver;-><init>(Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity$TestEventType;)V

    invoke-virtual {p1, v0}, Landroid/arch/lifecycle/Lifecycle;->addObserver(Landroid/arch/lifecycle/LifecycleObserver;)V

    return-void
.end method

.method protected onResume()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/app/Activity;->onResume()V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/SimpleAppLifecycleTestActivity;->finish()V

    return-void
.end method
