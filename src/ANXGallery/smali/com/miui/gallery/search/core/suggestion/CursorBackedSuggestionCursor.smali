.class public Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;
.super Landroid/database/CursorWrapper;
.source "CursorBackedSuggestionCursor.java"

# interfaces
.implements Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C::",
        "Landroid/database/Cursor;",
        ">",
        "Landroid/database/CursorWrapper;",
        "Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;"
    }
.end annotation


# static fields
.field private static final EMPTY_EXTRA:Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;


# instance fields
.field protected mActionURIIdx:I

.field private mExtras:Landroid/os/Bundle;

.field protected mIconIdx:I

.field protected final mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

.field protected mSubTitleIdx:I

.field private mSuggestionExtrasArray:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;",
            ">;"
        }
    .end annotation
.end field

.field protected final mSuggestionSource:Lcom/miui/gallery/search/core/source/Source;

.field protected mTitleIdx:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor$1;

    invoke-direct {v0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->EMPTY_EXTRA:Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Landroid/database/Cursor;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "TC;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Landroid/database/Cursor;Lcom/miui/gallery/search/core/source/Source;)V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Landroid/database/Cursor;Lcom/miui/gallery/search/core/source/Source;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "TC;",
            "Lcom/miui/gallery/search/core/source/Source;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Landroid/database/Cursor;Lcom/miui/gallery/search/core/source/Source;Lcom/miui/gallery/search/core/result/ErrorInfo;)V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Landroid/database/Cursor;Lcom/miui/gallery/search/core/source/Source;Lcom/miui/gallery/search/core/result/ErrorInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "TC;",
            "Lcom/miui/gallery/search/core/source/Source;",
            "Lcom/miui/gallery/search/core/result/ErrorInfo;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p2}, Landroid/database/CursorWrapper;-><init>(Landroid/database/Cursor;)V

    sget-object p2, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    iput-object p2, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mExtras:Landroid/os/Bundle;

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    iput-object p3, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mSuggestionSource:Lcom/miui/gallery/search/core/source/Source;

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->updateIndexes()V

    return-void
.end method

.method private isExtraIndex(I)Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mIconIdx:I

    if-eq p1, v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mActionURIIdx:I

    if-eq p1, v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mTitleIdx:I

    if-eq p1, v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mSubTitleIdx:I

    if-eq p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;
    .locals 0

    return-object p0
.end method

.method public getExtras()Landroid/os/Bundle;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getWrappedCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mExtras:Landroid/os/Bundle;

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getWrappedCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getIntentActionURI()Ljava/lang/String;
    .locals 1

    iget v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mActionURIIdx:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getStringOrNull(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    return-object v0
.end method

.method protected getStringOrNull(I)Ljava/lang/String;
    .locals 1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getWrappedCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getWrappedCursor()Landroid/database/Cursor;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mSuggestionExtrasArray:Landroid/util/SparseArray;

    if-nez v0, :cond_1

    new-instance v0, Landroid/util/SparseArray;

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getCount()I

    move-result v2

    invoke-direct {v0, v2}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mSuggestionExtrasArray:Landroid/util/SparseArray;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mSuggestionExtrasArray:Landroid/util/SparseArray;

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getWrappedCursor()Landroid/database/Cursor;

    move-result-object v2

    invoke-interface {v2}, Landroid/database/Cursor;->getPosition()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    sget-object v2, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->EMPTY_EXTRA:Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    if-ne v0, v2, :cond_2

    sget-object v0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->EMPTY_EXTRA:Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    return-object v0

    :cond_2
    if-nez v0, :cond_7

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getWrappedCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_5

    invoke-direct {p0, v2}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->isExtraIndex(I)Z

    move-result v3

    if-eqz v3, :cond_4

    aget-object v3, v0, v2

    if-eqz v3, :cond_4

    invoke-virtual {p0, v2}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getStringOrNull(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_4

    if-nez v1, :cond_3

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    :cond_3
    aget-object v4, v0, v2

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_5
    if-eqz v1, :cond_6

    new-instance v0, Lcom/miui/gallery/search/core/suggestion/MapBackedSuggestionExtras;

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/core/suggestion/MapBackedSuggestionExtras;-><init>(Ljava/util/Map;)V

    iget-object v1, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mSuggestionExtrasArray:Landroid/util/SparseArray;

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getPosition()I

    move-result v2

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_1

    :cond_6
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mSuggestionExtrasArray:Landroid/util/SparseArray;

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getPosition()I

    move-result v1

    sget-object v2, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->EMPTY_EXTRA:Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_7
    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mSuggestionExtrasArray:Landroid/util/SparseArray;

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    return-object v0
.end method

.method public getSuggestionIcon()Ljava/lang/String;
    .locals 1

    iget v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mIconIdx:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getStringOrNull(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSuggestionSource()Lcom/miui/gallery/search/core/source/Source;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mSuggestionSource:Lcom/miui/gallery/search/core/source/Source;

    return-object v0
.end method

.method public getSuggestionSubTitle()Ljava/lang/String;
    .locals 1

    iget v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mSubTitleIdx:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getStringOrNull(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSuggestionTitle()Ljava/lang/String;
    .locals 1

    iget v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mTitleIdx:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getStringOrNull(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setExtras(Landroid/os/Bundle;)V
    .locals 0

    if-nez p1, :cond_0

    sget-object p1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mExtras:Landroid/os/Bundle;

    return-void
.end method

.method protected updateIndexes()V
    .locals 1

    const-string v0, "title"

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mTitleIdx:I

    const-string v0, "subTitle"

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mSubTitleIdx:I

    const-string v0, "icon"

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mIconIdx:I

    const-string v0, "actionUri"

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;->mActionURIIdx:I

    return-void
.end method
