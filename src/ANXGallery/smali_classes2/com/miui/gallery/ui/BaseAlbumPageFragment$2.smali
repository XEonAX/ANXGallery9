.class Lcom/miui/gallery/ui/BaseAlbumPageFragment$2;
.super Ljava/lang/Object;
.source "BaseAlbumPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BaseAlbumPageFragment;
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

    iput-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$2;->this$0:Lcom/miui/gallery/ui/BaseAlbumPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDeleted(I[J)V
    .locals 1

    iget-object p2, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$2;->this$0:Lcom/miui/gallery/ui/BaseAlbumPageFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    if-nez p2, :cond_0

    return-void

    :cond_0
    if-ltz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$2;->this$0:Lcom/miui/gallery/ui/BaseAlbumPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$2;->this$0:Lcom/miui/gallery/ui/BaseAlbumPageFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    const v0, 0x7f1002f5

    invoke-virtual {p2, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$2;->this$0:Lcom/miui/gallery/ui/BaseAlbumPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SoundUtils;->playSoundForOperation(Landroid/content/Context;I)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$2;->this$0:Lcom/miui/gallery/ui/BaseAlbumPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$2;->this$0:Lcom/miui/gallery/ui/BaseAlbumPageFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    const v0, 0x7f1002f3

    invoke-virtual {p2, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method
