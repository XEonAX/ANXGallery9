.class public Lcom/miui/gallery/util/StaticContext;
.super Ljava/lang/Object;
.source "StaticContext.java"


# static fields
.field private static volatile sContext:Landroid/content/Context;


# direct methods
.method public static init(Landroid/content/Context;)V
    .locals 0

    sput-object p0, Lcom/miui/gallery/util/StaticContext;->sContext:Landroid/content/Context;

    return-void
.end method

.method public static sGetAndroidContext()Landroid/content/Context;
    .locals 1

    sget-object v0, Lcom/miui/gallery/util/StaticContext;->sContext:Landroid/content/Context;

    return-object v0
.end method
