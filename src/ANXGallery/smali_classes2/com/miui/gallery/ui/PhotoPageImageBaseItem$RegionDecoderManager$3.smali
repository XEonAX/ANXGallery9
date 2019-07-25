.class Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$3;
.super Ljava/lang/Object;
.source "PhotoPageImageBaseItem.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->onFutureDone(Lcom/miui/gallery/threadpool/Future;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->displayImage(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method
