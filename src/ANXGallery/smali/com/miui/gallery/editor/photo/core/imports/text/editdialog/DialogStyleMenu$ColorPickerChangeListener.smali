.class Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;
.super Ljava/lang/Object;
.source "DialogStyleMenu.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ColorPickerChangeListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mListener:Ljava/lang/Object;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getColor()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setThumbColor(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mListener:Ljava/lang/Object;

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getColor()I

    move-result p2

    invoke-interface {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;->onColorChange(I)V

    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mListener:Ljava/lang/Object;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getColor()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setThumbColor(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->mListener:Ljava/lang/Object;

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$ColorPickerChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getColor()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;->onColorChange(I)V

    :cond_0
    return-void
.end method
