.class Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;
.super Landroid/os/AsyncTask;
.source "FilterRenderFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SkyTransferTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;)Landroid/graphics/Bitmap;
    .locals 4

    const/4 v0, 0x0

    aget-object p1, p1, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->getCate()I

    move-result v2

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->getCate()I

    move-result v3

    if-ne v2, v3, :cond_1

    invoke-static {}, Lcom/xiaomi/skytransfer/SkyTranFilter;->getInstance()Lcom/xiaomi/skytransfer/SkyTranFilter;

    move-result-object v2

    invoke-virtual {v2, v0, v1, p1}, Lcom/xiaomi/skytransfer/SkyTranFilter;->transferSkyAdjustMoment(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;)V

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/xiaomi/skytransfer/SkyTranFilter;->getInstance()Lcom/xiaomi/skytransfer/SkyTranFilter;

    move-result-object v2

    invoke-virtual {v2, v0, v1, p1}, Lcom/xiaomi/skytransfer/SkyTranFilter;->transferSkyForShow(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->access$1002(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;)Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

    const-string v0, "FilterRenderFragment"

    const-string v2, "SkyTransferTask:%s"

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v2, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->doInBackground([Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->access$1102(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->enableComparison(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->access$1200(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->access$1300(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Landroid/graphics/Bitmap;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->hideProgressView()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->access$1402(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->access$1500(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 1

    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$SkyTransferTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->showProgressView()V

    return-void
.end method
