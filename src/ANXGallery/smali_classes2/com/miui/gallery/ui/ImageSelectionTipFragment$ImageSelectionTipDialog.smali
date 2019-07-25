.class Lcom/miui/gallery/ui/ImageSelectionTipFragment$ImageSelectionTipDialog;
.super Landroid/app/Dialog;
.source "ImageSelectionTipFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/ImageSelectionTipFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ImageSelectionTipDialog"
.end annotation


# instance fields
.field private mPositiveBtn:Landroid/widget/Button;

.field private mPositiveListener:Landroid/view/View$OnClickListener;

.field final synthetic this$0:Lcom/miui/gallery/ui/ImageSelectionTipFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/ImageSelectionTipFragment;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ImageSelectionTipFragment$ImageSelectionTipDialog;->this$0:Lcom/miui/gallery/ui/ImageSelectionTipFragment;

    invoke-direct {p0, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f090224

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/ImageSelectionTipFragment$ImageSelectionTipDialog;->mPositiveListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/ImageSelectionTipFragment$ImageSelectionTipDialog;->mPositiveListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b009a

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/ImageSelectionTipFragment$ImageSelectionTipDialog;->setContentView(I)V

    const p1, 0x7f090224

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/ImageSelectionTipFragment$ImageSelectionTipDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/miui/gallery/ui/ImageSelectionTipFragment$ImageSelectionTipDialog;->mPositiveBtn:Landroid/widget/Button;

    iget-object p1, p0, Lcom/miui/gallery/ui/ImageSelectionTipFragment$ImageSelectionTipDialog;->mPositiveBtn:Landroid/widget/Button;

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ImageSelectionTipFragment$ImageSelectionTipDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/16 v1, 0x50

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    const/4 v1, -0x1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v1, -0x2

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    invoke-virtual {p1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/ImageSelectionTipFragment$ImageSelectionTipDialog;->setCanceledOnTouchOutside(Z)V

    return-void
.end method

.method public setPositiveButtonOnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/ImageSelectionTipFragment$ImageSelectionTipDialog;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ImageSelectionTipFragment$ImageSelectionTipDialog;->mPositiveListener:Landroid/view/View$OnClickListener;

    return-object p0
.end method
