.class public Lcom/miui/gallery/preference/GalleryPreferences$CTA;
.super Lcom/miui/gallery/preference/BaseGalleryPreferences$CTA;
.source "GalleryPreferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/preference/GalleryPreferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CTA"
.end annotation


# direct methods
.method public static onCreateOrDestroyHomePage()V
    .locals 1

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->setCanConnectToNetworkTemp(Z)V

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->setToAllowUseOnOfflineGlobal(Z)V

    return-void
.end method
