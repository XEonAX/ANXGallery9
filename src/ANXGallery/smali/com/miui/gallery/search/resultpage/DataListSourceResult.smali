.class public Lcom/miui/gallery/search/resultpage/DataListSourceResult;
.super Lcom/miui/gallery/search/core/result/BaseSourceResult;
.source "DataListSourceResult.java"

# interfaces
.implements Lcom/miui/gallery/search/core/result/SourceResult;


# instance fields
.field private mIndexHash:J

.field private mIsLastPage:Z

.field private mNextPosition:I


# direct methods
.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/Source;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;IZJ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/search/core/result/BaseSourceResult;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/Source;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    iput p4, p0, Lcom/miui/gallery/search/resultpage/DataListSourceResult;->mNextPosition:I

    iput-boolean p5, p0, Lcom/miui/gallery/search/resultpage/DataListSourceResult;->mIsLastPage:Z

    iput-wide p6, p0, Lcom/miui/gallery/search/resultpage/DataListSourceResult;->mIndexHash:J

    return-void
.end method


# virtual methods
.method public getIndexHash()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/search/resultpage/DataListSourceResult;->mIndexHash:J

    return-wide v0
.end method

.method public getNextPosition()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/search/resultpage/DataListSourceResult;->mNextPosition:I

    return v0
.end method

.method public isLastPage()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/search/resultpage/DataListSourceResult;->mIsLastPage:Z

    return v0
.end method
