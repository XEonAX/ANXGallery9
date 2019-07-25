.class Lcom/miui/gallery/assistant/manager/ImageFeatureManager$3;
.super Ljava/lang/Object;
.source "ImageFeatureManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->createNewImageCalculateRunnable()Ljava/lang/Runnable;
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

    iput-object p1, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$3;->this$0:Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$3;->this$0:Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    invoke-static {v0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->access$400(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;)V

    return-void
.end method
