.class public final enum Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;
.super Ljava/lang/Enum;
.source "MosaicEntity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TYPE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

.field public static final enum BITMAP:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

.field public static final enum BLUR:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

.field public static final enum NORMAL:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

.field public static final enum ORIGIN:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

.field public static final enum TRIANGLE:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

.field public static final enum TRIANGLE_RECT:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    const-string v1, "ORIGIN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->ORIGIN:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    const-string v1, "NORMAL"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->NORMAL:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    const-string v1, "TRIANGLE"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->TRIANGLE:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    const-string v1, "TRIANGLE_RECT"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->TRIANGLE_RECT:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    const-string v1, "BLUR"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->BLUR:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    const-string v1, "BITMAP"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->BITMAP:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->ORIGIN:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->NORMAL:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->TRIANGLE:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->TRIANGLE_RECT:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->BLUR:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    aput-object v1, v0, v6

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->BITMAP:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    aput-object v1, v0, v7

    sput-object v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->$VALUES:[Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;
    .locals 1

    const-class v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->$VALUES:[Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    invoke-virtual {v0}, [Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    return-object v0
.end method
