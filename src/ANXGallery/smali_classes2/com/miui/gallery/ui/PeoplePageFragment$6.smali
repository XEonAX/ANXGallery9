.class Lcom/miui/gallery/ui/PeoplePageFragment$6;
.super Ljava/lang/Object;
.source "PeoplePageFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PeoplePageFragment;->showIgnoreFaceAlbumAlert([JLandroid/view/ActionMode;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

.field final synthetic val$mode:Landroid/view/ActionMode;

.field final synthetic val$selectIds:[J


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PeoplePageFragment;[JLandroid/view/ActionMode;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$6;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iput-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$6;->val$selectIds:[J

    iput-object p3, p0, Lcom/miui/gallery/ui/PeoplePageFragment$6;->val$mode:Landroid/view/ActionMode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$6;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$6;->val$selectIds:[J

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$6;->val$mode:Landroid/view/ActionMode;

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$2800(Lcom/miui/gallery/ui/PeoplePageFragment;[JLandroid/view/ActionMode;)V

    const-string p1, "people"

    const-string p2, "people_ignore_album"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
