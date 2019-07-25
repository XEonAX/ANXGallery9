.class Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1$1;
.super Ljava/lang/Object;
.source "IgnorePeoplePageFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1;->onPeopleRecoveryButtonClick(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/RectF;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1;

.field final synthetic val$localId:Ljava/lang/String;

.field final synthetic val$name:Ljava/lang/String;

.field final synthetic val$positiveButton:Landroid/widget/Button;

.field final synthetic val$serverId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1$1;->this$1:Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1;

    iput-object p2, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1$1;->val$positiveButton:Landroid/widget/Button;

    iput-object p3, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1$1;->val$localId:Ljava/lang/String;

    iput-object p4, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1$1;->val$serverId:Ljava/lang/String;

    iput-object p5, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1$1;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    iget-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1$1;->val$positiveButton:Landroid/widget/Button;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1$1;->this$1:Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1;

    iget-object p1, p1, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    iget-object v0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1$1;->val$localId:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1$1;->val$serverId:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1$1;->val$name:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1$1;->this$1:Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1;

    iget-object v3, v3, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->access$000(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)Landroid/app/AlertDialog;

    move-result-object v3

    invoke-static {p1, v0, v1, v2, v3}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->access$100(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;)V

    return-void
.end method
