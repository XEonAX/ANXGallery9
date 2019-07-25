.class public Lcom/miui/gallery/loader/SearchResultSetLoader;
.super Lcom/miui/gallery/loader/CloudSetLoader;
.source "SearchResultSetLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;
    }
.end annotation


# instance fields
.field private mIds:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 0

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/loader/CloudSetLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)V

    if-eqz p3, :cond_0

    const-string p1, "photo_selection_args"

    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/loader/SearchResultSetLoader;->mIds:[Ljava/lang/String;

    :cond_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/loader/SearchResultSetLoader;->mUnfoldBurst:Z

    return-void
.end method


# virtual methods
.method protected getOrder()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getSelection()Ljava/lang/String;
    .locals 5

    const-string v0, "%s in (%s) AND %s != %s"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "_id"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/loader/SearchResultSetLoader;->mIds:[Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/loader/SearchResultSetLoader;->mIds:[Ljava/lang/String;

    array-length v2, v2

    if-lez v2, :cond_0

    const-string v2, ","

    iget-object v3, p0, Lcom/miui/gallery/loader/SearchResultSetLoader;->mIds:[Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    const-string v2, ""

    :goto_0
    const/4 v3, 0x1

    aput-object v2, v1, v3

    const/4 v2, 0x2

    const-string v3, "localGroupId"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-wide/16 v3, -0x3e8

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSelectionArgs()[Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getTAG()Ljava/lang/String;
    .locals 1

    const-string v0, "SearchResultSetLoader"

    return-object v0
.end method

.method protected wrapDataSet(Landroid/database/Cursor;)Lcom/miui/gallery/model/CursorDataSet;
    .locals 3

    new-instance v0, Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;

    iget-object v1, p0, Lcom/miui/gallery/loader/SearchResultSetLoader;->mIds:[Ljava/lang/String;

    iget v2, p0, Lcom/miui/gallery/loader/SearchResultSetLoader;->mInitPos:I

    invoke-direct {v0, v1, p1, v2}, Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;-><init>([Ljava/lang/String;Landroid/database/Cursor;I)V

    return-object v0
.end method
