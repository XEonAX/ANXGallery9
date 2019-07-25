.class Lcom/miui/gallery/widget/TwoStageDrawer$1;
.super Ljava/lang/Object;
.source "TwoStageDrawer.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/TwoStageDrawer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/TwoStageDrawer;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/TwoStageDrawer;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$000(Lcom/miui/gallery/widget/TwoStageDrawer;)Landroid/view/View;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$100(Lcom/miui/gallery/widget/TwoStageDrawer;Landroid/view/View;)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$200(Lcom/miui/gallery/widget/TwoStageDrawer;)I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v4}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$200(Lcom/miui/gallery/widget/TwoStageDrawer;)I

    move-result v4

    if-eqz v4, :cond_0

    if-eqz v0, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    invoke-static {v1, v4}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$302(Lcom/miui/gallery/widget/TwoStageDrawer;Z)Z

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v1, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$202(Lcom/miui/gallery/widget/TwoStageDrawer;I)I

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v4}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$400(Lcom/miui/gallery/widget/TwoStageDrawer;)Landroid/view/View;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$100(Lcom/miui/gallery/widget/TwoStageDrawer;Landroid/view/View;)I

    move-result v1

    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v4}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$500(Lcom/miui/gallery/widget/TwoStageDrawer;)I

    move-result v4

    if-eq v1, v4, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v4}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$500(Lcom/miui/gallery/widget/TwoStageDrawer;)I

    move-result v4

    if-eqz v4, :cond_2

    if-eqz v1, :cond_2

    const/4 v4, 0x1

    goto :goto_2

    :cond_2
    const/4 v4, 0x0

    :goto_2
    invoke-static {v0, v4}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$602(Lcom/miui/gallery/widget/TwoStageDrawer;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$502(Lcom/miui/gallery/widget/TwoStageDrawer;I)I

    const/4 v0, 0x1

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v4}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$700(Lcom/miui/gallery/widget/TwoStageDrawer;)Landroid/view/View;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$100(Lcom/miui/gallery/widget/TwoStageDrawer;Landroid/view/View;)I

    move-result v1

    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v4}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$800(Lcom/miui/gallery/widget/TwoStageDrawer;)I

    move-result v4

    if-eq v1, v4, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$802(Lcom/miui/gallery/widget/TwoStageDrawer;I)I

    const/4 v0, 0x1

    :cond_4
    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$900(Lcom/miui/gallery/widget/TwoStageDrawer;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v0, v2}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$902(Lcom/miui/gallery/widget/TwoStageDrawer;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$1000(Lcom/miui/gallery/widget/TwoStageDrawer;)V

    goto :goto_3

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$1100(Lcom/miui/gallery/widget/TwoStageDrawer;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v0, v3}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$1202(Lcom/miui/gallery/widget/TwoStageDrawer;Z)Z

    goto :goto_3

    :cond_6
    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer$1;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$1300(Lcom/miui/gallery/widget/TwoStageDrawer;)V

    :cond_7
    :goto_3
    return-void
.end method
