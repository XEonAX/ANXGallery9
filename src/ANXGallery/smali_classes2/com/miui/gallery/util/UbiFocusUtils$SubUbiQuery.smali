.class Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;
.super Lcom/miui/gallery/util/UbiFocusUtils$UbiQuery;
.source "UbiFocusUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/UbiFocusUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SubUbiQuery"
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    invoke-direct {p0}, Lcom/miui/gallery/util/UbiFocusUtils$UbiQuery;-><init>()V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-eqz v2, :cond_3

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ubiLocalId = ? "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_1

    const-string v2, " AND ubiSubIndex = ? "

    goto :goto_0

    :cond_1
    const-string v2, ""

    :goto_0
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->queryString:Ljava/lang/String;

    if-eqz v0, :cond_2

    new-array p1, v3, [Ljava/lang/String;

    aput-object p2, p1, v4

    aput-object p3, p1, v1

    goto :goto_1

    :cond_2
    new-array p1, v1, [Ljava/lang/String;

    aput-object p2, p1, v4

    :goto_1
    iput-object p1, p0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->queryArgs:[Ljava/lang/String;

    goto :goto_6

    :cond_3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_6

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ubiServerId = ? "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_4

    const-string v2, " AND ubiSubIndex = ? "

    goto :goto_2

    :cond_4
    const-string v2, ""

    :goto_2
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->queryString:Ljava/lang/String;

    if-eqz v0, :cond_5

    new-array p2, v3, [Ljava/lang/String;

    aput-object p1, p2, v4

    aput-object p3, p2, v1

    goto :goto_3

    :cond_5
    new-array p2, v1, [Ljava/lang/String;

    aput-object p1, p2, v4

    :goto_3
    iput-object p2, p0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->queryArgs:[Ljava/lang/String;

    goto :goto_6

    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " ( ubiServerId = ? OR ubiLocalId = ? ) "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_7

    const-string v5, " AND ubiSubIndex = ? "

    goto :goto_4

    :cond_7
    const-string v5, ""

    :goto_4
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->queryString:Ljava/lang/String;

    if-eqz v0, :cond_8

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    aput-object p1, v0, v4

    aput-object p2, v0, v1

    aput-object p3, v0, v3

    goto :goto_5

    :cond_8
    new-array v0, v3, [Ljava/lang/String;

    aput-object p1, v0, v4

    aput-object p2, v0, v1

    :goto_5
    iput-object v0, p0, Lcom/miui/gallery/util/UbiFocusUtils$SubUbiQuery;->queryArgs:[Ljava/lang/String;

    :goto_6
    return-void
.end method
