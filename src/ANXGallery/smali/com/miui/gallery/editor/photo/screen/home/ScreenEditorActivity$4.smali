.class Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$4;
.super Lcom/miui/gallery/listener/SingleClickListener;
.source "ScreenEditorActivity.java"


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

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$4;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-direct {p0}, Lcom/miui/gallery/listener/SingleClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method protected onSingleClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f090275

    if-eq p1, v0, :cond_1

    const v0, 0x7f09027a

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$4;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$700(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$4;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$400(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Z

    move-result p1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/stat/ScreenEditorStatUtils;->statBtnDoneClick(Z)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$4;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->finish()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$4;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$400(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Z

    move-result p1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/stat/ScreenEditorStatUtils;->statBtnCancelClick(Z)V

    :goto_0
    return-void
.end method
