.class Lcom/miui/gallery/util/UbiFocusUtils$MainUbiQuery;
.super Lcom/miui/gallery/util/UbiFocusUtils$UbiQuery;
.source "UbiFocusUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/UbiFocusUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MainUbiQuery"
.end annotation


# direct methods
.method constructor <init>(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 4

    invoke-direct {p0}, Lcom/miui/gallery/util/UbiFocusUtils$UbiQuery;-><init>()V

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    const-string p1, "shareId"

    goto :goto_0

    :cond_1
    const-string p1, "serverId"

    :goto_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    const-string p1, "_id = ? "

    iput-object p1, p0, Lcom/miui/gallery/util/UbiFocusUtils$MainUbiQuery;->queryString:Ljava/lang/String;

    new-array p1, v2, [Ljava/lang/String;

    aput-object p3, p1, v1

    iput-object p1, p0, Lcom/miui/gallery/util/UbiFocusUtils$MainUbiQuery;->queryArgs:[Ljava/lang/String;

    goto :goto_1

    :cond_2
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " = ? "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/util/UbiFocusUtils$MainUbiQuery;->queryString:Ljava/lang/String;

    new-array p1, v2, [Ljava/lang/String;

    aput-object p2, p1, v1

    iput-object p1, p0, Lcom/miui/gallery/util/UbiFocusUtils$MainUbiQuery;->queryArgs:[Ljava/lang/String;

    goto :goto_1

    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " ( "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " = ? OR "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "_id"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " = ? ) "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/util/UbiFocusUtils$MainUbiQuery;->queryString:Ljava/lang/String;

    const/4 p1, 0x2

    new-array p1, p1, [Ljava/lang/String;

    aput-object p2, p1, v1

    aput-object p3, p1, v2

    iput-object p1, p0, Lcom/miui/gallery/util/UbiFocusUtils$MainUbiQuery;->queryArgs:[Ljava/lang/String;

    :goto_1
    return-void
.end method
