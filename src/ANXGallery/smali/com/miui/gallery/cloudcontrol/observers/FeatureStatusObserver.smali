.class public abstract Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;
.super Lio/reactivex/observers/DisposableObserver;
.source "FeatureStatusObserver.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/reactivex/observers/DisposableObserver<",
        "Landroid/support/v4/util/Pair<",
        "Ljava/lang/String;",
        "Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/reactivex/observers/DisposableObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onComplete()V
    .locals 0

    return-void
.end method

.method public final onError(Ljava/lang/Throwable;)V
    .locals 0

    return-void
.end method

.method public final onNext(Landroid/support/v4/util/Pair;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/Pair<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p1, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object p1, p1, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;->onStatusChanged(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;)V

    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/support/v4/util/Pair;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;->onNext(Landroid/support/v4/util/Pair;)V

    return-void
.end method

.method public abstract onStatusChanged(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;)V
.end method
