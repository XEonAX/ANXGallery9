.class public Lcom/miui/gallery/preference/GalleryPreferences$Secret;
.super Ljava/lang/Object;
.source "GalleryPreferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/preference/GalleryPreferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Secret"
.end annotation


# direct methods
.method public static isFirstAddSecret()Z
    .locals 2

    const-string v0, "first_add_secret"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isFirstAddSecretVideo()Z
    .locals 2

    const-string v0, "first_add_secret_video"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isFirstUsePrivacyPassword()Z
    .locals 2

    const-string v0, "first_use_privacy_password"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static setFirstAddSecretVideo(Z)V
    .locals 1

    const-string v0, "first_add_secret_video"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setIsFirstAddSecret(Z)V
    .locals 1

    const-string v0, "first_add_secret"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setIsFirstUsePrivacyPassword(Z)V
    .locals 1

    const-string v0, "first_use_privacy_password"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method
