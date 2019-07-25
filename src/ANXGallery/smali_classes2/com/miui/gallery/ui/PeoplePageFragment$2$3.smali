.class Lcom/miui/gallery/ui/PeoplePageFragment$2$3;
.super Ljava/lang/Object;
.source "PeoplePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PeoplePageFragment$2;->onAntiDoubleItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PeoplePageFragment$2;

.field final synthetic val$peopleId:Ljava/lang/String;

.field final synthetic val$peopleLocalId:Ljava/lang/String;

.field final synthetic val$peopleName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PeoplePageFragment$2;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2$3;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$2;

    iput-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2$3;->val$peopleLocalId:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2$3;->val$peopleId:Ljava/lang/String;

    iput-object p4, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2$3;->val$peopleName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfirm(Ljava/lang/String;Z)V
    .locals 6

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2$3;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$2;

    iget-object v0, p2, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object v1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2$3;->val$peopleLocalId:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2$3;->val$peopleId:Ljava/lang/String;

    iget-object v4, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2$3;->val$peopleName:Ljava/lang/String;

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2$3;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$2;

    iget-object p2, p2, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$900(Lcom/miui/gallery/ui/PeoplePageFragment;)Ljava/lang/String;

    move-result-object v5

    move-object v3, p1

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$1200(Lcom/miui/gallery/ui/PeoplePageFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
