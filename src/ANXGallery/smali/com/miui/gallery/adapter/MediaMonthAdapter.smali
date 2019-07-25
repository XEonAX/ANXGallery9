.class public Lcom/miui/gallery/adapter/MediaMonthAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "MediaMonthAdapter.java"

# interfaces
.implements Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/MediaMonthAdapter$MonthHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;",
        ">;",
        "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter<",
        "Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field public static final PROJECTION:[Ljava/lang/String;

.field private static sMainMicroFolder:Ljava/lang/String;


# instance fields
.field private mCursor:Lcom/miui/gallery/util/BurstFilterCursor;

.field private mGroupItemCount:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mGroupStartLocations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mGroupStartPos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 19

    const-string v0, "_id"

    const-string v1, "alias_micro_thumbnail"

    const-string v2, "alias_create_date"

    const-string v3, "alias_create_time"

    const-string v4, "location"

    const-string v5, "sha1"

    const-string v6, "serverType"

    const-string v7, "duration"

    const-string v8, "mimeType"

    const-string v9, "alias_sync_state"

    const-string v10, "thumbnailFile"

    const-string v11, "localFile"

    const-string v12, "alias_clear_thumbnail"

    const-string v13, "alias_is_favorite"

    const-string v14, "specialTypeFlags"

    const-string v15, "alias_sort_time"

    const-string v16, "size"

    const-string v17, "title"

    const-string v18, "burst_group_id"

    filled-new-array/range {v0 .. v18}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->PROJECTION:[Ljava/lang/String;

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getPriorMicroThumbnailDirectory()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->sMainMicroFolder:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    return-void
.end method

.method private getClearThumbFilePath(I)Ljava/lang/String;
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xc

    const/4 v1, 0x5

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getMicroPath(Landroid/database/Cursor;II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getDownloadUri(I)Landroid/net/Uri;
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x9

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private getFileLength(I)J
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x10

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method private getItem(I)Landroid/database/Cursor;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mCursor:Lcom/miui/gallery/util/BurstFilterCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mCursor:Lcom/miui/gallery/util/BurstFilterCursor;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/util/BurstFilterCursor;->moveToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mCursor:Lcom/miui/gallery/util/BurstFilterCursor;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private getItemKey(I)J
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method private getItemSortTime(I)J
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xf

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method private static getMicroPath(Landroid/database/Cursor;II)Ljava/lang/String;
    .locals 1

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-ltz p2, :cond_0

    sget-object p1, Lcom/miui/gallery/adapter/MediaMonthAdapter;->sMainMicroFolder:Ljava/lang/String;

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/cloud/CloudUtils;->getThumbnailNameBySha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/miui/gallery/util/FileUtils;->concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method private parseMonthData(I)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/ui/MonthView$MonthItem;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    add-int/2addr p1, v0

    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    :goto_0
    if-ge v0, p1, :cond_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->parseMonthItem(I)Lcom/miui/gallery/ui/MonthView$MonthItem;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method private parseMonthItem(I)Lcom/miui/gallery/ui/MonthView$MonthItem;
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;-><init>()V

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItemKey(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->setId(J)Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getClearThumbFilePath(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->setLocalPath(Ljava/lang/String;)Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getDownloadUri(I)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->setDownloadUri(Landroid/net/Uri;)Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItemSortTime(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->setDate(J)Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getFileLength(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->setFileLength(J)Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->setPosition(I)Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->build()Lcom/miui/gallery/ui/MonthView$MonthItem;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public estimateItemFrame(IIJ)Landroid/graphics/Rect;
    .locals 7

    const/4 v0, 0x0

    if-ltz p2, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-le p2, v1, :cond_0

    goto :goto_2

    :cond_0
    int-to-float p1, p1

    const/high16 v1, 0x41100000    # 9.0f

    sub-float/2addr p1, v1

    const/high16 v1, 0x41200000    # 10.0f

    div-float/2addr p1, v1

    iget-object v1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v2, v1

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_2

    invoke-direct {p0, v3}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItemKey(I)J

    move-result-wide v4

    cmp-long v6, v4, p3

    if-nez v6, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    if-ne v3, v2, :cond_3

    const-string p1, "MediaMonthAdapter"

    const-string v1, "not found %d, position %d, size %d"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iget-object p4, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result p4

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-static {p1, v1, p3, p2, p4}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0

    :cond_3
    sub-int/2addr v3, v1

    div-int/lit8 p2, v3, 0xa

    rem-int/lit8 v3, v3, 0xa

    const/high16 p3, 0x3f800000    # 1.0f

    add-float/2addr p3, p1

    int-to-float p4, v3

    mul-float p4, p4, p3

    float-to-int p4, p4

    int-to-float p2, p2

    mul-float p3, p3, p2

    float-to-int p2, p3

    new-instance p3, Landroid/graphics/Rect;

    int-to-float v0, p4

    add-float/2addr v0, p1

    float-to-int v0, v0

    int-to-float v1, p2

    add-float/2addr v1, p1

    float-to-int p1, v1

    invoke-direct {p3, p4, p2, v0, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object p3

    :cond_4
    :goto_2
    const-string p1, "MediaMonthAdapter"

    const-string p3, "out of bounds position %d, size %d"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iget-object p4, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result p4

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-static {p1, p3, p2, p4}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method public findFuzzyMatchItem(Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;)Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x0

    if-eqz v1, :cond_7

    iget-object v3, v0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mCursor:Lcom/miui/gallery/util/BurstFilterCursor;

    if-nez v3, :cond_0

    goto/16 :goto_5

    :cond_0
    const-wide/16 v3, -0x1

    const-wide/16 v5, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x1

    :goto_0
    iget-object v9, v0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v10, -0x1

    if-ge v8, v9, :cond_2

    iget-object v9, v0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    iget-wide v11, v1, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mDate:J

    invoke-direct {v0, v9}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItemSortTime(I)J

    move-result-wide v13

    cmp-long v9, v11, v13

    if-lez v9, :cond_1

    sub-int/2addr v8, v7

    goto :goto_1

    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_2
    const/4 v8, -0x1

    :goto_1
    if-ne v8, v10, :cond_3

    iget-object v8, v0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    sub-int/2addr v8, v7

    :cond_3
    move v12, v8

    if-eq v12, v10, :cond_6

    iget-object v7, v0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v12, v7, :cond_6

    iget-object v7, v0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v7, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iget-object v8, v0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v8, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    add-int/2addr v8, v7

    :goto_2
    if-ge v7, v8, :cond_6

    invoke-direct {v0, v7}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItemKey(I)J

    move-result-wide v9

    iget-wide v13, v1, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mId:J

    cmp-long v11, v9, v13

    if-eqz v11, :cond_5

    iget-wide v13, v1, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mDate:J

    invoke-direct {v0, v7}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItemSortTime(I)J

    move-result-wide v15

    cmp-long v11, v13, v15

    if-gtz v11, :cond_5

    add-int/lit8 v11, v8, -0x1

    if-ne v7, v11, :cond_4

    goto :goto_3

    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_5
    :goto_3
    invoke-direct {v0, v7}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v1

    const/4 v2, 0x4

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v7}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItemSortTime(I)J

    move-result-wide v5

    move-object v15, v2

    move-wide/from16 v16, v5

    move-wide v13, v9

    goto :goto_4

    :cond_6
    move-object v15, v2

    move-wide v13, v3

    move-wide/from16 v16, v5

    :goto_4
    new-instance v1, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;

    move-object v11, v1

    invoke-direct/range {v11 .. v17}, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;-><init>(IJLjava/lang/String;J)V

    return-object v1

    :cond_7
    :goto_5
    return-object v2
.end method

.method public getHeaderCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getHeaderId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getHeaderIndex(I)I
    .locals 0

    return p1
.end method

.method public getHeaderViewType(I)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getItemId(I)J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const-wide/16 v0, -0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItemKey(I)J

    move-result-wide v0

    :goto_0
    return-wide v0
.end method

.method public getItemPositionInterval(I)[I
    .locals 2

    const/4 v0, 0x2

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput p1, v0, v1

    const/4 v1, 0x1

    aput p1, v0, v1

    return-object v0
.end method

.method public onBindHeaderViewHolder(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    iget-object p1, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    check-cast p1, Lcom/miui/gallery/ui/HomePageGridHeaderItem;

    invoke-direct {p0, p2}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItemSortTime(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/miui/gallery/util/GalleryDateUtils;->formatRelativeMonth(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/ui/HomePageGridHeaderItem;->bindData(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->onBindViewHolder(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/adapter/MediaMonthAdapter$MonthHolder;

    iget-object p1, p1, Lcom/miui/gallery/adapter/MediaMonthAdapter$MonthHolder;->mItemView:Lcom/miui/gallery/ui/MonthView;

    invoke-direct {p0, p2}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->parseMonthData(I)Ljava/util/List;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/MonthView;->bindData(Ljava/util/List;)V

    return-void
.end method

.method public onCreateHeaderViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;
    .locals 1

    new-instance p2, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    const v0, 0x7f0b008e

    invoke-static {p1, v0}, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->getView(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;
    .locals 2

    const-string p2, "MediaMonthAdapter"

    const-string v0, "onCreateViewHolder"

    invoke-static {p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p2, Lcom/miui/gallery/ui/MonthView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/miui/gallery/ui/MonthView;-><init>(Landroid/content/Context;)V

    const/16 p1, 0xa

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/MonthView;->setSpanCount(I)V

    const/4 p1, 0x1

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/MonthView;->setItemHorizontalSpace(I)V

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/MonthView;->setItemVerticalSpace(I)V

    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p1, v0, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/MonthView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lcom/miui/gallery/adapter/MediaMonthAdapter$MonthHolder;

    invoke-direct {p1, p2}, Lcom/miui/gallery/adapter/MediaMonthAdapter$MonthHolder;-><init>(Lcom/miui/gallery/ui/MonthView;)V

    return-object p1
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 6

    const/4 v0, 0x0

    if-nez p1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mCursor:Lcom/miui/gallery/util/BurstFilterCursor;

    if-eqz v1, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mCursor:Lcom/miui/gallery/util/BurstFilterCursor;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mCursor:Lcom/miui/gallery/util/BurstFilterCursor;

    invoke-virtual {v1}, Lcom/miui/gallery/util/BurstFilterCursor;->getWrappedCursor()Landroid/database/Cursor;

    move-result-object v1

    if-ne v1, p1, :cond_2

    :cond_1
    return-object v0

    :cond_2
    if-eqz p1, :cond_3

    invoke-interface {p1}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "extra_timeline_item_count_in_group"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-interface {p1}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "extra_timeline_group_start_pos"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-interface {p1}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    const-string v4, "extra_timeline_group_start_locations"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    goto :goto_0

    :cond_3
    move-object v1, v0

    move-object v2, v1

    move-object v3, v2

    :goto_0
    iget-object v4, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mCursor:Lcom/miui/gallery/util/BurstFilterCursor;

    if-nez p1, :cond_4

    move-object v5, v0

    goto :goto_1

    :cond_4
    new-instance v5, Lcom/miui/gallery/util/BurstFilterCursor;

    invoke-direct {v5, p1}, Lcom/miui/gallery/util/BurstFilterCursor;-><init>(Landroid/database/Cursor;)V

    :goto_1
    iput-object v5, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mCursor:Lcom/miui/gallery/util/BurstFilterCursor;

    if-eqz v1, :cond_6

    if-eqz v2, :cond_6

    if-eqz v3, :cond_6

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v5, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mCursor:Lcom/miui/gallery/util/BurstFilterCursor;

    if-eqz v1, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mCursor:Lcom/miui/gallery/util/BurstFilterCursor;

    invoke-virtual {v0}, Lcom/miui/gallery/util/BurstFilterCursor;->getResultPos()Ljava/util/ArrayList;

    move-result-object v0

    :cond_5
    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p1

    iget-object v1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-static {v0, p1, v1, v2}, Lcom/miui/gallery/util/BurstFilterCursor;->wrapGroupInfos(Ljava/util/List;ILjava/util/List;Ljava/util/List;)V

    goto :goto_2

    :cond_6
    iget-object p1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    if-eqz p1, :cond_7

    iget-object p1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_7
    iget-object p1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_8
    iget-object p1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    if-eqz p1, :cond_9

    iget-object p1, p0, Lcom/miui/gallery/adapter/MediaMonthAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_9
    :goto_2
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->notifyDataSetChanged()V

    return-object v4
.end method
