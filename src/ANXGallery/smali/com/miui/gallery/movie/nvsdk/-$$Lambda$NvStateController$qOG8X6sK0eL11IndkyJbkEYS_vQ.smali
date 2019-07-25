.class public final synthetic Lcom/miui/gallery/movie/nvsdk/-$$Lambda$NvStateController$qOG8X6sK0eL11IndkyJbkEYS_vQ;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/movie/nvsdk/NvStateController;


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/movie/nvsdk/NvStateController;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/movie/nvsdk/-$$Lambda$NvStateController$qOG8X6sK0eL11IndkyJbkEYS_vQ;->f$0:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/-$$Lambda$NvStateController$qOG8X6sK0eL11IndkyJbkEYS_vQ;->f$0:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-static {v0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->lambda$onPlaybackEOF$145(Lcom/miui/gallery/movie/nvsdk/NvStateController;)V

    return-void
.end method
