.class Lcom/miui/gallery/view/BrightnessManager$1;
.super Landroid/database/ContentObserver;
.source "BrightnessManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/view/BrightnessManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/view/BrightnessManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/view/BrightnessManager;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/BrightnessManager$1;->this$0:Lcom/miui/gallery/view/BrightnessManager;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1

    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    iget-object v0, p0, Lcom/miui/gallery/view/BrightnessManager$1;->this$0:Lcom/miui/gallery/view/BrightnessManager;

    invoke-static {v0}, Lcom/miui/gallery/view/BrightnessManager;->access$500(Lcom/miui/gallery/view/BrightnessManager;)Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/view/BrightnessManager$1;->this$0:Lcom/miui/gallery/view/BrightnessManager;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/view/BrightnessManager;->access$402(Lcom/miui/gallery/view/BrightnessManager;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/view/BrightnessManager$1;->this$0:Lcom/miui/gallery/view/BrightnessManager;

    invoke-static {p1}, Lcom/miui/gallery/view/BrightnessManager;->access$600(Lcom/miui/gallery/view/BrightnessManager;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method
