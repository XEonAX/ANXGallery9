.class public final enum Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;
.super Ljava/lang/Enum;
.source "PullToRefreshBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

.field public static final enum MANUAL_REFRESHING:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

.field public static final enum OVERSCROLLING:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

.field public static final enum PULL_TO_REFRESH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

.field public static final enum REFRESHING:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

.field public static final enum RELEASE_TO_REFRESH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

.field public static final enum RESET:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;


# instance fields
.field private mIntValue:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    new-instance v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    const-string v1, "RESET"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->RESET:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    new-instance v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    const-string v1, "PULL_TO_REFRESH"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v3}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->PULL_TO_REFRESH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    new-instance v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    const-string v1, "RELEASE_TO_REFRESH"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4, v4}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->RELEASE_TO_REFRESH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    new-instance v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    const-string v1, "REFRESHING"

    const/4 v5, 0x3

    const/16 v6, 0x8

    invoke-direct {v0, v1, v5, v6}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->REFRESHING:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    new-instance v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    const-string v1, "MANUAL_REFRESHING"

    const/4 v6, 0x4

    const/16 v7, 0x9

    invoke-direct {v0, v1, v6, v7}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->MANUAL_REFRESHING:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    new-instance v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    const-string v1, "OVERSCROLLING"

    const/4 v7, 0x5

    const/16 v8, 0x10

    invoke-direct {v0, v1, v7, v8}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->OVERSCROLLING:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->RESET:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->PULL_TO_REFRESH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->RELEASE_TO_REFRESH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->REFRESHING:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->MANUAL_REFRESHING:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    aput-object v1, v0, v6

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->OVERSCROLLING:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    aput-object v1, v0, v7

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->$VALUES:[Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

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

    iput p3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->mIntValue:I

    return-void
.end method

.method static mapIntToValue(I)Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;
    .locals 5

    invoke-static {}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->values()[Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->getIntValue()I

    move-result v4

    if-ne p0, v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->RESET:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;
    .locals 1

    const-class v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;
    .locals 1

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->$VALUES:[Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    invoke-virtual {v0}, [Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    return-object v0
.end method


# virtual methods
.method getIntValue()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->mIntValue:I

    return v0
.end method
