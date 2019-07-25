.class Lcom/miui/gallery/ui/SyncBar$DownloadManager$1;
.super Ljava/lang/Object;
.source "SyncBar.java"

# interfaces
.implements Lcom/miui/gallery/error/core/ErrorTranslateCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/SyncBar$DownloadManager;->onDownloadComplete(Ljava/util/List;Ljava/util/List;Lcom/miui/gallery/error/core/ErrorCode;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/SyncBar$DownloadManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/SyncBar$DownloadManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$1;->this$0:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTranslate(Lcom/miui/gallery/error/core/ErrorTip;)V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$1;->this$0:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    invoke-static {v0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->access$100(Lcom/miui/gallery/ui/SyncBar$DownloadManager;)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$1;->this$0:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/error/core/ErrorTip;->getTitle(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$1;->this$0:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->getContext()Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f100316

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$1;->this$0:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    new-instance v8, Lcom/miui/gallery/ui/SyncBar$PanelData;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$1;->this$0:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    move-object v2, v8

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/ui/SyncBar$PanelData;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;ZLandroid/view/View$OnClickListener;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v8, v1}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->refresh(Lcom/miui/gallery/ui/SyncBar$PanelData;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$1;->this$0:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    invoke-virtual {p1}, Lcom/miui/gallery/error/core/ErrorTip;->getCode()Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->access$202(Lcom/miui/gallery/ui/SyncBar$DownloadManager;Lcom/miui/gallery/error/core/ErrorCode;)Lcom/miui/gallery/error/core/ErrorCode;

    :cond_0
    return-void

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$1;->this$0:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    new-instance v6, Lcom/miui/gallery/ui/SyncBar$PanelData;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/miui/gallery/ui/SyncBar$DownloadManager$1;->this$0:Lcom/miui/gallery/ui/SyncBar$DownloadManager;

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/ui/SyncBar$PanelData;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;ZLandroid/view/View$OnClickListener;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v6, v0}, Lcom/miui/gallery/ui/SyncBar$DownloadManager;->refresh(Lcom/miui/gallery/ui/SyncBar$PanelData;Z)Z

    :cond_2
    return-void
.end method
