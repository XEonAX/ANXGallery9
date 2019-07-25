.class final Lmiui/gallery/support/MiuiSdkCompat$2;
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
        "Ljava/lang/Void;",
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
.method protected onInit(Ljava/lang/Void;)Ljava/lang/Integer;
    .locals 1

    const-string p1, "ro.miui.ui.version.code"

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/android/internal/SystemPropertiesCompat;->getInt(Ljava/lang/String;I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic onInit(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lmiui/gallery/support/MiuiSdkCompat$2;->onInit(Ljava/lang/Void;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method
