.class public abstract Lcom/miui/gallery/editor/photo/core/RenderEngine;
.super Ljava/lang/Object;
.source "RenderEngine.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static findEngine(Landroid/content/Context;Lcom/miui/gallery/editor/photo/core/RenderData;[Lcom/miui/gallery/editor/photo/core/RenderEngine;)Lcom/miui/gallery/editor/photo/core/RenderEngine;
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/RenderData;->getType()Lcom/miui/gallery/editor/photo/core/Effect;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v0

    aget-object v0, p2, v0

    if-nez v0, :cond_0

    sget-object v1, Lcom/miui/gallery/editor/photo/core/SdkManager;->INSTANCE:Lcom/miui/gallery/editor/photo/core/SdkManager;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/core/SdkManager;->getProvider(Lcom/miui/gallery/editor/photo/core/Effect;)Lcom/miui/gallery/editor/photo/core/SdkProvider;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1, p0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->createEngine(Landroid/content/Context;)Lcom/miui/gallery/editor/photo/core/RenderEngine;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result p0

    aput-object v0, p2, p0

    :cond_0
    return-object v0
.end method

.method public static render(Landroid/content/Context;Landroid/graphics/Bitmap;Ljava/util/List;[Lcom/miui/gallery/editor/photo/core/RenderEngine;)Landroid/graphics/Bitmap;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/graphics/Bitmap;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/RenderData;",
            ">;[",
            "Lcom/miui/gallery/editor/photo/core/RenderEngine;",
            ")",
            "Landroid/graphics/Bitmap;"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const-string p0, "RenderEngine"

    const-string p1, "no bitmap need to render"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    move-object v3, p1

    :goto_0
    if-ge v2, v1, :cond_6

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/RenderData;

    add-int/lit8 v2, v2, 0x1

    :goto_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_2

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/editor/photo/core/RenderData;

    const-string v5, "RenderEngine"

    const-string v6, "try merge %s with %s"

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/RenderData;->getType()Lcom/miui/gallery/editor/photo/core/Effect;

    move-result-object v7

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/RenderData;->getType()Lcom/miui/gallery/editor/photo/core/Effect;

    move-result-object v8

    invoke-static {v5, v6, v7, v8}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v4}, Lcom/miui/gallery/editor/photo/core/RenderData;->merge(Lcom/miui/gallery/editor/photo/core/RenderData;)Lcom/miui/gallery/editor/photo/core/RenderData;

    move-result-object v4

    if-eqz v4, :cond_1

    const-string p1, "RenderEngine"

    const-string v5, "merged"

    invoke-static {p1, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v2, v2, 0x1

    move-object p1, v4

    goto :goto_1

    :cond_1
    const-string v4, "RenderEngine"

    const-string v5, "not support"

    invoke-static {v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    invoke-static {p0, p1, p3}, Lcom/miui/gallery/editor/photo/core/RenderEngine;->findEngine(Landroid/content/Context;Lcom/miui/gallery/editor/photo/core/RenderData;[Lcom/miui/gallery/editor/photo/core/RenderEngine;)Lcom/miui/gallery/editor/photo/core/RenderEngine;

    move-result-object v4

    if-nez v4, :cond_3

    return-object v0

    :cond_3
    invoke-virtual {v4, v3, p1}, Lcom/miui/gallery/editor/photo/core/RenderEngine;->render(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/core/RenderData;)Landroid/graphics/Bitmap;

    move-result-object v4

    if-eq v4, v3, :cond_4

    invoke-static {v3}, Lcom/miui/gallery/util/BaseBitmapUtils;->recycleSilently(Landroid/graphics/Bitmap;)V

    move-object v3, v4

    :cond_4
    if-nez v4, :cond_5

    const-string p0, "RenderEngine"

    const-string p2, "render %s failed, return"

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/RenderData;->getType()Lcom/miui/gallery/editor/photo/core/Effect;

    move-result-object p1

    invoke-static {p0, p2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0

    :cond_5
    move-object p1, v4

    goto :goto_0

    :cond_6
    const-string p0, "RenderEngine"

    const-string p3, "render %d finish"

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p0, p3, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p1
.end method


# virtual methods
.method public release()V
    .locals 0

    return-void
.end method

.method public abstract render(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/core/RenderData;)Landroid/graphics/Bitmap;
.end method
