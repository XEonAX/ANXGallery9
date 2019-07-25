.class public final enum Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;
.super Ljava/lang/Enum;
.source "FeatureProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloudcontrol/FeatureProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

.field public static final enum DISABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

.field public static final enum ENABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

.field public static final enum REMOVE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

.field public static final enum UNAVAILABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    const-string v1, "ENABLE"

    const-string v2, "enable"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->ENABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    new-instance v0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    const-string v1, "DISABLE"

    const-string v2, "disable"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->DISABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    new-instance v0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    const-string v1, "REMOVE"

    const-string v2, "remove"

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->REMOVE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    new-instance v0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    const-string v1, "UNAVAILABLE"

    const-string v2, "unavailable"

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->UNAVAILABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    sget-object v1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->ENABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->DISABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->REMOVE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->UNAVAILABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    aput-object v1, v0, v6

    sput-object v0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->$VALUES:[Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->value:Ljava/lang/String;

    return-void
.end method

.method public static fromValue(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;
    .locals 5

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->values()[Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    iget-object v4, v3, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->value:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->UNAVAILABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;
    .locals 1

    const-class v0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->$VALUES:[Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-virtual {v0}, [Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    return-object v0
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->value:Ljava/lang/String;

    return-object v0
.end method
