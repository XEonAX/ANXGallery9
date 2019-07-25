.class public final enum Lcom/miui/gallery/collage/render/CollageMargin;
.super Ljava/lang/Enum;
.source "CollageMargin.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/collage/render/CollageMargin;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/collage/render/CollageMargin;

.field public static final enum LARGE:Lcom/miui/gallery/collage/render/CollageMargin;

.field public static final enum MEDIUM:Lcom/miui/gallery/collage/render/CollageMargin;

.field public static final enum NONE:Lcom/miui/gallery/collage/render/CollageMargin;

.field public static final enum SMALL:Lcom/miui/gallery/collage/render/CollageMargin;


# instance fields
.field public final iconRes:I

.field public final marginSize:F


# direct methods
.method static constructor <clinit>()V
    .locals 8

    new-instance v0, Lcom/miui/gallery/collage/render/CollageMargin;

    const-string v1, "NONE"

    const/4 v2, 0x0

    const v3, 0x7f070094

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/miui/gallery/collage/render/CollageMargin;-><init>(Ljava/lang/String;IIF)V

    sput-object v0, Lcom/miui/gallery/collage/render/CollageMargin;->NONE:Lcom/miui/gallery/collage/render/CollageMargin;

    new-instance v0, Lcom/miui/gallery/collage/render/CollageMargin;

    const-string v1, "SMALL"

    const/4 v3, 0x1

    const v4, 0x7f07009d

    const v5, 0x3f8ba5e3    # 1.091f

    invoke-direct {v0, v1, v3, v4, v5}, Lcom/miui/gallery/collage/render/CollageMargin;-><init>(Ljava/lang/String;IIF)V

    sput-object v0, Lcom/miui/gallery/collage/render/CollageMargin;->SMALL:Lcom/miui/gallery/collage/render/CollageMargin;

    new-instance v0, Lcom/miui/gallery/collage/render/CollageMargin;

    const-string v1, "MEDIUM"

    const/4 v4, 0x2

    const v5, 0x7f07009a

    const v6, 0x3fe8b439    # 1.818f

    invoke-direct {v0, v1, v4, v5, v6}, Lcom/miui/gallery/collage/render/CollageMargin;-><init>(Ljava/lang/String;IIF)V

    sput-object v0, Lcom/miui/gallery/collage/render/CollageMargin;->MEDIUM:Lcom/miui/gallery/collage/render/CollageMargin;

    new-instance v0, Lcom/miui/gallery/collage/render/CollageMargin;

    const-string v1, "LARGE"

    const/4 v5, 0x3

    const v6, 0x7f070097

    const v7, 0x4022e148    # 2.545f

    invoke-direct {v0, v1, v5, v6, v7}, Lcom/miui/gallery/collage/render/CollageMargin;-><init>(Ljava/lang/String;IIF)V

    sput-object v0, Lcom/miui/gallery/collage/render/CollageMargin;->LARGE:Lcom/miui/gallery/collage/render/CollageMargin;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/miui/gallery/collage/render/CollageMargin;

    sget-object v1, Lcom/miui/gallery/collage/render/CollageMargin;->NONE:Lcom/miui/gallery/collage/render/CollageMargin;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/collage/render/CollageMargin;->SMALL:Lcom/miui/gallery/collage/render/CollageMargin;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/collage/render/CollageMargin;->MEDIUM:Lcom/miui/gallery/collage/render/CollageMargin;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/collage/render/CollageMargin;->LARGE:Lcom/miui/gallery/collage/render/CollageMargin;

    aput-object v1, v0, v5

    sput-object v0, Lcom/miui/gallery/collage/render/CollageMargin;->$VALUES:[Lcom/miui/gallery/collage/render/CollageMargin;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IF)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/miui/gallery/collage/render/CollageMargin;->iconRes:I

    iput p4, p0, Lcom/miui/gallery/collage/render/CollageMargin;->marginSize:F

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/collage/render/CollageMargin;
    .locals 1

    const-class v0, Lcom/miui/gallery/collage/render/CollageMargin;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/collage/render/CollageMargin;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/collage/render/CollageMargin;
    .locals 1

    sget-object v0, Lcom/miui/gallery/collage/render/CollageMargin;->$VALUES:[Lcom/miui/gallery/collage/render/CollageMargin;

    invoke-virtual {v0}, [Lcom/miui/gallery/collage/render/CollageMargin;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/collage/render/CollageMargin;

    return-object v0
.end method
