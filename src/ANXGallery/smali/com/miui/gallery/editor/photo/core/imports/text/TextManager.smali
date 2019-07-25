.class public Lcom/miui/gallery/editor/photo/core/imports/text/TextManager;
.super Ljava/lang/Object;
.source "TextManager.java"


# direct methods
.method public static getDefaultTextConfig()Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;
    .locals 13

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->NONE:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;

    new-instance v12, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/LocalDialogModel;

    iget v2, v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mBackGroundColor:I

    iget v3, v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mSmallIcon:I

    iget v4, v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mGraphics:I

    iget v5, v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mLeftPercent:F

    iget v6, v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mTopPercent:F

    iget v7, v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mRightPercent:F

    iget v8, v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mBottomPercent:F

    iget-boolean v9, v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mIsCorner:Z

    iget v10, v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->mCornerPosition:I

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager$LocalDialog;->name()Ljava/lang/String;

    move-result-object v11

    move-object v1, v12

    invoke-direct/range {v1 .. v11}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/LocalDialogModel;-><init>(IIIFFFFZILjava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;

    iget-object v1, v12, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->name:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1, v12}, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;-><init>(SLjava/lang/String;Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;)V

    return-object v0
.end method

.method public static getScreenTextBubbleData()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/TextData;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager;->getDialogModelList()Ljava/util/List;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_0

    const/4 v4, 0x5

    if-ge v3, v4, :cond_0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    new-instance v5, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;

    iget-object v6, v4, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->name:Ljava/lang/String;

    invoke-direct {v5, v2, v6, v4}, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;-><init>(SLjava/lang/String;Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method
