.class Lcom/miui/gallery/ui/PeoplePageFragment$2$1;
.super Ljava/lang/Object;
.source "PeoplePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PeoplePageFragment$2;->onAntiDoubleItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/ui/ProcessTask$ProcessCallback<",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PeoplePageFragment$2;

.field final synthetic val$peopleLocalId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PeoplePageFragment$2;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2$1;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$2;

    iput-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2$1;->val$peopleLocalId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doProcess([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 4

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2$1;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$2;

    iget-object p1, p1, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$800(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/model/PeopleContactInfo;->getRelationValue(Lcom/miui/gallery/model/PeopleContactInfo$Relation;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    new-array v0, v0, [J

    iget-object v1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2$1;->val$peopleLocalId:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const/4 v3, 0x0

    aput-wide v1, v0, v3

    invoke-static {v0, p1, p1}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->moveFaceToRelationGroup([JLjava/lang/String;Ljava/lang/String;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic doProcess([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PeoplePageFragment$2$1;->doProcess([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
