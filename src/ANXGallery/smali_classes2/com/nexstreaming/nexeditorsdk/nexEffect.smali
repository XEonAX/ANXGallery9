.class public abstract Lcom/nexstreaming/nexeditorsdk/nexEffect;
.super Ljava/lang/Object;
.source "nexEffect.java"


# static fields
.field public static final kEFFECT_CLIP_AUTO:I = 0x1

.field public static final kEFFECT_CLIP_USER:I = 0x2

.field public static final kEFFECT_NONE:I = 0x0

.field public static final kEFFECT_OVERLAY_FILTER:I = 0x5

.field public static final kEFFECT_TRANSITION_AUTO:I = 0x3

.field public static final kEFFECT_TRANSITION_USER:I = 0x4

.field private static final kMaxStringTrackCount:I = 0x8


# instance fields
.field itemMethodType:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

.field mAutoID:Ljava/lang/String;

.field mDuration:I

.field mID:Ljava/lang/String;

.field mIsResolveOptions:Z

.field mName:Ljava/lang/String;

.field private mObserver:Lcom/nexstreaming/nexeditorsdk/b;

.field mOptionsUpdate:Z

.field private mTitles:[Ljava/lang/String;

.field mType:I

.field mUpdated:Z

.field m_effectOptions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mType:I

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;->ItemExtra:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->itemMethodType:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mTitles:[Ljava/lang/String;

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mIsResolveOptions:Z

    return-void
.end method

.method private static encodeEffectOptions(Ljava/lang/StringBuilder;Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;)V
    .locals 7

    :try_start_0
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->getEffectID()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Landroid/content/Context;Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/h;

    move-result-object v0
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    :goto_0
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_d

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/h;->a()Ljava/util/List;

    move-result-object v0

    :try_start_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x1

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    goto :goto_2

    :cond_1
    const/16 v3, 0x26

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_2
    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    move-result-object v3

    sget-object v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->TEXT:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    if-ne v3, v4, :cond_3

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->getTextOptions()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->e()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;->getText()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;->getId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;->getText()Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    :cond_3
    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    move-result-object v3

    sget-object v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->RGBA:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    if-eq v3, v4, :cond_b

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    move-result-object v3

    sget-object v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->RGB:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    if-ne v3, v4, :cond_4

    goto/16 :goto_7

    :cond_4
    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    move-result-object v3

    sget-object v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->CHOICE:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    if-ne v3, v4, :cond_6

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->getSelectOptions()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_5
    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->e()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_5

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;->getId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;->getSelectValue()Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    :cond_6
    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    move-result-object v3

    sget-object v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->RANGE:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    if-ne v3, v4, :cond_8

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->getRangeOptions()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_7
    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->e()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_7

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->getId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->getValue()I

    move-result v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5

    :cond_8
    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    move-result-object v3

    sget-object v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->SWITCH:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    if-ne v3, v4, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->getSwitchOptions()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_9
    :goto_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->e()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_9

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;->getId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;->getValue()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->d()Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_6

    :cond_a
    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->c()Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_6

    :cond_b
    :goto_7
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->getColorOptions()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_c
    :goto_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->e()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_c

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;->getId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;->getARGBformat()I

    move-result v4

    invoke-static {v4}, Lcom/nexstreaming/app/common/util/c;->a(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_8

    :catch_2
    move-exception p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :cond_d
    return-void
.end method

.method public static getTitleOptions(Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;)Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mEffectType:I

    const/4 v2, 0x5

    if-ne v1, v2, :cond_0

    invoke-static {v0, p0}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->encodeEffectOptions(Ljava/lang/StringBuilder;Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v1, 0x2710

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mEffectType:I

    const/4 v3, 0x4

    if-eq v2, v3, :cond_1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mEffectType:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_2

    :cond_1
    invoke-static {v0, p0}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->encodeEffectOptions(Ljava/lang/StringBuilder;Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;)V

    :cond_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mEffectType:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_3

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mEffectType:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_4

    :cond_3
    invoke-static {v0, p0}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->encodeEffectOptions(Ljava/lang/StringBuilder;Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;)V

    :cond_4
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private isAllEmptyTitle()Z
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mTitles:[Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    const/16 v3, 0x8

    if-ge v2, v3, :cond_2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mTitles:[Ljava/lang/String;

    aget-object v3, v3, v2

    if-eqz v3, :cond_1

    return v0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method private resetOptions()V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    :cond_0
    return-void
.end method


# virtual methods
.method public getDuration()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mDuration:I

    return v0
.end method

.method getEffectOptions(Ljava/lang/String;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mType:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    :cond_2
    if-nez p1, :cond_3

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->isAllEmptyTitle()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    return-object p1

    :cond_3
    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/i;->a(Landroid/content/Context;Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/h;

    move-result-object v1
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v1

    invoke-virtual {v1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    :goto_0
    if-eqz v0, :cond_7

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/h;->a()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    move-result-object v3

    sget-object v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;->TEXT:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemParameterType;

    if-ne v3, v4, :cond_4

    if-eqz p1, :cond_5

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->e()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_5
    invoke-virtual {p0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->getTitle(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_6

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/g;->e()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->getTitle(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_7
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    return-object p1
.end method

.method public getId()Ljava/lang/String;
    .locals 3

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mType:I

    if-nez v0, :cond_0

    const-string v0, "none"

    return-object v0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mType:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mID:Ljava/lang/String;

    if-nez v0, :cond_2

    const-string v0, "nexEffect"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mType="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " mID=null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "none"

    return-object v0

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mID:Ljava/lang/String;

    return-object v0

    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mAutoID:Ljava/lang/String;

    if-nez v0, :cond_4

    const-string v0, "nexEffect"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mType="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " mAutoID=null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "none"

    return-object v0

    :cond_4
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mAutoID:Ljava/lang/String;

    return-object v0
.end method

.method public getMethodType()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->itemMethodType:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;->ItemExtra:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mID:Ljava/lang/String;

    const-string v1, "none"

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;->ItemKedl:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->itemMethodType:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getType()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getMethodType(Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;)Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->itemMethodType:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->itemMethodType:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    return-object v0
.end method

.method public getTitle(I)Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mTitles:[Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    const/16 v0, 0x8

    if-ge p1, v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mTitles:[Ljava/lang/String;

    aget-object p1, v0, p1

    return-object p1

    :cond_1
    return-object v1
.end method

.method getTitleCount()I
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mTitles:[Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mTitles:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_2

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mTitles:[Ljava/lang/String;

    aget-object v2, v2, v1

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mTitles:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    add-int/lit8 v0, v0, 0x1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method getTitles()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mTitles:[Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mType:I

    return v0
.end method

.method isValidId(Ljava/lang/String;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public setDuration(I)V
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mDuration:I

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mUpdated:Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->setModified(Z)V

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mDuration:I

    return-void
.end method

.method setEffect(Ljava/lang/String;I)Z
    .locals 1

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mType:I

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mID:Ljava/lang/String;

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mID:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p2

    if-nez p2, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->isValidId(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mUpdated:Z

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mID:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mOptionsUpdate:Z

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->resetOptions()V

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mIsResolveOptions:Z

    return p2

    :cond_1
    return v0
.end method

.method public setEffectNone()V
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mType:I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mUpdated:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mOptionsUpdate:Z

    invoke-virtual {p0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->setModified(Z)V

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->resetOptions()V

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mIsResolveOptions:Z

    :cond_0
    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mType:I

    return-void
.end method

.method setModified(Z)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mObserver:Lcom/nexstreaming/nexeditorsdk/b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mObserver:Lcom/nexstreaming/nexeditorsdk/b;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/b;->updateTimeLine(Z)V

    :cond_0
    return-void
.end method

.method setObserver(Lcom/nexstreaming/nexeditorsdk/b;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mObserver:Lcom/nexstreaming/nexeditorsdk/b;

    return-void
.end method

.method public setTitle(ILjava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mTitles:[Ljava/lang/String;

    const/16 v1, 0x8

    if-nez v0, :cond_0

    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mTitles:[Ljava/lang/String;

    :cond_0
    if-ge p1, v1, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mTitles:[Ljava/lang/String;

    aput-object p2, v0, p1

    :cond_1
    return-void
.end method

.method public updateEffectOptions(Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;Z)Z
    .locals 8

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    :cond_0
    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->mEffectID:Ljava/lang/String;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_13

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mOptionsUpdate:Z

    if-eqz p2, :cond_1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    :cond_1
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->getTextOptions()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_4

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;

    if-eqz p2, :cond_2

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;->getText()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v3, v5}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->setTitle(ILjava/lang/String;)V

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->getTitle(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    invoke-virtual {p0, v3}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->getTitle(I)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    invoke-virtual {p0, v3}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->getTitle(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$TextOpt;->setText(Ljava/lang/String;)V

    :cond_3
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->getColorOptions()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_7

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;

    if-eqz p2, :cond_6

    iget v4, v3, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;->default_argb_color:I

    iget v5, v3, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;->argb_color:I

    if-eq v4, v5, :cond_5

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;->getARGBformat()I

    move-result v3

    invoke-static {v3}, Lcom/nexstreaming/app/common/util/c;->a(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_6
    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_5

    invoke-static {v4}, Lcom/nexstreaming/app/common/util/c;->a(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$ColorOpt;->argb_color:I

    goto :goto_2

    :cond_7
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->getSelectOptions()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_a

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_8
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;

    if-eqz p2, :cond_9

    iget v4, v3, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;->default_select_index:I

    iget v5, v3, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;->select_index:I

    if-eq v4, v5, :cond_8

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;->getSelectValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    :cond_9
    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_8

    invoke-virtual {v3, v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SelectOpt;->setValue(Ljava/lang/String;)I

    goto :goto_3

    :cond_a
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->getRangeOptions()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_d

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;

    if-eqz p2, :cond_c

    iget v4, v3, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->default_value:I

    iget v5, v3, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->mValue:I

    if-eq v4, v5, :cond_b

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->getId()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->getValue()I

    move-result v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    :cond_c
    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$RangeOpt;->setValue(I)V

    goto :goto_4

    :cond_d
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->getSwitchOptions()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_12

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_e
    :goto_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_12

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;

    if-eqz p2, :cond_10

    iget-boolean v3, v2, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;->default_on:Z

    iget-boolean v4, v2, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;->on:Z

    if-eq v3, v4, :cond_e

    iget-boolean v3, v2, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;->on:Z

    if-eqz v3, :cond_f

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;->getId()Ljava/lang/String;

    move-result-object v2

    const-string v4, "on"

    invoke-virtual {v3, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5

    :cond_f
    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;->getId()Ljava/lang/String;

    move-result-object v2

    const-string v4, "off"

    invoke-virtual {v3, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5

    :cond_10
    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->m_effectOptions:Ljava/util/HashMap;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "on"

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_11

    invoke-virtual {v2, v0}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;->setValue(Z)V

    goto :goto_5

    :cond_11
    invoke-virtual {v2, v1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions$SwitchOpt;->setValue(Z)V

    goto :goto_5

    :cond_12
    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEffect;->mIsResolveOptions:Z

    return v0

    :cond_13
    return v1
.end method
