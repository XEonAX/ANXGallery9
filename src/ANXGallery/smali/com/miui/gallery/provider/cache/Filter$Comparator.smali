.class public final enum Lcom/miui/gallery/provider/cache/Filter$Comparator;
.super Ljava/lang/Enum;
.source "Filter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Comparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/provider/cache/Filter$Comparator;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/provider/cache/Filter$Comparator;

.field public static final enum EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

.field public static final enum GREATER:Lcom/miui/gallery/provider/cache/Filter$Comparator;

.field public static final enum GREATER_OR_EQUAL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

.field public static final enum IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

.field public static final enum IS_NULL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

.field public static final enum LESS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

.field public static final enum LESS_OR_EQUAL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

.field public static final enum LIKE:Lcom/miui/gallery/provider/cache/Filter$Comparator;

.field public static final enum NOT_EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

.field public static final enum NOT_IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

.field public static final enum NOT_NULL:Lcom/miui/gallery/provider/cache/Filter$Comparator;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    new-instance v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;

    const-string v1, "GREATER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/provider/cache/Filter$Comparator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->GREATER:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    new-instance v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;

    const-string v1, "GREATER_OR_EQUAL"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/provider/cache/Filter$Comparator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->GREATER_OR_EQUAL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    new-instance v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;

    const-string v1, "LESS"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/miui/gallery/provider/cache/Filter$Comparator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->LESS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    new-instance v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;

    const-string v1, "LESS_OR_EQUAL"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/miui/gallery/provider/cache/Filter$Comparator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->LESS_OR_EQUAL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    new-instance v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;

    const-string v1, "EQUALS"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/miui/gallery/provider/cache/Filter$Comparator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    new-instance v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;

    const-string v1, "NOT_EQUALS"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/miui/gallery/provider/cache/Filter$Comparator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    new-instance v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;

    const-string v1, "IN"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lcom/miui/gallery/provider/cache/Filter$Comparator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    new-instance v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;

    const-string v1, "NOT_IN"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9}, Lcom/miui/gallery/provider/cache/Filter$Comparator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    new-instance v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;

    const-string v1, "IS_NULL"

    const/16 v10, 0x8

    invoke-direct {v0, v1, v10}, Lcom/miui/gallery/provider/cache/Filter$Comparator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->IS_NULL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    new-instance v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;

    const-string v1, "NOT_NULL"

    const/16 v11, 0x9

    invoke-direct {v0, v1, v11}, Lcom/miui/gallery/provider/cache/Filter$Comparator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_NULL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    new-instance v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;

    const-string v1, "LIKE"

    const/16 v12, 0xa

    invoke-direct {v0, v1, v12}, Lcom/miui/gallery/provider/cache/Filter$Comparator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->LIKE:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    const/16 v0, 0xb

    new-array v0, v0, [Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->GREATER:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->GREATER_OR_EQUAL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->LESS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->LESS_OR_EQUAL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    aput-object v1, v0, v6

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    aput-object v1, v0, v7

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    aput-object v1, v0, v8

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    aput-object v1, v0, v9

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->IS_NULL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    aput-object v1, v0, v10

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_NULL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    aput-object v1, v0, v11

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->LIKE:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    aput-object v1, v0, v12

    sput-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->$VALUES:[Lcom/miui/gallery/provider/cache/Filter$Comparator;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method static from(Ljava/lang/String;)Lcom/miui/gallery/provider/cache/Filter$Comparator;
    .locals 4

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x3c

    const/16 v3, 0x3d

    if-ne v0, v2, :cond_0

    if-ne v1, v3, :cond_0

    sget-object p0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->LESS_OR_EQUAL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    return-object p0

    :cond_0
    if-ne v0, v2, :cond_1

    sget-object p0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->LESS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    return-object p0

    :cond_1
    const/16 v2, 0x3e

    if-ne v0, v2, :cond_2

    if-ne v1, v3, :cond_2

    sget-object p0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->GREATER_OR_EQUAL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    return-object p0

    :cond_2
    if-ne v0, v2, :cond_3

    sget-object p0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->GREATER:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    return-object p0

    :cond_3
    if-ne v0, v3, :cond_4

    sget-object p0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    return-object p0

    :cond_4
    const/16 v2, 0x21

    if-ne v0, v2, :cond_5

    sget-object p0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    return-object p0

    :cond_5
    const/16 v2, 0x6e

    if-eq v1, v2, :cond_e

    const/16 v2, 0x4e

    if-ne v1, v2, :cond_6

    goto :goto_3

    :cond_6
    const/16 p0, 0x6c

    if-eq v1, p0, :cond_b

    const/16 v2, 0x4c

    if-ne v1, v2, :cond_7

    goto :goto_1

    :cond_7
    if-eq v0, p0, :cond_8

    if-ne v0, v2, :cond_9

    :cond_8
    const/16 p0, 0x45

    if-eq v1, p0, :cond_a

    const/16 p0, 0x65

    if-ne v1, p0, :cond_9

    goto :goto_0

    :cond_9
    const/4 p0, 0x0

    return-object p0

    :cond_a
    :goto_0
    sget-object p0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->LIKE:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    return-object p0

    :cond_b
    :goto_1
    const/16 p0, 0x69

    if-eq v0, p0, :cond_d

    const/16 p0, 0x49

    if-ne v0, p0, :cond_c

    goto :goto_2

    :cond_c
    sget-object p0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_NULL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    return-object p0

    :cond_d
    :goto_2
    sget-object p0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->IS_NULL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    return-object p0

    :cond_e
    :goto_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    const/4 v0, 0x2

    if-le p0, v0, :cond_f

    sget-object p0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    return-object p0

    :cond_f
    sget-object p0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/provider/cache/Filter$Comparator;
    .locals 1

    const-class v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/provider/cache/Filter$Comparator;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/provider/cache/Filter$Comparator;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->$VALUES:[Lcom/miui/gallery/provider/cache/Filter$Comparator;

    invoke-virtual {v0}, [Lcom/miui/gallery/provider/cache/Filter$Comparator;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/provider/cache/Filter$Comparator;

    return-object v0
.end method
