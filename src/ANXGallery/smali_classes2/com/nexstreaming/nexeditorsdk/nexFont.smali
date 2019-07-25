.class public final Lcom/nexstreaming/nexeditorsdk/nexFont;
.super Ljava/lang/Object;
.source "nexFont.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "nexFont"

.field private static list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexFont;",
            ">;"
        }
    .end annotation
.end field

.field private static s_update:Z


# instance fields
.field private builtin:Z

.field private font:Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

.field private sample:Ljava/lang/String;

.field private system:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexFont;->list:Ljava/util/List;

    return-void
.end method

.method private constructor <init>(ZLcom/nexstreaming/kminternal/kinemaster/fonts/Font;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexFont;->builtin:Z

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexFont;->font:Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    iput-object p3, p0, Lcom/nexstreaming/nexeditorsdk/nexFont;->sample:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/nexstreaming/nexeditorsdk/nexFont;->system:Z

    return-void
.end method

.method static checkUpdate()V
    .locals 1

    sget-boolean v0, Lcom/nexstreaming/nexeditorsdk/nexFont;->s_update:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    sput-boolean v0, Lcom/nexstreaming/nexeditorsdk/nexFont;->s_update:Z

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexFont;->reload()V

    :cond_0
    return-void
.end method

.method public static clearBuiltinFontsCache()V
    .locals 1

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/fonts/c;->a()Lcom/nexstreaming/kminternal/kinemaster/fonts/c;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/fonts/c;->c()V

    return-void
.end method

.method public static getFont(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexFont;
    .locals 3

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexFont;->checkUpdate()V

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexFont;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexFont;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexFont;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    return-object v1

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getFontIds()[Ljava/lang/String;
    .locals 3

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexFont;->checkUpdate()V

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexFont;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexFont;->list:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/nexFont;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexFont;->getId()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private static getLocalPath(Lcom/nexstreaming/app/common/nexasset/assetpackage/f;)Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v1

    invoke-interface {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getPackageURI()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-interface {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getFilePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->c(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v1, :cond_0

    :try_start_2
    invoke-virtual {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "nexFont"

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-object p0

    :catch_1
    move-exception p0

    goto :goto_1

    :catchall_0
    move-exception p0

    move-object v1, v0

    goto :goto_3

    :catch_2
    move-exception p0

    move-object v1, v0

    :goto_1
    :try_start_3
    const-string v2, "nexFont"

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v1, :cond_1

    :try_start_4
    invoke-virtual {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_2

    :catch_3
    move-exception p0

    const-string v1, "nexFont"

    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_2
    return-object v0

    :catchall_1
    move-exception p0

    :goto_3
    if-eqz v1, :cond_2

    :try_start_5
    invoke-virtual {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_4

    :catch_4
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "nexFont"

    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_4
    throw p0
.end method

.method public static getPresetList()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexFont;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexFont;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_7

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/fonts/c;->a()Lcom/nexstreaming/kminternal/kinemaster/fonts/c;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/fonts/c;->b()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/kminternal/kinemaster/fonts/b;

    invoke-interface {v1}, Lcom/nexstreaming/kminternal/kinemaster/fonts/b;->a()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    invoke-virtual {v3}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;->a()Ljava/lang/String;

    move-result-object v4

    const-string v5, "system"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    sget-object v5, Lcom/nexstreaming/nexeditorsdk/nexFont;->list:Ljava/util/List;

    new-instance v6, Lcom/nexstreaming/nexeditorsdk/nexFont;

    const/4 v7, 0x0

    invoke-virtual {v3, v7}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v2, v3, v7, v4}, Lcom/nexstreaming/nexeditorsdk/nexFont;-><init>(ZLcom/nexstreaming/kminternal/kinemaster/fonts/Font;Ljava/lang/String;Z)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    sget-object v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->font:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    invoke-interface {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->isHidden()Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    invoke-interface {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getAssetPackage()Lcom/nexstreaming/app/common/nexasset/assetpackage/b;

    move-result-object v3

    invoke-interface {v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetSubCategory()Lcom/nexstreaming/app/common/nexasset/assetpackage/d;

    move-result-object v3

    invoke-interface {v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/d;->getSubCategoryId()J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_3

    const-string v3, "asset"

    :cond_3
    invoke-interface {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getSampleText()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v5, v2, :cond_5

    :cond_4
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v4

    invoke-virtual {v4}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v4

    invoke-interface {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getLabel()Ljava/util/Map;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/nexstreaming/app/common/util/n;->a(Landroid/content/Context;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v4

    :cond_5
    if-nez v4, :cond_6

    invoke-interface {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getId()Ljava/lang/String;

    move-result-object v4

    :cond_6
    const-string v5, "nexFont"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "asset font id="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ", loacalPath="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/nexFont;->getLocalPath(Lcom/nexstreaming/app/common/nexasset/assetpackage/f;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v5, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    invoke-interface {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getId()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/io/File;

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/nexFont;->getLocalPath(Lcom/nexstreaming/app/common/nexasset/assetpackage/f;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6, v3, v7, v4}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)V

    invoke-interface {v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getPackageURI()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->getInstalledAssetPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    xor-int/2addr v1, v2

    sget-object v3, Lcom/nexstreaming/nexeditorsdk/nexFont;->list:Ljava/util/List;

    new-instance v6, Lcom/nexstreaming/nexeditorsdk/nexFont;

    const/4 v7, 0x0

    invoke-direct {v6, v1, v5, v4, v7}, Lcom/nexstreaming/nexeditorsdk/nexFont;-><init>(ZLcom/nexstreaming/kminternal/kinemaster/fonts/Font;Ljava/lang/String;Z)V

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_7
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexFont;->list:Ljava/util/List;

    return-object v0
.end method

.method public static getTypeface(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;
    .locals 0

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/fonts/c;->a()Lcom/nexstreaming/kminternal/kinemaster/fonts/c;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/fonts/c;->b(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method static isLoadedFont(Ljava/lang/String;)Z
    .locals 3

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/fonts/c;->a()Lcom/nexstreaming/kminternal/kinemaster/fonts/c;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/nexstreaming/kminternal/kinemaster/fonts/c;->a(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_1

    return v0

    :cond_1
    invoke-interface {p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getCategory()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    move-result-object p0

    sget-object v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->font:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    if-ne p0, v2, :cond_2

    return v1

    :cond_2
    return v0
.end method

.method static needUpdate()V
    .locals 1

    const/4 v0, 0x1

    sput-boolean v0, Lcom/nexstreaming/nexeditorsdk/nexFont;->s_update:Z

    return-void
.end method

.method public static reload()V
    .locals 1

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexFont;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexFont;->getPresetList()Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexFont;->font:Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;->a()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSampleImage(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexFont;->font:Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;->c(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method public getSampleText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexFont;->sample:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeFace()Landroid/graphics/Typeface;
    .locals 2

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/fonts/c;->a()Lcom/nexstreaming/kminternal/kinemaster/fonts/c;

    move-result-object v0

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexFont;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/kinemaster/fonts/c;->b(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method

.method public isBuiltinFont()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexFont;->builtin:Z

    return v0
.end method

.method public isSystemFont()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexFont;->system:Z

    return v0
.end method
