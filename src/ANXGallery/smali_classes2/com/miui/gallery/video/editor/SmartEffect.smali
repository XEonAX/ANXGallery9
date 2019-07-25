.class public Lcom/miui/gallery/video/editor/SmartEffect;
.super Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;
.source "SmartEffect.java"


# static fields
.field private static smartEffectNames:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final TAG:Ljava/lang/String;

.field private mAssetId:I

.field private mAssetName:Ljava/lang/String;

.field private mEnName:Ljava/lang/String;

.field private mHasSpeedChange:Z

.field private mIconResId:I

.field private mLongTime:I

.field private mNameResid:I

.field private mShortTime:I

.field private mTemplate:Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/video/editor/SmartEffect$1;

    invoke-direct {v0}, Lcom/miui/gallery/video/editor/SmartEffect$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/video/editor/SmartEffect;->smartEffectNames:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/video/editor/model/LocalResource;)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;-><init>()V

    const-string v0, "SmartEffect"

    iput-object v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->TAG:Ljava/lang/String;

    if-eqz p1, :cond_3

    iget-wide v0, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->id:J

    iput-wide v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mID:J

    iget-object v0, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->nameKey:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mNameKey:Ljava/lang/String;

    iget-object v0, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->label:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mLabel:Ljava/lang/String;

    iget v0, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->imageId:I

    iput v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mIconResId:I

    iget-object v0, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->icon:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mIconUrl:Ljava/lang/String;

    iget-object v0, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->type:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mType:Ljava/lang/String;

    const-string v0, "ve_type_extra"

    iget-object v1, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mExtra:Z

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mExtra:Z

    if-nez v0, :cond_0

    const/16 v0, 0x11

    iput v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mDownloadState:I

    :cond_0
    instance-of v0, p1, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;

    if-eqz v0, :cond_2

    check-cast p1, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;

    iget-object v0, p1, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;->assetId:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->parseIntFromStr(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mAssetId:I

    iget-object v0, p1, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;->assetName:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mAssetName:Ljava/lang/String;

    iget-object v0, p1, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;->enName:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mEnName:Ljava/lang/String;

    iget-object v0, p1, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;->longTime:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->parseIntFromStr(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mLongTime:I

    iget-object v0, p1, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;->shortTime:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->parseIntFromStr(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mShortTime:I

    iget-object p1, p1, Lcom/miui/gallery/video/editor/model/SmartEffectLocalResource;->hasSpeedChange:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->parseIntFromStr(Ljava/lang/String;)I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mHasSpeedChange:Z

    :cond_2
    iget-boolean p1, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mExtra:Z

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mIsTemplate:Z

    :cond_3
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;-><init>()V

    const-string p4, "SmartEffect"

    iput-object p4, p0, Lcom/miui/gallery/video/editor/SmartEffect;->TAG:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mNameKey:Ljava/lang/String;

    iput p2, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mIconResId:I

    iput-object p3, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mType:Ljava/lang/String;

    const-string p1, "ve_type_extra"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mExtra:Z

    iget-boolean p1, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mExtra:Z

    if-nez p1, :cond_0

    const/16 p1, 0x11

    iput p1, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mDownloadState:I

    :cond_0
    return-void
.end method


# virtual methods
.method public getAssetId()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mAssetId:I

    return v0
.end method

.method public getAssetName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mAssetName:Ljava/lang/String;

    return-object v0
.end method

.method public getEnName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mEnName:Ljava/lang/String;

    return-object v0
.end method

.method public getIconResId()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mIconResId:I

    return v0
.end method

.method public getLongTime()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mLongTime:I

    return v0
.end method

.method public getNameResId()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mNameResid:I

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/video/editor/SmartEffect;->smartEffectNames:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/video/editor/SmartEffect;->smartEffectNames:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mNameKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/video/editor/SmartEffect;->smartEffectNames:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mNameKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mNameResid:I

    :cond_0
    iget v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mNameResid:I

    return v0
.end method

.method public getShortTime()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mShortTime:I

    return v0
.end method

.method public getTemplate()Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mTemplate:Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;

    return-object v0
.end method

.method public isHasSpeedChange()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mHasSpeedChange:Z

    return v0
.end method

.method public isLimitFourtySeconds()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mLongTime:I

    const v1, 0x9c40

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isLimitSixtySeconds()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mLongTime:I

    const v1, 0xea60

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setTemplate(Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/SmartEffect;->mTemplate:Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;

    return-void
.end method
