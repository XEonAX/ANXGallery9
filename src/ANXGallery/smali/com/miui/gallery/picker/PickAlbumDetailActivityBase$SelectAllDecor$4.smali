.class Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$4;
.super Ljava/lang/Object;
.source "PickAlbumDetailActivityBase.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->setup()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;


# direct methods
.method constructor <init>(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$4;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$4;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->access$100(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$4;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->access$000(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    move-result-object p1

    iget-object p1, p1, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->mAlbumDetailFragment:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->clear()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$4;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->access$000(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    move-result-object p1

    iget-object p1, p1, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->mAlbumDetailFragment:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->selectAll()V

    :goto_0
    return-void
.end method
