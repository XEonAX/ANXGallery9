.class final Lmiui/gallery/support/MiuiSdkCompat$1;
.super Lcom/miui/gallery/util/LazyValue;
.source "MiuiSdkCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/gallery/support/MiuiSdkCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/util/LazyValue<",
        "Landroid/content/Context;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/LazyValue;-><init>()V

    return-void
.end method


# virtual methods
.method protected onInit(Landroid/content/Context;)Ljava/lang/Integer;
    .locals 1

    const-string v0, "com.miui.core"

    invoke-static {p1, v0}, Lmiui/util/AppConstants;->getSdkLevel(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic onInit(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Landroid/content/Context;

    invoke-virtual {p0, p1}, Lmiui/gallery/support/MiuiSdkCompat$1;->onInit(Landroid/content/Context;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method
