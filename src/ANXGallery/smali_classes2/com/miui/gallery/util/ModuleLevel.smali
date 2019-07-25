.class public final Lcom/miui/gallery/util/ModuleLevel;
.super Lcom/miui/gallery/util/LazyValue;
.source "ModuleLevel.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/util/LazyValue<",
        "Landroid/content/Context;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private mModuleName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/LazyValue;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/util/ModuleLevel;->mModuleName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected onInit(Landroid/content/Context;)Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/ModuleLevel;->mModuleName:Ljava/lang/String;

    invoke-static {p1, v0}, Lmiui/util/AppConstants;->getSdkLevel(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic onInit(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Landroid/content/Context;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/ModuleLevel;->onInit(Landroid/content/Context;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method
