.class Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask$1;
.super Ljava/lang/Object;
.source "MarkMyselfSuggestionModel.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask;->doInBackground([Ljava/lang/Void;)Landroid/util/Pair;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/SafeDBUtil$QueryHandler<",
        "Landroid/util/Pair<",
        "Ljava/lang/Integer;",
        "Ljava/util/ArrayList<",
        "Lcom/miui/gallery/people/model/People;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask$1;->this$0:Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask;

    iput-object p2, p0, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Landroid/database/Cursor;)Landroid/util/Pair;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/people/model/People;",
            ">;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p1, :cond_5

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask$1;->val$context:Landroid/content/Context;

    invoke-static {v3}, Lcom/miui/gallery/model/PeopleContactInfo;->getDefaultNameForMyself(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v5, 0x0

    const/4 v6, 0x0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getRelationType(Landroid/database/Cursor;)I

    move-result v7

    sget-object v8, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->child:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v8}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v8

    if-eq v7, v8, :cond_2

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->toPeople(Landroid/database/Cursor;)Lcom/miui/gallery/people/model/People;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v9, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->myself:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v9}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v9

    if-ne v7, v9, :cond_1

    add-int/lit8 v5, v5, 0x1

    :cond_1
    invoke-virtual {v8}, Lcom/miui/gallery/people/model/People;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    add-int/lit8 v6, v6, 0x1

    :cond_2
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-nez v7, :cond_0

    if-ne v5, v1, :cond_3

    const/4 v1, 0x2

    const-string p1, "suggestType"

    const-string v2, "No need mark"

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_3
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_6

    new-instance p1, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask$1$1;

    invoke-direct {p1, p0, v3}, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask$1$1;-><init>(Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask$1;Ljava/lang/String;)V

    invoke-static {v4, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask$1;->this$0:Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask;

    invoke-static {p1}, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask;->access$100(Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask;)Landroid/os/Bundle;

    move-result-object p1

    const-string v3, "option_suggestion_limit"

    const/4 v7, -0x1

    invoke-virtual {p1, v3, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    if-lez p1, :cond_4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-le v3, p1, :cond_4

    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {v4, v2, p1}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object p1

    invoke-direct {v3, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v4, v3

    :cond_4
    const-string p1, "suggestType"

    const-string v2, "Normal"

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "peopleOfMyself"

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "peopleNameOfMe"

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_5
    const/4 v4, 0x0

    :cond_6
    const/4 v1, 0x0

    :goto_0
    if-eqz v4, :cond_7

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_8

    :cond_7
    const-string p1, "suggestType"

    const-string v2, "No people"

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8
    const-string p1, "people_mark"

    const-string v2, "mark_myself_triggered"

    invoke-static {p1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    new-instance p1, Landroid/util/Pair;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p1, v0, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p1
.end method

.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel$LoadPeopleTask$1;->handle(Landroid/database/Cursor;)Landroid/util/Pair;

    move-result-object p1

    return-object p1
.end method
