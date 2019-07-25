.class public abstract Lcom/miui/gallery/editor/photo/core/common/model/CropData;
.super Lcom/miui/gallery/editor/photo/core/Metadata;
.source "CropData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;
    }
.end annotation


# static fields
.field public static MIRROR:Lcom/miui/gallery/editor/photo/core/common/model/CropData;

.field public static ROTATE:Lcom/miui/gallery/editor/photo/core/common/model/CropData;


# instance fields
.field public final icon:I

.field public final talkbackName:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/miui/gallery/editor/photo/core/common/model/CropData$1;

    const-string v1, "rotate"

    const/4 v2, -0x1

    const v3, 0x7f0700cb

    const v4, 0x7f10054e

    invoke-direct {v0, v2, v1, v3, v4}, Lcom/miui/gallery/editor/photo/core/common/model/CropData$1;-><init>(SLjava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/common/model/CropData;->ROTATE:Lcom/miui/gallery/editor/photo/core/common/model/CropData;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/common/model/CropData$2;

    const-string v1, "mirror"

    const/4 v2, -0x2

    const v3, 0x7f0700c9

    const v4, 0x7f10054c

    invoke-direct {v0, v2, v1, v3, v4}, Lcom/miui/gallery/editor/photo/core/common/model/CropData$2;-><init>(SLjava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/common/model/CropData;->MIRROR:Lcom/miui/gallery/editor/photo/core/common/model/CropData;

    return-void
.end method

.method constructor <init>(SLjava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/Metadata;-><init>(SLjava/lang/String;)V

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/common/model/CropData;->icon:I

    iput p4, p0, Lcom/miui/gallery/editor/photo/core/common/model/CropData;->talkbackName:I

    return-void
.end method
