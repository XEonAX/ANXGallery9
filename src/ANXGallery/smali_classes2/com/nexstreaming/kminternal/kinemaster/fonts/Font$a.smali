.class Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$a;
.super Ljava/lang/Object;
.source "Font.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# static fields
.field static final c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$a;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final a:Ljava/lang/String;

.field final b:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$a;->c:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;->c()[Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$b;

    move-result-object v2

    array-length v3, v2

    move v5, v1

    const/4 v4, 0x0

    move-object v1, p1

    const/4 p1, 0x0

    :goto_1
    if-ge p1, v3, :cond_1

    aget-object v6, v2, p1

    iget-object v7, v6, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$b;->a:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    iget-object v7, v6, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$b;->a:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v4, v7

    invoke-virtual {v1, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iget v4, v6, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$b;->b:I

    add-int/2addr v5, v4

    const/4 v4, 0x1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_1
    if-nez v4, :cond_2

    iput-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$a;->a:Ljava/lang/String;

    iput v5, p0, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$a;->b:I

    return-void

    :cond_2
    move-object p1, v1

    move v1, v5

    goto :goto_0
.end method

.method public static a(Ljava/lang/String;)Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$a;
    .locals 1

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$a;->c:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$a;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$a;

    invoke-direct {v0, p0}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$a;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
