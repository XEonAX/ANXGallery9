.class Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$2;
.super Ljava/lang/Object;
.source "StoryAlbumRenameDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;
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

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$2;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$2;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->mInputView:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$2;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    invoke-static {v0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->access$100(Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$2;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    iget-object v0, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->mDefaultName:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$2;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    iget-object v0, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->mConfirmButton:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$2;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    iget-object v0, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->mOnRenameDoneListener:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$OnRenameDoneListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$2;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    iget-object v0, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->mOnRenameDoneListener:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$OnRenameDoneListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$OnRenameDoneListener;->onOperationDone(Ljava/lang/String;)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog$2;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumRenameDialog;->mDialog:Lmiui/app/AlertDialog;

    invoke-virtual {p1}, Lmiui/app/AlertDialog;->dismiss()V

    return-void
.end method
