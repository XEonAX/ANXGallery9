.class Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;
.super Ljava/lang/Object;
.source "MiuiBeautyFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ChildFragmentData"
.end annotation


# instance fields
.field final beautyEffect:Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

.field final menu:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+",
            "Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;",
            ">;",
            "Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;->menu:Ljava/lang/Class;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;->beautyEffect:Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    return-void
.end method


# virtual methods
.method public newMenu()Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;
    .locals 4

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;->menu:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "BEAUTY_EFFECT"

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;->beautyEffect:Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment;->setArguments(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "MiuiBeautyFragment"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    const-string v1, "MiuiBeautyFragment"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
