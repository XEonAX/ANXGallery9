.class final enum Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;
.super Ljava/lang/Enum;
.source "Crop.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "GuideLine"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

.field public static final enum CROP:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

.field public static final enum PREVIEW:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

.field public static final enum ROTATE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;


# instance fields
.field mCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    const-string v1, "PREVIEW"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->PREVIEW:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    const-string v1, "CROP"

    const/4 v3, 0x3

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->CROP:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    const-string v1, "ROTATE"

    const/4 v5, 0x2

    const/16 v6, 0x9

    invoke-direct {v0, v1, v5, v6}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->ROTATE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    new-array v0, v3, [Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->PREVIEW:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->CROP:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->ROTATE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    aput-object v1, v0, v5

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->$VALUES:[Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->mCount:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;
    .locals 1

    const-class v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->$VALUES:[Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    invoke-virtual {v0}, [Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    return-object v0
.end method
