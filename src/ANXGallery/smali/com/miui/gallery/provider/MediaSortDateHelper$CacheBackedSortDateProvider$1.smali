.class Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider$1;
.super Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;
.source "MediaSortDateHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver<",
        "Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;


# direct methods
.method constructor <init>(Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider$1;->this$0:Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onStrategyChanged(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider$1;->this$0:Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;

    invoke-static {p1, p2}, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;->access$100(Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider;Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;)V

    return-void
.end method

.method public bridge synthetic onStrategyChanged(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;)V
    .locals 0

    check-cast p2, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/MediaSortDateHelper$CacheBackedSortDateProvider$1;->onStrategyChanged(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;)V

    return-void
.end method
