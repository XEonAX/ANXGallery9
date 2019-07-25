.class public Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;
.super Ljava/lang/Object;
.source "Crop.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AspectRatio"
.end annotation


# static fields
.field private static final RATIO_NONE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;


# instance fields
.field private mHeight:F

.field private mWidth:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;-><init>(FF)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->RATIO_NONE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    return-void
.end method

.method constructor <init>(FF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->mWidth:F

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->mHeight:F

    return-void
.end method

.method static synthetic access$000()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->RATIO_NONE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    return-object v0
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->mWidth:F

    return p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->mHeight:F

    return p0
.end method


# virtual methods
.method public getHeight(F)F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->mWidth:F

    div-float/2addr p1, v0

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->mHeight:F

    mul-float p1, p1, v0

    return p1
.end method

.method public getWidth(F)F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->mHeight:F

    div-float/2addr p1, v0

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->mWidth:F

    mul-float p1, p1, v0

    return p1
.end method
