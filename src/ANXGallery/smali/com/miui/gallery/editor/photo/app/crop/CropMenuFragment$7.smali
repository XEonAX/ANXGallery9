.class Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$7;
.super Ljava/lang/Object;
.source "CropMenuFragment.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mStart:Z

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$7;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$7;->mStart:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$7;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$1500(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)I

    move-result p1

    sub-int p1, p2, p1

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    const/4 p3, 0x6

    if-lt p1, p3, :cond_1

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$7;->mStart:Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$7;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$1502(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;I)I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$7;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$1700(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$7;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {p3, p2}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$1600(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;I)F

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->tuning(F)V

    :cond_1
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$7;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$1800(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->prepareTuning()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$7;->mStart:Z

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$7;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$1900(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->finishTuning()V

    return-void
.end method
