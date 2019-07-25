.class Lcom/miui/gallery/assistant/manager/ImageFeatureManager$4;
.super Ljava/lang/Object;
.source "ImageFeatureManager.java"

# interfaces
.implements Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->scheduleNewImages()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/assistant/manager/ImageFeatureManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$4;->this$0:Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$4;->this$0:Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->access$500(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;Z)Z

    return-void
.end method

.method public onComputeComplete(Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;)V
    .locals 0

    return-void
.end method

.method public onSaveComplete(Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$4;->this$0:Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->access$500(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$4;->this$0:Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    invoke-static {v0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->access$600(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;->getResultCode()I

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$4;->this$0:Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    invoke-static {p1, v1}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->access$602(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$4;->this$0:Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->triggerNewImageCalculation()V

    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 0

    return-void
.end method
