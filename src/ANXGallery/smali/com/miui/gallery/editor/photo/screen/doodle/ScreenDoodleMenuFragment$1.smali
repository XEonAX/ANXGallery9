.class Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment$1;
.super Ljava/lang/Object;
.source "ScreenDoodleMenuFragment.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getColor()I

    move-result p1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setThumbColor(I)V

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;

    invoke-static {p3, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->access$100(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;I)V

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/stat/ScreenEditorStatUtils;->statDoodleColorChoose(I)V

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
