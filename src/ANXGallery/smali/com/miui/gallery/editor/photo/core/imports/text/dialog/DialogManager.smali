.class public Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager;
.super Ljava/lang/Object;
.source "DialogManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;
    }
.end annotation


# instance fields
.field private mDialogModelList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 17

    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager;->mDialogModelList:Ljava/util/List;

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->values()[Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    new-instance v15, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/LocalDialogModel;

    iget v6, v4, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mBackGroundColor:I

    iget v7, v4, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mSmallIcon:I

    iget v8, v4, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mGraphics:I

    iget v9, v4, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mLeftPercent:F

    iget v10, v4, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mTopPercent:F

    iget v11, v4, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mRightPercent:F

    iget v12, v4, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mBottomPercent:F

    iget-boolean v13, v4, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mIsCorner:Z

    iget v14, v4, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mCornerPosition:I

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->name()Ljava/lang/String;

    move-result-object v4

    move-object v5, v15

    move-object/from16 v16, v1

    move-object v1, v15

    move-object v15, v4

    invoke-direct/range {v5 .. v15}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/LocalDialogModel;-><init>(IIIFFFFZILjava/lang/String;)V

    iget-object v4, v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager;->mDialogModelList:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v1, v16

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public getDialogModelList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager;->mDialogModelList:Ljava/util/List;

    return-object v0
.end method
