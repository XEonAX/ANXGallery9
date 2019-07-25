.class public Lcom/miui/gallery/util/SyncSortUtil;
.super Ljava/lang/Object;
.source "SyncSortUtil.java"


# direct methods
.method private static partition([I[JII)I
    .locals 6

    aget-wide v0, p1, p2

    aget v2, p0, p2

    :goto_0
    if-ge p2, p3, :cond_2

    :goto_1
    aget-wide v3, p1, p3

    cmp-long v5, v3, v0

    if-ltz v5, :cond_0

    if-le p3, p2, :cond_0

    add-int/lit8 p3, p3, -0x1

    goto :goto_1

    :cond_0
    aget-wide v3, p1, p3

    aput-wide v3, p1, p2

    aget v3, p0, p3

    aput v3, p0, p2

    :goto_2
    aget-wide v3, p1, p2

    cmp-long v5, v3, v0

    if-gtz v5, :cond_1

    if-le p3, p2, :cond_1

    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    :cond_1
    aget-wide v3, p1, p2

    aput-wide v3, p1, p3

    aget v3, p0, p2

    aput v3, p0, p3

    goto :goto_0

    :cond_2
    aput-wide v0, p1, p3

    aput v2, p0, p3

    return p3
.end method

.method private static partition([J[JII)I
    .locals 7

    aget-wide v0, p1, p2

    aget-wide v2, p0, p2

    :goto_0
    if-ge p2, p3, :cond_2

    :goto_1
    aget-wide v4, p1, p3

    cmp-long v6, v4, v0

    if-ltz v6, :cond_0

    if-le p3, p2, :cond_0

    add-int/lit8 p3, p3, -0x1

    goto :goto_1

    :cond_0
    aget-wide v4, p1, p3

    aput-wide v4, p1, p2

    aget-wide v4, p0, p3

    aput-wide v4, p0, p2

    :goto_2
    aget-wide v4, p1, p2

    cmp-long v6, v4, v0

    if-gtz v6, :cond_1

    if-le p3, p2, :cond_1

    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    :cond_1
    aget-wide v4, p1, p2

    aput-wide v4, p1, p3

    aget-wide v4, p0, p2

    aput-wide v4, p0, p3

    goto :goto_0

    :cond_2
    aput-wide v0, p1, p3

    aput-wide v2, p0, p3

    return p3
.end method

.method public static sort([I[JII)V
    .locals 2

    if-lt p2, p3, :cond_0

    return-void

    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/util/SyncSortUtil;->partition([I[JII)I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    invoke-static {p0, p1, p2, v1}, Lcom/miui/gallery/util/SyncSortUtil;->sort([I[JII)V

    add-int/lit8 v0, v0, 0x1

    invoke-static {p0, p1, v0, p3}, Lcom/miui/gallery/util/SyncSortUtil;->sort([I[JII)V

    return-void
.end method

.method public static sort([J[JII)V
    .locals 2

    if-lt p2, p3, :cond_0

    return-void

    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/util/SyncSortUtil;->partition([J[JII)I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    invoke-static {p0, p1, p2, v1}, Lcom/miui/gallery/util/SyncSortUtil;->sort([J[JII)V

    add-int/lit8 v0, v0, 0x1

    invoke-static {p0, p1, v0, p3}, Lcom/miui/gallery/util/SyncSortUtil;->sort([J[JII)V

    return-void
.end method
