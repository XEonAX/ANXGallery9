.class public Lcom/miui/gallery/provider/peoplecover/PeopleCover;
.super Lcom/miui/gallery/dao/base/Entity;
.source "PeopleCover.java"


# instance fields
.field private mCoverScore:I

.field private mCoverServerId:Ljava/lang/String;

.field private mPeopleServerId:Ljava/lang/String;

.field private mPeopleServerTag:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/dao/base/Entity;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/dao/base/Entity;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mPeopleServerId:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mCoverServerId:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mPeopleServerTag:Ljava/lang/String;

    iput p4, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mCoverScore:I

    return-void
.end method


# virtual methods
.method public getCoverId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mCoverServerId:Ljava/lang/String;

    return-object v0
.end method

.method public getCoverScore()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mCoverScore:I

    return v0
.end method

.method public getServerTag()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mPeopleServerTag:Ljava/lang/String;

    return-object v0
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

    const-string v1, "peopleServerId"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "coverServerId"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "peopleServerTag"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "coverScore"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method protected getUniqueConstraints()[Ljava/lang/String;
    .locals 1

    const-string v0, "peopleServerId"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onConvertToContents(Landroid/content/ContentValues;)V
    .locals 2

    const-string v0, "peopleServerId"

    iget-object v1, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mPeopleServerId:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "coverServerId"

    iget-object v1, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mCoverServerId:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "peopleServerTag"

    iget-object v1, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mPeopleServerTag:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "coverScore"

    iget v1, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mCoverScore:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    return-void
.end method

.method protected onInitFromCursor(Landroid/database/Cursor;)V
    .locals 1

    const-string v0, "peopleServerId"

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mPeopleServerId:Ljava/lang/String;

    const-string v0, "coverServerId"

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mCoverServerId:Ljava/lang/String;

    const-string v0, "peopleServerTag"

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mPeopleServerTag:Ljava/lang/String;

    const-string v0, "coverScore"

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mCoverScore:I

    return-void
.end method

.method public setCoverId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mCoverServerId:Ljava/lang/String;

    return-void
.end method

.method public setCoverScore(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mCoverScore:I

    return-void
.end method

.method public setServerTag(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->mPeopleServerTag:Ljava/lang/String;

    return-void
.end method
