.class Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$2;
.super Ljava/lang/Object;
.source "CropMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment$OnCropStateChangedListener;


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

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public changeRotationState(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$500(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->setEnabled(Z)V

    return-void
.end method

.method public onCropped()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$200(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x7f10051a

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$200(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0500f8

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$200(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$300(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onRestored()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$400(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$500(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$500(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->setCurrentValue(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$500(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$600(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BiDirectionSeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$700(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/app/crop/CropAdapter;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/crop/CropAdapter;->setSelection(I)V

    return-void
.end method
