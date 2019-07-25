.class Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter$SuggestionDiffCallback;
.super Lcom/miui/gallery/search/core/display/QuickAdapterBase$InnerDiffCallback;
.source "BaseSuggestionAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SuggestionDiffCallback"
.end annotation


# instance fields
.field private mNewSuggestionCursor:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

.field private mOldSuggestionCursor:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase$InnerDiffCallback;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter$SuggestionDiffCallback;->mOldSuggestionCursor:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    iput-object p2, p0, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter$SuggestionDiffCallback;->mNewSuggestionCursor:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    return-void
.end method


# virtual methods
.method public areContentsTheSame(II)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter$SuggestionDiffCallback;->mOldSuggestionCursor:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter$SuggestionDiffCallback;->mOldSuggestionCursor:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter$SuggestionDiffCallback;->mNewSuggestionCursor:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter$SuggestionDiffCallback;->mNewSuggestionCursor:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCount()I

    move-result v0

    if-ge p2, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter$SuggestionDiffCallback;->mOldSuggestionCursor:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->moveToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter$SuggestionDiffCallback;->mNewSuggestionCursor:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {p1, p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->moveToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter$SuggestionDiffCallback;->mOldSuggestionCursor:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter$SuggestionDiffCallback;->mNewSuggestionCursor:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
