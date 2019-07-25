.class Lcom/miui/gallery/ui/IgnorePeoplePageFragment$4;
.super Ljava/lang/Object;
.source "IgnorePeoplePageFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->showMergeOrRenameDialog(Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

.field final synthetic val$existPeopleName:Ljava/lang/String;

.field final synthetic val$recoveryPeople:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$4;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    iput-object p2, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$4;->val$recoveryPeople:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    iput-object p3, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$4;->val$existPeopleName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$4;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    iget-object p2, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$4;->val$recoveryPeople:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->access$602(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;)Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    new-instance p1, Landroid/content/Intent;

    iget-object p2, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$4;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-class v0, Lcom/miui/gallery/activity/facebaby/InputFaceNameActivity;

    invoke-direct {p1, p2, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance p2, Landroid/os/Bundle;

    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    const-string v0, "original_name"

    iget-object v1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$4;->val$existPeopleName:Ljava/lang/String;

    invoke-virtual {p2, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    iget-object p2, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$4;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/16 v0, 0x27

    invoke-virtual {p2, p1, v0}, Lcom/miui/gallery/activity/BaseActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
