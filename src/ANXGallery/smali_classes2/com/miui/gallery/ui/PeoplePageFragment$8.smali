.class Lcom/miui/gallery/ui/PeoplePageFragment$8;
.super Ljava/lang/Object;
.source "PeoplePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PeoplePageFragment;->mergePeople([JLandroid/view/ActionMode;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

.field final synthetic val$mode:Landroid/view/ActionMode;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PeoplePageFragment;Landroid/view/ActionMode;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$8;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iput-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$8;->val$mode:Landroid/view/ActionMode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfirm(Ljava/lang/String;Z)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$8;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PeoplePageFragment;->mHandler:Landroid/os/Handler;

    new-instance p2, Lcom/miui/gallery/ui/PeoplePageFragment$8$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/ui/PeoplePageFragment$8$1;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment$8;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const-string p1, "people"

    const-string p2, "people_merge_album"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
