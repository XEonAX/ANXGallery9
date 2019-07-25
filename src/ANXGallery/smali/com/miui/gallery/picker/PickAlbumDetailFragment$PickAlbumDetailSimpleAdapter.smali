.class Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;
.super Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;
.source "PickAlbumDetailFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickAlbumDetailFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PickAlbumDetailSimpleAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/picker/PickAlbumDetailFragment;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    sget-object p1, Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;->SCENE_NONE:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    invoke-direct {p0, p2, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    return-void
.end method


# virtual methods
.method public doBindData(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->doBindData(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    invoke-virtual {p2, p1, p3}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->bindCheckState(Landroid/view/View;Landroid/database/Cursor;)V

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result p2

    iget-object p3, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    invoke-static {p3}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->access$800(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;

    move-result-object p3

    invoke-static {p2, p1, p0, p3}, Lcom/miui/gallery/picker/helper/PickerItemHolder;->bindView(ILandroid/view/View;Landroid/widget/ListAdapter;Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;)V

    return-void
.end method
