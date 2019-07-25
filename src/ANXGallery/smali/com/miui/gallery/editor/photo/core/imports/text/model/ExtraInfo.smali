.class public Lcom/miui/gallery/editor/photo/core/imports/text/model/ExtraInfo;
.super Ljava/lang/Object;
.source "ExtraInfo.java"


# instance fields
.field public darkmode:I

.field public index:I


# virtual methods
.method public isDarkModeData()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/ExtraInfo;->darkmode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method
