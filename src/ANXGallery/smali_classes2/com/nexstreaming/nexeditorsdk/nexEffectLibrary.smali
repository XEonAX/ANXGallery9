.class public final Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;
.super Ljava/lang/Object;
.source "nexEffectLibrary.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary$OnInstallPluginEffectPackageAsyncListener;
    }
.end annotation


# static fields
.field private static sSingleton:Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;


# instance fields
.field private final mAppContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->mAppContext:Landroid/content/Context;

    return-void
.end method

.method public static getEffectLibrary(Landroid/content/Context;)Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;

    iget-object v0, v0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->mAppContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;

    :cond_0
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;

    if-nez v0, :cond_1

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;

    invoke-direct {v0, p0}, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;

    :cond_1
    sget-object p0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;

    return-object p0
.end method

.method public static getPluginDirPath()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->g()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method checkEffectID(Ljava/lang/String;)Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->mAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    sget-object v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->transition:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    invoke-virtual {v0, p1, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Ljava/lang/String;Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->mAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    sget-object v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->effect:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    invoke-virtual {v0, p1, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Ljava/lang/String;Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;)Z

    move-result v0

    :cond_0
    return v0
.end method

.method public findClipEffectById(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexClipEffect;
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->mAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getCategory()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    move-result-object v2

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->effect:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    if-ne v2, v3, :cond_1

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    invoke-direct {v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getType()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    move-result-object p1

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getMethodType(Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;)Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    move-result-object p1

    iput-object p1, v1, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->itemMethodType:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    return-object v1

    :cond_1
    return-object v1
.end method

.method public findOverlayFilterById(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->mAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getType()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    move-result-object v0

    sget-object v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;->renderitem:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    if-ne v0, v2, :cond_1

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    invoke-direct {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;-><init>(Ljava/lang/String;)V

    return-object v0

    :cond_1
    return-object v1
.end method

.method public findThemeById(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexTheme;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method public findTransitionEffectById(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->mAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getCategory()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    move-result-object v2

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->transition:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    if-ne v2, v3, :cond_1

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    invoke-direct {v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getType()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    move-result-object p1

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getMethodType(Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;)Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    move-result-object p1

    iput-object p1, v1, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->itemMethodType:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    return-object v1

    :cond_1
    return-object v1
.end method

.method public getClipEffects()[Lcom/nexstreaming/nexeditorsdk/nexClipEffect;
    .locals 6

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->mAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    sget-object v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->effect:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->isHidden()Z

    move-result v4

    if-nez v4, :cond_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    new-array v1, v3, [Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    invoke-interface {v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->isHidden()Z

    move-result v4

    if-nez v4, :cond_2

    new-instance v4, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    invoke-interface {v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;-><init>(Ljava/lang/String;)V

    aput-object v4, v1, v2

    aget-object v4, v1, v2

    invoke-interface {v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getType()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    move-result-object v3

    invoke-static {v3}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getMethodType(Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;)Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    move-result-object v3

    iput-object v3, v4, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->itemMethodType:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    return-object v1
.end method

.method public getEffectOptions(Landroid/content/Context;Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;
    .locals 13

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_17

    invoke-interface {p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getCategory()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    move-result-object v1

    sget-object v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->transition:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-ne v1, v2, :cond_0

    const/4 p1, 0x4

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getCategory()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    move-result-object v1

    sget-object v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->effect:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    if-ne v1, v2, :cond_1

    const/4 p1, 0x2

    goto :goto_0

    :cond_1
    invoke-interface {p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getCategory()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    move-result-object v1

    sget-object v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->filter:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    if-ne v1, v2, :cond_2

    invoke-interface {p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getType()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    move-result-object p1

    sget-object v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;->renderitem:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    if-ne p1, v1, :cond_2

    const/4 p1, 0x5

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;

    invoke-direct {v1, p2, p1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;-><init>(Ljava/lang/String;I)V

    :try_start_0
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Landroid/content/Context;Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/h;

    move-result-object p1
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    :goto_1
    move-object p1, v0

    :goto_2
    if-nez p1, :cond_3

    goto/16 :goto_9

    :cond_3
    invoke-interface {p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/h;->a()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_4
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_16

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;

    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->i()Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_5

    const-string v5, "label"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_5

    const-string v5, "en"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    goto :goto_4

    :cond_5
    move-object v2, v0

    :goto_4
    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    move-result-object v5

    sget-object v6, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->RGBA:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    if-eq v5, v6, :cond_14

    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    move-result-object v5

    sget-object v6, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->RGB:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    if-ne v5, v6, :cond_6

    goto/16 :goto_8

    :cond_6
    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    move-result-object v5

    sget-object v6, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->TEXT:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    const/4 v7, 0x1

    if-ne v5, v6, :cond_9

    if-nez v2, :cond_7

    const-string v2, "Text"

    :cond_7
    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->e()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->f()Z

    move-result p2

    if-eqz p2, :cond_8

    const/4 v7, 0x2

    :cond_8
    invoke-virtual {v1, v5, v2, v7}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->addTextOpt(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_3

    :cond_9
    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    move-result-object v5

    sget-object v6, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->CHOICE:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    if-ne v5, v6, :cond_f

    if-nez v2, :cond_a

    const-string v2, "Choice"

    :cond_a
    move-object v7, v2

    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->j()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    new-array v8, v5, [Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    new-array v9, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v10, 0x0

    :goto_5
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_e

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/nexstreaming/app/common/nexasset/assetpackage/g$a;

    invoke-interface {v6}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g$a;->a()Ljava/util/Map;

    move-result-object v6

    if-eqz v6, :cond_b

    const-string v11, "label"

    invoke-interface {v6, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    if-eqz v6, :cond_b

    const-string v11, "en"

    invoke-interface {v6, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    goto :goto_6

    :cond_b
    move-object v6, v0

    :goto_6
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/nexstreaming/app/common/nexasset/assetpackage/g$a;

    invoke-interface {v11}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g$a;->b()Ljava/lang/String;

    move-result-object v11

    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->b()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v11

    if-nez v11, :cond_c

    move v10, v5

    :cond_c
    if-nez v6, :cond_d

    new-instance v6, Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "item"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v6, v11}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :cond_d
    aput-object v6, v8, v5

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/nexstreaming/app/common/nexasset/assetpackage/g$a;

    invoke-interface {v6}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g$a;->b()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v9, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    :cond_e
    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->e()Ljava/lang/String;

    move-result-object v6

    move-object v5, v1

    invoke-virtual/range {v5 .. v10}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->addSelectOpt(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;I)V

    goto/16 :goto_3

    :cond_f
    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    move-result-object v5

    sget-object v6, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->RANGE:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    if-ne v5, v6, :cond_11

    if-nez v2, :cond_10

    const-string v2, "Range"

    :cond_10
    move-object v7, v2

    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->b()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->e()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->g()I

    move-result v9

    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->h()I

    move-result v10

    move-object v5, v1

    invoke-virtual/range {v5 .. v10}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->addRangeOpt(Ljava/lang/String;Ljava/lang/String;III)V

    goto/16 :goto_3

    :cond_11
    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    move-result-object v5

    sget-object v6, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->SWITCH:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    if-ne v5, v6, :cond_4

    if-nez v2, :cond_12

    const-string v2, "Switch"

    :cond_12
    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->d()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->b()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_13

    goto :goto_7

    :cond_13
    const/4 v7, 0x0

    :goto_7
    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->e()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2, v2, v7}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->addSwitchOpt(Ljava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_3

    :cond_14
    :goto_8
    if-nez v2, :cond_15

    const-string v2, "Color"

    :cond_15
    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->e()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->b()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, v5, v2, p2}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->addColorOpt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    :cond_16
    :goto_9
    return-object v1

    :cond_17
    return-object v0
.end method

.method public getOverlayFilters()[Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;
    .locals 5

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->mAppContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v1

    sget-object v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->effect:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    invoke-virtual {v1, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->isHidden()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getType()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    move-result-object v3

    sget-object v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;->renderitem:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    if-ne v3, v4, :cond_0

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    const/4 v2, 0x0

    :goto_1
    array-length v3, v1

    if-ge v2, v3, :cond_2

    new-instance v3, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {v3, v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;-><init>(Ljava/lang/String;)V

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-object v1
.end method

.method public getThemes()[Lcom/nexstreaming/nexeditorsdk/nexTheme;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/nexstreaming/nexeditorsdk/nexTheme;

    return-object v0
.end method

.method public getThemesEx()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/nexstreaming/nexeditorsdk/nexTheme;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public getTransitionEffects()[Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;
    .locals 6

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->mAppContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    sget-object v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->transition:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->isHidden()Z

    move-result v4

    if-nez v4, :cond_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    new-array v1, v3, [Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    invoke-interface {v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->isHidden()Z

    move-result v4

    if-nez v4, :cond_2

    new-instance v4, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    invoke-interface {v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;-><init>(Ljava/lang/String;)V

    aput-object v4, v1, v2

    aget-object v4, v1, v2

    invoke-interface {v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getType()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    move-result-object v3

    invoke-static {v3}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getMethodType(Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;)Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    move-result-object v3

    iput-object v3, v4, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->itemMethodType:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    return-object v1
.end method

.method public getTransitionEffectsEx()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->mAppContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v1

    sget-object v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->transition:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    invoke-virtual {v1, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->isHidden()Z

    move-result v3

    if-nez v3, :cond_0

    new-instance v3, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public installPluginEffectPackageAsync([Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary$OnInstallPluginEffectPackageAsyncListener;)Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 p1, 0x1

    return p1
.end method
