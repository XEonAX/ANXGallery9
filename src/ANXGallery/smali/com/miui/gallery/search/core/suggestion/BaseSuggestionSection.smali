.class public Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;
.super Ljava/lang/Object;
.source "BaseSuggestionSection.java"

# interfaces
.implements Lcom/miui/gallery/search/core/suggestion/SuggestionSection;


# instance fields
.field protected mDataURI:Ljava/lang/String;

.field protected final mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

.field protected mMoreItem:Lcom/miui/gallery/search/core/suggestion/Suggestion;

.field protected final mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

.field private mRankInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/suggestion/RankInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mSectionExtras:Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

.field private mSectionSubTitle:Ljava/lang/String;

.field private mSectionTitle:Ljava/lang/String;

.field protected final mSectionTypeString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/SearchConstants$SectionType;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/Suggestion;)V
    .locals 11

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/search/SearchConstants$SectionType;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    move-object v3, v0

    goto :goto_1

    :cond_0
    sget-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_DEFAULT:Lcom/miui/gallery/search/SearchConstants$SectionType;

    invoke-virtual {v0}, Lcom/miui/gallery/search/SearchConstants$SectionType;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :goto_1
    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v4, p3

    move-object v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v1 .. v10}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/Suggestion;Ljava/util/List;Landroid/os/Bundle;)V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V
    .locals 10

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v9}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/Suggestion;Ljava/util/List;Landroid/os/Bundle;)V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/Suggestion;Ljava/util/List;Landroid/os/Bundle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/search/core/suggestion/Suggestion;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/suggestion/RankInfo;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    iput-object p3, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_DEFAULT:Lcom/miui/gallery/search/SearchConstants$SectionType;

    invoke-virtual {p1}, Lcom/miui/gallery/search/SearchConstants$SectionType;->getName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mSectionTypeString:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iput-object p2, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mSectionTypeString:Ljava/lang/String;

    :goto_0
    iput-object p4, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mDataURI:Ljava/lang/String;

    iput-object p5, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mSectionTitle:Ljava/lang/String;

    iput-object p6, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mSectionSubTitle:Ljava/lang/String;

    iput-object p7, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mMoreItem:Lcom/miui/gallery/search/core/suggestion/Suggestion;

    if-eqz p8, :cond_1

    invoke-interface {p8}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_1

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mRankInfos:Ljava/util/List;

    :cond_1
    if-eqz p9, :cond_2

    sget-object p1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    if-eq p9, p1, :cond_2

    invoke-virtual {p0, p9}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->setExtras(Landroid/os/Bundle;)V

    :cond_2
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->close()V

    :cond_0
    return-void
.end method

.method public copyStringToBuffer(ILandroid/database/CharArrayBuffer;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->copyStringToBuffer(ILandroid/database/CharArrayBuffer;)V

    :cond_0
    return-void
.end method

.method public deactivate()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->deactivate()V

    :cond_0
    return-void
.end method

.method public getBlob(I)[B
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getBlob(I)[B

    move-result-object p1

    return-object p1
.end method

.method public getColumnCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getColumnCount()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getColumnIndex(Ljava/lang/String;)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-nez v0, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p1

    :goto_0
    return p1
.end method

.method public getColumnIndexOrThrow(Ljava/lang/String;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result p1

    return p1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "column \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\' does not exist"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getColumnName(I)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getColumnName(I)Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public getColumnNames()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCount()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    return-object v0
.end method

.method public getDataURI()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mDataURI:Ljava/lang/String;

    return-object v0
.end method

.method public getDouble(I)D
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getDouble(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public getExtras()Landroid/os/Bundle;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getFloat(I)F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getFloat(I)F

    move-result p1

    return p1
.end method

.method public getInt(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getInt(I)I

    move-result p1

    return p1
.end method

.method public getIntentActionURI()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getIntentActionURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLong(I)J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getNotificationUri()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getNotificationUri()Landroid/net/Uri;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getPosition()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getPosition()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    return-object v0
.end method

.method public getRankInfos()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/suggestion/RankInfo;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mRankInfos:Ljava/util/List;

    return-object v0
.end method

.method public getSectionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mSectionExtras:Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    return-object v0
.end method

.method public getSectionSubTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mSectionSubTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getSectionTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mSectionTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mSectionTypeString:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/search/SearchConstants$SectionType;->fromName(Ljava/lang/String;)Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v0

    return-object v0
.end method

.method public getSectionTypeString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mSectionTypeString:Ljava/lang/String;

    return-object v0
.end method

.method public getShort(I)S
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getShort(I)S

    move-result p1

    return p1
.end method

.method public getString(I)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object v0

    return-object v0
.end method

.method public getSuggestionIcon()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getSuggestionIcon()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSuggestionSource()Lcom/miui/gallery/search/core/source/Source;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getSuggestionSource()Lcom/miui/gallery/search/core/source/Source;

    move-result-object v0

    return-object v0
.end method

.method public getSuggestionSubTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getSuggestionSubTitle()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSuggestionTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getSuggestionTitle()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getType(I)I

    move-result p1

    return p1
.end method

.method public getWantsAllOnMoveCalls()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getWantsAllOnMoveCalls()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isAfterLast()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->isAfterLast()Z

    move-result v0

    return v0
.end method

.method public isBeforeFirst()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->isBeforeFirst()Z

    move-result v0

    return v0
.end method

.method public isClosed()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFirst()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->isFirst()Z

    move-result v0

    return v0
.end method

.method public isLast()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->isLast()Z

    move-result v0

    return v0
.end method

.method public isNull(I)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->isNull(I)Z

    move-result p1

    return p1
.end method

.method public move(I)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->move(I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public moveToFirst()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public moveToLast()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->moveToLast()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public moveToMore()Lcom/miui/gallery/search/core/suggestion/Suggestion;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mMoreItem:Lcom/miui/gallery/search/core/suggestion/Suggestion;

    return-object v0
.end method

.method public moveToNext()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public moveToPosition(I)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->moveToPosition(I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public moveToPrevious()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->moveToPrevious()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public registerContentObserver(Landroid/database/ContentObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    :cond_0
    return-void
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    :cond_0
    return-void
.end method

.method public requery()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->requery()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public respond(Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->respond(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public setExtras(Landroid/os/Bundle;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->setExtras(Landroid/os/Bundle;)V

    :cond_0
    return-void
.end method

.method public setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    :cond_0
    return-void
.end method

.method public setSectionExtras(Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mSectionExtras:Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    return-void
.end method

.method public setSectionMoreItem(Lcom/miui/gallery/search/core/suggestion/Suggestion;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mMoreItem:Lcom/miui/gallery/search/core/suggestion/Suggestion;

    return-void
.end method

.method public unregisterContentObserver(Landroid/database/ContentObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    :cond_0
    return-void
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->mItems:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    :cond_0
    return-void
.end method
