.class public Lcom/miui/gallery/editor/photo/core/imports/filter/FilterManager;
.super Ljava/lang/Object;
.source "FilterManager.java"


# direct methods
.method static getAdjustData()Ljava/util/List;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;

    new-instance v7, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f10001b

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v2, 0x0

    const/16 v3, 0xa

    const v5, 0x7f070028

    const/4 v6, 0x1

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;-><init>(ISLjava/lang/String;IZ)V

    const/4 v1, 0x0

    aput-object v7, v0, v1

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f10001e

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    const/4 v9, 0x3

    const/16 v10, 0xa

    const v12, 0x7f07002b

    const/4 v13, 0x0

    move-object v8, v1

    invoke-direct/range {v8 .. v13}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;-><init>(ISLjava/lang/String;IZ)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f10001c

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v4, 0x1

    const/16 v5, 0xa

    const v7, 0x7f070029

    const/4 v8, 0x1

    move-object v3, v1

    invoke-direct/range {v3 .. v8}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;-><init>(ISLjava/lang/String;IZ)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f10001d

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v4, 0x2

    const v7, 0x7f07002a

    move-object v3, v1

    invoke-direct/range {v3 .. v8}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;-><init>(ISLjava/lang/String;IZ)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f10001f

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v4, 0x4

    const v7, 0x7f07002c

    const/4 v8, 0x0

    move-object v3, v1

    invoke-direct/range {v3 .. v8}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterAdjust;-><init>(ISLjava/lang/String;IZ)V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getAutoBeautifyData()Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;
    .locals 4

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f1004c4

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    const v3, 0x7f0701ed

    invoke-direct {v0, v2, v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;-><init>(ILjava/lang/String;I)V

    return-object v0
.end method

.method static getBeautifyData()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1003d6

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const v4, 0x7f0701ef

    invoke-direct {v1, v3, v2, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;-><init>(ILjava/lang/String;I)V

    aput-object v1, v0, v3

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1004c4

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    const v4, 0x7f0701ed

    invoke-direct {v1, v3, v2, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;-><init>(ILjava/lang/String;I)V

    aput-object v1, v0, v3

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1004c5

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    const v4, 0x7f0701ee

    invoke-direct {v1, v3, v2, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;-><init>(ILjava/lang/String;I)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f1004c8

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    const v6, 0x7f0701f1

    invoke-direct {v1, v5, v4, v6}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;-><init>(ILjava/lang/String;I)V

    aput-object v1, v0, v3

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1004c7

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f0701f0

    invoke-direct {v1, v2, v3, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterBeautify;-><init>(ILjava/lang/String;I)V

    aput-object v1, v0, v5

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private static getFilmFilterItem()Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1003d6

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f070123

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/film/film.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003c4

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x64

    const v5, 0x7f070121

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/film/quiet.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003c6

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0x50

    const v6, 0x7f070124

    invoke-direct {v1, v2, v3, v6, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/film/style.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v6, 0x7f1003c7

    invoke-virtual {v3, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v6, 0x7f070125

    invoke-direct {v1, v2, v3, v6, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/film/dew.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v6, 0x7f1003c2

    invoke-virtual {v3, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v6, 0x7f07011f

    invoke-direct {v1, v2, v3, v6, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/film/time.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v6, 0x7f1003c8

    invoke-virtual {v3, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v6, 0x7f070126

    invoke-direct {v1, v2, v3, v6, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/film/grey.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003c5

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f070122

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/film/bw.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003c1

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f07011e

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/film/fade.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003c3

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f070120

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method static getFilterCategory()Ljava/util/List;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1003bf

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f050099

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    const/4 v4, 0x3

    invoke-direct {v1, v4, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;-><init>(ILjava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isInternational()Z

    move-result v1

    const v2, 0x7f1003be

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/miui/settings/Settings;->getRegion()Ljava/lang/String;

    move-result-object v1

    const-string v3, "IN"

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    const/4 v4, 0x5

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f050096

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f050097

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v7

    const/4 v8, 0x5

    move-object v3, v1

    invoke-direct/range {v3 .. v8}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;-><init>(ILjava/lang/String;III)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    const/4 v10, 0x2

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f050095

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v12

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f050098

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v13

    const/4 v14, 0x4

    move-object v9, v1

    invoke-direct/range {v9 .. v14}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;-><init>(ILjava/lang/String;III)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    const/4 v2, 0x4

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003bc

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f050092

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;-><init>(ILjava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    const/4 v2, 0x1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003bb

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f050091

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;-><init>(ILjava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "wayne"

    sget-object v2, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    const/4 v2, 0x6

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003bd

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f050094

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;-><init>(ILjava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    return-object v0
.end method

.method static getFiltersByCategory(I)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;",
            ">;"
        }
    .end annotation

    packed-switch p0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "not support filterCategory:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterManager;->getSkyFilterItem()Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    :pswitch_1
    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterManager;->getMasterFilterItem()Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    :pswitch_2
    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterManager;->getPortraitIndiaFilterItem()Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    :pswitch_3
    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterManager;->getFoodFilterItem()Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    :pswitch_4
    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterManager;->getSceneFilterItem()Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    :pswitch_5
    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterManager;->getPortraitFilterItem()Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    :pswitch_6
    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterManager;->getFilmFilterItem()Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getFoodFilterItem()Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1003d6

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f07012d

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/food/cookie.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003ca

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x3c

    const v5, 0x7f070128

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/food/soda.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003cf

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f07012e

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/food/latte.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003ce

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0x50

    const v6, 0x7f07012c

    invoke-direct {v1, v2, v3, v6, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/food/delicacy.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v6, 0x7f1003cb

    invoke-virtual {v3, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v6, 0x7f070129

    invoke-direct {v1, v2, v3, v6, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/food/barbecue.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v6, 0x7f1003c9

    invoke-virtual {v3, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0x46

    const v7, 0x7f070127

    invoke-direct {v1, v2, v3, v7, v6}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/food/wholemeal.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v7, 0x7f1003d0

    invoke-virtual {v3, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v7, 0x7f07012f

    invoke-direct {v1, v2, v3, v7, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/food/berry.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003cd

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f07012b

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/food/dessert.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003cc

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f07012a

    invoke-direct {v1, v2, v3, v4, v6}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method private static getMasterFilterItem()Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1003d6

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f070133

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/master/memoire.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003d3

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x64

    const v5, 0x7f070132

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/master/mellow.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003d2

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f070131

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/master/somber.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003d5

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f070135

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/master/rise.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003d4

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f070134

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/master/hazy.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003d1

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f070130

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method private static getPortraitFilterItem()Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1003d6

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f07013d

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty/nature.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003df

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x46

    const v5, 0x7f07013c

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty/japanese.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003da

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0x64

    const v6, 0x7f070138

    invoke-direct {v1, v2, v3, v6, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty/pink.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v6, 0x7f1003e0

    invoke-virtual {v3, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v6, 0x7f07013e

    invoke-direct {v1, v2, v3, v6, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty/story.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003e4

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f070141

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty/fairytale.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003d8

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f070137

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty/maze.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003dc

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f07013a

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty/riddle.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003e1

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f07013f

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty/movie.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003de

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f07013b

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty/tea.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003e5

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f070142

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty/lilt.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003db

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f070139

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty/sepia.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003e3

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f070140

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty/bw.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003d7

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f070136

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method private static getPortraitIndiaFilterItem()Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1003d6

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f070213

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty_india/sunny.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003b6

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x50

    const v5, 0x7f070218

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty_india/pink.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003b0

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0x64

    const v6, 0x7f070214

    invoke-direct {v1, v2, v3, v6, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty_india/memory.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v6, 0x7f1003ae

    invoke-virtual {v3, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v6, 0x7f070212

    invoke-direct {v1, v2, v3, v6, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty_india/strong.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v6, 0x7f1003b5

    invoke-virtual {v3, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v6, 0x7f070217

    invoke-direct {v1, v2, v3, v6, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty_india/warm.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003b9

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f070219

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty_india/retro.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003b2

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f070215

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty_india/romantic.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003b3

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f070216

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty_india/dusk.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003ac

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f070119

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty_india/lilt.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003ad

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f07011a

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty_india/tea.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003b8

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f07011c

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty_india/sepia.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003b4

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f07011b

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/beauty_india/bw.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003ab

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f070118

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method private static getSceneFilterItem()Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1003d6

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f070148

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/scene/lively.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003ec

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x50

    const v5, 0x7f07014a

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/scene/koizora.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003e8

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f070145

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/scene/warm.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003ed

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f07014b

    invoke-direct {v1, v2, v3, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/scene/light.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f1003eb

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0x64

    const v6, 0x7f070149

    invoke-direct {v1, v2, v3, v6, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/scene/neon.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v6, 0x7f1003ea

    invoke-virtual {v3, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v6, 0x7f070147

    const/16 v7, 0x3c

    invoke-direct {v1, v2, v3, v6, v7}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/scene/city.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v6, 0x7f1003e6

    invoke-virtual {v3, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v6, 0x7f070143

    invoke-direct {v1, v2, v3, v6, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/scene/lomo.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v6, 0x7f1003e9

    invoke-virtual {v3, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v6, 0x7f070146

    invoke-direct {v1, v2, v3, v6, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v2, "filter/scene/df.png"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f1003e7

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f070144

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method private static getSkyFilterItem()Ljava/util/ArrayList;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1003d6

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    const v4, 0x7f07014f

    invoke-direct {v1, v3, v2, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(ZLjava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v7, "filter_sky_sunny"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1003f7

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v6, 0x1

    const v9, 0x7f070151

    const/16 v10, 0x50

    move-object v5, v1

    invoke-direct/range {v5 .. v10}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(ZLjava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v13, "filter_sky_cloudy"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1003ee

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v12, 0x1

    const v15, 0x7f07014c

    const/16 v16, 0x50

    move-object v11, v1

    invoke-direct/range {v11 .. v16}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(ZLjava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v4, "filter_sky_rainbow"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1003f6

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v3, 0x1

    const v6, 0x7f070150

    const/16 v7, 0x50

    move-object v2, v1

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(ZLjava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v10, "filter_sky_glow"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1003f5

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    const/4 v9, 0x1

    const v12, 0x7f07014e

    const/16 v13, 0x50

    move-object v8, v1

    invoke-direct/range {v8 .. v13}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(ZLjava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v4, "filter_sky_dusk"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1003f4

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v3, 0x1

    const v6, 0x7f07014d

    const/16 v7, 0x64

    move-object v2, v1

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(ZLjava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    const-string v10, "filter_sky_sunset"

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f1003f8

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    const v12, 0x7f070152

    const/16 v13, 0x64

    move-object v8, v1

    invoke-direct/range {v8 .. v13}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;-><init>(ZLjava/lang/String;Ljava/lang/String;II)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
