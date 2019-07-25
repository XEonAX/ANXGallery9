.class Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$3;
.super Ljava/lang/Object;
.source "DoodleMenuFragment.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->access$300(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getColor()I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->access$300(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setThumbColor(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->access$400(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;->setColor(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;->access$500(Lcom/miui/gallery/editor/photo/app/doodle/DoodleMenuFragment;)Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->setColor(I)V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
