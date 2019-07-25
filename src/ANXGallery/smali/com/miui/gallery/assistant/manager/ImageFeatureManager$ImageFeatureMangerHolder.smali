.class final Lcom/miui/gallery/assistant/manager/ImageFeatureManager$ImageFeatureMangerHolder;
.super Ljava/lang/Object;
.source "ImageFeatureManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/assistant/manager/ImageFeatureManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ImageFeatureMangerHolder"
.end annotation


# static fields
.field private static final INSTANCE:Lcom/miui/gallery/assistant/manager/ImageFeatureManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;-><init>(Lcom/miui/gallery/assistant/manager/ImageFeatureManager$1;)V

    sput-object v0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$ImageFeatureMangerHolder;->INSTANCE:Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    return-void
.end method

.method static synthetic access$100()Lcom/miui/gallery/assistant/manager/ImageFeatureManager;
    .locals 1

    sget-object v0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$ImageFeatureMangerHolder;->INSTANCE:Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    return-object v0
.end method
