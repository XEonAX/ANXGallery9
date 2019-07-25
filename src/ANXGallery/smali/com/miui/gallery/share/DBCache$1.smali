.class Lcom/miui/gallery/share/DBCache$1;
.super Ljava/lang/Object;
.source "DBCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/share/DBCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/share/DBCache;


# direct methods
.method constructor <init>(Lcom/miui/gallery/share/DBCache;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/DBCache$1;->this$0:Lcom/miui/gallery/share/DBCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/share/DBCache$1$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/share/DBCache$1$1;-><init>(Lcom/miui/gallery/share/DBCache$1;)V

    new-instance v1, Lcom/miui/gallery/share/DBCache$1$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/share/DBCache$1$2;-><init>(Lcom/miui/gallery/share/DBCache$1;)V

    invoke-static {v0, v1}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method
