.class public final enum Lcom/miui/gallery/search/SearchConstants$SearchType;
.super Ljava/lang/Enum;
.source "SearchConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/SearchConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SearchType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/search/SearchConstants$SearchType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/search/SearchConstants$SearchType;

.field public static final enum SEARCH_TYPE_FEEDBACK_LIKELY_RESULT:Lcom/miui/gallery/search/SearchConstants$SearchType;

.field public static final enum SEARCH_TYPE_FILTER:Lcom/miui/gallery/search/SearchConstants$SearchType;

.field public static final enum SEARCH_TYPE_HINT:Lcom/miui/gallery/search/SearchConstants$SearchType;

.field public static final enum SEARCH_TYPE_HISTORY:Lcom/miui/gallery/search/SearchConstants$SearchType;

.field public static final enum SEARCH_TYPE_NAVIGATION:Lcom/miui/gallery/search/SearchConstants$SearchType;

.field public static final enum SEARCH_TYPE_RESULT:Lcom/miui/gallery/search/SearchConstants$SearchType;

.field public static final enum SEARCH_TYPE_RESULT_LIST:Lcom/miui/gallery/search/SearchConstants$SearchType;

.field public static final enum SEARCH_TYPE_SEARCH:Lcom/miui/gallery/search/SearchConstants$SearchType;

.field public static final enum SEARCH_TYPE_SUGGESTION:Lcom/miui/gallery/search/SearchConstants$SearchType;


# instance fields
.field private name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SearchType;

    const-string v1, "SEARCH_TYPE_HINT"

    const-string v2, "hint"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/miui/gallery/search/SearchConstants$SearchType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_HINT:Lcom/miui/gallery/search/SearchConstants$SearchType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SearchType;

    const-string v1, "SEARCH_TYPE_HISTORY"

    const-string v2, "history"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2}, Lcom/miui/gallery/search/SearchConstants$SearchType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_HISTORY:Lcom/miui/gallery/search/SearchConstants$SearchType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SearchType;

    const-string v1, "SEARCH_TYPE_NAVIGATION"

    const-string v2, "navigation"

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2}, Lcom/miui/gallery/search/SearchConstants$SearchType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_NAVIGATION:Lcom/miui/gallery/search/SearchConstants$SearchType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SearchType;

    const-string v1, "SEARCH_TYPE_SUGGESTION"

    const-string v2, "suggestion"

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2}, Lcom/miui/gallery/search/SearchConstants$SearchType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_SUGGESTION:Lcom/miui/gallery/search/SearchConstants$SearchType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SearchType;

    const-string v1, "SEARCH_TYPE_SEARCH"

    const-string v2, "search"

    const/4 v7, 0x4

    invoke-direct {v0, v1, v7, v2}, Lcom/miui/gallery/search/SearchConstants$SearchType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_SEARCH:Lcom/miui/gallery/search/SearchConstants$SearchType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SearchType;

    const-string v1, "SEARCH_TYPE_RESULT"

    const-string v2, "result"

    const/4 v8, 0x5

    invoke-direct {v0, v1, v8, v2}, Lcom/miui/gallery/search/SearchConstants$SearchType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_RESULT:Lcom/miui/gallery/search/SearchConstants$SearchType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SearchType;

    const-string v1, "SEARCH_TYPE_RESULT_LIST"

    const-string v2, "list"

    const/4 v9, 0x6

    invoke-direct {v0, v1, v9, v2}, Lcom/miui/gallery/search/SearchConstants$SearchType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_RESULT_LIST:Lcom/miui/gallery/search/SearchConstants$SearchType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SearchType;

    const-string v1, "SEARCH_TYPE_FILTER"

    const-string v2, "filter"

    const/4 v10, 0x7

    invoke-direct {v0, v1, v10, v2}, Lcom/miui/gallery/search/SearchConstants$SearchType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_FILTER:Lcom/miui/gallery/search/SearchConstants$SearchType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SearchType;

    const-string v1, "SEARCH_TYPE_FEEDBACK_LIKELY_RESULT"

    const-string v2, "likelyResult"

    const/16 v11, 0x8

    invoke-direct {v0, v1, v11, v2}, Lcom/miui/gallery/search/SearchConstants$SearchType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_FEEDBACK_LIKELY_RESULT:Lcom/miui/gallery/search/SearchConstants$SearchType;

    const/16 v0, 0x9

    new-array v0, v0, [Lcom/miui/gallery/search/SearchConstants$SearchType;

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_HINT:Lcom/miui/gallery/search/SearchConstants$SearchType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_HISTORY:Lcom/miui/gallery/search/SearchConstants$SearchType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_NAVIGATION:Lcom/miui/gallery/search/SearchConstants$SearchType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_SUGGESTION:Lcom/miui/gallery/search/SearchConstants$SearchType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_SEARCH:Lcom/miui/gallery/search/SearchConstants$SearchType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_RESULT:Lcom/miui/gallery/search/SearchConstants$SearchType;

    aput-object v1, v0, v8

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_RESULT_LIST:Lcom/miui/gallery/search/SearchConstants$SearchType;

    aput-object v1, v0, v9

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_FILTER:Lcom/miui/gallery/search/SearchConstants$SearchType;

    aput-object v1, v0, v10

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_FEEDBACK_LIKELY_RESULT:Lcom/miui/gallery/search/SearchConstants$SearchType;

    aput-object v1, v0, v11

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->$VALUES:[Lcom/miui/gallery/search/SearchConstants$SearchType;

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

    iput-object p3, p0, Lcom/miui/gallery/search/SearchConstants$SearchType;->name:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/search/SearchConstants$SearchType;
    .locals 1

    const-class v0, Lcom/miui/gallery/search/SearchConstants$SearchType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/search/SearchConstants$SearchType;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/search/SearchConstants$SearchType;
    .locals 1

    sget-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->$VALUES:[Lcom/miui/gallery/search/SearchConstants$SearchType;

    invoke-virtual {v0}, [Lcom/miui/gallery/search/SearchConstants$SearchType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/search/SearchConstants$SearchType;

    return-object v0
.end method
