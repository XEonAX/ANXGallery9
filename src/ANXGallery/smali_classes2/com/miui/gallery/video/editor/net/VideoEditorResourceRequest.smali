.class public Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;
.super Lcom/miui/gallery/video/editor/net/VideoEditorBaseResourceRequest;
.source "VideoEditorResourceRequest.java"


# instance fields
.field private final RESOURCE_AUDIO_PARENT_ID:J

.field private final RESOURCE_SMART_EFFECT_PARENT_ID:J

.field private final RESOURCE_TEXT_PARENT_ID:J

.field private mModuleFactory:Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;


# direct methods
.method public constructor <init>(ILcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/net/VideoEditorBaseResourceRequest;-><init>(I)V

    const-wide v0, 0x21c652595e00c0L

    iput-wide v0, p0, Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;->RESOURCE_SMART_EFFECT_PARENT_ID:J

    const-wide v0, 0x21c6baa0e20020L

    iput-wide v0, p0, Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;->RESOURCE_AUDIO_PARENT_ID:J

    const-wide v0, 0x21a3b76ff200a0L

    iput-wide v0, p0, Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;->RESOURCE_TEXT_PARENT_ID:J

    iput-object p2, p0, Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;->mModuleFactory:Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;

    return-void
.end method


# virtual methods
.method protected getParentId()J
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;->type:I

    const v1, 0x7f09032c

    if-eq v0, v1, :cond_2

    const v1, 0x7f090338

    if-eq v0, v1, :cond_1

    const v1, 0x7f090341

    if-eq v0, v1, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    const-wide v0, 0x21a3b76ff200a0L

    goto :goto_0

    :cond_1
    const-wide v0, 0x21c652595e00c0L

    goto :goto_0

    :cond_2
    const-wide v0, 0x21c6baa0e20020L

    :goto_0
    return-wide v0
.end method

.method protected newLocalResource()Lcom/miui/gallery/video/editor/model/LocalResource;
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;->type:I

    const v1, 0x7f090338

    if-ne v0, v1, :cond_0

    new-instance v0, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;->mModuleFactory:Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;

    invoke-direct {v0, v1}, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;-><init>(Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;)V

    return-object v0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;->type:I

    const v1, 0x7f090341

    if-ne v0, v1, :cond_1

    new-instance v0, Lcom/miui/gallery/video/editor/model/WaterMarkLocalResource;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;->mModuleFactory:Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;

    invoke-direct {v0, v1}, Lcom/miui/gallery/video/editor/model/WaterMarkLocalResource;-><init>(Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;)V

    return-object v0

    :cond_1
    new-instance v0, Lcom/miui/gallery/video/editor/model/VideoEditorBaseLocalResource;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;->mModuleFactory:Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;

    invoke-direct {v0, v1}, Lcom/miui/gallery/video/editor/model/VideoEditorBaseLocalResource;-><init>(Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;)V

    return-object v0
.end method

.method protected setResult(Lcom/miui/gallery/video/editor/model/LocalResource;)V
    .locals 9

    instance-of v0, p1, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    iget-object v2, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->extra:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "assetid"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "update"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "assetName"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "longTime"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "shortTime"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "hasSpeedChange"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "enName"

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->getTrimedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;->assetId:Ljava/lang/String;

    invoke-static {v3}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->getTrimedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;->update:Ljava/lang/String;

    invoke-static {v4}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->getTrimedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;->assetName:Ljava/lang/String;

    invoke-static {v5}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->getTrimedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;->longTime:Ljava/lang/String;

    invoke-static {v6}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->getTrimedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;->shortTime:Ljava/lang/String;

    invoke-static {v7}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->getTrimedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;->hasSpeedChange:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->getTrimedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;->enName:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_0
    :goto_0
    instance-of v0, p1, Lcom/miui/gallery/video/editor/model/WaterMarkLocalResource;

    if-eqz v0, :cond_4

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/video/editor/model/WaterMarkLocalResource;

    :try_start_1
    new-instance v1, Lorg/json/JSONObject;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->extra:Ljava/lang/String;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "assetid"

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v2, "update"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "assetName"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "cn"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string p1, ""

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    :goto_1
    iput-object p1, v0, Lcom/miui/gallery/video/editor/model/WaterMarkLocalResource;->assetId:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, ""

    goto :goto_2

    :cond_2
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    :goto_2
    iput-object p1, v0, Lcom/miui/gallery/video/editor/model/WaterMarkLocalResource;->update:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, ""

    goto :goto_3

    :cond_3
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    :goto_3
    iput-object p1, v0, Lcom/miui/gallery/video/editor/model/WaterMarkLocalResource;->assetName:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->getTrimedString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->parseIntFromStr(Ljava/lang/String;)I

    move-result p1

    iput p1, v0, Lcom/miui/gallery/video/editor/model/WaterMarkLocalResource;->isInternational:I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :cond_4
    :goto_4
    return-void
.end method
