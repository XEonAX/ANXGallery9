.class public final Lcom/nexstreaming/nexeditorsdk/nexClipEffect;
.super Lcom/nexstreaming/nexeditorsdk/nexEffect;
.source "nexClipEffect.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private mShowEndTime:I

.field private mShowStartTime:I


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEffect;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowStartTime:I

    const/16 v0, 0x2710

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowEndTime:I

    const/4 v0, 0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mType:I

    return-void
.end method

.method constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;)V
    .locals 1

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEffect;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowStartTime:I

    const/16 v0, 0x2710

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowEndTime:I

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mID:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mID:Ljava/lang/String;

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mAutoID:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mAutoID:Ljava/lang/String;

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mName:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mName:Ljava/lang/String;

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mType:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mType:I

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mDuration:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mDuration:I

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->itemMethodType:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->itemMethodType:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    iget-boolean v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mIsResolveOptions:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mIsResolveOptions:Z

    iget-boolean v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mOptionsUpdate:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mOptionsUpdate:Z

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->m_effectOptions:Ljava/util/HashMap;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->m_effectOptions:Ljava/util/HashMap;

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mShowStartTime:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowStartTime:I

    iget p1, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mShowEndTime:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowEndTime:I

    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEffect;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowStartTime:I

    const/16 v0, 0x2710

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowEndTime:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mID:Ljava/lang/String;

    const/4 p1, 0x2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mType:I

    return-void
.end method

.method protected static clone(Lcom/nexstreaming/nexeditorsdk/nexClipEffect;)Lcom/nexstreaming/nexeditorsdk/nexClipEffect;
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowEndTime:I

    iput v0, v1, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowEndTime:I

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowStartTime:I

    iput p0, v1, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowStartTime:I
    :try_end_1
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    move-object v1, v0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    :goto_1
    return-object v1
.end method


# virtual methods
.method public getCategoryTitle(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mType:I

    if-nez p1, :cond_0

    const-string p1, "None"

    return-object p1

    :cond_0
    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mType:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    const-string p1, "Theme"

    return-object p1

    :cond_1
    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object p1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mID:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-interface {p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getCategory()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public getDesc(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mType:I

    if-nez v0, :cond_0

    const-string p1, "None Clip Effect"

    return-object p1

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    const-string p1, "Theme Clip Effect"

    return-object p1

    :cond_1
    const/4 v0, 0x0

    if-nez p1, :cond_2

    return-object v0

    :cond_2
    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object p1

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mID:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-interface {p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getLabel()Ljava/util/Map;

    move-result-object p1

    const-string v0, "en"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    :cond_3
    return-object v0
.end method

.method public getIcon()Landroid/graphics/Bitmap;
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mID:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/e;->a(Landroid/content/Context;Lcom/nexstreaming/app/common/nexasset/assetpackage/f;II)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getName(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mType:I

    if-nez v0, :cond_0

    const-string p1, "None Clip Effect"

    return-object p1

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    const-string p1, "Theme Clip Effect"

    return-object p1

    :cond_1
    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v0

    if-eqz v0, :cond_3

    if-eqz p1, :cond_2

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getLabel()Ljava/util/Map;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/nexstreaming/app/common/util/n;->a(Landroid/content/Context;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mName:Ljava/lang/String;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mName:Ljava/lang/String;

    if-nez p1, :cond_3

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getLabel()Ljava/util/Map;

    move-result-object p1

    const-string v0, "en"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mName:Ljava/lang/String;

    goto :goto_0

    :cond_2
    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getLabel()Ljava/util/Map;

    move-result-object p1

    const-string v0, "en"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mName:Ljava/lang/String;

    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mName:Ljava/lang/String;

    return-object p1
.end method

.method getSaveData()Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;
    .locals 2

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;-><init>()V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mID:Ljava/lang/String;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mID:Ljava/lang/String;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mAutoID:Ljava/lang/String;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mAutoID:Ljava/lang/String;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mName:Ljava/lang/String;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mName:Ljava/lang/String;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mType:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mType:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mDuration:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mDuration:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->itemMethodType:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->itemMethodType:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    iget-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mIsResolveOptions:Z

    iput-boolean v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mIsResolveOptions:Z

    iget-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mOptionsUpdate:Z

    iput-boolean v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mOptionsUpdate:Z

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->m_effectOptions:Ljava/util/HashMap;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->m_effectOptions:Ljava/util/HashMap;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowStartTime:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mShowStartTime:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowEndTime:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mShowEndTime:I

    const/4 v1, 0x0

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mMinDuration:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mMaxDuration:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mEffectOffset:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mEffectOverlap:I

    return-object v0
.end method

.method public getShowEndTime()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowEndTime:I

    return v0
.end method

.method public getShowStartTime()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowStartTime:I

    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->getTitle(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setAutoTheme()V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mType:I

    return-void
.end method

.method public setEffect(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x2

    invoke-super {p0, p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->setEffect(Ljava/lang/String;I)Z

    return-void
.end method

.method public setEffectShowTime(II)V
    .locals 1

    if-lt p2, p1, :cond_0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowStartTime:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowEndTime:I

    return-void

    :cond_0
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    invoke-direct {v0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(II)V

    throw v0
.end method

.method public setShowEndTime(I)V
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowStartTime:I

    if-gt v0, p1, :cond_0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowEndTime:I

    return-void

    :cond_0
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowStartTime:I

    invoke-direct {v0, v1, p1}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(II)V

    throw v0
.end method

.method public setShowStartTime(I)V
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowEndTime:I

    if-lt v0, p1, :cond_0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowStartTime:I

    return-void

    :cond_0
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mShowEndTime:I

    invoke-direct {v0, p1, v1}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(II)V

    throw v0
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->mUpdated:Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->setTitle(ILjava/lang/String;)V

    return-void
.end method
