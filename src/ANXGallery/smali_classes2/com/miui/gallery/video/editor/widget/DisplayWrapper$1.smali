.class Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;
.super Ljava/lang/Object;
.source "DisplayWrapper.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_1

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p2

    invoke-static {p1, p2}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$102(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;F)F

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$100(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)F

    move-result p2

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$000(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)F

    move-result v1

    sub-float/2addr p2, v1

    invoke-static {p1, p2}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$202(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;F)F

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$200(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$300(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)I

    move-result p2

    int-to-float p2, p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$400(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)F

    move-result p1

    const/4 p2, 0x0

    cmpl-float p1, p1, p2

    if-lez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$200(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {v2}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$400(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)F

    move-result v2

    div-float/2addr v1, v2

    invoke-static {p1, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$502(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;F)F

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$200(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)F

    move-result v1

    cmpg-float p2, v1, p2

    if-gez p2, :cond_0

    sget p2, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->LEFT:I

    goto :goto_0

    :cond_0
    sget p2, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->RIGHT:I

    :goto_0
    invoke-static {p1, p2}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$602(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;I)I

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$700(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)Lcom/miui/gallery/video/editor/widget/DisplayWrapper$IProgress;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$700(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)Lcom/miui/gallery/video/editor/widget/DisplayWrapper$IProgress;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$600(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)I

    move-result p2

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$500(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)F

    move-result v1

    invoke-interface {p1, p2, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$IProgress;->onVideoProgressChanging(IF)V

    goto :goto_1

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p2

    invoke-static {p1, p2}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$802(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;F)F

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$800(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)F

    move-result p2

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$000(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)F

    move-result v1

    sub-float/2addr p2, v1

    invoke-static {p1, p2}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$202(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;F)F

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$700(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)Lcom/miui/gallery/video/editor/widget/DisplayWrapper$IProgress;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$700(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;)Lcom/miui/gallery/video/editor/widget/DisplayWrapper$IProgress;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$IProgress;->onVideoProgressChanged()V

    goto :goto_1

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper$1;->this$0:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p2

    invoke-static {p1, p2}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->access$002(Lcom/miui/gallery/video/editor/widget/DisplayWrapper;F)F

    return v0

    :cond_1
    :goto_1
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
