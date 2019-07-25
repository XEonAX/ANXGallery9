.class public Lcom/miui/gallery/assistant/manager/result/SceneFeatureResult;
.super Lcom/miui/gallery/assistant/manager/result/ImageFeatureResult;
.source "SceneFeatureResult.java"


# instance fields
.field private mSceneResult:Lcom/miui/gallery/assistant/jni/filter/SceneResult;


# direct methods
.method public constructor <init>(IJ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/assistant/manager/result/ImageFeatureResult;-><init>(IJ)V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/assistant/jni/filter/SceneResult;J)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0, p2, p3}, Lcom/miui/gallery/assistant/manager/result/ImageFeatureResult;-><init>(IJ)V

    iput-object p1, p0, Lcom/miui/gallery/assistant/manager/result/SceneFeatureResult;->mSceneResult:Lcom/miui/gallery/assistant/jni/filter/SceneResult;

    return-void
.end method


# virtual methods
.method public getSceneResult()Lcom/miui/gallery/assistant/jni/filter/SceneResult;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/result/SceneFeatureResult;->mSceneResult:Lcom/miui/gallery/assistant/jni/filter/SceneResult;

    return-object v0
.end method

.method public updateImageFeature(Lcom/miui/gallery/assistant/model/ImageFeature;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/manager/result/SceneFeatureResult;->getSceneResult()Lcom/miui/gallery/assistant/jni/filter/SceneResult;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/assistant/model/ImageFeature;->setSceneResult(Lcom/miui/gallery/assistant/jni/filter/SceneResult;)V

    :cond_0
    return-void
.end method
