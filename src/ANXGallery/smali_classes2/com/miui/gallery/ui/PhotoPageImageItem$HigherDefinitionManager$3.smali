.class Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$3;
.super Ljava/lang/Object;
.source "PhotoPageImageItem.java"

# interfaces
.implements Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMaxScaleStage(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->access$1400(Lcom/miui/gallery/ui/PhotoPageImageItem;)Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->access$1700(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->access$1400(Lcom/miui/gallery/ui/PhotoPageImageItem;)Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->access$1600(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)V

    :goto_0
    return-void
.end method

.method public onMidScaleStage(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->access$1400(Lcom/miui/gallery/ui/PhotoPageImageItem;)Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->access$1500(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->access$1400(Lcom/miui/gallery/ui/PhotoPageImageItem;)Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->access$1600(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)V

    :goto_0
    return-void
.end method
