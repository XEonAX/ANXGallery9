.class Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OrientationManager"
.end annotation


# instance fields
.field private isOrientationLocked:Z

.field private mAccelerometerRotationObserver:Landroid/database/ContentObserver;

.field private mCurUiOrientation:I

.field private mOrientationSensor:Lcom/miui/gallery/util/OrientationSensor;

.field private mSensorEnable:Z

.field private mSensorRotation:I

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mSensorRotation:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mCurUiOrientation:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mSensorEnable:Z

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->isOrientationLocked:Z

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mCurUiOrientation:I

    new-instance v0, Lcom/miui/gallery/util/OrientationSensor;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, p1}, Lcom/miui/gallery/util/OrientationSensor;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mOrientationSensor:Lcom/miui/gallery/util/OrientationSensor;

    return-void
.end method

.method private disableAccelerometerRotationObserver()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mAccelerometerRotationObserver:Landroid/database/ContentObserver;

    if-eqz v0, :cond_0

    const-string v0, "PhotoPageFragment"

    const-string v1, "disableAccelerometerRotationObserver"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mAccelerometerRotationObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mAccelerometerRotationObserver:Landroid/database/ContentObserver;

    :cond_0
    return-void
.end method

.method private disableOrientationSensor()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mOrientationSensor:Lcom/miui/gallery/util/OrientationSensor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mOrientationSensor:Lcom/miui/gallery/util/OrientationSensor;

    invoke-virtual {v0}, Lcom/miui/gallery/util/OrientationSensor;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "PhotoPageFragment"

    const-string v1, "disableOrientationSensor"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mOrientationSensor:Lcom/miui/gallery/util/OrientationSensor;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/OrientationSensor;->setOrientationChangedListener(Lcom/miui/gallery/util/OrientationSensor$OnOrientationChangedListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mOrientationSensor:Lcom/miui/gallery/util/OrientationSensor;

    invoke-virtual {v0}, Lcom/miui/gallery/util/OrientationSensor;->disable()V

    :cond_0
    return-void
.end method

.method private enableAccelerometerRotationObserver()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isResumed()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mAccelerometerRotationObserver:Landroid/database/ContentObserver;

    if-nez v0, :cond_1

    const-string v0, "PhotoPageFragment"

    const-string v1, "enableAccelerometerRotationObserver"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$AccelerometerRotationChangedListener;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$AccelerometerRotationChangedListener;-><init>(Landroid/os/Handler;Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mAccelerometerRotationObserver:Landroid/database/ContentObserver;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "accelerometer_rotation"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mAccelerometerRotationObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    :cond_1
    return-void
.end method

.method private enableOrientationSensor()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mSensorEnable:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isResumed()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mOrientationSensor:Lcom/miui/gallery/util/OrientationSensor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mOrientationSensor:Lcom/miui/gallery/util/OrientationSensor;

    invoke-virtual {v0}, Lcom/miui/gallery/util/OrientationSensor;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "PhotoPageFragment"

    const-string v1, "enableOrientationSensor"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mOrientationSensor:Lcom/miui/gallery/util/OrientationSensor;

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationChangedListener;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationChangedListener;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/OrientationSensor;->setOrientationChangedListener(Lcom/miui/gallery/util/OrientationSensor$OnOrientationChangedListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mOrientationSensor:Lcom/miui/gallery/util/OrientationSensor;

    invoke-virtual {v0}, Lcom/miui/gallery/util/OrientationSensor;->enable()V

    :cond_1
    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method private getScreenOrientation(I)I
    .locals 0

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x2

    return p1

    :pswitch_0
    const/16 p1, 0x8

    return p1

    :pswitch_1
    const/16 p1, 0x9

    return p1

    :pswitch_2
    const/4 p1, 0x0

    return p1

    :pswitch_3
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private lock()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-string v1, "window"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->getScreenOrientation(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/activity/BaseActivity;->setRequestedOrientation(I)V

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->isOrientationLocked:Z

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "lock"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "photo"

    const-string v2, "orientation_lock_by_accelerometer"

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private unlock()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->setRequestedOrientation(I)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->isOrientationLocked:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "unlock"

    iget v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mSensorRotation:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "photo"

    const-string v2, "orientation_lock_by_accelerometer"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method onAccelerometerRotationChanged()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-nez v0, :cond_0

    const-string v0, "PhotoPageFragment"

    const-string v1, "activity has detached AccelerometerRotationChanged"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "accelerometer_rotation"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const-string v1, "PhotoPageFragment"

    const-string v2, "onAccelerometerRotationChanged %d"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->lock()V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->unlock()V

    :goto_0
    return-void
.end method

.method onSensorOrientationChanged(II)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-nez v0, :cond_0

    const-string v0, "PhotoPageFragment"

    const-string v1, "activity has detached onOrientationChanged oldOrientation %d, newOrientation %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {v0, v1, p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_0
    invoke-static {p2}, Lcom/miui/gallery/util/OrientationSensor;->transfer2SurfaceRotation(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mSensorRotation:I

    const-string v0, "PhotoPageFragment"

    const-string v1, "onSensorOrientationChanged old %s, new %s"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {v0, v1, p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method onUiOrientationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mCurUiOrientation:I

    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    if-eq v0, v1, :cond_0

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mCurUiOrientation:I

    :cond_0
    return-void
.end method

.method pause()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->disableOrientationSensor()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->disableAccelerometerRotationObserver()V

    return-void
.end method

.method release()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->disableOrientationSensor()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->disableAccelerometerRotationObserver()V

    return-void
.end method

.method resume()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->enableOrientationSensor()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->enableAccelerometerRotationObserver()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->tryRestoreOrientation(Z)V

    return-void
.end method

.method setSensorEnable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mSensorEnable:Z

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->isResumed()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->mSensorEnable:Z

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->enableOrientationSensor()V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->disableOrientationSensor()V

    :cond_1
    :goto_0
    return-void
.end method

.method public settleItem(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->setSensorEnable(Z)V

    return-void
.end method

.method tryRestoreOrientation(Z)V
    .locals 2

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4700(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v1, "accelerometer_rotation"

    invoke-static {p1, v1, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p1

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->isOrientationLocked:Z

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$OrientationManager;->isOrientationLocked:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x2

    goto :goto_0

    :cond_2
    const/4 v0, 0x4

    :goto_0
    invoke-virtual {p1, v0}, Lcom/miui/gallery/activity/BaseActivity;->setRequestedOrientation(I)V

    return-void
.end method
