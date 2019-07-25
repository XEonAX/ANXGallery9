.class Lcom/miui/gallery/provider/cache/SearchHistoryItem;
.super Ljava/lang/Object;
.source "SearchHistoryItem.java"

# interfaces
.implements Lcom/miui/gallery/provider/cache/CacheItem;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/cache/SearchHistoryItem$QueryFactory;,
        Lcom/miui/gallery/provider/cache/SearchHistoryItem$Generator;
    }
.end annotation


# static fields
.field private static final COLUMN_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final COLUMN_MAPPER:Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

.field protected static final PROJECTION:[Ljava/lang/String;


# instance fields
.field public icon:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "icon"
    .end annotation
.end field

.field public intentActionURI:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "url"
    .end annotation
.end field

.field public subTitle:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "subtitle"
    .end annotation
.end field

.field public timestamp:Ljava/lang/Long;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "timestamp"
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "title"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const-string v0, "title"

    const-string v1, "subTitle"

    const-string v2, "actionUri"

    const-string v3, "icon"

    const-string v4, "timestamp"

    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->PROJECTION:[Ljava/lang/String;

    new-instance v0, Landroid/util/ArrayMap;

    sget-object v1, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->PROJECTION:[Ljava/lang/String;

    array-length v1, v1

    invoke-direct {v0, v1}, Landroid/util/ArrayMap;-><init>(I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->COLUMN_MAP:Ljava/util/Map;

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "title"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "subTitle"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "actionUri"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "icon"

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "timestamp"

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/miui/gallery/provider/cache/SearchHistoryItem$1;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/SearchHistoryItem$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->COLUMN_MAPPER:Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/Map;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->COLUMN_MAP:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$100()Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->COLUMN_MAPPER:Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    return-object v0
.end method


# virtual methods
.method public fillWindow(Landroid/database/CursorWindow;III)Z
    .locals 1

    if-nez p4, :cond_0

    iget-object p4, p0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->title:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    return p1

    :cond_0
    const/4 v0, 0x1

    if-ne p4, v0, :cond_1

    iget-object p4, p0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->subTitle:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    return p1

    :cond_1
    const/4 v0, 0x2

    if-ne p4, v0, :cond_2

    iget-object p4, p0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->intentActionURI:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    return p1

    :cond_2
    const/4 v0, 0x3

    if-ne p4, v0, :cond_3

    iget-object p4, p0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->icon:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    return p1

    :cond_3
    const/4 v0, 0x4

    if-ne p4, v0, :cond_4

    iget-object p4, p0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->timestamp:Ljava/lang/Long;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    return p1

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, " not recognized column."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public get(IZ)Ljava/lang/Object;
    .locals 0

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->title:Ljava/lang/String;

    return-object p1

    :cond_0
    const/4 p2, 0x1

    if-ne p1, p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->subTitle:Ljava/lang/String;

    return-object p1

    :cond_1
    const/4 p2, 0x2

    if-ne p1, p2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->intentActionURI:Ljava/lang/String;

    return-object p1

    :cond_2
    const/4 p2, 0x3

    if-ne p1, p2, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->icon:Ljava/lang/String;

    return-object p1

    :cond_3
    const/4 p2, 0x4

    if-ne p1, p2, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->timestamp:Ljava/lang/Long;

    return-object p1

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, " not recognized column."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getType(I)I
    .locals 3

    const/4 v0, 0x3

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    return v0

    :cond_1
    const/4 v2, 0x2

    if-ne p1, v2, :cond_2

    return v0

    :cond_2
    if-ne p1, v0, :cond_3

    return v0

    :cond_3
    const/4 v0, 0x4

    if-ne p1, v0, :cond_4

    return v1

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, " not recognized column."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
