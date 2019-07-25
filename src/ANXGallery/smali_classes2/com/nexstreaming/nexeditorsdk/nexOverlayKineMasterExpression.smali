.class public final Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;
.super Ljava/lang/Object;
.source "nexOverlayKineMasterExpression.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final DRIFTING:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

.field public static final DROP:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

.field public static final FADE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

.field public static final FLOATING:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

.field public static final NONE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

.field public static final POP:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

.field public static final SCALE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

.field public static final SLIDE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

.field public static final SPIN:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

.field public static final SQUISHING:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

.field private static final values:[Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;


# instance fields
.field private KMinID:Ljava/lang/String;

.field private KMoutID:Ljava/lang/String;

.field private KMoverallID:Ljava/lang/String;

.field private KineMasterID:I

.field private name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    new-instance v6, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const-string v1, "None"

    const-string v3, "none"

    const-string v4, "none"

    const-string v5, "none"

    const/4 v2, 0x0

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v6, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->NONE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const-string v8, "Fade"

    const-string v10, "FadeIn"

    const-string v11, "FadeOut"

    const-string v12, "none"

    const/4 v9, 0x1

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->FADE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const-string v2, "Pop"

    const-string v4, "PopIn"

    const-string v5, "ScaleUpOut"

    const-string v6, "none"

    const/4 v3, 0x2

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->POP:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const-string v8, "Slide"

    const-string v10, "SlideRightIn"

    const-string v11, "SlideRightOut"

    const-string v12, "none"

    const/4 v9, 0x3

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->SLIDE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const-string v2, "Spin"

    const-string v4, "SpinCCWIn"

    const-string v5, "SpinCWOut"

    const-string v6, "none"

    const/4 v3, 0x4

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->SPIN:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const-string v8, "Drop"

    const-string v10, "DropIn"

    const-string v11, "FadeOut"

    const-string v12, "none"

    const/4 v9, 0x5

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->DROP:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const-string v2, "Scale"

    const-string v4, "ScaleUpIn"

    const-string v5, "ScaleDownOut"

    const-string v6, "none"

    const/4 v3, 0x6

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->SCALE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const-string v8, "Floating"

    const-string v10, "FadeIn"

    const-string v11, "FadeOut"

    const-string v12, "FloatingOverall"

    const/4 v9, 0x7

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->FLOATING:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const-string v2, "Drifting"

    const-string v4, "FadeIn"

    const-string v5, "FadeOut"

    const-string v6, "DriftingOverall"

    const/16 v3, 0x8

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->DRIFTING:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const-string v8, "Squishing"

    const-string v10, "FadeIn"

    const-string v11, "FadeOut"

    const-string v12, "SquishingOverall"

    const/16 v9, 0x9

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->SQUISHING:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const/16 v0, 0xa

    new-array v0, v0, [Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->NONE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->FADE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->POP:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->SLIDE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->SPIN:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->DROP:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->SCALE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->FLOATING:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->DRIFTING:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->SQUISHING:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->values:[Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->name:Ljava/lang/String;

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->KineMasterID:I

    iput-object p3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->KMinID:Ljava/lang/String;

    iput-object p4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->KMoutID:Ljava/lang/String;

    iput-object p5, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->KMoverallID:Ljava/lang/String;

    return-void
.end method

.method public static getExpression(I)Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->values:[Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    array-length v0, v0

    if-ge p0, v0, :cond_1

    if-ltz p0, :cond_0

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->values:[Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    aget-object p0, v0, p0

    return-object p0

    :cond_0
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    invoke-direct {v0, p0}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(I)V

    throw v0

    :cond_1
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->values:[Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    array-length v1, v1

    invoke-direct {v0, p0, v1}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(II)V

    throw v0
.end method

.method public static getNames()[Ljava/lang/String;
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->values:[Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    array-length v0, v0

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    :goto_0
    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->values:[Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->values:[Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    aget-object v2, v2, v1

    iget-object v2, v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->name:Ljava/lang/String;

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static getPresetList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->values:[Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static values()[Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->values:[Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    return-object v0
.end method


# virtual methods
.method public getID()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->KineMasterID:I

    return v0
.end method

.method getNames(I)Ljava/lang/String;
    .locals 1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->KMinID:Ljava/lang/String;

    return-object p1

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->KMoutID:Ljava/lang/String;

    return-object p1

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->KMoverallID:Ljava/lang/String;

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method
