.class public final enum Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;
.super Ljava/lang/Enum;
.source "HybridLoadingProgressView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/hybrid/HybridLoadingProgressView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "HybridLoadingState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

.field public static final enum DATA_ERROR:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

.field public static final enum LOCATION_ERROR:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

.field public static final enum NETWORK_ERROR:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

.field public static final enum OK:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

.field public static final enum SERVICE_ERROR:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;


# instance fields
.field private mDefaultDescription:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    new-instance v0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    const-string v1, "NETWORK_ERROR"

    const/4 v2, 0x0

    const v3, 0x7f10041a

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->NETWORK_ERROR:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    new-instance v0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    const-string v1, "SERVICE_ERROR"

    const/4 v3, 0x1

    const v4, 0x7f10041e

    invoke-direct {v0, v1, v3, v4}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->SERVICE_ERROR:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    new-instance v0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    const-string v1, "DATA_ERROR"

    const/4 v4, 0x2

    const v5, 0x7f100417

    invoke-direct {v0, v1, v4, v5}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->DATA_ERROR:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    new-instance v0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    const-string v1, "LOCATION_ERROR"

    const/4 v5, 0x3

    const v6, 0x7f100418

    invoke-direct {v0, v1, v5, v6}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->LOCATION_ERROR:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    new-instance v0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    const-string v1, "OK"

    const/4 v6, 0x4

    const v7, 0x104000a

    invoke-direct {v0, v1, v6, v7}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->OK:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    sget-object v1, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->NETWORK_ERROR:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->SERVICE_ERROR:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->DATA_ERROR:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->LOCATION_ERROR:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->OK:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    aput-object v1, v0, v6

    sput-object v0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->$VALUES:[Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->mDefaultDescription:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;
    .locals 1

    const-class v0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;
    .locals 1

    sget-object v0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->$VALUES:[Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    invoke-virtual {v0}, [Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    return-object v0
.end method


# virtual methods
.method public getDescription()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->mDefaultDescription:I

    return v0
.end method
