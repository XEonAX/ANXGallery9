.class public final enum Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;
.super Ljava/lang/Enum;
.source "PullToRefreshBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Mode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

.field public static final enum BOTH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

.field public static final enum DISABLED:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

.field public static final enum MANUAL_REFRESH_ONLY:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

.field public static PULL_DOWN_TO_REFRESH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

.field public static final enum PULL_FROM_END:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

.field public static final enum PULL_FROM_START:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

.field public static PULL_UP_TO_REFRESH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;


# instance fields
.field private mIntValue:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    const-string v1, "DISABLED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->DISABLED:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    new-instance v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    const-string v1, "PULL_FROM_START"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v3}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_START:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    new-instance v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    const-string v1, "PULL_FROM_END"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4, v4}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_END:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    new-instance v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    const-string v1, "BOTH"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5, v5}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->BOTH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    new-instance v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    const-string v1, "MANUAL_REFRESH_ONLY"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6, v6}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->MANUAL_REFRESH_ONLY:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->DISABLED:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_START:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_END:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->BOTH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->MANUAL_REFRESH_ONLY:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    aput-object v1, v0, v6

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->$VALUES:[Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_START:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_DOWN_TO_REFRESH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_END:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_UP_TO_REFRESH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

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

    iput p3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->mIntValue:I

    return-void
.end method

.method static getDefault()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;
    .locals 1

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_START:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    return-object v0
.end method

.method static mapIntToValue(I)Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;
    .locals 5

    invoke-static {}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->values()[Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->getIntValue()I

    move-result v4

    if-ne p0, v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->getDefault()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;
    .locals 1

    const-class v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;
    .locals 1

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->$VALUES:[Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v0}, [Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    return-object v0
.end method


# virtual methods
.method getIntValue()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->mIntValue:I

    return v0
.end method

.method permitsPullToRefresh()Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->DISABLED:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    if-eq p0, v0, :cond_0

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->MANUAL_REFRESH_ONLY:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    if-eq p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public showFooterLoadingLayout()Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_END:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->BOTH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->MANUAL_REFRESH_ONLY:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public showHeaderLoadingLayout()Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_START:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->BOTH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
