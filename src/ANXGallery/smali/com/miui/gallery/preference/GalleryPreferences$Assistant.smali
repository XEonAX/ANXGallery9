.class public Lcom/miui/gallery/preference/GalleryPreferences$Assistant;
.super Ljava/lang/Object;
.source "GalleryPreferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/preference/GalleryPreferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Assistant"
.end annotation


# direct methods
.method public static getLastGuaranteeTriggerTime()J
    .locals 3

    const-string v0, "assistant_last_guarantee_trigger_time"

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getLastImageFeatureTaskTime()J
    .locals 3

    const-string v0, "assistant_last_image_feature_task_time"

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getLastTriggerTime()J
    .locals 3

    const-string v0, "assistant_last_trigger_time"

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static hasCardEver()Z
    .locals 2

    const-string v0, "assistant_has_card_ever"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isFirstShowImageSelection()Z
    .locals 2

    const-string v0, "assistant_first_show_image_selection"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isImageSelectionFunctionOn()Z
    .locals 2

    const-string v0, "assistant_image_selection_function"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isStoryFunctionOn()Z
    .locals 2

    const-string v0, "assistant_story_function"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static setHasCardEver()V
    .locals 2

    const-string v0, "assistant_has_card_ever"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setImageSelectionFunctionState(Z)V
    .locals 1

    const-string v0, "assistant_image_selection_function"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setIsFirstShowImageSelection(Z)V
    .locals 1

    const-string v0, "assistant_first_show_image_selection"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setLastGuaranteeTriggerTime(J)V
    .locals 1

    const-string v0, "assistant_last_guarantee_trigger_time"

    invoke-static {v0, p0, p1}, Lcom/miui/gallery/preference/PreferenceHelper;->putLong(Ljava/lang/String;J)V

    return-void
.end method

.method public static setLastImageFeatureTaskTime(J)V
    .locals 1

    const-string v0, "assistant_last_image_feature_task_time"

    invoke-static {v0, p0, p1}, Lcom/miui/gallery/preference/PreferenceHelper;->putLong(Ljava/lang/String;J)V

    return-void
.end method

.method public static setLastTriggerTime(J)V
    .locals 1

    const-string v0, "assistant_last_trigger_time"

    invoke-static {v0, p0, p1}, Lcom/miui/gallery/preference/PreferenceHelper;->putLong(Ljava/lang/String;J)V

    return-void
.end method

.method public static setStoryFunctionState(Z)V
    .locals 1

    const-string v0, "assistant_story_function"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method
