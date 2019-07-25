.class Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;
.super Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;
.source "PickRecentDiscoveryFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PickRecentAlbumTimelineAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;Landroid/content/Context;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;->this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;

    sget-object p1, Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;->SCENE_NONE:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    const/4 v0, 0x1

    invoke-direct {p0, p2, p1, v0}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;Z)V

    return-void
.end method


# virtual methods
.method public doBindData(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->doBindData(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V

    iget-object p2, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;->this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;

    invoke-virtual {p2, p1, p3}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->bindCheckState(Landroid/view/View;Landroid/database/Cursor;)V

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result p2

    iget-object p3, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;->this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;

    invoke-static {p3}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->access$500(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;)Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;

    move-result-object p3

    invoke-static {p2, p1, p0, p3}, Lcom/miui/gallery/picker/helper/PickerItemHolder;->bindView(ILandroid/view/View;Landroid/widget/ListAdapter;Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;)V

    return-void
.end method
