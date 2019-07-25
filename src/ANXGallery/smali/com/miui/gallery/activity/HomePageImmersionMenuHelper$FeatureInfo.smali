.class Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$FeatureInfo;
.super Ljava/lang/Object;
.source "HomePageImmersionMenuHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FeatureInfo"
.end annotation


# instance fields
.field public mFeatureName:Ljava/lang/String;

.field private mIsPushValid:Z

.field private mIsUpdate:Z

.field final synthetic this$0:Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;Ljava/lang/String;ZZ)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$FeatureInfo;->this$0:Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$FeatureInfo;->mFeatureName:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$FeatureInfo;->mIsUpdate:Z

    iput-boolean p4, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$FeatureInfo;->mIsPushValid:Z

    invoke-static {p2}, Lcom/miui/gallery/preference/GalleryPreferences$FeatureRedDot;->isUpdateFeatureStated(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p3, "featureName"

    invoke-interface {p1, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "feature_red_dot"

    const-string p4, "new_feature"

    invoke-static {p3, p4, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const/4 p1, 0x1

    invoke-static {p2, p1}, Lcom/miui/gallery/preference/GalleryPreferences$FeatureRedDot;->setUpdateFeatureStated(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method public needRedDot()Z
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$FeatureInfo;->mIsUpdate:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$FeatureInfo;->mFeatureName:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$FeatureRedDot;->hasUpdateFeatureUsed(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$FeatureInfo;->mIsPushValid:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$FeatureInfo;->mFeatureName:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/GalleryPreferences$FeatureRedDot;->isFeatureRedDotValid(Ljava/lang/String;J)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setFeatureUsed()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$FeatureInfo;->mFeatureName:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/GalleryPreferences$FeatureRedDot;->setUpdateFeatureUsed(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$FeatureInfo;->mFeatureName:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/GalleryPreferences$FeatureRedDot;->isFeatureRedDotValid(Ljava/lang/String;J)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$FeatureInfo;->mFeatureName:Ljava/lang/String;

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2, v1, v2}, Lcom/miui/gallery/preference/GalleryPreferences$FeatureRedDot;->setFeatureRedDotValidTime(Ljava/lang/String;JJ)V

    :cond_0
    return-void
.end method
