.class Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;
.super Landroid/os/HandlerThread;
.source "SmartVideoGuideHelper.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SmartVideoGuideHandleThread"
.end annotation


# instance fields
.field mWorkHandler:Landroid/os/Handler;

.field final synthetic this$0:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;->this$0:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;

    const-string p1, "SmartEffectAttentionThread"

    invoke-direct {p0, p1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;->start()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;-><init>(Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;)V

    return-void
.end method

.method private isSupportSmartVideo(I)Z
    .locals 1

    const/16 v0, 0x64

    if-lt p1, v0, :cond_0

    const/16 v0, 0x78

    if-gt p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public destroyThread()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;->mWorkHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;->quit()Z

    return-void
.end method

.method public handleHighFrameRate(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;->mWorkHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;->mWorkHandler:Landroid/os/Handler;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;->mWorkHandler:Landroid/os/Handler;

    invoke-static {v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;)Landroid/os/Message;

    move-result-object v0

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    const/4 p1, 0x0

    iput p1, v0, Landroid/os/Message;->what:I

    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;->mWorkHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;->mWorkHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->getVideoFrameRate(Ljava/lang/String;)I

    move-result v0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;->isSupportSmartVideo(I)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;->this$0:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;

    invoke-static {v0, p1}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->access$200(Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;Ljava/lang/String;)V

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method
