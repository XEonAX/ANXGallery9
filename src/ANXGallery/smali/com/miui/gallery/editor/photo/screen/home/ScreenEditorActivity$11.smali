.class Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;
.super Ljava/lang/Object;
.source "ScreenEditorActivity.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IILcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;)Z
    .locals 2

    iget p2, p5, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;->id:I

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$602(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;I)I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$600(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->changeWithMode(I)V

    goto :goto_0

    :cond_0
    iget p2, p5, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;->id:I

    const/4 v1, 0x5

    if-ne p2, v1, :cond_3

    if-ne p4, p3, :cond_1

    return v0

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$3300(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Z

    move-result p2

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$3400(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)V

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p2, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1502(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;Z)Z

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1600(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)V

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;

    invoke-virtual {p1, p3}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->setSelection(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$3500(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;

    move-result-object p2

    invoke-interface {p2}, Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;->onExport()Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderData;

    move-result-object p2

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderData;->mDrawEntry:Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment;->setScreenDrawEntry(Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;)V

    goto :goto_0

    :cond_3
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$3600(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/longcrop/ILongCropEditorController;

    move-result-object p2

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$3600(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/longcrop/ILongCropEditorController;

    move-result-object v1

    invoke-interface {v1}, Lcom/miui/gallery/editor/photo/screen/longcrop/ILongCropEditorController;->onExport()Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    move-result-object v1

    invoke-interface {p2, v1}, Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;->setLongCropEntry(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;)V

    :cond_4
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p2, p1, p5, p3, p4}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$3700(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;Landroid/support/v7/widget/RecyclerView;Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;II)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1502(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->configEditModeView()V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$400(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Z

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$11;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$3300(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Z

    move-result p2

    invoke-static {p1, p5, p2}, Lcom/miui/gallery/editor/photo/screen/stat/ScreenEditorStatUtils;->statNavItemClick(ZLcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;Z)V

    return v0
.end method
