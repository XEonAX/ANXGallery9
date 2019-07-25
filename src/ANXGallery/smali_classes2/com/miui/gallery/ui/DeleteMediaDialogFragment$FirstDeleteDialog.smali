.class Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;
.super Landroid/app/Dialog;
.source "DeleteMediaDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/DeleteMediaDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FirstDeleteDialog"
.end annotation


# instance fields
.field private mCurOrientation:I

.field private mDeleteTipIcon:Landroid/view/View;

.field private mDeleteTitle:Landroid/view/View;

.field private mNegativeBtn:Landroid/widget/Button;

.field private mNegativeListener:Landroid/view/View$OnClickListener;

.field private mNegativeRes:I

.field private mPositiveBtn:Landroid/widget/Button;

.field private mPositiveListener:Landroid/view/View$OnClickListener;

.field private mPositiveRes:I

.field private mSubTitle:Landroid/widget/TextView;

.field private mSubTitleRes:I

.field private mTipOne:Landroid/widget/TextView;

.field private mTipOneText:Ljava/lang/String;

.field private mTipOneVisibility:I

.field private mTipThree:Landroid/widget/TextView;

.field private mTipThreeText:Ljava/lang/String;

.field private mTipThreeVisibility:I

.field private mTipTwo:Landroid/widget/TextView;

.field private mTipTwoText:Ljava/lang/String;

.field private mTipTwoVisibility:I

.field final synthetic this$0:Lcom/miui/gallery/ui/DeleteMediaDialogFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/DeleteMediaDialogFragment;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->this$0:Lcom/miui/gallery/ui/DeleteMediaDialogFragment;

    invoke-direct {p0, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipOneVisibility:I

    iput p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipTwoVisibility:I

    iput p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipThreeVisibility:I

    const/4 p1, 0x1

    iput p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mCurOrientation:I

    return-void
.end method

.method private setText(Landroid/widget/TextView;I)V
    .locals 0

    if-lez p2, :cond_0

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    :cond_0
    return-void
.end method

.method private setText(Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public changeOrientation(I)V
    .locals 3

    iput p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mCurOrientation:I

    iget-object v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mDeleteTitle:Landroid/view/View;

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mDeleteTipIcon:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mDeleteTitle:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mDeleteTipIcon:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mDeleteTitle:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0901ed

    if-eq v0, v1, :cond_2

    const v1, 0x7f090224

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mPositiveListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mPositiveListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->dismiss()V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mNegativeListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mNegativeListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->dismiss()V

    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0085

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->setContentView(I)V

    const p1, 0x7f0900cb

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mDeleteTipIcon:Landroid/view/View;

    const p1, 0x7f0900cc

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mDeleteTitle:Landroid/view/View;

    const p1, 0x7f0900ca

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mSubTitle:Landroid/widget/TextView;

    const p1, 0x7f0900c7

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipOne:Landroid/widget/TextView;

    const p1, 0x7f0900c9

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipTwo:Landroid/widget/TextView;

    const p1, 0x7f0900c8

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipThree:Landroid/widget/TextView;

    const p1, 0x7f090224

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mPositiveBtn:Landroid/widget/Button;

    const p1, 0x7f0901ed

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mNegativeBtn:Landroid/widget/Button;

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mSubTitle:Landroid/widget/TextView;

    iget v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mSubTitleRes:I

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->setText(Landroid/widget/TextView;I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mPositiveBtn:Landroid/widget/Button;

    iget v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mPositiveRes:I

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->setText(Landroid/widget/TextView;I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mNegativeBtn:Landroid/widget/Button;

    iget v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mNegativeRes:I

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->setText(Landroid/widget/TextView;I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipOne:Landroid/widget/TextView;

    iget v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipOneVisibility:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipTwo:Landroid/widget/TextView;

    iget v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipTwoVisibility:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipThree:Landroid/widget/TextView;

    iget v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipThreeVisibility:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipOne:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipOneText:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->setText(Landroid/widget/TextView;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipTwo:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipTwoText:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->setText(Landroid/widget/TextView;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipThree:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipThreeText:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->setText(Landroid/widget/TextView;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mPositiveBtn:Landroid/widget/Button;

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mNegativeBtn:Landroid/widget/Button;

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->getWindow()Landroid/view/Window;

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

    iget p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mCurOrientation:I

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->changeOrientation(I)V

    return-void
.end method

.method public setNegativeButton(ILandroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mNegativeBtn:Landroid/widget/Button;

    if-nez v0, :cond_0

    iput p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mNegativeRes:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mNegativeBtn:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(I)V

    :goto_0
    iput-object p2, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mNegativeListener:Landroid/view/View$OnClickListener;

    return-object p0
.end method

.method public setPositiveButton(ILandroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mPositiveBtn:Landroid/widget/Button;

    if-nez v0, :cond_0

    iput p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mPositiveRes:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mPositiveBtn:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(I)V

    :goto_0
    iput-object p2, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mPositiveListener:Landroid/view/View$OnClickListener;

    return-object p0
.end method

.method public setSubTitle(I)Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mSubTitle:Landroid/widget/TextView;

    if-nez v0, :cond_0

    iput p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mSubTitleRes:I

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mSubTitle:Landroid/widget/TextView;

    iget v0, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mSubTitleRes:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    :goto_0
    return-object p0
.end method

.method public setTipText(ILjava/lang/String;)Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;
    .locals 0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipThree:Landroid/widget/TextView;

    if-nez p1, :cond_0

    iput-object p2, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipThreeText:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipThree:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipTwo:Landroid/widget/TextView;

    if-nez p1, :cond_1

    iput-object p2, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipTwoText:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipTwo:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipOne:Landroid/widget/TextView;

    if-nez p1, :cond_2

    iput-object p2, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipOneText:Ljava/lang/String;

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipOne:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setTipVisibility(IZ)Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;
    .locals 0

    if-eqz p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    const/16 p2, 0x8

    :goto_0
    packed-switch p1, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipThree:Landroid/widget/TextView;

    if-nez p1, :cond_1

    iput p2, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipThreeVisibility:I

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipThree:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipTwo:Landroid/widget/TextView;

    if-nez p1, :cond_2

    iput p2, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipTwoVisibility:I

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipTwo:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipOne:Landroid/widget/TextView;

    if-nez p1, :cond_3

    iput p2, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipOneVisibility:I

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$FirstDeleteDialog;->mTipOne:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_1
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
