.class Lcom/miui/gallery/GalleryApp$4;
.super Ljava/lang/Object;
.source "GalleryApp.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/GalleryApp;->initDataInSubThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/GalleryApp;


# direct methods
.method constructor <init>(Lcom/miui/gallery/GalleryApp;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/GalleryApp$4;->this$0:Lcom/miui/gallery/GalleryApp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/GalleryApp$4;->this$0:Lcom/miui/gallery/GalleryApp;

    invoke-static {v0}, Lcom/miui/gallery/GalleryApp;->access$500(Lcom/miui/gallery/GalleryApp;)V

    const/16 v0, 0xa

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    const-wide/16 v0, 0x1f4

    invoke-static {v0, v1}, Lcom/miui/gallery/threadpool/ThreadManager;->sleepThread(J)V

    iget-object v0, p0, Lcom/miui/gallery/GalleryApp$4;->this$0:Lcom/miui/gallery/GalleryApp;

    invoke-static {v0}, Lcom/miui/gallery/GalleryApp;->access$600(Lcom/miui/gallery/GalleryApp;)V

    return-void
.end method