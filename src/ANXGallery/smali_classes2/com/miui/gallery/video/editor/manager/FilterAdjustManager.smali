.class public Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;
.super Ljava/lang/Object;
.source "FilterAdjustManager.java"


# static fields
.field private static filterIcons:[I

.field private static sAdjustMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sFilterName:[Ljava/lang/String;

.field private static sFilterNameKeys:[Ljava/lang/String;

.field private static sFilterTypes:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    new-instance v0, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager$1;

    invoke-direct {v0}, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->sAdjustMap:Ljava/util/HashMap;

    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->filterIcons:[I

    const-string v1, "ve_type_none"

    const-string v2, "ve_type_local"

    const-string v3, "ve_type_local"

    const-string v4, "ve_type_local"

    const-string v5, "ve_type_local"

    const-string v6, "ve_type_local"

    const-string v7, "ve_type_local"

    const-string v8, "ve_type_local"

    const-string v9, "ve_type_local"

    filled-new-array/range {v1 .. v9}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->sFilterTypes:[Ljava/lang/String;

    const-string v1, "video_editor_filter_origin"

    const-string v2, "video_editor_filter_jiaopian"

    const-string v3, "video_editor_filter_jingmi"

    const-string v4, "video_editor_filter_wangshi"

    const-string v5, "video_editor_filter_nuancha"

    const-string v6, "video_editor_filter_bailu"

    const-string v7, "video_editor_filter_qingse"

    const-string v8, "video_editor_filter_xiaosenlin"

    const-string v9, "video_editor_filter_heibai"

    filled-new-array/range {v1 .. v9}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->sFilterNameKeys:[Ljava/lang/String;

    const-string v1, "\u539f\u56fe"

    const-string v2, "\u80f6\u7247"

    const-string v3, "\u9759\u8c27"

    const-string v4, "\u5f80\u4e8b"

    const-string v5, "\u6696\u8336"

    const-string v6, "\u767d\u9732"

    const-string v7, "\u9752\u6da9"

    const-string v8, "\u5c0f\u68ee\u6797"

    const-string v9, "\u9ed1\u767d"

    filled-new-array/range {v1 .. v9}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->sFilterName:[Ljava/lang/String;

    return-void

    nop

    :array_0
    .array-data 4
        0x7f07030c
        0x7f070309
        0x7f07030a
        0x7f07030f
        0x7f07030b
        0x7f070307
        0x7f07030d
        0x7f070310
        0x7f070308
    .end array-data
.end method

.method public static getAdjustData()Ljava/util/List;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/video/editor/model/FilterAdjustData;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/miui/gallery/video/editor/model/FilterAdjustData;

    new-instance v8, Lcom/miui/gallery/video/editor/model/FilterAdjustData;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f10001b

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    sget-object v1, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->sAdjustMap:Ljava/util/HashMap;

    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Ljava/lang/String;

    const/4 v2, 0x0

    const/16 v3, 0xa

    const v5, 0x7f070028

    const/4 v6, 0x1

    move-object v1, v8

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/video/editor/model/FilterAdjustData;-><init>(ISLjava/lang/String;IZLjava/lang/String;)V

    aput-object v8, v0, v9

    new-instance v1, Lcom/miui/gallery/video/editor/model/FilterAdjustData;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f10001e

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    sget-object v2, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->sAdjustMap:Ljava/util/HashMap;

    const/4 v3, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Ljava/lang/String;

    const/4 v11, 0x3

    const/16 v12, 0xa

    const v14, 0x7f07002b

    const/4 v15, 0x0

    move-object v10, v1

    invoke-direct/range {v10 .. v16}, Lcom/miui/gallery/video/editor/model/FilterAdjustData;-><init>(ISLjava/lang/String;IZLjava/lang/String;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/miui/gallery/video/editor/model/FilterAdjustData;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f10001c

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    sget-object v4, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->sAdjustMap:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Ljava/lang/String;

    const/4 v5, 0x1

    const/16 v6, 0xa

    const v8, 0x7f070029

    const/4 v9, 0x1

    move-object v4, v1

    invoke-direct/range {v4 .. v10}, Lcom/miui/gallery/video/editor/model/FilterAdjustData;-><init>(ISLjava/lang/String;IZLjava/lang/String;)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lcom/miui/gallery/video/editor/model/FilterAdjustData;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f10001d

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    sget-object v4, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->sAdjustMap:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Ljava/lang/String;

    const/4 v5, 0x2

    const v8, 0x7f07002a

    move-object v4, v1

    invoke-direct/range {v4 .. v10}, Lcom/miui/gallery/video/editor/model/FilterAdjustData;-><init>(ISLjava/lang/String;IZLjava/lang/String;)V

    aput-object v1, v0, v3

    new-instance v1, Lcom/miui/gallery/video/editor/model/FilterAdjustData;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f10001f

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    sget-object v2, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->sAdjustMap:Ljava/util/HashMap;

    const/4 v3, 0x4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v17, v2

    check-cast v17, Ljava/lang/String;

    const/4 v12, 0x4

    const/16 v13, 0xa

    const v15, 0x7f07002c

    const/16 v16, 0x0

    move-object v11, v1

    invoke-direct/range {v11 .. v17}, Lcom/miui/gallery/video/editor/model/FilterAdjustData;-><init>(ISLjava/lang/String;IZLjava/lang/String;)V

    aput-object v1, v0, v3

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getFilterData()Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/video/editor/Filter;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :goto_0
    sget-object v2, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->sFilterNameKeys:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    new-instance v2, Lcom/miui/gallery/video/editor/Filter;

    sget-object v3, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->filterIcons:[I

    aget v3, v3, v1

    sget-object v4, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->sFilterTypes:[Ljava/lang/String;

    aget-object v4, v4, v1

    sget-object v5, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->sFilterNameKeys:[Ljava/lang/String;

    aget-object v5, v5, v1

    sget-object v6, Lcom/miui/gallery/video/editor/manager/FilterAdjustManager;->sFilterName:[Ljava/lang/String;

    aget-object v6, v6, v1

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/miui/gallery/video/editor/Filter;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method
