.class Lcom/nexstreaming/app/common/util/q$b;
.super Ljava/lang/Object;
.source "utilityTextOverlay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/app/common/util/q;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/app/common/util/q;

.field private b:Z

.field private c:I

.field private d:F


# direct methods
.method public constructor <init>(Lcom/nexstreaming/app/common/util/q;ZIF)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/app/common/util/q$b;->a:Lcom/nexstreaming/app/common/util/q;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Lcom/nexstreaming/app/common/util/q$b;->b:Z

    iput p3, p0, Lcom/nexstreaming/app/common/util/q$b;->c:I

    iput p4, p0, Lcom/nexstreaming/app/common/util/q$b;->d:F

    return-void
.end method

.method static synthetic a(Lcom/nexstreaming/app/common/util/q$b;)F
    .locals 0

    iget p0, p0, Lcom/nexstreaming/app/common/util/q$b;->d:F

    return p0
.end method

.method static synthetic b(Lcom/nexstreaming/app/common/util/q$b;)I
    .locals 0

    iget p0, p0, Lcom/nexstreaming/app/common/util/q$b;->c:I

    return p0
.end method
