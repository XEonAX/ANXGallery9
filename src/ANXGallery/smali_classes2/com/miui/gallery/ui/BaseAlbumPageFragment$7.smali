.class Lcom/miui/gallery/ui/BaseAlbumPageFragment$7;
.super Ljava/lang/Object;
.source "BaseAlbumPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/BaseAlbumPageFragment;->showAlbumShareInfo()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/BaseAlbumPageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BaseAlbumPageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$7;->this$0:Lcom/miui/gallery/ui/BaseAlbumPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/app/DialogFragment;)V
    .locals 0

    return-void
.end method

.method public onConfirm(Landroid/app/DialogFragment;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$7;->this$0:Lcom/miui/gallery/ui/BaseAlbumPageFragment;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->access$200(Lcom/miui/gallery/ui/BaseAlbumPageFragment;Z)V

    return-void
.end method
