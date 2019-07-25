.class Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$4;
.super Ljava/lang/Object;
.source "CropMenuFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$4;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$4;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$900(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;Z)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string v0, "photo_editor"

    const-string v1, "crop_auto_click"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
