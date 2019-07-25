.class Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$3;
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

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$3;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$3;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->access$000(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    move-result-object p1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->setResultCode(I)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$3;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->access$000(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/picker/helper/Picker;->done()V

    return-void
.end method
