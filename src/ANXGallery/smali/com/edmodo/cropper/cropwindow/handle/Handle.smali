.class public final enum Lcom/edmodo/cropper/cropwindow/handle/Handle;
.super Ljava/lang/Enum;
.source "Handle.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/edmodo/cropper/cropwindow/handle/Handle;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/edmodo/cropper/cropwindow/handle/Handle;

.field public static final enum BOTTOM:Lcom/edmodo/cropper/cropwindow/handle/Handle;

.field public static final enum BOTTOM_LEFT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

.field public static final enum BOTTOM_RIGHT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

.field public static final enum CENTER:Lcom/edmodo/cropper/cropwindow/handle/Handle;

.field public static final enum LEFT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

.field public static final enum RIGHT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

.field public static final enum TOP:Lcom/edmodo/cropper/cropwindow/handle/Handle;

.field public static final enum TOP_LEFT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

.field public static final enum TOP_RIGHT:Lcom/edmodo/cropper/cropwindow/handle/Handle;


# instance fields
.field private mHelper:Lcom/edmodo/cropper/cropwindow/handle/HandleHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    new-instance v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;

    const-string v1, "TOP_LEFT"

    new-instance v2, Lcom/edmodo/cropper/cropwindow/handle/CornerHandleHelper;

    sget-object v3, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    sget-object v4, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-direct {v2, v3, v4}, Lcom/edmodo/cropper/cropwindow/handle/CornerHandleHelper;-><init>(Lcom/edmodo/cropper/cropwindow/edge/Edge;Lcom/edmodo/cropper/cropwindow/edge/Edge;)V

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/edmodo/cropper/cropwindow/handle/Handle;-><init>(Ljava/lang/String;ILcom/edmodo/cropper/cropwindow/handle/HandleHelper;)V

    sput-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->TOP_LEFT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    new-instance v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;

    const-string v1, "TOP_RIGHT"

    new-instance v2, Lcom/edmodo/cropper/cropwindow/handle/CornerHandleHelper;

    sget-object v4, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    sget-object v5, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-direct {v2, v4, v5}, Lcom/edmodo/cropper/cropwindow/handle/CornerHandleHelper;-><init>(Lcom/edmodo/cropper/cropwindow/edge/Edge;Lcom/edmodo/cropper/cropwindow/edge/Edge;)V

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2}, Lcom/edmodo/cropper/cropwindow/handle/Handle;-><init>(Ljava/lang/String;ILcom/edmodo/cropper/cropwindow/handle/HandleHelper;)V

    sput-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->TOP_RIGHT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    new-instance v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;

    const-string v1, "BOTTOM_LEFT"

    new-instance v2, Lcom/edmodo/cropper/cropwindow/handle/CornerHandleHelper;

    sget-object v5, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    sget-object v6, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-direct {v2, v5, v6}, Lcom/edmodo/cropper/cropwindow/handle/CornerHandleHelper;-><init>(Lcom/edmodo/cropper/cropwindow/edge/Edge;Lcom/edmodo/cropper/cropwindow/edge/Edge;)V

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2}, Lcom/edmodo/cropper/cropwindow/handle/Handle;-><init>(Ljava/lang/String;ILcom/edmodo/cropper/cropwindow/handle/HandleHelper;)V

    sput-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->BOTTOM_LEFT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    new-instance v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;

    const-string v1, "BOTTOM_RIGHT"

    new-instance v2, Lcom/edmodo/cropper/cropwindow/handle/CornerHandleHelper;

    sget-object v6, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    sget-object v7, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-direct {v2, v6, v7}, Lcom/edmodo/cropper/cropwindow/handle/CornerHandleHelper;-><init>(Lcom/edmodo/cropper/cropwindow/edge/Edge;Lcom/edmodo/cropper/cropwindow/edge/Edge;)V

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2}, Lcom/edmodo/cropper/cropwindow/handle/Handle;-><init>(Ljava/lang/String;ILcom/edmodo/cropper/cropwindow/handle/HandleHelper;)V

    sput-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->BOTTOM_RIGHT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    new-instance v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;

    const-string v1, "LEFT"

    new-instance v2, Lcom/edmodo/cropper/cropwindow/handle/VerticalHandleHelper;

    sget-object v7, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-direct {v2, v7}, Lcom/edmodo/cropper/cropwindow/handle/VerticalHandleHelper;-><init>(Lcom/edmodo/cropper/cropwindow/edge/Edge;)V

    const/4 v7, 0x4

    invoke-direct {v0, v1, v7, v2}, Lcom/edmodo/cropper/cropwindow/handle/Handle;-><init>(Ljava/lang/String;ILcom/edmodo/cropper/cropwindow/handle/HandleHelper;)V

    sput-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->LEFT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    new-instance v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;

    const-string v1, "TOP"

    new-instance v2, Lcom/edmodo/cropper/cropwindow/handle/HorizontalHandleHelper;

    sget-object v8, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-direct {v2, v8}, Lcom/edmodo/cropper/cropwindow/handle/HorizontalHandleHelper;-><init>(Lcom/edmodo/cropper/cropwindow/edge/Edge;)V

    const/4 v8, 0x5

    invoke-direct {v0, v1, v8, v2}, Lcom/edmodo/cropper/cropwindow/handle/Handle;-><init>(Ljava/lang/String;ILcom/edmodo/cropper/cropwindow/handle/HandleHelper;)V

    sput-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->TOP:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    new-instance v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;

    const-string v1, "RIGHT"

    new-instance v2, Lcom/edmodo/cropper/cropwindow/handle/VerticalHandleHelper;

    sget-object v9, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-direct {v2, v9}, Lcom/edmodo/cropper/cropwindow/handle/VerticalHandleHelper;-><init>(Lcom/edmodo/cropper/cropwindow/edge/Edge;)V

    const/4 v9, 0x6

    invoke-direct {v0, v1, v9, v2}, Lcom/edmodo/cropper/cropwindow/handle/Handle;-><init>(Ljava/lang/String;ILcom/edmodo/cropper/cropwindow/handle/HandleHelper;)V

    sput-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->RIGHT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    new-instance v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;

    const-string v1, "BOTTOM"

    new-instance v2, Lcom/edmodo/cropper/cropwindow/handle/HorizontalHandleHelper;

    sget-object v10, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-direct {v2, v10}, Lcom/edmodo/cropper/cropwindow/handle/HorizontalHandleHelper;-><init>(Lcom/edmodo/cropper/cropwindow/edge/Edge;)V

    const/4 v10, 0x7

    invoke-direct {v0, v1, v10, v2}, Lcom/edmodo/cropper/cropwindow/handle/Handle;-><init>(Ljava/lang/String;ILcom/edmodo/cropper/cropwindow/handle/HandleHelper;)V

    sput-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->BOTTOM:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    new-instance v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;

    const-string v1, "CENTER"

    new-instance v2, Lcom/edmodo/cropper/cropwindow/handle/CenterHandleHelper;

    invoke-direct {v2}, Lcom/edmodo/cropper/cropwindow/handle/CenterHandleHelper;-><init>()V

    const/16 v11, 0x8

    invoke-direct {v0, v1, v11, v2}, Lcom/edmodo/cropper/cropwindow/handle/Handle;-><init>(Ljava/lang/String;ILcom/edmodo/cropper/cropwindow/handle/HandleHelper;)V

    sput-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->CENTER:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    const/16 v0, 0x9

    new-array v0, v0, [Lcom/edmodo/cropper/cropwindow/handle/Handle;

    sget-object v1, Lcom/edmodo/cropper/cropwindow/handle/Handle;->TOP_LEFT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    aput-object v1, v0, v3

    sget-object v1, Lcom/edmodo/cropper/cropwindow/handle/Handle;->TOP_RIGHT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    aput-object v1, v0, v4

    sget-object v1, Lcom/edmodo/cropper/cropwindow/handle/Handle;->BOTTOM_LEFT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    aput-object v1, v0, v5

    sget-object v1, Lcom/edmodo/cropper/cropwindow/handle/Handle;->BOTTOM_RIGHT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    aput-object v1, v0, v6

    sget-object v1, Lcom/edmodo/cropper/cropwindow/handle/Handle;->LEFT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    aput-object v1, v0, v7

    sget-object v1, Lcom/edmodo/cropper/cropwindow/handle/Handle;->TOP:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    aput-object v1, v0, v8

    sget-object v1, Lcom/edmodo/cropper/cropwindow/handle/Handle;->RIGHT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    aput-object v1, v0, v9

    sget-object v1, Lcom/edmodo/cropper/cropwindow/handle/Handle;->BOTTOM:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    aput-object v1, v0, v10

    sget-object v1, Lcom/edmodo/cropper/cropwindow/handle/Handle;->CENTER:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    aput-object v1, v0, v11

    sput-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->$VALUES:[Lcom/edmodo/cropper/cropwindow/handle/Handle;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/edmodo/cropper/cropwindow/handle/HandleHelper;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/edmodo/cropper/cropwindow/handle/HandleHelper;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->mHelper:Lcom/edmodo/cropper/cropwindow/handle/HandleHelper;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/edmodo/cropper/cropwindow/handle/Handle;
    .locals 1

    const-class v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/edmodo/cropper/cropwindow/handle/Handle;

    return-object p0
.end method

.method public static values()[Lcom/edmodo/cropper/cropwindow/handle/Handle;
    .locals 1

    sget-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->$VALUES:[Lcom/edmodo/cropper/cropwindow/handle/Handle;

    invoke-virtual {v0}, [Lcom/edmodo/cropper/cropwindow/handle/Handle;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/edmodo/cropper/cropwindow/handle/Handle;

    return-object v0
.end method


# virtual methods
.method public updateCropWindow(FFFLandroid/graphics/RectF;F)V
    .locals 6

    iget-object v0, p0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->mHelper:Lcom/edmodo/cropper/cropwindow/handle/HandleHelper;

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/edmodo/cropper/cropwindow/handle/HandleHelper;->updateCropWindow(FFFLandroid/graphics/RectF;F)V

    return-void
.end method

.method public updateCropWindow(FFLandroid/graphics/RectF;F)V
    .locals 1

    iget-object v0, p0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->mHelper:Lcom/edmodo/cropper/cropwindow/handle/HandleHelper;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/edmodo/cropper/cropwindow/handle/HandleHelper;->updateCropWindow(FFLandroid/graphics/RectF;F)V

    return-void
.end method
