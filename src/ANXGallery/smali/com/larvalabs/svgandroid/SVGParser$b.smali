.class Lcom/larvalabs/svgandroid/SVGParser$b;
.super Ljava/lang/Object;
.source "SVGParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/larvalabs/svgandroid/SVGParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation


# instance fields
.field private a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private b:I


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Float;",
            ">;I)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$b;->a:Ljava/util/ArrayList;

    iput p2, p0, Lcom/larvalabs/svgandroid/SVGParser$b;->b:I

    return-void
.end method

.method static synthetic a(Lcom/larvalabs/svgandroid/SVGParser$b;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/larvalabs/svgandroid/SVGParser$b;->a:Ljava/util/ArrayList;

    return-object p0
.end method


# virtual methods
.method public a()I
    .locals 1

    iget v0, p0, Lcom/larvalabs/svgandroid/SVGParser$b;->b:I

    return v0
.end method
