.class public interface abstract Lcom/miui/os/Rom;
.super Ljava/lang/Object;
.source "Rom.java"


# static fields
.field public static final IS_ALPHA:Z

.field public static final IS_DEBUGGABLE:Z

.field public static final IS_DEV:Z

.field public static final IS_INTERNATIONAL:Z

.field public static final IS_MIUI:Z

.field public static final IS_STABLE:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    sget-boolean v0, Lcom/miui/core/SdkHelper;->IS_MIUI:Z

    sput-boolean v0, Lcom/miui/os/Rom;->IS_MIUI:Z

    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    sput-boolean v0, Lcom/miui/os/Rom;->IS_INTERNATIONAL:Z

    sget-boolean v0, Lcom/miui/core/SdkHelper;->IS_MIUI:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    sget-boolean v0, Lmiui/os/Build;->IS_ALPHA_BUILD:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/miui/os/Rom;->IS_ALPHA:Z

    sget-boolean v0, Lcom/miui/core/SdkHelper;->IS_MIUI:Z

    if-eqz v0, :cond_1

    sget-boolean v0, Lmiui/os/Build;->IS_DEVELOPMENT_VERSION:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    sput-boolean v0, Lcom/miui/os/Rom;->IS_DEV:Z

    sget-boolean v0, Lcom/miui/core/SdkHelper;->IS_MIUI:Z

    if-eqz v0, :cond_3

    sget-boolean v0, Lmiui/os/Build;->IS_STABLE_VERSION:Z

    if-eqz v0, :cond_2

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v0, 0x1

    :goto_3
    sput-boolean v0, Lcom/miui/os/Rom;->IS_STABLE:Z

    sget-boolean v0, Lcom/miui/core/SdkHelper;->IS_MIUI:Z

    if-eqz v0, :cond_4

    sget-boolean v0, Lmiui/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v0, :cond_4

    goto :goto_4

    :cond_4
    const/4 v1, 0x0

    :goto_4
    sput-boolean v1, Lcom/miui/os/Rom;->IS_DEBUGGABLE:Z

    return-void
.end method
