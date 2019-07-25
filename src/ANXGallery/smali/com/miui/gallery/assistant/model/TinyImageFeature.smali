.class public Lcom/miui/gallery/assistant/model/TinyImageFeature;
.super Ljava/lang/Object;
.source "TinyImageFeature.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/miui/gallery/assistant/model/TinyImageFeature;",
        ">;"
    }
.end annotation


# static fields
.field public static final PROJECTION:[Ljava/lang/String;

.field public static final PROJECTION_GROUP:[Ljava/lang/String;


# instance fields
.field private final mClusterGroupId:J

.field private mImageDateTime:J

.field private final mImageId:J

.field private mIsPoorImage:Z

.field private final mScore:D


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const-string v0, "imageId"

    const-string v1, "score"

    const-string v2, "clusterGroupId"

    const-string v3, "iqaExpo"

    const-string v4, "iqaNois"

    const-string v5, "iqaBlur"

    const-string v6, "iqaBlueType"

    const-string v7, "imageDatetime"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/assistant/model/TinyImageFeature;->PROJECTION:[Ljava/lang/String;

    const-string v0, "imageId"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/assistant/model/TinyImageFeature;->PROJECTION_GROUP:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const-string v2, "imageId"

    invoke-static {v1, v2}, Lcom/miui/gallery/dao/base/Entity;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/miui/gallery/assistant/model/TinyImageFeature;->mImageId:J

    const-string v2, "score"

    const-wide/16 v3, 0x0

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/dao/base/Entity;->getDoubleDefault(Landroid/database/Cursor;Ljava/lang/String;D)D

    move-result-wide v5

    iput-wide v5, v0, Lcom/miui/gallery/assistant/model/TinyImageFeature;->mScore:D

    const-string v2, "clusterGroupId"

    const-wide/16 v5, 0x0

    invoke-static {v1, v2, v5, v6}, Lcom/miui/gallery/dao/base/Entity;->getLongDefault(Landroid/database/Cursor;Ljava/lang/String;J)J

    move-result-wide v7

    iput-wide v7, v0, Lcom/miui/gallery/assistant/model/TinyImageFeature;->mClusterGroupId:J

    const-string v2, "iqaExpo"

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/dao/base/Entity;->getDoubleDefault(Landroid/database/Cursor;Ljava/lang/String;D)D

    move-result-wide v7

    const-string v2, "iqaNois"

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/dao/base/Entity;->getDoubleDefault(Landroid/database/Cursor;Ljava/lang/String;D)D

    move-result-wide v9

    const-string v2, "iqaBlur"

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/dao/base/Entity;->getDoubleDefault(Landroid/database/Cursor;Ljava/lang/String;D)D

    move-result-wide v11

    const-string v2, "iqaBlueType"

    const/4 v13, -0x1

    invoke-static {v1, v2, v13}, Lcom/miui/gallery/dao/base/Entity;->getIntDefault(Landroid/database/Cursor;Ljava/lang/String;I)I

    move-result v2

    int-to-double v13, v2

    const-wide v15, 0x4054800000000000L    # 82.0

    cmpg-double v2, v11, v15

    if-gez v2, :cond_0

    cmpl-double v2, v13, v3

    if-eqz v2, :cond_2

    :cond_0
    const-wide v2, 0x4053d9999999999aL    # 79.4

    cmpg-double v4, v9, v2

    if-ltz v4, :cond_2

    const-wide v2, 0x404f266666666666L    # 62.3

    cmpg-double v4, v7, v2

    if-gez v4, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v2, 0x1

    :goto_1
    iput-boolean v2, v0, Lcom/miui/gallery/assistant/model/TinyImageFeature;->mIsPoorImage:Z

    const-string v2, "imageDatetime"

    invoke-static {v1, v2, v5, v6}, Lcom/miui/gallery/dao/base/Entity;->getLongDefault(Landroid/database/Cursor;Ljava/lang/String;J)J

    move-result-wide v1

    iput-wide v1, v0, Lcom/miui/gallery/assistant/model/TinyImageFeature;->mImageDateTime:J

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/miui/gallery/assistant/model/TinyImageFeature;)I
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getScore()D

    move-result-wide v0

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getScore()D

    move-result-wide v2

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->isPoorImage()Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->isPoorImage()Z

    move-result v4

    if-nez v4, :cond_0

    return v5

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->isPoorImage()Z

    move-result v4

    const/4 v6, -0x1

    if-nez v4, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->isPoorImage()Z

    move-result p1

    if-eqz p1, :cond_1

    return v6

    :cond_1
    cmpl-double p1, v0, v2

    if-lez p1, :cond_2

    return v6

    :cond_2
    cmpg-double p1, v0, v2

    if-gez p1, :cond_3

    return v5

    :cond_3
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/assistant/model/TinyImageFeature;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->compareTo(Lcom/miui/gallery/assistant/model/TinyImageFeature;)I

    move-result p1

    return p1
.end method

.method public getClusterGroupId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/TinyImageFeature;->mClusterGroupId:J

    return-wide v0
.end method

.method public getImageDateTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/TinyImageFeature;->mImageDateTime:J

    return-wide v0
.end method

.method public getImageId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/TinyImageFeature;->mImageId:J

    return-wide v0
.end method

.method public getScore()D
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/TinyImageFeature;->mScore:D

    return-wide v0
.end method

.method public isPoorImage()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/model/TinyImageFeature;->mIsPoorImage:Z

    return v0
.end method
