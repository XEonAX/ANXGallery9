.class public final enum Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;
.super Ljava/lang/Enum;
.source "DialogManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LocalDialog"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

.field public static final enum ARROW_1:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

.field public static final enum ARROW_2:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

.field public static final enum CIRCULAR:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

.field public static final enum NONE:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

.field public static final enum OVAL:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

.field public static final enum RECTANGLE:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

.field public static final enum RECT_HORIZONTAL:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;


# instance fields
.field public final mBackGroundColor:I

.field public final mBottomPercent:F

.field public final mCornerPosition:I

.field public final mGraphics:I

.field public final mIsCorner:Z

.field public final mLeftPercent:F

.field public final mRightPercent:F

.field public final mSmallIcon:I

.field public final mTopPercent:F


# direct methods
.method static constructor <clinit>()V
    .locals 21

    new-instance v10, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    const-string v1, "NONE"

    const/4 v2, 0x0

    const v3, 0x7f070290

    const/4 v4, 0x0

    const v5, 0x7f05016e

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, v10

    invoke-direct/range {v0 .. v9}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;-><init>(Ljava/lang/String;IIIIFFFF)V

    sput-object v10, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->NONE:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    const-string v12, "CIRCULAR"

    const/4 v13, 0x1

    const v14, 0x7f07028f

    const v15, 0x7f07028e

    const v16, 0x7f05016c

    const v17, 0x3e19999a    # 0.15f

    const v18, 0x3e6147ae    # 0.22f

    const v19, 0x3e19999a    # 0.15f

    const v20, 0x3e6b851f    # 0.23f

    move-object v11, v0

    invoke-direct/range {v11 .. v20}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;-><init>(Ljava/lang/String;IIIIFFFF)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->CIRCULAR:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    const-string v2, "RECTANGLE"

    const/4 v3, 0x2

    const v4, 0x7f070296

    const v5, 0x7f070295

    const v6, 0x7f05016d

    const v7, 0x3e19999a    # 0.15f

    const v8, 0x3e19999a    # 0.15f

    const v9, 0x3e19999a    # 0.15f

    const/high16 v10, 0x3e800000    # 0.25f

    move-object v1, v0

    invoke-direct/range {v1 .. v10}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;-><init>(Ljava/lang/String;IIIIFFFF)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->RECTANGLE:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    const-string v12, "RECT_HORIZONTAL"

    const/4 v13, 0x3

    const v14, 0x7f070294

    const v15, 0x7f070293

    const v18, 0x3e4ccccd    # 0.2f

    const v19, 0x3dcccccd    # 0.1f

    const v20, 0x3e4ccccd    # 0.2f

    move-object v11, v0

    invoke-direct/range {v11 .. v20}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;-><init>(Ljava/lang/String;IIIIFFFF)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->RECT_HORIZONTAL:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    const-string v2, "OVAL"

    const/4 v3, 0x4

    const v4, 0x7f070292

    const v5, 0x7f070291

    const v6, 0x7f05016f

    const v8, 0x3e2e147b    # 0.17f

    const v10, 0x3ea3d70a    # 0.32f

    move-object v1, v0

    invoke-direct/range {v1 .. v10}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;-><init>(Ljava/lang/String;IIIIFFFF)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->OVAL:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    const-string v12, "ARROW_1"

    const/4 v13, 0x5

    const v14, 0x7f07028b

    const v15, 0x7f07028a

    const/16 v17, 0x0

    move-object v11, v0

    invoke-direct/range {v11 .. v17}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->ARROW_1:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    const-string v2, "ARROW_2"

    const/4 v3, 0x6

    const v4, 0x7f07028d

    const v5, 0x7f07028c

    const/4 v7, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->ARROW_2:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    const/4 v0, 0x7

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->NONE:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->CIRCULAR:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->RECTANGLE:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->RECT_HORIZONTAL:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->OVAL:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->ARROW_1:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->ARROW_2:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->$VALUES:[Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIIIFFFF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIIFFFF)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mSmallIcon:I

    iput p4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mGraphics:I

    iput p5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mBackGroundColor:I

    iput p6, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mLeftPercent:F

    iput p7, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mTopPercent:F

    iput p8, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mRightPercent:F

    iput p9, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mBottomPercent:F

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mIsCorner:Z

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mCornerPosition:I

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIIII)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mSmallIcon:I

    iput p4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mGraphics:I

    iput p5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mBackGroundColor:I

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mLeftPercent:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mTopPercent:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mRightPercent:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mBottomPercent:F

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mIsCorner:Z

    iput p6, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mCornerPosition:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;
    .locals 1

    const-class v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->$VALUES:[Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    invoke-virtual {v0}, [Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    return-object v0
.end method
