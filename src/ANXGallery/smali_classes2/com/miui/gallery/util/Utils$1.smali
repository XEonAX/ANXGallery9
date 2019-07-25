.class final Lcom/miui/gallery/util/Utils$1;
.super Lcom/miui/gallery/util/LazyValue;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/util/LazyValue<",
        "Ljava/lang/Void;",
        "Ljava/util/regex/Pattern;",
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
.method protected bridge synthetic onInit(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/Utils$1;->onInit(Ljava/lang/Void;)Ljava/util/regex/Pattern;

    move-result-object p1

    return-object p1
.end method

.method protected onInit(Ljava/lang/Void;)Ljava/util/regex/Pattern;
    .locals 0

    const-string p1, "(\\d+)(-\\d+)"

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    return-object p1
.end method
