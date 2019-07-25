.class Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$1;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;->execute(Ljava/lang/String;ZLcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
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
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;

.field final synthetic val$insertMediaStore:Z

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;Ljava/lang/String;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$1;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$1;->val$path:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$1;->val$insertMediaStore:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$1;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$1;->val$path:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/miui/gallery/scanner/MediaScanner;->scanSingleFile(Landroid/content/Context;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$1;->val$insertMediaStore:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$1;->val$path:Ljava/lang/String;

    const-string v1, ".mp4"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$1;->val$path:Ljava/lang/String;

    invoke-static {p1, v2, v0}, Lcom/miui/gallery/util/MediaStoreUtils;->insert(Landroid/content/Context;Ljava/lang/String;I)Landroid/net/Uri;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$1;->val$path:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/miui/gallery/util/MediaStoreUtils;->sendScannerBroadcast(Landroid/content/Context;Ljava/lang/String;)V

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method
