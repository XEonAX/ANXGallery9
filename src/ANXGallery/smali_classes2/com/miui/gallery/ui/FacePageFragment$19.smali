.class Lcom/miui/gallery/ui/FacePageFragment$19;
.super Ljava/lang/Object;
.source "FacePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/FacePageFragment;->confirmListener()Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/FacePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$19;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfirm(Ljava/lang/String;Z)V
    .locals 1

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment$19;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/FacePageFragment;->access$3600(Lcom/miui/gallery/ui/FacePageFragment;)Landroid/os/Handler;

    move-result-object p2

    new-instance v0, Lcom/miui/gallery/ui/FacePageFragment$19$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/ui/FacePageFragment$19$1;-><init>(Lcom/miui/gallery/ui/FacePageFragment$19;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p2

    new-instance v0, Lcom/miui/gallery/ui/FacePageFragment$19$2;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/ui/FacePageFragment$19$2;-><init>(Lcom/miui/gallery/ui/FacePageFragment$19;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    :goto_0
    const-string p1, "face"

    const-string p2, "face_album_rename"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
