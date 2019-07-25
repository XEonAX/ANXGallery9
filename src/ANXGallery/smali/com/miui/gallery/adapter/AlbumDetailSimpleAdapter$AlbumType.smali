.class public final enum Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;
.super Ljava/lang/Enum;
.source "AlbumDetailSimpleAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AlbumType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

.field public static final enum BABY:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

.field public static final enum FAVORITES:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

.field public static final enum NORMAL:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

.field public static final enum OTHER_SHARE:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

.field public static final enum PANO:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

.field public static final enum RECENT:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

.field public static final enum SCREENSHOT:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

.field public static final enum SECRET:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    new-instance v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    const-string v1, "NORMAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->NORMAL:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    new-instance v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    const-string v1, "SECRET"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->SECRET:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    new-instance v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    const-string v1, "BABY"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->BABY:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    new-instance v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    const-string v1, "SCREENSHOT"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->SCREENSHOT:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    new-instance v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    const-string v1, "OTHER_SHARE"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->OTHER_SHARE:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    new-instance v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    const-string v1, "PANO"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->PANO:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    new-instance v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    const-string v1, "RECENT"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->RECENT:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    new-instance v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    const-string v1, "FAVORITES"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->FAVORITES:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    const/16 v0, 0x8

    new-array v0, v0, [Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->NORMAL:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->SECRET:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->BABY:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->SCREENSHOT:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->OTHER_SHARE:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->PANO:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->RECENT:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    aput-object v1, v0, v8

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->FAVORITES:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    aput-object v1, v0, v9

    sput-object v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->$VALUES:[Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;
    .locals 1

    const-class v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;
    .locals 1

    sget-object v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->$VALUES:[Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {v0}, [Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    return-object v0
.end method
