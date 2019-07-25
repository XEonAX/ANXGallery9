.class Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1$1;
.super Ljava/lang/Object;
.source "SlideshowIntervalDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;->onShow(Landroid/content/DialogInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1$1;->this$1:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1$1;->this$1:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;

    iget-object p1, p1, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;->this$0:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;

    iget-object v0, p0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1$1;->this$1:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;

    iget-object v0, v0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;->val$editText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->access$100(Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1$1;->this$1:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;

    iget-object p1, p1, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;->this$0:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const v0, 0x7f10067d

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1$1;->this$1:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;

    iget-object p1, p1, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;->val$editText:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$SlideShow;->setSlideShowInterval(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1$1;->this$1:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;

    iget-object p1, p1, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;->this$0:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->access$200(Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;)Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$CompleteListener;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1$1;->this$1:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;

    iget-object p1, p1, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;->this$0:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->access$200(Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;)Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$CompleteListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$CompleteListener;->onComplete()V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1$1;->this$1:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;

    iget-object p1, p1, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;->this$0:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->access$000(Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;)Lmiui/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1}, Lmiui/app/AlertDialog;->dismiss()V

    :goto_0
    return-void
.end method
