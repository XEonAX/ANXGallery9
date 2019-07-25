.class Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;
.super Ljava/lang/Object;
.source "BottomMenuFragmentDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/app/BottomMenuFragmentDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;


# direct methods
.method constructor <init>(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-static {v0}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->access$000(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;)B

    move-result v0

    const/4 v1, 0x1

    and-int/2addr v0, v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-static {v0, v2}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->access$102(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;Lcom/miui/gallery/view/menu/MenuBuilder;)Lcom/miui/gallery/view/menu/MenuBuilder;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-static {v0}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->access$100(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;)Lcom/miui/gallery/view/menu/MenuBuilder;

    move-result-object v0

    const/4 v3, 0x0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    iget-object v1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-virtual {v1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->createMenu()Lcom/miui/gallery/view/menu/MenuBuilder;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->access$102(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;Lcom/miui/gallery/view/menu/MenuBuilder;)Lcom/miui/gallery/view/menu/MenuBuilder;

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    iget-object v1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-static {v1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->access$100(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;)Lcom/miui/gallery/view/menu/MenuBuilder;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result v1

    :cond_1
    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    iget-object v1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-static {v1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->access$100(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;)Lcom/miui/gallery/view/menu/MenuBuilder;

    move-result-object v1

    invoke-virtual {v0, v3, v2, v1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v1

    :cond_2
    if-eqz v1, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    iget-object v1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-static {v1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->access$100(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;)Lcom/miui/gallery/view/menu/MenuBuilder;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->setMenu(Lcom/miui/gallery/view/menu/MenuBuilder;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->setMenu(Lcom/miui/gallery/view/menu/MenuBuilder;)V

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-static {v0, v2}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->access$102(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;Lcom/miui/gallery/view/menu/MenuBuilder;)Lcom/miui/gallery/view/menu/MenuBuilder;

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    iget-object v1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;->this$0:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-static {v1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->access$000(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;)B

    move-result v1

    and-int/lit8 v1, v1, -0x12

    int-to-byte v1, v1

    invoke-static {v0, v1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->access$002(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;B)B

    return-void
.end method
