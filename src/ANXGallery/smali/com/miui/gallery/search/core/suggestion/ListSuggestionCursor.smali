.class public Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;
.super Landroid/database/AbstractCursor;
.source "ListSuggestionCursor.java"

# interfaces
.implements Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S::",
        "Lcom/miui/gallery/search/core/suggestion/Suggestion;",
        ">",
        "Landroid/database/AbstractCursor;",
        "Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;"
    }
.end annotation


# static fields
.field protected static final COLUMNS:[Ljava/lang/String;


# instance fields
.field private EMPTY_COLUMNS:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mExtraColumns:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mExtras:Landroid/os/Bundle;

.field protected final mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

.field protected final mSuggestions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TS;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "title"

    const-string v1, "subTitle"

    const-string v2, "actionUri"

    const-string v3, "icon"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Ljava/util/List<",
            "TS;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;Landroid/os/Bundle;)V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;Landroid/os/Bundle;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Ljava/util/List<",
            "TS;>;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/database/AbstractCursor;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->mSuggestions:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->EMPTY_COLUMNS:Ljava/util/ArrayList;

    sget-object v0, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    iput-object v0, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->mExtras:Landroid/os/Bundle;

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    if-nez p2, :cond_0

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->mSuggestions:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0, p3}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->setExtras(Landroid/os/Bundle;)V

    return-void
.end method

.method private getExtraColumns()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->mExtraColumns:Ljava/util/ArrayList;

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;->getExtraColumnNames()Ljava/util/Collection;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v1

    if-lez v1, :cond_1

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->mExtraColumns:Ljava/util/ArrayList;

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->EMPTY_COLUMNS:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->mExtraColumns:Ljava/util/ArrayList;

    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->mExtraColumns:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method public getColumnIndex(Ljava/lang/String;)I
    .locals 1

    const-string v0, "title"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const-string v0, "subTitle"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const-string v0, "actionUri"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 p1, 0x2

    return p1

    :cond_2
    const-string v0, "icon"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 p1, 0x3

    return p1

    :cond_3
    invoke-direct {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getExtraColumns()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    sget-object v0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->COLUMNS:[Ljava/lang/String;

    array-length v0, v0

    add-int/2addr p1, v0

    return p1
.end method

.method public getColumnNames()[Ljava/lang/String;
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getExtraColumns()Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->EMPTY_COLUMNS:Ljava/util/ArrayList;

    if-eq v0, v1, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->COLUMNS:[Ljava/lang/String;

    array-length v1, v1

    invoke-direct {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getExtraColumns()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    sget-object v1, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->COLUMNS:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-direct {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getExtraColumns()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0

    :cond_0
    sget-object v0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->COLUMNS:[Ljava/lang/String;

    return-object v0
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->mSuggestions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getPosition()I

    move-result v0

    if-ltz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getPosition()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->mSuggestions:Ljava/util/List;

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getPosition()I

    move-result v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/search/core/suggestion/Suggestion;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDouble(I)D
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getExtras()Landroid/os/Bundle;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->mExtras:Landroid/os/Bundle;

    return-object v0
.end method

.method public getFloat(I)F
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getInt(I)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getIntentActionURI()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getIntentActionURI()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getLong(I)J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    return-object v0
.end method

.method public getShort(I)S
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getString(I)Ljava/lang/String;
    .locals 2

    packed-switch p1, :pswitch_data_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->COLUMNS:[Ljava/lang/String;

    array-length v0, v0

    sub-int/2addr p1, v0

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object v0

    invoke-direct {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getExtraColumns()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;->getExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getSuggestionIcon()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_1
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getIntentActionURI()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_2
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getSuggestionSubTitle()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_3
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getSuggestionTitle()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getSuggestionIcon()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionIcon()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getSuggestionSource()Lcom/miui/gallery/search/core/source/Source;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionSource()Lcom/miui/gallery/search/core/source/Source;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getSuggestionSubTitle()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionSubTitle()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getSuggestionTitle()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionTitle()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public isNull(I)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public onMove(II)Z
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->mExtraColumns:Ljava/util/ArrayList;

    invoke-super {p0, p1, p2}, Landroid/database/AbstractCursor;->onMove(II)Z

    move-result p1

    return p1
.end method

.method public setExtras(Landroid/os/Bundle;)V
    .locals 0

    if-nez p1, :cond_0

    sget-object p1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->mExtras:Landroid/os/Bundle;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "Suggestions = %s;"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;->mSuggestions:Ljava/util/List;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
