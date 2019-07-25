.class public Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;
.super Ljava/lang/Object;
.source "SmartVideoGuideHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideListener;,
        Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;
    }
.end annotation


# static fields
.field private static volatile sHasGuided:Z = true


# instance fields
.field private mGuideHandleThread:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;

.field private mGuideListener:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideListener;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;)Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->mGuideListener:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideListener;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->tryShowGuideView(Ljava/lang/String;)V

    return-void
.end method

.method public static hasGuided()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->sHasGuided:Z

    return v0
.end method

.method public static init()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/video/editor/manager/SmartVideoJudgeManager;->isAvailable()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$SmartVideoGuide;->hasGuided()Z

    move-result v0

    sput-boolean v0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->sHasGuided:Z

    return-void
.end method

.method public static setHasGuided(Z)V
    .locals 0

    sput-boolean p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->sHasGuided:Z

    invoke-static {p0}, Lcom/miui/gallery/preference/GalleryPreferences$SmartVideoGuide;->setSmartVideoGuided(Z)V

    return-void
.end method

.method private tryShowGuideView(Ljava/lang/String;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$1;-><init>(Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/miui/gallery/threadpool/ThreadManager;->runOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public handleHighFrameRate(Ljava/lang/String;)V
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->mGuideHandleThread:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;

    if-nez v0, :cond_1

    new-instance v0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;-><init>(Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$1;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->mGuideHandleThread:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->mGuideHandleThread:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;->handleHighFrameRate(Ljava/lang/String;)V

    return-void
.end method

.method public release()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->mGuideListener:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideListener;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->mGuideListener:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideListener;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->mGuideHandleThread:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->mGuideHandleThread:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideHandleThread;->destroyThread()V

    :cond_1
    return-void
.end method

.method public setSmartVideoGuideListener(Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->mGuideListener:Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper$SmartVideoGuideListener;

    return-void
.end method
