.class final Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$2;
.super Ljava/lang/Object;
.source "PeopleRelationSetDialogFragment.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->createRelationSetDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ILcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$defaultRelation:Ljava/lang/String;

.field final synthetic val$peopleCount:I

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(ILandroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$2;->val$peopleCount:I

    iput-object p2, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$2;->val$activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$2;->val$title:Ljava/lang/String;

    iput-object p4, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$2;->val$defaultRelation:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Landroid/os/Bundle;
    .locals 5

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Lcom/miui/gallery/model/PeopleContactInfo;->getSystemRelationNameItems()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-static {}, Lcom/miui/gallery/model/PeopleContactInfo;->getSystemRelationValueItems()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget v1, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$2;->val$peopleCount:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-gt v1, v3, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$2;->val$activity:Landroid/app/Activity;

    sget-object v4, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->myself:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v4}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v4

    invoke-static {v1, v4}, Lcom/miui/gallery/provider/FaceManager;->queryPeopleIdOfRelation(Landroid/content/Context;I)Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-gtz v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 v1, 0x1

    :cond_3
    :goto_2
    if-nez v1, :cond_4

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->myself:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-static {v1}, Lcom/miui/gallery/model/PeopleContactInfo;->getRelationValue(Lcom/miui/gallery/model/PeopleContactInfo$Relation;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_4
    invoke-static {}, Lcom/miui/gallery/model/PeopleContactInfo$UserDefineRelation;->getUserDefineRelations()Ljava/util/ArrayList;

    move-result-object v1

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$2;->val$activity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/miui/gallery/provider/FaceManager;->queryAllUserDefineRelationsOfPeople(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v1

    :cond_5
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_6
    invoke-static {v1}, Lcom/miui/gallery/model/PeopleContactInfo$UserDefineRelation;->setUserDefineRelations(Ljava/util/ArrayList;)V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "people_relation_set_title"

    iget-object v3, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$2;->val$title:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "default_relation"

    iget-object v3, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$2;->val$defaultRelation:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "relation_names"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string v0, "relation_values"

    invoke-virtual {v1, v0, p1}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    return-object v1
.end method

.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$2;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Landroid/os/Bundle;

    move-result-object p1

    return-object p1
.end method
