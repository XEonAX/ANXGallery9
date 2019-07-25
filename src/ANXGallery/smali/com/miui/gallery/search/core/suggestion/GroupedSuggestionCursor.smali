.class public Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;
.super Landroid/database/AbstractCursor;
.source "GroupedSuggestionCursor.java"

# interfaces
.implements Lcom/miui/gallery/search/core/GroupList;
.implements Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S::",
        "Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;",
        ">",
        "Landroid/database/AbstractCursor;",
        "Lcom/miui/gallery/search/core/GroupList<",
        "TS;",
        "Lcom/miui/gallery/search/core/suggestion/Suggestion;",
        ">;",
        "Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;"
    }
.end annotation


# instance fields
.field protected mCachedCount:Ljava/lang/Integer;

.field private mExtras:Landroid/os/Bundle;

.field protected mObserver:Landroid/database/DataSetObserver;

.field protected final mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

.field private mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field private mSections:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TS;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Ljava/util/List<",
            "TS;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/database/AbstractCursor;-><init>()V

    new-instance v0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor$1;-><init>(Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;)V

    iput-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mObserver:Landroid/database/DataSetObserver;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mCachedCount:Ljava/lang/Integer;

    sget-object v1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    iput-object v1, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mExtras:Landroid/os/Bundle;

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    if-eqz p2, :cond_2

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2

    new-instance p1, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    iget-object v1, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mObserver:Landroid/database/DataSetObserver;

    invoke-interface {p2, v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    const/4 p2, 0x1

    if-ge p1, p2, :cond_1

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    :goto_1
    invoke-direct {p0, v0}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->setSection(Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    return-void

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Empty section value is not acceptable!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$002(Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mPos:I

    return p1
.end method

.method static synthetic access$102(Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mPos:I

    return p1
.end method

.method private setSection(Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    :cond_0
    return-void
.end method


# virtual methods
.method protected checkGroupPosition(I)V
    .locals 4

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v3

    const/4 p1, 0x1

    iget-object v3, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, p1

    const-string p1, "Invalid groupIndex %d, total group count %d"

    invoke-static {v1, p1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->close()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-super {p0}, Landroid/database/AbstractCursor;->close()V

    return-void
.end method

.method public deactivate()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->deactivate()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getBlob(I)[B
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getBlob(I)[B

    move-result-object p1

    return-object p1
.end method

.method public getChildrenCount(I)I
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->checkGroupPosition(I)V

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCount()I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public getColumnNames()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    return-object v0
.end method

.method public getCount()I
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mCachedCount:Ljava/lang/Integer;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->getGroupCount()I

    move-result v2

    if-ge v0, v2, :cond_0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->getChildrenCount(I)I

    move-result v2

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mCachedCount:Ljava/lang/Integer;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mCachedCount:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    return-object v0
.end method

.method public getDouble(I)D
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getDouble(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public getExtras()Landroid/os/Bundle;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mExtras:Landroid/os/Bundle;

    return-object v0
.end method

.method public getFloat(I)F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getFloat(I)F

    move-result p1

    return p1
.end method

.method public getGroup(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TS;"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->checkGroupPosition(I)V

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    return-object p1
.end method

.method public bridge synthetic getGroup(I)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->getGroup(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    return-object p1
.end method

.method public getGroupCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getInt(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getInt(I)I

    move-result p1

    return p1
.end method

.method public getIntentActionURI()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getIntentActionURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLong(I)J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    :goto_0
    return-object v0
.end method

.method public getShort(I)S
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getShort(I)S

    move-result p1

    return p1
.end method

.method public getString(I)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object v0

    return-object v0
.end method

.method public getSuggestionIcon()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getSuggestionIcon()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSuggestionSource()Lcom/miui/gallery/search/core/source/Source;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getSuggestionSource()Lcom/miui/gallery/search/core/source/Source;

    move-result-object v0

    return-object v0
.end method

.method public getSuggestionSubTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getSuggestionSubTitle()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSuggestionTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getSuggestionTitle()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getType(I)I

    move-result p1

    return p1
.end method

.method public isNull(I)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->isNull(I)Z

    move-result p1

    return p1
.end method

.method public moveToPosition(II)V
    .locals 3

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->checkGroupPosition(I)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->getChildrenCount(I)I

    move-result v2

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    add-int/2addr v1, p2

    invoke-virtual {p0, v1}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->moveToPosition(I)Z

    return-void
.end method

.method public onMove(II)Z
    .locals 3

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    const/4 p1, 0x0

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->getGroupCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->getChildrenCount(I)I

    move-result v2

    add-int/2addr v2, v1

    if-ge p2, v2, :cond_0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->getGroup(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    move v1, v2

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    :goto_1
    if-ltz v0, :cond_2

    sub-int/2addr p2, v1

    invoke-virtual {p0, v0, p2}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->onMoveGroup(II)Z

    move-result p1

    return p1

    :cond_2
    return p1
.end method

.method protected onMoveGroup(II)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->getGroup(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    invoke-interface {p1, p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->moveToPosition(I)Z

    move-result p1

    return p1
.end method

.method public registerContentObserver(Landroid/database/ContentObserver;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v1, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1}, Landroid/database/AbstractCursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    return-void
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v1, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1}, Landroid/database/AbstractCursor;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    return-void
.end method

.method public requery()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->requery()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_1
    invoke-super {p0}, Landroid/database/AbstractCursor;->requery()Z

    move-result v0

    return v0
.end method

.method public setExtras(Landroid/os/Bundle;)V
    .locals 0

    if-nez p1, :cond_0

    sget-object p1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mExtras:Landroid/os/Bundle;

    return-void
.end method

.method public unregisterContentObserver(Landroid/database/ContentObserver;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v1, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1}, Landroid/database/AbstractCursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    return-void
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->mSections:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v1, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1}, Landroid/database/AbstractCursor;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    return-void
.end method
