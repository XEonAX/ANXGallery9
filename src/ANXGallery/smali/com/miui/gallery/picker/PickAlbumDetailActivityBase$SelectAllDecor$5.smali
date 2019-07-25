.class Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$5;
.super Landroid/database/DataSetObserver;
.source "PickAlbumDetailActivityBase.java"


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

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$5;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    invoke-super {p0}, Landroid/database/DataSetObserver;->onChanged()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$5;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->access$000(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->updateTitle()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$5;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->access$200(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)V

    return-void
.end method

.method public onInvalidated()V
    .locals 1

    invoke-super {p0}, Landroid/database/DataSetObserver;->onInvalidated()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$5;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->access$000(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->updateTitle()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$5;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->access$200(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)V

    return-void
.end method
