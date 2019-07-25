.class Lcom/miui/gallery/editor/photo/app/PreviewFragment$2;
.super Ljava/lang/Object;
.source "PreviewFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/PreviewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;

    invoke-interface {v1, v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment$Callbacks;->reRender(Z)V

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    move-result p1

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->access$402(Lcom/miui/gallery/editor/photo/app/PreviewFragment;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->access$300(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->access$400(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f10053d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f10053c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
