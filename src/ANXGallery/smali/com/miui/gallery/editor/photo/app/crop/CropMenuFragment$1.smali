.class Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$1;
.super Ljava/lang/Object;
.source "CropMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/TouchTransLinearLayout$OnTouchEvent;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
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

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$100(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->doTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
