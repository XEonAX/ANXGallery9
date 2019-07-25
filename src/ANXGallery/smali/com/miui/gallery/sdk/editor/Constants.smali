.class public interface abstract Lcom/miui/gallery/sdk/editor/Constants;
.super Ljava/lang/Object;
.source "Constants.java"


# static fields
.field public static final EXTRA_IS_LONG_SCREENSHOT:Ljava/lang/String;

.field public static final EXTRA_IS_SCREENSHOT:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Lmiui/external/SdkHelper;->isMiuiSystem()Z

    move-result v0

    const-string v0, "IsScreenshot"

    sput-object v0, Lcom/miui/gallery/sdk/editor/Constants;->EXTRA_IS_SCREENSHOT:Ljava/lang/String;

    invoke-static {}, Lmiui/external/SdkHelper;->isMiuiSystem()Z

    move-result v0

    const-string v0, "IsLongScreenshot"

    sput-object v0, Lcom/miui/gallery/sdk/editor/Constants;->EXTRA_IS_LONG_SCREENSHOT:Ljava/lang/String;

    return-void
.end method
