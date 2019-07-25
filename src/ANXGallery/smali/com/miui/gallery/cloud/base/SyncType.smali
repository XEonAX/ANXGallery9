.class public final enum Lcom/miui/gallery/cloud/base/SyncType;
.super Ljava/lang/Enum;
.source "SyncType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/cloud/base/SyncType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/cloud/base/SyncType;

.field public static final enum BACKGROUND:Lcom/miui/gallery/cloud/base/SyncType;

.field public static final enum GPRS_FORCE:Lcom/miui/gallery/cloud/base/SyncType;

.field public static final enum NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

.field public static final enum POWER_FORCE:Lcom/miui/gallery/cloud/base/SyncType;

.field public static final enum UNKNOW:Lcom/miui/gallery/cloud/base/SyncType;


# instance fields
.field private mIdentifier:Ljava/lang/String;

.field private mIsForce:Z


# direct methods
.method static constructor <clinit>()V
    .locals 8

    new-instance v0, Lcom/miui/gallery/cloud/base/SyncType;

    const-string v1, "UNKNOW"

    const-string v2, "unknow"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2, v3}, Lcom/miui/gallery/cloud/base/SyncType;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    sput-object v0, Lcom/miui/gallery/cloud/base/SyncType;->UNKNOW:Lcom/miui/gallery/cloud/base/SyncType;

    new-instance v0, Lcom/miui/gallery/cloud/base/SyncType;

    const-string v1, "BACKGROUND"

    const-string v2, "auto-background"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/miui/gallery/cloud/base/SyncType;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    sput-object v0, Lcom/miui/gallery/cloud/base/SyncType;->BACKGROUND:Lcom/miui/gallery/cloud/base/SyncType;

    new-instance v0, Lcom/miui/gallery/cloud/base/SyncType;

    const-string v1, "NORMAL"

    const-string v2, "auto-foreground"

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2, v3}, Lcom/miui/gallery/cloud/base/SyncType;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    sput-object v0, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    new-instance v0, Lcom/miui/gallery/cloud/base/SyncType;

    const-string v1, "POWER_FORCE"

    const-string v2, "manual-battery"

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2, v4}, Lcom/miui/gallery/cloud/base/SyncType;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    sput-object v0, Lcom/miui/gallery/cloud/base/SyncType;->POWER_FORCE:Lcom/miui/gallery/cloud/base/SyncType;

    new-instance v0, Lcom/miui/gallery/cloud/base/SyncType;

    const-string v1, "GPRS_FORCE"

    const-string v2, "manual-network"

    const/4 v7, 0x4

    invoke-direct {v0, v1, v7, v2, v4}, Lcom/miui/gallery/cloud/base/SyncType;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    sput-object v0, Lcom/miui/gallery/cloud/base/SyncType;->GPRS_FORCE:Lcom/miui/gallery/cloud/base/SyncType;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/miui/gallery/cloud/base/SyncType;

    sget-object v1, Lcom/miui/gallery/cloud/base/SyncType;->UNKNOW:Lcom/miui/gallery/cloud/base/SyncType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/cloud/base/SyncType;->BACKGROUND:Lcom/miui/gallery/cloud/base/SyncType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/cloud/base/SyncType;->POWER_FORCE:Lcom/miui/gallery/cloud/base/SyncType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/miui/gallery/cloud/base/SyncType;->GPRS_FORCE:Lcom/miui/gallery/cloud/base/SyncType;

    aput-object v1, v0, v7

    sput-object v0, Lcom/miui/gallery/cloud/base/SyncType;->$VALUES:[Lcom/miui/gallery/cloud/base/SyncType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/miui/gallery/cloud/base/SyncType;->mIdentifier:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/miui/gallery/cloud/base/SyncType;->mIsForce:Z

    return-void
.end method

.method public static compare(Lcom/miui/gallery/cloud/base/SyncType;Lcom/miui/gallery/cloud/base/SyncType;)I
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/base/SyncType;->ordinal()I

    move-result p0

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncType;->ordinal()I

    move-result p1

    sub-int/2addr p0, p1

    return p0
.end method

.method public static fromIdentifier(Ljava/lang/String;)Lcom/miui/gallery/cloud/base/SyncType;
    .locals 5

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lcom/miui/gallery/cloud/base/SyncType;->UNKNOW:Lcom/miui/gallery/cloud/base/SyncType;

    return-object p0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/base/SyncType;->values()[Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lcom/miui/gallery/cloud/base/SyncType;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    return-object v3

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    sget-object p0, Lcom/miui/gallery/cloud/base/SyncType;->UNKNOW:Lcom/miui/gallery/cloud/base/SyncType;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/cloud/base/SyncType;
    .locals 1

    const-class v0, Lcom/miui/gallery/cloud/base/SyncType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloud/base/SyncType;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/cloud/base/SyncType;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/base/SyncType;->$VALUES:[Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {v0}, [Lcom/miui/gallery/cloud/base/SyncType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/cloud/base/SyncType;

    return-object v0
.end method


# virtual methods
.method public getIdentifier()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/base/SyncType;->mIdentifier:Ljava/lang/String;

    return-object v0
.end method

.method public isForce()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloud/base/SyncType;->mIsForce:Z

    return v0
.end method
