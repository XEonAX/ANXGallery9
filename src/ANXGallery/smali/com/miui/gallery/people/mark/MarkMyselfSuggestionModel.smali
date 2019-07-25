.class public Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;
.super Ljava/lang/Object;
.source "MarkMyselfSuggestionModel.java"

# interfaces
.implements Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$MarkPeopleTask;,
        Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private isMarkingMyself(Landroid/os/Bundle;)Z
    .locals 1

    const-string v0, "option_mark_relation"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/model/PeopleContactInfo;->getRelationType(Ljava/lang/String;)I

    move-result p1

    sget-object v0, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->myself:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v0}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v0

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public loadMarkSuggestion(Landroid/content/Context;Landroid/os/Bundle;Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$LoadMarkSuggestionCallback;)V
    .locals 1

    invoke-direct {p0, p2}, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;->isMarkingMyself(Landroid/os/Bundle;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask;

    invoke-direct {v0, p1, p2, p3}, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask;-><init>(Landroid/content/Context;Landroid/os/Bundle;Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$LoadMarkSuggestionCallback;)V

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    :cond_0
    invoke-interface {p3}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$LoadMarkSuggestionCallback;->onPeopleSuggestionLoadFailed()V

    :goto_0
    return-void
.end method

.method public markPeople(Landroid/content/Context;Lcom/miui/gallery/people/model/People;Landroid/os/Bundle;Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$MarkPeopleCallback;)V
    .locals 1

    invoke-direct {p0, p3}, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;->isMarkingMyself(Landroid/os/Bundle;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$MarkPeopleTask;

    invoke-direct {v0, p1, p2, p4}, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$MarkPeopleTask;-><init>(Landroid/content/Context;Lcom/miui/gallery/people/model/People;Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$MarkPeopleCallback;)V

    const/4 p1, 0x1

    new-array p1, p1, [Landroid/os/Bundle;

    const/4 p2, 0x0

    aput-object p3, p1, p2

    invoke-virtual {v0, p1}, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$MarkPeopleTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    invoke-interface {p4, p1}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$MarkPeopleCallback;->onMarkPeopleFailed(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public needMark(Landroid/os/Bundle;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;->isMarkingMyself(Landroid/os/Bundle;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Face;->getMarkMyselfTriggeredCount()I

    move-result p1

    if-gtz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Face;->isFirstSyncCompleted()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public onMarkSuggestionTriggered(Landroid/os/Bundle;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;->isMarkingMyself(Landroid/os/Bundle;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Face;->onMarkMyselfTriggered()V

    :cond_0
    return-void
.end method

.method public setMarkResult(Landroid/os/Bundle;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;->isMarkingMyself(Landroid/os/Bundle;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {p2}, Lcom/miui/gallery/preference/GalleryPreferences$Face;->setMarkMyselfResult(Z)V

    :cond_0
    return-void
.end method
