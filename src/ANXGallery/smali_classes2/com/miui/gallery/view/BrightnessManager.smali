.class public Lcom/miui/gallery/view/BrightnessManager;
.super Ljava/lang/Object;
.source "BrightnessManager.java"

# interfaces
.implements Lcom/miui/gallery/util/BrightnessProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/view/BrightnessManager$BrightnessAsynTask;
    }
.end annotation


# static fields
.field private static final BRIGHTNESS_ADJ_URI:Landroid/net/Uri;

.field private static final BRIGHTNESS_URI:Landroid/net/Uri;


# instance fields
.field private mActivityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private mBrightMode:I

.field mBrightnessAsynTask:Lcom/miui/gallery/view/BrightnessManager$BrightnessAsynTask;

.field private mBrightnessObserver:Landroid/database/ContentObserver;

.field private mCurrentBrightnessAuto:F

.field private mCurrentBrightnessManual:F

.field private mFocus:Z

.field private mSystemBrightnessChanged:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "screen_brightness"

    invoke-static {v0}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/view/BrightnessManager;->BRIGHTNESS_URI:Landroid/net/Uri;

    const-string v0, "screen_auto_brightness_adj"

    invoke-static {v0}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/view/BrightnessManager;->BRIGHTNESS_ADJ_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;FF)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/view/BrightnessManager;->mCurrentBrightnessAuto:F

    const/high16 v1, -0x40800000    # -1.0f

    iput v1, p0, Lcom/miui/gallery/view/BrightnessManager;->mCurrentBrightnessManual:F

    const/4 v2, -0x1

    iput v2, p0, Lcom/miui/gallery/view/BrightnessManager;->mBrightMode:I

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/miui/gallery/view/BrightnessManager;->mSystemBrightnessChanged:Z

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/miui/gallery/view/BrightnessManager;->mFocus:Z

    new-instance v2, Lcom/miui/gallery/view/BrightnessManager$1;

    new-instance v3, Landroid/os/Handler;

    invoke-direct {v3}, Landroid/os/Handler;-><init>()V

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/view/BrightnessManager$1;-><init>(Lcom/miui/gallery/view/BrightnessManager;Landroid/os/Handler;)V

    iput-object v2, p0, Lcom/miui/gallery/view/BrightnessManager;->mBrightnessObserver:Landroid/database/ContentObserver;

    cmpl-float v2, p3, v0

    if-ltz v2, :cond_0

    invoke-direct {p0, p3}, Lcom/miui/gallery/view/BrightnessManager;->ensureBrightness(F)F

    move-result p3

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    iput p3, p0, Lcom/miui/gallery/view/BrightnessManager;->mCurrentBrightnessAuto:F

    cmpl-float p3, p2, v0

    if-lez p3, :cond_1

    invoke-direct {p0, p2}, Lcom/miui/gallery/view/BrightnessManager;->ensureBrightness(F)F

    move-result v1

    :cond_1
    iput v1, p0, Lcom/miui/gallery/view/BrightnessManager;->mCurrentBrightnessManual:F

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/miui/gallery/view/BrightnessManager;->mActivityRef:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/view/BrightnessManager;)Ljava/lang/ref/WeakReference;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/view/BrightnessManager;->mActivityRef:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/view/BrightnessManager;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/view/BrightnessManager;->mBrightMode:I

    return p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/view/BrightnessManager;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/view/BrightnessManager;->mBrightMode:I

    return p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/view/BrightnessManager;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/view/BrightnessManager;->mCurrentBrightnessManual:F

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/view/BrightnessManager;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/view/BrightnessManager;->mCurrentBrightnessAuto:F

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/view/BrightnessManager;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/view/BrightnessManager;->mSystemBrightnessChanged:Z

    return p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/view/BrightnessManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/view/BrightnessManager;->mSystemBrightnessChanged:Z

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/view/BrightnessManager;)Landroid/app/Activity;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/view/BrightnessManager;->getActivity()Landroid/app/Activity;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/view/BrightnessManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/view/BrightnessManager;->adjustBrightness()V

    return-void
.end method

.method private adjustBrightness()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/view/BrightnessManager;->mBrightnessAsynTask:Lcom/miui/gallery/view/BrightnessManager$BrightnessAsynTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/view/BrightnessManager;->mBrightnessAsynTask:Lcom/miui/gallery/view/BrightnessManager$BrightnessAsynTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/view/BrightnessManager$BrightnessAsynTask;->cancel(Z)Z

    :cond_0
    new-instance v0, Lcom/miui/gallery/view/BrightnessManager$BrightnessAsynTask;

    invoke-direct {v0, p0}, Lcom/miui/gallery/view/BrightnessManager$BrightnessAsynTask;-><init>(Lcom/miui/gallery/view/BrightnessManager;)V

    iput-object v0, p0, Lcom/miui/gallery/view/BrightnessManager;->mBrightnessAsynTask:Lcom/miui/gallery/view/BrightnessManager$BrightnessAsynTask;

    iget-object v0, p0, Lcom/miui/gallery/view/BrightnessManager;->mBrightnessAsynTask:Lcom/miui/gallery/view/BrightnessManager$BrightnessAsynTask;

    sget-object v1, Landroid/os/AsyncTask;->SERIAL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/view/BrightnessManager$BrightnessAsynTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method private ensureBrightness(F)F
    .locals 1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    return p1
.end method

.method private getActivity()Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/BrightnessManager;->mActivityRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/view/BrightnessManager;->mActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private registerObserver()V
    .locals 4

    invoke-direct {p0}, Lcom/miui/gallery/view/BrightnessManager;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/view/BrightnessManager;->BRIGHTNESS_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/miui/gallery/view/BrightnessManager;->mBrightnessObserver:Landroid/database/ContentObserver;

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    sget-object v1, Lcom/miui/gallery/view/BrightnessManager;->BRIGHTNESS_ADJ_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/miui/gallery/view/BrightnessManager;->mBrightnessObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "BrightnessManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Register BrightnessObserver error: %s"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private unregisterObserver()V
    .locals 4

    invoke-direct {p0}, Lcom/miui/gallery/view/BrightnessManager;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/view/BrightnessManager;->mBrightnessObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "BrightnessManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unregister BrightnessObserver error: %s"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public adjustBrightnessTask(ZFI)V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/view/BrightnessManager;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    const/4 v2, 0x1

    if-ne p3, v2, :cond_1

    iget-boolean p1, p0, Lcom/miui/gallery/view/BrightnessManager;->mFocus:Z

    if-eqz p1, :cond_0

    invoke-virtual {p0, p2}, Lcom/miui/gallery/view/BrightnessManager;->setTemporaryScreenAutoBrightnessAdjustmentRatio(F)V

    goto :goto_2

    :cond_0
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/BrightnessManager;->setTemporaryScreenAutoBrightnessAdjustmentRatio(F)V

    goto :goto_2

    :cond_1
    if-nez p3, :cond_4

    iget-boolean p2, p0, Lcom/miui/gallery/view/BrightnessManager;->mFocus:Z

    const/high16 p3, -0x40800000    # -1.0f

    if-eqz p2, :cond_3

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    iget p3, p0, Lcom/miui/gallery/view/BrightnessManager;->mCurrentBrightnessManual:F

    :goto_0
    iput p3, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    goto :goto_1

    :cond_3
    iput p3, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    :goto_1
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    :cond_4
    :goto_2
    return-void
.end method

.method public getAutoBrightness()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/view/BrightnessManager;->mCurrentBrightnessAuto:F

    return v0
.end method

.method public getManualBrightness()F
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/view/BrightnessManager;->mSystemBrightnessChanged:Z

    if-eqz v0, :cond_0

    const/high16 v0, -0x40800000    # -1.0f

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/view/BrightnessManager;->mCurrentBrightnessManual:F

    :goto_0
    return v0
.end method

.method public onPause()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/view/BrightnessManager;->adjustBrightness()V

    invoke-direct {p0}, Lcom/miui/gallery/view/BrightnessManager;->unregisterObserver()V

    return-void
.end method

.method public onResume()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/view/BrightnessManager;->registerObserver()V

    invoke-direct {p0}, Lcom/miui/gallery/view/BrightnessManager;->adjustBrightness()V

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/view/BrightnessManager;->mFocus:Z

    invoke-direct {p0}, Lcom/miui/gallery/view/BrightnessManager;->adjustBrightness()V

    return-void
.end method

.method public setTemporaryScreenAutoBrightnessAdjustmentRatio(F)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/view/BrightnessManager;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/util/BrightnessUtils;->setTemporaryAutoBrightness(Landroid/content/Context;F)V

    return-void
.end method
