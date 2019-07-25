.class public Lcom/miui/gallery/editor/photo/app/crop/AutoCropJni;
.super Ljava/lang/Object;
.source "AutoCropJni.java"


# static fields
.field private static sLoaded:Z = false


# direct methods
.method static constructor <clinit>()V
    .locals 3

    :try_start_0
    const-string v0, "autocrop"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/miui/gallery/editor/photo/app/crop/AutoCropJni;->sLoaded:Z
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "AutoCropJni"

    const-string v2, "library load failed.\n"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static native autoRotation([BIILcom/miui/gallery/editor/photo/app/crop/AutoCropData;)I
.end method

.method public static isAvailable()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/editor/photo/app/crop/AutoCropJni;->sLoaded:Z

    return v0
.end method
