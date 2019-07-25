.class public Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;
.super Ljava/lang/Object;
.source "AbstractNaviFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "NavigatorData"
.end annotation


# instance fields
.field public final effect:Lcom/miui/gallery/editor/photo/core/Effect;

.field public final icon:I

.field public final isPlugin:Z

.field public final name:I

.field public final pluginModuleName:Ljava/lang/String;


# direct methods
.method constructor <init>(IILcom/miui/gallery/editor/photo/core/Effect;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;-><init>(IILcom/miui/gallery/editor/photo/core/Effect;Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(IILcom/miui/gallery/editor/photo/core/Effect;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->icon:I

    iput p2, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->name:I

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->effect:Lcom/miui/gallery/editor/photo/core/Effect;

    iput-object p4, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->pluginModuleName:Ljava/lang/String;

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->isPlugin:Z

    return-void
.end method
