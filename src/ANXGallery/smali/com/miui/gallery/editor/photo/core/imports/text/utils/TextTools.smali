.class public Lcom/miui/gallery/editor/photo/core/imports/text/utils/TextTools;
.super Ljava/lang/Object;
.source "TextTools.java"


# direct methods
.method public static checkResourceExist(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;",
            ">;)V"
        }
    .end annotation

    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->isLocal()Z

    move-result v1

    const/16 v2, 0x11

    if-eqz v1, :cond_2

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->setTypeFace(Landroid/graphics/Typeface;)V

    invoke-virtual {v0, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->setState(I)V

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->isExtra()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getFilePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getFilePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->setTypeFace(Landroid/graphics/Typeface;)V

    invoke-virtual {v0, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->setState(I)V

    goto :goto_0

    :cond_3
    return-void
.end method

.method public static isZhCNLanguage()Z
    .locals 2

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh_CN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
