.class Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$3;
.super Ljava/lang/Object;
.source "ScreenEditorActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$3;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f090003

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$3;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;->doRevoke()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$3;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$300(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$3;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$400(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Z

    move-result p1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/stat/ScreenEditorStatUtils;->statRevokeClick(Z)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$3;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;->doRevert()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$3;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$300(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$3;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$400(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Z

    move-result p1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/stat/ScreenEditorStatUtils;->statRevertClick(Z)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$3;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$500(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$3;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->finish()V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$3;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$602(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;I)I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$3;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$3;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$600(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->changeWithMode(I)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f0901fe
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
