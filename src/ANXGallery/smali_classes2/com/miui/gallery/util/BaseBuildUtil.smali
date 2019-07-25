.class public Lcom/miui/gallery/util/BaseBuildUtil;
.super Ljava/lang/Object;
.source "BaseBuildUtil.java"


# static fields
.field public static final IS_DEBUG_BUILD:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget-object v0, Landroid/os/Build;->TYPE:Ljava/lang/String;

    const-string v1, "eng"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Landroid/os/Build;->TYPE:Ljava/lang/String;

    const-string v1, "userdebug"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    sput-boolean v0, Lcom/miui/gallery/util/BaseBuildUtil;->IS_DEBUG_BUILD:Z

    return-void
.end method

.method public static getRegion()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/settings/Settings;->getRegion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isInternational()Z
    .locals 1

    sget-boolean v0, Lcom/miui/os/Rom;->IS_INTERNATIONAL:Z

    return v0
.end method

.method public static isUUIDSDCard()Z
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
