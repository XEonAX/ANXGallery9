.class Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$1;
.super Ljava/lang/Object;
.source "StoryAlbumRenameDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    iget-object v0, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->mDialog:Lmiui/app/AlertDialog;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    iput-object v0, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->mConfirmButton:Landroid/widget/Button;

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->mConfirmButton:Landroid/widget/Button;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    iget-object v0, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->mConfirmButton:Landroid/widget/Button;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$1;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->access$000(Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;)Landroid/view/View$OnClickListener;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
