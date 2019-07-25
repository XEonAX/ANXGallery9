.class public final enum Lcom/miui/gallery/collage/core/Effect;
.super Ljava/lang/Enum;
.source "Effect.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/collage/core/Effect;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/collage/core/Effect;

.field public static final enum LAYOUT:Lcom/miui/gallery/collage/core/Effect;

.field public static final enum POSTER:Lcom/miui/gallery/collage/core/Effect;

.field public static final enum STITCHING:Lcom/miui/gallery/collage/core/Effect;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/miui/gallery/collage/core/Effect;

    const-string v1, "POSTER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/collage/core/Effect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/collage/core/Effect;->POSTER:Lcom/miui/gallery/collage/core/Effect;

    new-instance v0, Lcom/miui/gallery/collage/core/Effect;

    const-string v1, "LAYOUT"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/collage/core/Effect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/collage/core/Effect;->LAYOUT:Lcom/miui/gallery/collage/core/Effect;

    new-instance v0, Lcom/miui/gallery/collage/core/Effect;

    const-string v1, "STITCHING"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/miui/gallery/collage/core/Effect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/collage/core/Effect;->STITCHING:Lcom/miui/gallery/collage/core/Effect;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/miui/gallery/collage/core/Effect;

    sget-object v1, Lcom/miui/gallery/collage/core/Effect;->POSTER:Lcom/miui/gallery/collage/core/Effect;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/collage/core/Effect;->LAYOUT:Lcom/miui/gallery/collage/core/Effect;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/collage/core/Effect;->STITCHING:Lcom/miui/gallery/collage/core/Effect;

    aput-object v1, v0, v4

    sput-object v0, Lcom/miui/gallery/collage/core/Effect;->$VALUES:[Lcom/miui/gallery/collage/core/Effect;

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

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/collage/core/Effect;
    .locals 1

    const-class v0, Lcom/miui/gallery/collage/core/Effect;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/collage/core/Effect;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/collage/core/Effect;
    .locals 1

    sget-object v0, Lcom/miui/gallery/collage/core/Effect;->$VALUES:[Lcom/miui/gallery/collage/core/Effect;

    invoke-virtual {v0}, [Lcom/miui/gallery/collage/core/Effect;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/collage/core/Effect;

    return-object v0
.end method


# virtual methods
.method public generatePresenter()Lcom/miui/gallery/collage/core/CollagePresenter;
    .locals 2

    sget-object v0, Lcom/miui/gallery/collage/core/Effect$1;->$SwitchMap$com$miui$gallery$collage$core$Effect:[I

    invoke-virtual {p0}, Lcom/miui/gallery/collage/core/Effect;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Lcom/miui/gallery/collage/core/poster/PosterPresenter;

    invoke-direct {v0}, Lcom/miui/gallery/collage/core/poster/PosterPresenter;-><init>()V

    return-object v0

    :pswitch_0
    new-instance v0, Lcom/miui/gallery/collage/core/stitching/StitchingPresenter;

    invoke-direct {v0}, Lcom/miui/gallery/collage/core/stitching/StitchingPresenter;-><init>()V

    return-object v0

    :pswitch_1
    new-instance v0, Lcom/miui/gallery/collage/core/layout/LayoutPresenter;

    invoke-direct {v0}, Lcom/miui/gallery/collage/core/layout/LayoutPresenter;-><init>()V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
