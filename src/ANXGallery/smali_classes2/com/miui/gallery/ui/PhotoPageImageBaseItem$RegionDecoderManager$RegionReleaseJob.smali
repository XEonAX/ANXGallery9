.class Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionReleaseJob;
.super Ljava/lang/Object;
.source "PhotoPageImageBaseItem.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RegionReleaseJob"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private mToBeReleasedProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;Lcom/miui/gallery/util/photoview/TileBitProvider;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionReleaseJob;->this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionReleaseJob;->mToBeReleasedProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionReleaseJob;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionReleaseJob;->mToBeReleasedProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-interface {p1}, Lcom/miui/gallery/util/photoview/TileBitProvider;->release()V

    const-string p1, "PhotoPageImageBaseItem"

    const-string v0, "release region"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionReleaseJob;->mToBeReleasedProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    return-object p1
.end method
