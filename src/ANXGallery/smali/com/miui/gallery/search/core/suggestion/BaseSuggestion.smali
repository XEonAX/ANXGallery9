.class public Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;
.super Ljava/lang/Object;
.source "BaseSuggestion.java"

# interfaces
.implements Lcom/miui/gallery/search/core/suggestion/Suggestion;


# instance fields
.field protected mIcon:Ljava/lang/String;

.field protected mIntentActionURI:Ljava/lang/String;

.field protected mSubTitle:Ljava/lang/String;

.field protected mSuggestionExtras:Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

.field protected mSuggestionSource:Lcom/miui/gallery/search/core/source/Source;

.field protected mTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;Lcom/miui/gallery/search/core/source/Source;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mTitle:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mIcon:Ljava/lang/String;

    iput-object p4, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mIntentActionURI:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mSubTitle:Ljava/lang/String;

    iput-object p5, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mSuggestionExtras:Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    iput-object p6, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mSuggestionSource:Lcom/miui/gallery/search/core/source/Source;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_7

    instance-of v2, p1, Lcom/miui/gallery/search/core/suggestion/Suggestion;

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    check-cast p1, Lcom/miui/gallery/search/core/suggestion/Suggestion;

    iget-object v2, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mTitle:Ljava/lang/String;

    invoke-static {v2}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionTitle()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    return v1

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mSubTitle:Ljava/lang/String;

    invoke-static {v2}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionSubTitle()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    return v1

    :cond_3
    iget-object v2, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mIcon:Ljava/lang/String;

    invoke-static {v2}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionIcon()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    return v1

    :cond_4
    iget-object v2, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mIntentActionURI:Ljava/lang/String;

    invoke-static {v2}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getIntentActionURI()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    return v1

    :cond_5
    iget-object v2, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mSuggestionExtras:Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/miui/gallery/util/MiscUtil;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    return v1

    :cond_6
    return v0

    :cond_7
    :goto_0
    return v1
.end method

.method public getIntentActionURI()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mIntentActionURI:Ljava/lang/String;

    return-object v0
.end method

.method public getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mSuggestionExtras:Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    return-object v0
.end method

.method public getSuggestionIcon()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mIcon:Ljava/lang/String;

    return-object v0
.end method

.method public getSuggestionSource()Lcom/miui/gallery/search/core/source/Source;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mSuggestionSource:Lcom/miui/gallery/search/core/source/Source;

    return-object v0
.end method

.method public getSuggestionSubTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mSubTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getSuggestionTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method public setIntentActionURI(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mIntentActionURI:Ljava/lang/String;

    return-void
.end method

.method public setSuggestionExtras(Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mSuggestionExtras:Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    return-void
.end method

.method public setSuggestionIcon(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mIcon:Ljava/lang/String;

    return-void
.end method

.method public setSuggestionSource(Lcom/miui/gallery/search/core/source/Source;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mSuggestionSource:Lcom/miui/gallery/search/core/source/Source;

    return-void
.end method

.method public setSuggestionSubTitle(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mSubTitle:Ljava/lang/String;

    return-void
.end method

.method public setSuggestionTitle(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mTitle:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BaseSuggestion [title:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "mSubTitle:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mSubTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "mIntentActionURI:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mIntentActionURI:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "mIcon:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mIcon:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "mSuggestionExtras:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->mSuggestionExtras:Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
