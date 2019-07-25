.class public Lcom/miui/gallery/lib/MiuiGalleryUtils;
.super Ljava/lang/Object;
.source "MiuiGalleryUtils.java"


# static fields
.field private static final ALBUM_SHARE_BARCODE_URLS:[Ljava/lang/String;

.field private static final ALBUM_SHARE_BARCODE_URL_PATTERNS:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/regex/Pattern;",
            ">;"
        }
    .end annotation
.end field

.field private static final ALBUM_SHARE_BARCODE_URL_STRICT_PATTERNS:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/regex/Pattern;",
            ">;"
        }
    .end annotation
.end field

.field private static final ALBUM_SHARE_INVITATION_URLS:[Ljava/lang/String;

.field private static final ALBUM_SHARE_INVITATION_URL_PATTERNS:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/regex/Pattern;",
            ">;"
        }
    .end annotation
.end field

.field private static final ALBUM_SHARE_INVITATION_URL_STRICT_PATTERNS:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/regex/Pattern;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-string v0, "http://mij.cc/[a-z]+/[a-zA-Z0-9\\-_]{16}#a"

    const-string v1, "http://mi1.cc/[a-zA-Z0-9\\-_]{16}#a"

    const/4 v2, 0x0

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/lib/MiuiGalleryUtils;->ALBUM_SHARE_INVITATION_URLS:[Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/lib/MiuiGalleryUtils;->ALBUM_SHARE_INVITATION_URLS:[Ljava/lang/String;

    sput-object v0, Lcom/miui/gallery/lib/MiuiGalleryUtils;->ALBUM_SHARE_BARCODE_URLS:[Ljava/lang/String;

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/lib/MiuiGalleryUtils;->ALBUM_SHARE_INVITATION_URL_PATTERNS:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/lib/MiuiGalleryUtils;->ALBUM_SHARE_INVITATION_URL_STRICT_PATTERNS:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/lib/MiuiGalleryUtils;->ALBUM_SHARE_BARCODE_URL_PATTERNS:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/lib/MiuiGalleryUtils;->ALBUM_SHARE_BARCODE_URL_STRICT_PATTERNS:Ljava/util/ArrayList;

    sget-object v0, Lcom/miui/gallery/lib/MiuiGalleryUtils;->ALBUM_SHARE_INVITATION_URLS:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/lib/MiuiGalleryUtils;->ALBUM_SHARE_INVITATION_URL_PATTERNS:Ljava/util/ArrayList;

    sget-object v2, Lcom/miui/gallery/lib/MiuiGalleryUtils;->ALBUM_SHARE_INVITATION_URL_STRICT_PATTERNS:Ljava/util/ArrayList;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/lib/MiuiGalleryUtils;->initPatterns([Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    sget-object v0, Lcom/miui/gallery/lib/MiuiGalleryUtils;->ALBUM_SHARE_BARCODE_URLS:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/lib/MiuiGalleryUtils;->ALBUM_SHARE_BARCODE_URL_PATTERNS:Ljava/util/ArrayList;

    sget-object v2, Lcom/miui/gallery/lib/MiuiGalleryUtils;->ALBUM_SHARE_BARCODE_URL_STRICT_PATTERNS:Ljava/util/ArrayList;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/lib/MiuiGalleryUtils;->initPatterns([Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    return-void
.end method

.method private static hasMatch(Ljava/util/ArrayList;Ljava/lang/String;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/util/regex/Pattern;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_2
    return v1
.end method

.method private static initPatterns([Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/util/regex/Pattern;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/util/regex/Pattern;",
            ">;)V"
        }
    .end annotation

    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p0, v2

    if-eqz v3, :cond_0

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v4, "^%s$"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v3, v5, v1

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static isAlbumShareBarcodeUrl(Ljava/lang/String;)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/lib/MiuiGalleryUtils;->ALBUM_SHARE_BARCODE_URL_STRICT_PATTERNS:Ljava/util/ArrayList;

    invoke-static {v0, p0}, Lcom/miui/gallery/lib/MiuiGalleryUtils;->hasMatch(Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static isAlbumShareInvitationUrl(Ljava/lang/String;)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/lib/MiuiGalleryUtils;->ALBUM_SHARE_INVITATION_URL_STRICT_PATTERNS:Ljava/util/ArrayList;

    invoke-static {v0, p0}, Lcom/miui/gallery/lib/MiuiGalleryUtils;->hasMatch(Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static isAlbumShareUrl(Ljava/lang/String;)Z
    .locals 1

    invoke-static {p0}, Lcom/miui/gallery/lib/MiuiGalleryUtils;->isAlbumShareInvitationUrl(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/miui/gallery/lib/MiuiGalleryUtils;->isAlbumShareBarcodeUrl(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method
