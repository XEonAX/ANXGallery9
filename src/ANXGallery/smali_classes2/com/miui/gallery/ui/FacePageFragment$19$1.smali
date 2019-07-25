.class Lcom/miui/gallery/ui/FacePageFragment$19$1;
.super Ljava/lang/Object;
.source "FacePageFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/FacePageFragment$19;->onConfirm(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/FacePageFragment$19;

.field final synthetic val$newName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/FacePageFragment$19;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$19$1;->this$1:Lcom/miui/gallery/ui/FacePageFragment$19;

    iput-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment$19$1;->val$newName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$19$1;->this$1:Lcom/miui/gallery/ui/FacePageFragment$19;

    iget-object v0, v0, Lcom/miui/gallery/ui/FacePageFragment$19;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/FacePageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$19$1;->this$1:Lcom/miui/gallery/ui/FacePageFragment$19;

    iget-object v0, v0, Lcom/miui/gallery/ui/FacePageFragment$19;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/FacePageFragment;->access$600(Lcom/miui/gallery/ui/FacePageFragment;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$19$1;->this$1:Lcom/miui/gallery/ui/FacePageFragment$19;

    iget-object v0, v0, Lcom/miui/gallery/ui/FacePageFragment$19;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/FacePageFragment;->access$2300(Lcom/miui/gallery/ui/FacePageFragment;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090119

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment$19$1;->this$1:Lcom/miui/gallery/ui/FacePageFragment$19;

    iget-object v1, v1, Lcom/miui/gallery/ui/FacePageFragment$19;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    const v2, 0x7f10039c

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/FacePageFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$19$1;->this$1:Lcom/miui/gallery/ui/FacePageFragment$19;

    iget-object v0, v0, Lcom/miui/gallery/ui/FacePageFragment$19;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment$19$1;->val$newName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/FacePageFragment;->access$302(Lcom/miui/gallery/ui/FacePageFragment;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$19$1;->this$1:Lcom/miui/gallery/ui/FacePageFragment$19;

    iget-object v0, v0, Lcom/miui/gallery/ui/FacePageFragment$19;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/FacePageFragment;->access$2400(Lcom/miui/gallery/ui/FacePageFragment;)V

    return-void
.end method
