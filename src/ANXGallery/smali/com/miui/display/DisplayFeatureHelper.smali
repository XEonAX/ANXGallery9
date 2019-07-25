.class public Lcom/miui/display/DisplayFeatureHelper;
.super Ljava/lang/Object;
.source "DisplayFeatureHelper.java"


# direct methods
.method public static setScreenEffect(Z)V
    .locals 1

    sget-boolean v0, Lcom/miui/core/SdkHelper;->IS_MIUI:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/miui/internal/GalleryDisplayFeatureManager;->setScreenEffect(Z)V

    :cond_0
    return-void
.end method
