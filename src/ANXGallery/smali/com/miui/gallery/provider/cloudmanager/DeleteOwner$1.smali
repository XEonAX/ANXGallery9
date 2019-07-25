.class Lcom/miui/gallery/provider/cloudmanager/DeleteOwner$1;
.super Ljava/lang/Object;
.source "DeleteOwner.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/provider/cloudmanager/DeleteOwner;->executeBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/provider/cloudmanager/DeleteOwner;

.field final synthetic val$imageIds:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/miui/gallery/provider/cloudmanager/DeleteOwner;Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/DeleteOwner$1;->this$0:Lcom/miui/gallery/provider/cloudmanager/DeleteOwner;

    iput-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/DeleteOwner$1;->val$imageIds:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->getInstance()Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/DeleteOwner$1;->val$imageIds:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->onImageBatchDelete(Ljava/util/List;)V

    return-void
.end method
