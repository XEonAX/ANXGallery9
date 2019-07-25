.class public Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;
.super Ljava/lang/Object;
.source "ScreenNavigatorData.java"


# instance fields
.field public final icon:I

.field public final id:I

.field public final name:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;->icon:I

    iput p2, p0, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;->name:I

    iput p3, p0, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;->id:I

    return-void
.end method

.method public static getNavData(Z)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v2, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;

    const v3, 0x7f07023f

    const v4, 0x7f100605

    const/4 v5, 0x1

    invoke-direct {v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;-><init>(III)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-eqz p0, :cond_0

    new-instance p0, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;

    const v2, 0x7f07023b

    const v3, 0x7f100601

    invoke-direct {p0, v2, v3, v1}, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;-><init>(III)V

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    new-instance p0, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;

    const v1, 0x7f07023c

    const v2, 0x7f100602

    const/4 v3, 0x2

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;-><init>(III)V

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance p0, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;

    const v1, 0x7f070240

    const v2, 0x7f100606

    const/4 v3, 0x3

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;-><init>(III)V

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance p0, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;

    const v1, 0x7f07023e

    const v2, 0x7f100604

    const/4 v3, 0x4

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;-><init>(III)V

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
