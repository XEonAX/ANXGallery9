.class public Lcom/miui/gallery/assistant/model/ImageFeature;
.super Lcom/miui/gallery/dao/base/Entity;
.source "ImageFeature.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/dao/base/Entity;",
        "Ljava/lang/Comparable<",
        "Lcom/miui/gallery/assistant/model/ImageFeature;",
        ">;"
    }
.end annotation


# static fields
.field public static final ALL_FEATURE_PROCESSED_SELECTION:Ljava/lang/String;

.field public static final ALL_IQA_CLUSTER_SELECTION:Ljava/lang/String;

.field public static final ALL_PROCESSED_SELECTION:Ljava/lang/String;

.field public static final SCENE_TAG_SELECTION:Ljava/lang/String;


# instance fields
.field private mClusterFeature:[F

.field private mClusterGroupId:J

.field private mCreateTime:J

.field private mImageDateTime:J

.field private mImageId:J

.field private mImageType:I

.field private mIqaBala:D

.field private mIqaBlur:D

.field private mIqaBlurType:I

.field private mIqaComp:D

.field private mIqaExpo:D

.field private mIqaHaze:D

.field private mIqaNima:D

.field private mIqaNois:D

.field private mIqaSatu:D

.field private mResultFlag:I

.field private mSceneScore:F

.field private mSceneTag:I

.field private mSceneTagA:I

.field private mSceneTagB:I

.field private mSceneTagC:I

.field private mScore:D

.field private mSha1:Ljava/lang/String;

.field private mVersion:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "imageId>0 AND version = 2 AND (imageType = 0 OR imageType = 1) AND resultFlag & "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " > 0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "clusterGroupId"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ">0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/assistant/model/ImageFeature;->ALL_IQA_CLUSTER_SELECTION:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "imageId>0 AND version = 2 AND (imageType = 0 OR imageType = 1) AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/assistant/algorithm/Algorithm;->FLAG_FEATURE_ALL_ARRAY:[I

    invoke-static {v1}, Lcom/miui/gallery/assistant/model/ImageFeature;->getFlagsMatchSql([I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/assistant/model/ImageFeature;->ALL_FEATURE_PROCESSED_SELECTION:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "imageId>0 AND version = 2 AND (imageType = 0 OR imageType = 1) AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/assistant/algorithm/Algorithm;->FLAG_FEATURE_ALL_ARRAY:[I

    invoke-static {v1}, Lcom/miui/gallery/assistant/model/ImageFeature;->getFlagsMatchSql([I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "clusterGroupId"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ">0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/assistant/model/ImageFeature;->ALL_PROCESSED_SELECTION:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "imageId>0 AND version = 2 AND (imageType = 0 OR imageType = 1) AND resultFlag & "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x10

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " > 0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "imageDatetime"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ">?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "imageDatetime"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "<?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "sceneTagA"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " IN (%s)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " OR "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "sceneTagB"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " IN (%s)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " OR "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "sceneTagC"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " IN (%s)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/assistant/model/ImageFeature;->SCENE_TAG_SELECTION:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/dao/base/Entity;-><init>()V

    const/4 v0, 0x2

    iput v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mVersion:I

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;J)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/dao/base/Entity;-><init>()V

    iput-wide p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mImageId:J

    iput-object p3, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSha1:Ljava/lang/String;

    const/4 p1, 0x2

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mVersion:I

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTag:I

    const/4 p2, 0x0

    iput p2, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneScore:F

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaBlurType:I

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagA:I

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagB:I

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagC:I

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mImageType:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mCreateTime:J

    iput-wide p4, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mImageDateTime:J

    return-void
.end method

.method private static getFlagsMatchSql([I)Ljava/lang/String;
    .locals 3

    if-eqz p0, :cond_3

    array-length v0, p0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_2

    const-string v2, "resultFlag"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " & "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v2, p0, v1

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " > 0"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    if-eq v1, v2, :cond_1

    const-string v2, " AND "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    :goto_1
    const-string p0, ""

    return-object p0
.end method


# virtual methods
.method public compareTo(Lcom/miui/gallery/assistant/model/ImageFeature;)I
    .locals 4

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mScore:D

    iget-wide v2, p1, Lcom/miui/gallery/assistant/model/ImageFeature;->mScore:D

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Double;->compare(DD)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/assistant/model/ImageFeature;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/model/ImageFeature;->compareTo(Lcom/miui/gallery/assistant/model/ImageFeature;)I

    move-result p1

    return p1
.end method

.method public getClusterFeature()[F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mClusterFeature:[F

    return-object v0
.end method

.method public getClusterGroupId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mClusterGroupId:J

    return-wide v0
.end method

.method public getFeatureFlag()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mResultFlag:I

    return v0
.end method

.method public getImageDateTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mImageDateTime:J

    return-wide v0
.end method

.method public getImageId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mImageId:J

    return-wide v0
.end method

.method public getScore()D
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mScore:D

    return-wide v0
.end method

.method public getSha1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSha1:Ljava/lang/String;

    return-object v0
.end method

.method protected getTableColumns()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/dao/base/TableColumn;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "imageId"

    const-string v2, "INTEGER"

    const/4 v3, 0x1

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Z)V

    const-string v1, "sha1"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "version"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "score"

    const-string v2, "REAL"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "sceneTag"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "sceneScore"

    const-string v2, "REAL"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "iqaExpo"

    const-string v2, "REAL"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "iqaSatu"

    const-string v2, "REAL"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "iqaBala"

    const-string v2, "REAL"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "iqaHaze"

    const-string v2, "REAL"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "iqaNois"

    const-string v2, "REAL"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "iqaBlur"

    const-string v2, "REAL"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "iqaComP"

    const-string v2, "REAL"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "iqaNima"

    const-string v2, "REAL"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "iqaBlueType"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "clusterFeature"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "sceneTagA"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "sceneTagB"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "sceneTagC"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "resultFlag"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "clusterGroupId"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "imageType"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "createTime"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "imageDatetime"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public hasClusterFeature()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mClusterFeature:[F

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mClusterFeature:[F

    array-length v0, v0

    const/16 v1, 0x400

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isDocumentImage()Z
    .locals 5

    sget-object v0, Lcom/miui/gallery/assistant/AssistantConstants;->TAGS_DOCUMENTS:[I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_2

    iget v3, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagA:I

    aget v4, v0, v2

    if-eq v3, v4, :cond_1

    iget v3, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagB:I

    aget v4, v0, v2

    if-eq v3, v4, :cond_1

    iget v3, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagC:I

    aget v4, v0, v2

    if-ne v3, v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    const/4 v0, 0x1

    return v0

    :cond_2
    return v1
.end method

.method public isFeatureDone(I)Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mResultFlag:I

    and-int/2addr p1, v0

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isPoorImage()Z
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaBlur:D

    const-wide v2, 0x4054800000000000L    # 82.0

    cmpg-double v4, v0, v2

    if-gez v4, :cond_0

    iget v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaBlurType:I

    if-eqz v0, :cond_2

    :cond_0
    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaNois:D

    const-wide v2, 0x4053d9999999999aL    # 79.4

    cmpg-double v4, v0, v2

    if-ltz v4, :cond_2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaExpo:D

    const-wide v2, 0x404f266666666666L    # 62.3

    cmpg-double v4, v0, v2

    if-gez v4, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isSelectionFeatureDone()Z
    .locals 6

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/assistant/model/ImageFeature;->isFeatureDone(I)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mClusterGroupId:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected onConvertToContents(Landroid/content/ContentValues;)V
    .locals 3

    const-string v0, "imageId"

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mImageId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "sha1"

    iget-object v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSha1:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "version"

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mVersion:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "score"

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mScore:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v0, "sceneTag"

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTag:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "sceneScore"

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneScore:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    const-string v0, "iqaExpo"

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaExpo:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v0, "iqaSatu"

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaSatu:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v0, "iqaBala"

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaBala:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v0, "iqaHaze"

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaHaze:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v0, "iqaNois"

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaNois:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v0, "iqaBlur"

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaBlur:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v0, "iqaBlueType"

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaBlurType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "iqaComP"

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaComp:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v0, "iqaNima"

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaNima:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    const-string v0, "sceneTagA"

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagA:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "sceneTagB"

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagB:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "sceneTagC"

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagC:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "clusterFeature"

    iget-object v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mClusterFeature:[F

    invoke-static {v1}, Lcom/miui/gallery/util/GsonUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "resultFlag"

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mResultFlag:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "clusterGroupId"

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mClusterGroupId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "imageType"

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mImageType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "createTime"

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mCreateTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "imageDatetime"

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mImageDateTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method protected onInitFromCursor(Landroid/database/Cursor;)V
    .locals 7

    const-string v0, "imageId"

    invoke-static {p1, v0}, Lcom/miui/gallery/assistant/model/ImageFeature;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mImageId:J

    const-string v0, "sha1"

    const-string v1, ""

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/assistant/model/ImageFeature;->getStringDefault(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSha1:Ljava/lang/String;

    const-string v0, "version"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/assistant/model/ImageFeature;->getIntDefault(Landroid/database/Cursor;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mVersion:I

    const-string v0, "score"

    const-wide/16 v2, 0x0

    invoke-static {p1, v0, v2, v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->getDoubleDefault(Landroid/database/Cursor;Ljava/lang/String;D)D

    move-result-wide v4

    iput-wide v4, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mScore:D

    const-string v0, "sceneTag"

    const/4 v4, -0x1

    invoke-static {p1, v0, v4}, Lcom/miui/gallery/assistant/model/ImageFeature;->getIntDefault(Landroid/database/Cursor;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTag:I

    const-string v0, "sceneScore"

    const/4 v5, 0x0

    invoke-static {p1, v0, v5}, Lcom/miui/gallery/assistant/model/ImageFeature;->getFloatDefault(Landroid/database/Cursor;Ljava/lang/String;F)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneScore:F

    const-string v0, "iqaExpo"

    invoke-static {p1, v0, v2, v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->getDoubleDefault(Landroid/database/Cursor;Ljava/lang/String;D)D

    move-result-wide v5

    iput-wide v5, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaExpo:D

    const-string v0, "iqaSatu"

    invoke-static {p1, v0, v2, v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->getDoubleDefault(Landroid/database/Cursor;Ljava/lang/String;D)D

    move-result-wide v5

    iput-wide v5, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaSatu:D

    const-string v0, "iqaBala"

    invoke-static {p1, v0, v2, v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->getDoubleDefault(Landroid/database/Cursor;Ljava/lang/String;D)D

    move-result-wide v5

    iput-wide v5, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaBala:D

    const-string v0, "iqaHaze"

    invoke-static {p1, v0, v2, v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->getDoubleDefault(Landroid/database/Cursor;Ljava/lang/String;D)D

    move-result-wide v5

    iput-wide v5, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaHaze:D

    const-string v0, "iqaNois"

    invoke-static {p1, v0, v2, v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->getDoubleDefault(Landroid/database/Cursor;Ljava/lang/String;D)D

    move-result-wide v5

    iput-wide v5, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaNois:D

    const-string v0, "iqaBlur"

    invoke-static {p1, v0, v2, v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->getDoubleDefault(Landroid/database/Cursor;Ljava/lang/String;D)D

    move-result-wide v5

    iput-wide v5, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaBlur:D

    const-string v0, "iqaBlueType"

    invoke-static {p1, v0, v4}, Lcom/miui/gallery/assistant/model/ImageFeature;->getIntDefault(Landroid/database/Cursor;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaBlurType:I

    const-string v0, "iqaComP"

    invoke-static {p1, v0, v2, v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->getDoubleDefault(Landroid/database/Cursor;Ljava/lang/String;D)D

    move-result-wide v5

    iput-wide v5, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaComp:D

    const-string v0, "iqaNima"

    invoke-static {p1, v0, v2, v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->getDoubleDefault(Landroid/database/Cursor;Ljava/lang/String;D)D

    move-result-wide v2

    iput-wide v2, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaNima:D

    const-string v0, "clusterFeature"

    const-string v2, ""

    invoke-static {p1, v0, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->getStringDefault(Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-class v2, [F

    invoke-static {v0, v2}, Lcom/miui/gallery/util/GsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    iput-object v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mClusterFeature:[F

    const-string v0, "sceneTagA"

    invoke-static {p1, v0, v4}, Lcom/miui/gallery/assistant/model/ImageFeature;->getIntDefault(Landroid/database/Cursor;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagA:I

    const-string v0, "sceneTagB"

    invoke-static {p1, v0, v4}, Lcom/miui/gallery/assistant/model/ImageFeature;->getIntDefault(Landroid/database/Cursor;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagB:I

    const-string v0, "sceneTagC"

    invoke-static {p1, v0, v4}, Lcom/miui/gallery/assistant/model/ImageFeature;->getIntDefault(Landroid/database/Cursor;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagC:I

    const-string v0, "resultFlag"

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/assistant/model/ImageFeature;->getIntDefault(Landroid/database/Cursor;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mResultFlag:I

    const-string v0, "clusterGroupId"

    const-wide/16 v2, 0x0

    invoke-static {p1, v0, v2, v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->getLongDefault(Landroid/database/Cursor;Ljava/lang/String;J)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mClusterGroupId:J

    const-string v0, "imageType"

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/assistant/model/ImageFeature;->getIntDefault(Landroid/database/Cursor;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mImageType:I

    const-string v0, "createTime"

    invoke-static {p1, v0, v2, v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->getLongDefault(Landroid/database/Cursor;Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mCreateTime:J

    const-string v0, "imageDatetime"

    invoke-static {p1, v0, v2, v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->getLongDefault(Landroid/database/Cursor;Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mImageDateTime:J

    return-void
.end method

.method public setClusterFeature([F)V
    .locals 0

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mClusterFeature:[F

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/model/ImageFeature;->setFeatureFlag(I)V

    :cond_0
    return-void
.end method

.method public setFeatureFlag(I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mResultFlag:I

    or-int/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mResultFlag:I

    return-void
.end method

.method public setImageType(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mImageType:I

    return-void
.end method

.method public setQualityScore(Lcom/miui/gallery/assistant/jni/score/QualityScore;)V
    .locals 2

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/jni/score/QualityScore;->getIqaExpo()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaExpo:D

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/jni/score/QualityScore;->getIqaSatu()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaSatu:D

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/jni/score/QualityScore;->getIqaBala()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaBala:D

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/jni/score/QualityScore;->getIqaHaze()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaHaze:D

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/jni/score/QualityScore;->getIqaNois()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaNois:D

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/jni/score/QualityScore;->getIqaBlur()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaBlur:D

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/jni/score/QualityScore;->getIqaComp()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaComp:D

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/jni/score/QualityScore;->getIqaNima()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaNima:D

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/jni/score/QualityScore;->getIqaBlurType()D

    move-result-wide v0

    double-to-int p1, v0

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaBlurType:I

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaNima:D

    iput-wide v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mScore:D

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/model/ImageFeature;->setFeatureFlag(I)V

    :cond_0
    return-void
.end method

.method public setSceneResult(Lcom/miui/gallery/assistant/jni/filter/ISceneResult;)V
    .locals 2

    if-eqz p1, :cond_3

    const/4 v0, 0x3

    invoke-interface {p1, v0}, Lcom/miui/gallery/assistant/jni/filter/ISceneResult;->getTags(I)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagA:I

    :cond_0
    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagB:I

    :cond_1
    const/4 v1, 0x2

    if-le v0, v1, :cond_2

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagC:I

    :cond_2
    const/16 p1, 0x10

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/model/ImageFeature;->setFeatureFlag(I)V

    goto :goto_0

    :cond_3
    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagA:I

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagB:I

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagC:I

    :goto_0
    return-void
.end method

.method public setSceneResult(Lcom/miui/gallery/assistant/jni/filter/SceneResult;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/jni/filter/SceneResult;->getTag()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTag:I

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/jni/filter/SceneResult;->getScore()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneScore:F

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/model/ImageFeature;->setFeatureFlag(I)V

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTag:I

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneScore:F

    :goto_0
    return-void
.end method

.method public setVersion(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mVersion:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ImageFeature{mImageId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mImageId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mVersion="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mVersion:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mScore="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mScore:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", mSceneTag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTag:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mSceneScore="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneScore:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", mIqaExpo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaExpo:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", mIqaSatu="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaSatu:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", mIqaBala="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaBala:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", mIqaHaze="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaHaze:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", mIqaNois="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaNois:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", mIqaBlur="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaBlur:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", mIqaBlurType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaBlurType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mIqaComp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaComp:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", mIqaNima="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mIqaNima:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ", mSceneTagA="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagA:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mSceneTagB="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagB:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mSceneTagC="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mSceneTagC:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mResultFlag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mResultFlag:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mClusterGroupId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mClusterGroupId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mImageType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mImageType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mCreateTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/model/ImageFeature;->mCreateTime:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
