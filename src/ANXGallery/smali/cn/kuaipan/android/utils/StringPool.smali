.class public final Lcn/kuaipan/android/utils/StringPool;
.super Ljava/lang/Object;
.source "StringPool.java"


# instance fields
.field private final pool:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x200

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcn/kuaipan/android/utils/StringPool;->pool:[Ljava/lang/String;

    return-void
.end method

.method private static contentEquals(Ljava/lang/String;[CII)Z
    .locals 4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-eq v0, p3, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-ge v0, p3, :cond_2

    add-int v2, p2, v0

    aget-char v2, p1, v2

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_1

    return v1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public get([CII)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    move v0, p2

    const/4 v1, 0x0

    :goto_0
    add-int v2, p2, p3

    if-ge v0, v2, :cond_0

    mul-int/lit8 v1, v1, 0x1f

    aget-char v2, p1, v0

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    ushr-int/lit8 v0, v1, 0x14

    ushr-int/lit8 v2, v1, 0xc

    xor-int/2addr v0, v2

    xor-int/2addr v0, v1

    ushr-int/lit8 v1, v0, 0x7

    ushr-int/lit8 v2, v0, 0x4

    xor-int/2addr v1, v2

    xor-int/2addr v0, v1

    iget-object v1, p0, Lcn/kuaipan/android/utils/StringPool;->pool:[Ljava/lang/String;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    and-int/2addr v0, v1

    iget-object v1, p0, Lcn/kuaipan/android/utils/StringPool;->pool:[Ljava/lang/String;

    aget-object v1, v1, v0

    if-eqz v1, :cond_1

    invoke-static {v1, p1, p2, p3}, Lcn/kuaipan/android/utils/StringPool;->contentEquals(Ljava/lang/String;[CII)Z

    move-result v2

    if-eqz v2, :cond_1

    return-object v1

    :cond_1
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    iget-object p1, p0, Lcn/kuaipan/android/utils/StringPool;->pool:[Ljava/lang/String;

    aput-object v1, p1, v0

    return-object v1
.end method
