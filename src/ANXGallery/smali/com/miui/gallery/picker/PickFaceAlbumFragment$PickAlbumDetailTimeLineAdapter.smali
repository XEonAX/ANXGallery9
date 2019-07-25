.class Lcom/miui/gallery/picker/PickFaceAlbumFragment$PickAlbumDetailTimeLineAdapter;
.super Lcom/miui/gallery/adapter/FacePageAdapter;
.source "PickFaceAlbumFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickFaceAlbumFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PickAlbumDetailTimeLineAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickFaceAlbumFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/picker/PickFaceAlbumFragment;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickFaceAlbumFragment$PickAlbumDetailTimeLineAdapter;->this$0:Lcom/miui/gallery/picker/PickFaceAlbumFragment;

    invoke-direct {p0, p2}, Lcom/miui/gallery/adapter/FacePageAdapter;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public doBindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/adapter/FacePageAdapter;->doBindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V

    iget-object p2, p0, Lcom/miui/gallery/picker/PickFaceAlbumFragment$PickAlbumDetailTimeLineAdapter;->this$0:Lcom/miui/gallery/picker/PickFaceAlbumFragment;

    invoke-virtual {p2, p1, p3}, Lcom/miui/gallery/picker/PickFaceAlbumFragment;->bindCheckState(Landroid/view/View;Landroid/database/Cursor;)V

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result p2

    iget-object p3, p0, Lcom/miui/gallery/picker/PickFaceAlbumFragment$PickAlbumDetailTimeLineAdapter;->this$0:Lcom/miui/gallery/picker/PickFaceAlbumFragment;

    invoke-static {p3}, Lcom/miui/gallery/picker/PickFaceAlbumFragment;->access$400(Lcom/miui/gallery/picker/PickFaceAlbumFragment;)Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;

    move-result-object p3

    invoke-static {p2, p1, p0, p3}, Lcom/miui/gallery/picker/helper/PickerItemHolder;->bindView(ILandroid/view/View;Landroid/widget/ListAdapter;Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;)V

    return-void
.end method
