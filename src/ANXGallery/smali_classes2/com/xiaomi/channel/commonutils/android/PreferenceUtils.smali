.class public abstract Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;
.super Ljava/lang/Object;
.source "PreferenceUtils.java"


# direct methods
.method public static checkProcess(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public static getSettingBoolean(Landroid/content/Context;Ljava/lang/String;Z)Z
    .locals 0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->checkProcess(Landroid/content/Context;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static putNotNullExtra(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public static setSettingBoolean(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/android/PreferenceUtils;->checkProcess(Landroid/content/Context;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method
