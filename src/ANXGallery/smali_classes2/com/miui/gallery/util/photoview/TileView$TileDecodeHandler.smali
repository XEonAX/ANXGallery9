.class Lcom/miui/gallery/util/photoview/TileView$TileDecodeHandler;
.super Landroid/os/Handler;
.source "TileView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/photoview/TileView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TileDecodeHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/photoview/TileView;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/util/photoview/TileView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/photoview/TileView$TileDecodeHandler;->this$0:Lcom/miui/gallery/util/photoview/TileView;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/util/photoview/TileView;Lcom/miui/gallery/util/photoview/TileView$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/photoview/TileView$TileDecodeHandler;-><init>(Lcom/miui/gallery/util/photoview/TileView;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/miui/gallery/util/photoview/Tile;

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/Tile;->getTileRect()Landroid/graphics/Rect;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/photoview/TileView;->makeTileKey(Landroid/graphics/Rect;)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/TileView$TileDecodeHandler;->this$0:Lcom/miui/gallery/util/photoview/TileView;

    invoke-static {v1}, Lcom/miui/gallery/util/photoview/TileView;->access$100(Lcom/miui/gallery/util/photoview/TileView;)Lcom/miui/gallery/util/photoview/TileDecodeManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/util/photoview/TileDecodeManager;->removeDecodingTile(I)V

    :cond_0
    const-string v0, "TileView"

    const-string v1, "tile decode fail: %s"

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_2

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/miui/gallery/util/photoview/Tile;

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/Tile;->getTileRect()Landroid/graphics/Rect;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/photoview/TileView;->makeTileKey(Landroid/graphics/Rect;)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/TileView$TileDecodeHandler;->this$0:Lcom/miui/gallery/util/photoview/TileView;

    invoke-static {v1}, Lcom/miui/gallery/util/photoview/TileView;->access$100(Lcom/miui/gallery/util/photoview/TileView;)Lcom/miui/gallery/util/photoview/TileDecodeManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/util/photoview/TileDecodeManager;->removeDecodingTile(I)V

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/Tile;->isActive()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/TileView$TileDecodeHandler;->this$0:Lcom/miui/gallery/util/photoview/TileView;

    invoke-static {v1}, Lcom/miui/gallery/util/photoview/TileView;->access$200(Lcom/miui/gallery/util/photoview/TileView;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/util/photoview/TileView$TileDecodeHandler;->this$0:Lcom/miui/gallery/util/photoview/TileView;

    invoke-static {p1}, Lcom/miui/gallery/util/photoview/TileView;->access$300(Lcom/miui/gallery/util/photoview/TileView;)Z

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/Tile;->recycle()V

    :cond_2
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
