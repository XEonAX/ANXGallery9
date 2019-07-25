.class Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$2;
.super Ljava/lang/Object;
.source "PeopleRelationCreatorDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$2;->this$0:Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$2;->this$0:Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->access$300(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;)Landroid/widget/EditText;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$2;->this$0:Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->access$400(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$2;->this$0:Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->access$100(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    invoke-static {p1}, Lcom/miui/gallery/model/PeopleContactInfo$UserDefineRelation;->addRelation(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$2;->this$0:Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->access$500(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;)Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$OnRelationCreatedListener;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$2;->this$0:Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;->access$500(Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment;)Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$OnRelationCreatedListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/miui/gallery/ui/PeopleRelationCreatorDialogFragment$OnRelationCreatedListener;->onRelationCreated(Ljava/lang/String;)V

    :cond_1
    return-void
.end method
