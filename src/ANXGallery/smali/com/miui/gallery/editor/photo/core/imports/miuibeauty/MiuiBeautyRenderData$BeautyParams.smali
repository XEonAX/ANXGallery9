.class public Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData$BeautyParams;
.super Ljava/lang/Object;
.source "MiuiBeautyRenderData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BeautyParams"
.end annotation


# instance fields
.field public mBrightEyeRatio:I

.field public mDeblemish:I

.field public mDepouchRatio:I

.field public mEyeLarge:I

.field public mFaceThin:I

.field public mIrisShineRatio:I

.field public mLipBeautyRatio:I

.field public mNoseThin:I

.field public mRelightingRatio:I

.field public mRuddyRatio:I

.field public mSmooth:I

.field public mWhite:I

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/miui/filtersdk/beauty/BeautyParameterType;",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData$BeautyParams;->this$0:Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Map$Entry;

    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData$1;->$SwitchMap$com$miui$filtersdk$beauty$BeautyParameterType:[I

    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-virtual {p2}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result p2

    aget p2, v1, p2

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData$BeautyParams;->mNoseThin:I

    goto :goto_0

    :pswitch_1
    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData$BeautyParams;->mIrisShineRatio:I

    goto :goto_0

    :pswitch_2
    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData$BeautyParams;->mLipBeautyRatio:I

    goto :goto_0

    :pswitch_3
    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData$BeautyParams;->mRelightingRatio:I

    goto :goto_0

    :pswitch_4
    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData$BeautyParams;->mDepouchRatio:I

    goto :goto_0

    :pswitch_5
    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData$BeautyParams;->mDeblemish:I

    goto :goto_0

    :pswitch_6
    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData$BeautyParams;->mBrightEyeRatio:I

    goto :goto_0

    :pswitch_7
    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData$BeautyParams;->mRuddyRatio:I

    goto :goto_0

    :pswitch_8
    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData$BeautyParams;->mSmooth:I

    goto :goto_0

    :pswitch_9
    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData$BeautyParams;->mWhite:I

    goto :goto_0

    :pswitch_a
    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData$BeautyParams;->mFaceThin:I

    goto :goto_0

    :pswitch_b
    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderData$BeautyParams;->mEyeLarge:I

    goto :goto_0

    :cond_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
