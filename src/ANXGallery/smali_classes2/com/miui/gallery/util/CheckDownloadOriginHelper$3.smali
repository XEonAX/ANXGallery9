.class Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;
.super Ljava/lang/Object;
.source "CheckDownloadOriginHelper.java"

# interfaces
.implements Lcom/miui/gallery/ui/DownloadFragment$OnDownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/CheckDownloadOriginHelper;->startDownloadOrigin(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCanceled()V
    .locals 2

    const-string v0, "CheckDownloadOriginHelper"

    const-string v1, "download canceled"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-static {v0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$100(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-static {v0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$100(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;->onCanceled()V

    :cond_0
    return-void
.end method

.method public onDownloadComplete(Ljava/util/List;Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;)V"
        }
    .end annotation

    const-string p1, "CheckDownloadOriginHelper"

    const-string v0, "onDownloadComplete fails: %s"

    if-nez p2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-eqz p2, :cond_1

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object p2, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-static {p2}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$200(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    iget-object p2, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-static {p2}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$200(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)Landroid/content/Context;

    move-result-object p2

    const v2, 0x7f100317

    invoke-virtual {p2, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object p2, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-static {p2}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$200(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)Landroid/content/Context;

    move-result-object p2

    const v3, 0x7f100319

    invoke-virtual {p2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f100318

    const/high16 v5, 0x1040000

    new-instance v6, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3$1;

    invoke-direct {v6, p0, p1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3$1;-><init>(Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;Ljava/util/ArrayList;)V

    new-instance v7, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3$2;

    invoke-direct {v7, p0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3$2;-><init>(Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;)V

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;IILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$100(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$100(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;->onComplete()V

    :cond_2
    :goto_1
    return-void
.end method
