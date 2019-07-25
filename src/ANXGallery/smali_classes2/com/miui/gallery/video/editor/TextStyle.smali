.class public Lcom/miui/gallery/video/editor/TextStyle;
.super Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;
.source "TextStyle.java"


# instance fields
.field private mAssetId:I

.field private mAssetName:Ljava/lang/String;

.field private mIconResId:I

.field private mTemplateId:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;-><init>()V

    iput p1, p0, Lcom/miui/gallery/video/editor/TextStyle;->mIconResId:I

    iput-object p2, p0, Lcom/miui/gallery/video/editor/TextStyle;->mType:Ljava/lang/String;

    const-string p1, "ve_type_extra"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/TextStyle;->mExtra:Z

    iget-boolean p1, p0, Lcom/miui/gallery/video/editor/TextStyle;->mExtra:Z

    if-nez p1, :cond_0

    const/16 p1, 0x11

    iput p1, p0, Lcom/miui/gallery/video/editor/TextStyle;->mDownloadState:I

    :cond_0
    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/video/editor/model/LocalResource;)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;-><init>()V

    if-eqz p1, :cond_2

    iget-wide v0, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->id:J

    iput-wide v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mID:J

    iget-object v0, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->nameKey:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mNameKey:Ljava/lang/String;

    iget-object v0, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->label:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mLabel:Ljava/lang/String;

    iget v0, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->imageId:I

    iput v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mIconResId:I

    iget-object v0, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->icon:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mIconUrl:Ljava/lang/String;

    iget-object v0, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->type:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mType:Ljava/lang/String;

    const-string v0, "ve_type_extra"

    iget-object v1, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mExtra:Z

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mExtra:Z

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mIsTemplate:Z

    instance-of v0, p1, Lcom/miui/gallery/video/editor/model/WaterMarkLocalResource;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/video/editor/model/WaterMarkLocalResource;

    iget-object v1, v0, Lcom/miui/gallery/video/editor/model/WaterMarkLocalResource;->assetId:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->parseIntFromStr(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/video/editor/TextStyle;->mAssetId:I

    iget-object v0, v0, Lcom/miui/gallery/video/editor/model/WaterMarkLocalResource;->assetName:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mAssetName:Ljava/lang/String;

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mExtra:Z

    if-nez v0, :cond_1

    const/16 v0, 0x11

    iput v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mDownloadState:I

    :cond_1
    iget-object p1, p1, Lcom/miui/gallery/video/editor/model/LocalResource;->label:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/TextStyle;->mLabel:Ljava/lang/String;

    :cond_2
    return-void
.end method


# virtual methods
.method public getAssetId()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mAssetId:I

    return v0
.end method

.method public getAssetName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mAssetName:Ljava/lang/String;

    return-object v0
.end method

.method public getIconResId()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mIconResId:I

    return v0
.end method

.method public getTemplateId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/TextStyle;->mTemplateId:Ljava/lang/String;

    return-object v0
.end method

.method public setTemplateId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/TextStyle;->mTemplateId:Ljava/lang/String;

    return-void
.end method
