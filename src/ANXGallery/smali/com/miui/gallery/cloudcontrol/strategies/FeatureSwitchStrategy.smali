.class public Lcom/miui/gallery/cloudcontrol/strategies/FeatureSwitchStrategy;
.super Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;
.source "FeatureSwitchStrategy.java"


# instance fields
.field private mIsGlobalSecretVideoSupported:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "global-secret-video"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/FeatureSwitchStrategy;->mIsGlobalSecretVideoSupported:Z

    return-void
.end method

.method public static createDefault()Lcom/miui/gallery/cloudcontrol/strategies/FeatureSwitchStrategy;
    .locals 1

    new-instance v0, Lcom/miui/gallery/cloudcontrol/strategies/FeatureSwitchStrategy;

    invoke-direct {v0}, Lcom/miui/gallery/cloudcontrol/strategies/FeatureSwitchStrategy;-><init>()V

    return-object v0
.end method


# virtual methods
.method public isGlobalSecretVideoSupported()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/FeatureSwitchStrategy;->mIsGlobalSecretVideoSupported:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FeatureSwitchStrategy{mIsGlobalSecretVideoSupported="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/FeatureSwitchStrategy;->mIsGlobalSecretVideoSupported:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
