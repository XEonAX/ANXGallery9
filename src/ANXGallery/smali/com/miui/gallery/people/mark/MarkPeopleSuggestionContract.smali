.class public Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract;
.super Ljava/lang/Object;
.source "MarkPeopleSuggestionContract.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;,
        Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$MarkPeopleCallback;,
        Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$LoadMarkSuggestionCallback;,
        Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;
    }
.end annotation


# direct methods
.method public static buildMarkInfoForMarkMyself(Landroid/content/Context;)Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "option_mark_relation"

    sget-object v2, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->myself:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-static {v2}, Lcom/miui/gallery/model/PeopleContactInfo;->getRelationValue(Lcom/miui/gallery/model/PeopleContactInfo$Relation;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "option_suggestion_limit"

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v2, 0x7f0a0015

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p0

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-object v0
.end method

.method public static buildMarkUriForMarkInfo(Landroid/os/Bundle;)Landroid/net/Uri;
    .locals 3

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Common;->URI_PEOPLE_LIST_PAGE:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "markMode"

    const-string v2, "true"

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "markRelation"

    const-string v2, "option_mark_relation"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method
