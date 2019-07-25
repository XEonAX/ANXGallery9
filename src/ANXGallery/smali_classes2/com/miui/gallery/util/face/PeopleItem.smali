.class public Lcom/miui/gallery/util/face/PeopleItem;
.super Lcom/miui/gallery/dao/base/Entity;
.source "PeopleItem.java"


# static fields
.field public static final COMPAT_PROJECTION:[Ljava/lang/String;

.field public static final Columns:[Ljava/lang/String;


# instance fields
.field private mCloudId:J

.field private mExifOrientation:I

.field private mFaceCount:I

.field private mFaceHScale:F

.field private mFaceWScale:F

.field private mFaceXScale:F

.field private mFaceYScale:F

.field private mLocalFile:Ljava/lang/String;

.field private mLocalId:J

.field private mMicroThumbFile:Ljava/lang/String;

.field private mName:Ljava/lang/String;

.field private mRelationText:Ljava/lang/String;

.field private mRelationType:I

.field private mServerId:Ljava/lang/String;

.field private mSha1:Ljava/lang/String;

.field private mSize:J

.field private mThumbFile:Ljava/lang/String;

.field private mVisibilityType:I


# direct methods
.method static constructor <clinit>()V
    .locals 19

    const-string v0, "localId"

    const-string v1, "peopleName"

    const-string v2, "serverId"

    const-string v3, "imageCloudId"

    const-string v4, "sha1"

    const-string v5, "microthumbfile"

    const-string v6, "thumbnailFile"

    const-string v7, "localFile"

    const-string v8, "exifOrientation"

    const-string v9, "faceXScale"

    const-string v10, "faceYScale"

    const-string v11, "faceWScale"

    const-string v12, "faceHScale"

    const-string v13, "relationType"

    const-string v14, "relationText"

    const-string v15, "visibilityType"

    const-string v16, "faceCount"

    const-string v17, "size"

    filled-new-array/range {v0 .. v17}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const-string v1, "localId as _id"

    const-string v2, "peopleName"

    const-string v3, "serverId"

    const-string v4, "imageCloudId as photo_id"

    const-string v5, "sha1"

    const-string v6, "microthumbfile"

    const-string v7, "thumbnailFile"

    const-string v8, "localFile"

    const-string v9, "exifOrientation"

    const-string v10, "faceXScale"

    const-string v11, "faceYScale"

    const-string v12, "faceWScale"

    const-string v13, "faceHScale"

    const-string v14, "relationType"

    const-string v15, "relationText"

    const-string v16, "visibilityType"

    const-string v17, "faceCount"

    const-string v18, "size"

    filled-new-array/range {v1 .. v18}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/face/PeopleItem;->COMPAT_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/dao/base/Entity;-><init>()V

    return-void
.end method

.method public static fromCursor(Landroid/database/Cursor;)Lcom/miui/gallery/util/face/PeopleItem;
    .locals 3

    if-eqz p0, :cond_1

    invoke-interface {p0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_0

    :cond_0
    new-instance v0, Lcom/miui/gallery/util/face/PeopleItem;

    invoke-direct {v0}, Lcom/miui/gallery/util/face/PeopleItem;-><init>()V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mLocalId:J

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mName:Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/4 v2, 0x2

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mServerId:Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/4 v2, 0x3

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mCloudId:J

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/4 v2, 0x4

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mSha1:Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/4 v2, 0x5

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mMicroThumbFile:Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/4 v2, 0x6

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mThumbFile:Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/4 v2, 0x7

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mLocalFile:Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x8

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mExifOrientation:I

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x9

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getFloat(Landroid/database/Cursor;Ljava/lang/String;)F

    move-result v1

    iput v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceXScale:F

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0xa

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getFloat(Landroid/database/Cursor;Ljava/lang/String;)F

    move-result v1

    iput v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceYScale:F

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0xb

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getFloat(Landroid/database/Cursor;Ljava/lang/String;)F

    move-result v1

    iput v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceWScale:F

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0xc

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getFloat(Landroid/database/Cursor;Ljava/lang/String;)F

    move-result v1

    iput v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceHScale:F

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0xd

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mRelationType:I

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0xe

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mRelationText:Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0xf

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mVisibilityType:I

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x10

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceCount:I

    sget-object v1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x11

    aget-object v1, v1, v2

    invoke-static {p0, v1}, Lcom/miui/gallery/util/face/PeopleItem;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, v0, Lcom/miui/gallery/util/face/PeopleItem;->mSize:J

    return-object v0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public getCloudId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mCloudId:J

    return-wide v0
.end method

.method public getExifOrientation()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mExifOrientation:I

    return v0
.end method

.method public getFaceHScale()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceHScale:F

    return v0
.end method

.method public getFaceWScale()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceWScale:F

    return v0
.end method

.method public getFaceXScale()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceXScale:F

    return v0
.end method

.method public getFaceYScale()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceYScale:F

    return v0
.end method

.method public getLocalFile()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mLocalFile:Ljava/lang/String;

    return-object v0
.end method

.method public getMicroThumbFile()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mMicroThumbFile:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getRelationType()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mRelationType:I

    return v0
.end method

.method public getSha1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mSha1:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mSize:J

    return-wide v0
.end method

.method protected getTableColumns()Ljava/util/List;
    .locals 3
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

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v2, 0x1

    aget-object v1, v1, v2

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v2, 0x2

    aget-object v1, v1, v2

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v2, 0x3

    aget-object v1, v1, v2

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v2, 0x4

    aget-object v1, v1, v2

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v2, 0x5

    aget-object v1, v1, v2

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v2, 0x6

    aget-object v1, v1, v2

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v2, 0x7

    aget-object v1, v1, v2

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v2, 0x8

    aget-object v1, v1, v2

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v2, 0x9

    aget-object v1, v1, v2

    const-string v2, "REAL"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v2, 0xa

    aget-object v1, v1, v2

    const-string v2, "REAL"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v2, 0xb

    aget-object v1, v1, v2

    const-string v2, "REAL"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v2, 0xc

    aget-object v1, v1, v2

    const-string v2, "REAL"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v2, 0xd

    aget-object v1, v1, v2

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v2, 0xe

    aget-object v1, v1, v2

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v2, 0xf

    aget-object v1, v1, v2

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v2, 0x10

    aget-object v1, v1, v2

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v2, 0x11

    aget-object v1, v1, v2

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/face/PeopleItem;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public getThumbFile()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mThumbFile:Ljava/lang/String;

    return-object v0
.end method

.method protected onConvertToContents(Landroid/content/ContentValues;)V
    .locals 3

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-wide v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mLocalId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mServerId:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x3

    aget-object v0, v0, v1

    iget-wide v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mCloudId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x4

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mSha1:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x5

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mMicroThumbFile:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x6

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mThumbFile:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x7

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mLocalFile:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0x8

    aget-object v0, v0, v1

    iget v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mExifOrientation:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0x9

    aget-object v0, v0, v1

    iget v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceXScale:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0xa

    aget-object v0, v0, v1

    iget v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceYScale:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0xb

    aget-object v0, v0, v1

    iget v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceWScale:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0xc

    aget-object v0, v0, v1

    iget v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceHScale:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0xd

    aget-object v0, v0, v1

    iget v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mRelationType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0xe

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mRelationText:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0xf

    aget-object v0, v0, v1

    iget v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mVisibilityType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0x10

    aget-object v0, v0, v1

    iget v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceCount:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0x11

    aget-object v0, v0, v1

    iget-wide v1, p0, Lcom/miui/gallery/util/face/PeopleItem;->mSize:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method protected onInitFromCursor(Landroid/database/Cursor;)V
    .locals 2

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mLocalId:J

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mName:Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mServerId:Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x3

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mCloudId:J

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x4

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mSha1:Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x5

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mMicroThumbFile:Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x6

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mThumbFile:Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/4 v1, 0x7

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mLocalFile:Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0x8

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mExifOrientation:I

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0x9

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getFloat(Landroid/database/Cursor;Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceXScale:F

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0xa

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getFloat(Landroid/database/Cursor;Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceYScale:F

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0xb

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getFloat(Landroid/database/Cursor;Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceWScale:F

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0xc

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getFloat(Landroid/database/Cursor;Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceHScale:F

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0xd

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mRelationType:I

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0xe

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mRelationText:Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0xf

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mVisibilityType:I

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0x10

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mFaceCount:I

    sget-object v0, Lcom/miui/gallery/util/face/PeopleItem;->Columns:[Ljava/lang/String;

    const/16 v1, 0x11

    aget-object v0, v0, v1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/face/PeopleItem;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/util/face/PeopleItem;->mSize:J

    return-void
.end method
