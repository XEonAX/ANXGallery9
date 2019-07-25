.class Lcom/nexstreaming/kminternal/kinemaster/fonts/c$a;
.super Ljava/lang/Object;
.source "FontManager.java"

# interfaces
.implements Lcom/nexstreaming/kminternal/kinemaster/fonts/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/kminternal/kinemaster/fonts/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:I

.field private final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/fonts/c$a;->c:Ljava/util/List;

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/fonts/c$a;->a:Ljava/lang/String;

    iput p2, p0, Lcom/nexstreaming/kminternal/kinemaster/fonts/c$a;->b:I

    return-void
.end method


# virtual methods
.method public a()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/fonts/c$a;->c:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method b()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/fonts/c$a;->c:Ljava/util/List;

    return-object v0
.end method
