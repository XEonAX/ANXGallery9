.class Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$1;
.super Landroid/os/Handler;
.source "CropFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->onAutoCrop(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->access$000(Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;Z)V

    return-void
.end method
