.class public Lcom/miui/gallery/preference/BaseGalleryPreferences$SampleStatistic;
.super Ljava/lang/Object;
.source "BaseGalleryPreferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/preference/BaseGalleryPreferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SampleStatistic"
.end annotation


# direct methods
.method public static getUniqId()J
    .locals 5

    const-string v0, "user_uniq_id"

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    move-result-wide v3

    const-string v0, "user_uniq_id"

    invoke-static {v0, v3, v4}, Lcom/miui/gallery/preference/PreferenceHelper;->putLong(Ljava/lang/String;J)V

    :cond_0
    return-wide v3
.end method

.method public static hasUploadUserInfo()Z
    .locals 2

    const-string v0, "user_info_self_shoot"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static setUploadedUserInfo(Z)V
    .locals 1

    const-string v0, "user_info_self_shoot"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method
