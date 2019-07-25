.class public Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyManager;
.super Ljava/lang/Object;
.source "MiuiBeautyManager.java"


# direct methods
.method public static getBeautyEffects()[Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;
    .locals 14

    sget-object v0, Lcom/miui/filtersdk/beauty/BeautyProcessorManager;->INSTANCE:Lcom/miui/filtersdk/beauty/BeautyProcessorManager;

    invoke-virtual {v0}, Lcom/miui/filtersdk/beauty/BeautyProcessorManager;->getBeautyProcessor()Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;->getSupportedBeautyParamTypes()[Lcom/miui/filtersdk/beauty/BeautyParameterType;

    move-result-object v0

    array-length v1, v0

    array-length v2, v0

    const/4 v3, 0x0

    move v4, v1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_2

    aget-object v5, v0, v1

    sget-object v6, Lcom/miui/filtersdk/beauty/BeautyParameterType;->RUDDY_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    if-eq v6, v5, :cond_0

    sget-object v6, Lcom/miui/filtersdk/beauty/BeautyParameterType;->IRIS_SHINE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    if-ne v6, v5, :cond_1

    :cond_0
    add-int/lit8 v4, v4, -0x1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    if-eqz v0, :cond_3

    if-lez v4, :cond_3

    new-array v1, v4, [Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    const/4 v2, 0x0

    :goto_1
    array-length v4, v0

    if-ge v2, v4, :cond_3

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyManager$1;->$SwitchMap$com$miui$filtersdk$beauty$BeautyParameterType:[I

    aget-object v5, v0, v2

    invoke-virtual {v5}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    const/16 v5, 0x9

    const/16 v6, 0x8

    const/4 v7, 0x7

    const/4 v8, 0x6

    const/4 v9, 0x5

    const/4 v10, 0x4

    const/4 v11, 0x3

    const/4 v12, 0x2

    const/4 v13, 0x1

    packed-switch v4, :pswitch_data_0

    goto/16 :goto_2

    :pswitch_0
    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f100529

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0xa

    aget-object v8, v0, v2

    invoke-direct {v4, v6, v7, v8}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;-><init>(Ljava/lang/String;ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    aput-object v4, v1, v5

    goto/16 :goto_2

    :pswitch_1
    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v7

    const v8, 0x7f10052a

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    aget-object v8, v0, v2

    invoke-direct {v4, v7, v5, v8}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;-><init>(Ljava/lang/String;ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    aput-object v4, v1, v6

    goto/16 :goto_2

    :pswitch_2
    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v5

    const v8, 0x7f10052b

    invoke-virtual {v5, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aget-object v8, v0, v2

    invoke-direct {v4, v5, v6, v8}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;-><init>(Ljava/lang/String;ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    aput-object v4, v1, v7

    goto/16 :goto_2

    :pswitch_3
    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f100523

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aget-object v6, v0, v2

    invoke-direct {v4, v5, v7, v6}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;-><init>(Ljava/lang/String;ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    aput-object v4, v1, v8

    goto/16 :goto_2

    :pswitch_4
    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f100525

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aget-object v6, v0, v2

    invoke-direct {v4, v5, v8, v6}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;-><init>(Ljava/lang/String;ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    aput-object v4, v1, v9

    goto :goto_2

    :pswitch_5
    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f100526

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aget-object v6, v0, v2

    invoke-direct {v4, v5, v9, v6}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;-><init>(Ljava/lang/String;ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    aput-object v4, v1, v10

    goto :goto_2

    :pswitch_6
    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f100527

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aget-object v6, v0, v2

    invoke-direct {v4, v5, v10, v6}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;-><init>(Ljava/lang/String;ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    aput-object v4, v1, v11

    goto :goto_2

    :pswitch_7
    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f10052f

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aget-object v6, v0, v2

    invoke-direct {v4, v5, v11, v6}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;-><init>(Ljava/lang/String;ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    aput-object v4, v1, v12

    goto :goto_2

    :pswitch_8
    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f10052d

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aget-object v6, v0, v2

    invoke-direct {v4, v5, v12, v6}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;-><init>(Ljava/lang/String;ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    aput-object v4, v1, v13

    goto :goto_2

    :pswitch_9
    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f100528

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aget-object v6, v0, v2

    invoke-direct {v4, v5, v13, v6}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;-><init>(Ljava/lang/String;ILcom/miui/filtersdk/beauty/BeautyParameterType;)V

    aput-object v4, v1, v3

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    :cond_3
    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
