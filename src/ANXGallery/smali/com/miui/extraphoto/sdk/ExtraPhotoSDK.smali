.class public Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;
.super Ljava/lang/Object;
.source "ExtraPhotoSDK.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$DeviceSupportMotionPhoto;,
        Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$DeviceSupportRefocus;
    }
.end annotation


# static fields
.field private static final DEVICE_SUPPORT_MOTION_PHOTO:Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$DeviceSupportMotionPhoto;

.field private static final DEVICE_SUPPORT_REFOCUS:Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$DeviceSupportRefocus;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$DeviceSupportRefocus;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$DeviceSupportRefocus;-><init>(Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$1;)V

    sput-object v0, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->DEVICE_SUPPORT_REFOCUS:Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$DeviceSupportRefocus;

    new-instance v0, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$DeviceSupportMotionPhoto;

    invoke-direct {v0, v1}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$DeviceSupportMotionPhoto;-><init>(Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$1;)V

    sput-object v0, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->DEVICE_SUPPORT_MOTION_PHOTO:Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$DeviceSupportMotionPhoto;

    return-void
.end method

.method private static getType(J)Ljava/lang/String;
    .locals 5

    const-wide/16 v0, 0x20

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const-string p0, "motion"

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x1

    and-long/2addr p0, v0

    cmp-long v0, p0, v2

    if-lez v0, :cond_1

    const-string p0, "refocus"

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public static isDeviceSupportMotionPhoto(Landroid/content/Context;)Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isInternational()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->DEVICE_SUPPORT_MOTION_PHOTO:Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$DeviceSupportMotionPhoto;

    invoke-virtual {v0, p0}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$DeviceSupportMotionPhoto;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isDeviceSupportRefocus(Landroid/content/Context;)Z
    .locals 1

    sget-object v0, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->DEVICE_SUPPORT_REFOCUS:Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$DeviceSupportRefocus;

    invoke-virtual {v0, p0}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK$DeviceSupportRefocus;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public static sendDeletePhotoStatic(J)V
    .locals 1

    const-string v0, "extra_photo_delete"

    invoke-static {v0, p0, p1}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->sendTypedPhotoStatic(Ljava/lang/String;J)V

    return-void
.end method

.method public static sendEnterStatic()V
    .locals 2

    const-string v0, "photo_extra"

    const-string v1, "refocus_enter"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static sendExposureStatic()V
    .locals 2

    const-string v0, "photo_extra"

    const-string v1, "refocus_exposure"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static sendNewPhotoStatic(J)V
    .locals 1

    const-string v0, "extra_photo_new"

    invoke-static {v0, p0, p1}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->sendTypedPhotoStatic(Ljava/lang/String;J)V

    return-void
.end method

.method public static sendResultStatic(Landroid/content/Intent;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    if-nez p0, :cond_0

    const-string p0, "save_type"

    const-string v1, "NONE"

    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->sendResultStatic(Ljava/util/Map;)V

    return-void

    :cond_0
    const-string v1, "save_type"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "save_explain"

    invoke-virtual {p0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "save_type"

    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->sendResultStatic(Ljava/util/Map;)V

    return-void
.end method

.method private static sendResultStatic(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "photo_extra"

    const-string v1, "refocus_save"

    invoke-static {v0, v1, p0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static sendSharePhotoStatic(J)V
    .locals 1

    const-string v0, "extra_photo_share"

    invoke-static {v0, p0, p1}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->sendTypedPhotoStatic(Ljava/lang/String;J)V

    return-void
.end method

.method private static sendTypedPhotoStatic(Ljava/lang/String;J)V
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_2

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1, p2}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->getType(J)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string v0, "type"

    invoke-virtual {p2, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "photo_extra"

    invoke-static {p1, p0, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_1
    return-void

    :cond_2
    :goto_0
    return-void
.end method
