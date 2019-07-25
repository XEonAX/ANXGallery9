.class Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection$ServiceConnectionImpl;
.super Ljava/lang/Object;
.source "VideoFrameProvider.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ServiceConnectionImpl"
.end annotation


# instance fields
.field private volatile mReleased:Z

.field final synthetic this$1:Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection$ServiceConnectionImpl;->this$1:Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;Lcom/miui/gallery/video/VideoFrameProvider$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection$ServiceConnectionImpl;-><init>(Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;)V

    return-void
.end method


# virtual methods
.method public isReleased()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection$ServiceConnectionImpl;->mReleased:Z

    return v0
.end method

.method public onBindingDied(Landroid/content/ComponentName;)V
    .locals 1

    const-string p1, "MiuiVideoConnection"

    const-string v0, "onBindingDied"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection$ServiceConnectionImpl;->this$1:Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;

    const/4 v0, 0x1

    invoke-static {p1, p0, v0}, Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;->access$600(Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection$ServiceConnectionImpl;Z)V

    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection$ServiceConnectionImpl;->this$1:Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;

    invoke-static {p1, p0, p2}, Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;->access$500(Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection$ServiceConnectionImpl;Landroid/os/IBinder;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    const-string p1, "MiuiVideoConnection"

    const-string v0, "onServiceDisconnected"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection$ServiceConnectionImpl;->this$1:Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;

    const/4 v0, 0x1

    invoke-static {p1, p0, v0}, Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;->access$600(Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection;Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection$ServiceConnectionImpl;Z)V

    return-void
.end method

.method public release()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/video/VideoFrameProvider$MiuiVideoConnection$ServiceConnectionImpl;->mReleased:Z

    return-void
.end method
