.class public Lcom/miui/gallery/cloud/CloudReceiverRegister;
.super Ljava/lang/Object;
.source "CloudReceiverRegister.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/CloudReceiverRegister$SingletonHolder;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/CloudReceiverRegister$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/CloudReceiverRegister;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/cloud/CloudReceiverRegister;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/CloudReceiverRegister$SingletonHolder;->access$100()Lcom/miui/gallery/cloud/CloudReceiverRegister;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public onAppCreate()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/cloud/TimeSetReceiver;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/TimeSetReceiver;-><init>()V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "android.intent.action.TIME_SET"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/miui/gallery/util/GalleryUtils;->registerReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;[Ljava/lang/String;)V

    return-void
.end method
