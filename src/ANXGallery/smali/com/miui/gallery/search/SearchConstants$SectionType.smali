.class public final enum Lcom/miui/gallery/search/SearchConstants$SectionType;
.super Ljava/lang/Enum;
.source "SearchConstants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/SearchConstants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SectionType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/search/SearchConstants$SectionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_ALBUM:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_APP_SCREENSHOT:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_DEFAULT:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_FEATURE:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_FILTER:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_GUIDE:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_HISTORY:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_IMAGE_LIST:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_LOCATION:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_LOCATION_LIST:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_NO_RESULT:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_OCR:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_OTHER:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_PEOPLE:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_RECOMMEND:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_SUGGESTION:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_TAG:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_TAG_LIST:Lcom/miui/gallery/search/SearchConstants$SectionType;

.field public static final enum SECTION_TYPE_WARNING:Lcom/miui/gallery/search/SearchConstants$SectionType;


# instance fields
.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_DEFAULT"

    const-string v2, "default"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_DEFAULT:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_RECOMMEND"

    const-string v2, "recommend"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_RECOMMEND:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_PEOPLE"

    const-string v2, "people"

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_PEOPLE:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_ALBUM"

    const-string v2, "album"

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_ALBUM:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_LOCATION"

    const-string v2, "location"

    const/4 v7, 0x4

    invoke-direct {v0, v1, v7, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_LOCATION:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_TAG"

    const-string v2, "tag"

    const/4 v8, 0x5

    invoke-direct {v0, v1, v8, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_TAG:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_FEATURE"

    const-string v2, "feature"

    const/4 v9, 0x6

    invoke-direct {v0, v1, v9, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_FEATURE:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_LOCATION_LIST"

    const-string v2, "locationList"

    const/4 v10, 0x7

    invoke-direct {v0, v1, v10, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_LOCATION_LIST:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_TAG_LIST"

    const-string v2, "tagList"

    const/16 v11, 0x8

    invoke-direct {v0, v1, v11, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_TAG_LIST:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_IMAGE_LIST"

    const-string v2, "imageList"

    const/16 v12, 0x9

    invoke-direct {v0, v1, v12, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_IMAGE_LIST:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_HISTORY"

    const-string v2, "history"

    const/16 v13, 0xa

    invoke-direct {v0, v1, v13, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_HISTORY:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_WARNING"

    const-string v2, "warning"

    const/16 v14, 0xb

    invoke-direct {v0, v1, v14, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_WARNING:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_FILTER"

    const-string v2, "facet"

    const/16 v15, 0xc

    invoke-direct {v0, v1, v15, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_FILTER:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_OCR"

    const-string v2, "ocr"

    const/16 v15, 0xd

    invoke-direct {v0, v1, v15, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_OCR:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_OTHER"

    const-string v2, "other"

    const/16 v15, 0xe

    invoke-direct {v0, v1, v15, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_OTHER:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_NO_RESULT"

    const-string v2, "noResult"

    const/16 v15, 0xf

    invoke-direct {v0, v1, v15, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_NO_RESULT:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_GUIDE"

    const-string v2, "guide"

    const/16 v15, 0x10

    invoke-direct {v0, v1, v15, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_GUIDE:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_SUGGESTION"

    const-string v2, "suggestion"

    const/16 v15, 0x11

    invoke-direct {v0, v1, v15, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_SUGGESTION:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    const-string v1, "SECTION_TYPE_APP_SCREENSHOT"

    const-string v2, "appScreenshot"

    const/16 v15, 0x12

    invoke-direct {v0, v1, v15, v2}, Lcom/miui/gallery/search/SearchConstants$SectionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_APP_SCREENSHOT:Lcom/miui/gallery/search/SearchConstants$SectionType;

    const/16 v0, 0x13

    new-array v0, v0, [Lcom/miui/gallery/search/SearchConstants$SectionType;

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_DEFAULT:Lcom/miui/gallery/search/SearchConstants$SectionType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_RECOMMEND:Lcom/miui/gallery/search/SearchConstants$SectionType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_PEOPLE:Lcom/miui/gallery/search/SearchConstants$SectionType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_ALBUM:Lcom/miui/gallery/search/SearchConstants$SectionType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_LOCATION:Lcom/miui/gallery/search/SearchConstants$SectionType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_TAG:Lcom/miui/gallery/search/SearchConstants$SectionType;

    aput-object v1, v0, v8

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_FEATURE:Lcom/miui/gallery/search/SearchConstants$SectionType;

    aput-object v1, v0, v9

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_LOCATION_LIST:Lcom/miui/gallery/search/SearchConstants$SectionType;

    aput-object v1, v0, v10

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_TAG_LIST:Lcom/miui/gallery/search/SearchConstants$SectionType;

    aput-object v1, v0, v11

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_IMAGE_LIST:Lcom/miui/gallery/search/SearchConstants$SectionType;

    aput-object v1, v0, v12

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_HISTORY:Lcom/miui/gallery/search/SearchConstants$SectionType;

    aput-object v1, v0, v13

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_WARNING:Lcom/miui/gallery/search/SearchConstants$SectionType;

    aput-object v1, v0, v14

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_FILTER:Lcom/miui/gallery/search/SearchConstants$SectionType;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_OCR:Lcom/miui/gallery/search/SearchConstants$SectionType;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_OTHER:Lcom/miui/gallery/search/SearchConstants$SectionType;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_NO_RESULT:Lcom/miui/gallery/search/SearchConstants$SectionType;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_GUIDE:Lcom/miui/gallery/search/SearchConstants$SectionType;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_SUGGESTION:Lcom/miui/gallery/search/SearchConstants$SectionType;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_APP_SCREENSHOT:Lcom/miui/gallery/search/SearchConstants$SectionType;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sput-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->$VALUES:[Lcom/miui/gallery/search/SearchConstants$SectionType;

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

    iput-object p3, p0, Lcom/miui/gallery/search/SearchConstants$SectionType;->name:Ljava/lang/String;

    return-void
.end method

.method public static fromName(Ljava/lang/String;)Lcom/miui/gallery/search/SearchConstants$SectionType;
    .locals 5

    invoke-static {}, Lcom/miui/gallery/search/SearchConstants$SectionType;->values()[Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    iget-object v4, v3, Lcom/miui/gallery/search/SearchConstants$SectionType;->name:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_DEFAULT:Lcom/miui/gallery/search/SearchConstants$SectionType;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/search/SearchConstants$SectionType;
    .locals 1

    const-class v0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/search/SearchConstants$SectionType;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/search/SearchConstants$SectionType;
    .locals 1

    sget-object v0, Lcom/miui/gallery/search/SearchConstants$SectionType;->$VALUES:[Lcom/miui/gallery/search/SearchConstants$SectionType;

    invoke-virtual {v0}, [Lcom/miui/gallery/search/SearchConstants$SectionType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/search/SearchConstants$SectionType;

    return-object v0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/SearchConstants$SectionType;->name:Ljava/lang/String;

    return-object v0
.end method
