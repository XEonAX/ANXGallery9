.class public Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;
.super Lcom/miui/gallery/dao/base/Entity;
.source "MediaRemarkInfo.java"


# instance fields
.field private mCloudId:J

.field private mOperationType:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/dao/base/Entity;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;->mOperationType:I

    return-void
.end method


# virtual methods
.method public getCloudId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;->mCloudId:J

    return-wide v0
.end method

.method protected final getTableColumns()Ljava/util/List;
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

    const-string v1, "mediaId"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "operationType"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method protected final onConvertToContents(Landroid/content/ContentValues;)V
    .locals 3

    const-string v0, "mediaId"

    iget-wide v1, p0, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;->mCloudId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "operationType"

    iget v1, p0, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;->mOperationType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    return-void
.end method

.method protected final onInitFromCursor(Landroid/database/Cursor;)V
    .locals 2

    const-string v0, "mediaId"

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;->mCloudId:J

    const-string v0, "operationType"

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;->mOperationType:I

    return-void
.end method

.method public setCloudId(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;->mCloudId:J

    return-void
.end method

.method public setOperationType(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;->mOperationType:I

    return-void
.end method
