.class public final Lcom/miui/gallery/util/FileSizeFormatter;
.super Ljava/lang/Object;
.source "FileSizeFormatter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/FileSizeFormatter$BytesResult;
    }
.end annotation


# direct methods
.method private static bidiWrap(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    invoke-static {p0}, Lcom/miui/gallery/util/FileSizeFormatter;->localeFromContext(Landroid/content/Context;)Ljava/util/Locale;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->getLayoutDirectionFromLocale(Ljava/util/Locale;)I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    invoke-static {v0}, Landroid/text/BidiFormatter;->getInstance(Z)Landroid/text/BidiFormatter;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/text/BidiFormatter;->unicodeWrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    return-object p1
.end method

.method public static formatBytes(Landroid/content/res/Resources;JI)Lcom/miui/gallery/util/FileSizeFormatter$BytesResult;
    .locals 15

    move-wide/from16 v0, p1

    and-int/lit8 v3, p3, 0x8

    if-eqz v3, :cond_0

    const/16 v3, 0x400

    goto :goto_0

    :cond_0
    const/16 v3, 0x3e8

    :goto_0
    const-wide/16 v4, 0x0

    cmp-long v6, v0, v4

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-gez v6, :cond_1

    const/4 v6, 0x1

    goto :goto_1

    :cond_1
    const/4 v6, 0x0

    :goto_1
    if-eqz v6, :cond_2

    neg-long v0, v0

    :cond_2
    long-to-float v0, v0

    const v1, 0x7f1000d3

    const/high16 v9, 0x44610000    # 900.0f

    cmpl-float v10, v0, v9

    const-wide/16 v11, 0x1

    if-lez v10, :cond_3

    const v1, 0x7f100444

    int-to-long v13, v3

    int-to-float v10, v3

    div-float/2addr v0, v10

    goto :goto_2

    :cond_3
    move-wide v13, v11

    :goto_2
    cmpl-float v10, v0, v9

    if-lez v10, :cond_4

    const v1, 0x7f10046a

    int-to-long v4, v3

    mul-long v13, v13, v4

    int-to-float v4, v3

    div-float/2addr v0, v4

    :cond_4
    cmpl-float v4, v0, v9

    if-lez v4, :cond_5

    const v1, 0x7f100406

    int-to-long v4, v3

    mul-long v13, v13, v4

    int-to-float v4, v3

    div-float/2addr v0, v4

    :cond_5
    cmpl-float v4, v0, v9

    if-lez v4, :cond_6

    const v1, 0x7f1006ce

    int-to-long v4, v3

    mul-long v13, v13, v4

    int-to-float v4, v3

    div-float/2addr v0, v4

    :cond_6
    cmpl-float v4, v0, v9

    if-lez v4, :cond_7

    const v1, 0x7f10050f

    int-to-long v4, v3

    mul-long v13, v13, v4

    int-to-float v3, v3

    div-float/2addr v0, v3

    :cond_7
    cmp-long v3, v13, v11

    const/16 v4, 0x64

    if-eqz v3, :cond_d

    const/high16 v3, 0x42c80000    # 100.0f

    cmpl-float v3, v0, v3

    if-ltz v3, :cond_8

    goto :goto_3

    :cond_8
    const/high16 v3, 0x3f800000    # 1.0f

    cmpg-float v3, v0, v3

    if-gez v3, :cond_9

    const-string v3, "%.2f"

    goto :goto_5

    :cond_9
    const/high16 v3, 0x41200000    # 10.0f

    cmpg-float v3, v0, v3

    if-gez v3, :cond_b

    and-int/lit8 v3, p3, 0x1

    if-eqz v3, :cond_a

    const/16 v3, 0xa

    const-string v4, "%.1f"

    move-object v3, v4

    const/16 v4, 0xa

    goto :goto_5

    :cond_a
    const-string v3, "%.2f"

    goto :goto_5

    :cond_b
    and-int/lit8 v3, p3, 0x1

    if-eqz v3, :cond_c

    const-string v3, "%.0f"

    goto :goto_4

    :cond_c
    const-string v3, "%.2f"

    goto :goto_5

    :cond_d
    :goto_3
    const-string v3, "%.0f"

    :goto_4
    const/4 v4, 0x1

    :goto_5
    if-eqz v6, :cond_e

    neg-float v0, v0

    :cond_e
    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x2e

    const/4 v9, 0x3

    const/16 v10, 0x30

    const/4 v11, 0x2

    if-le v5, v9, :cond_f

    add-int/lit8 v9, v5, -0x3

    invoke-virtual {v3, v9}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-ne v12, v6, :cond_f

    add-int/lit8 v12, v5, -0x2

    invoke-virtual {v3, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-ne v12, v10, :cond_f

    add-int/lit8 v12, v5, -0x1

    invoke-virtual {v3, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-ne v12, v10, :cond_f

    invoke-virtual {v3, v7, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_6

    :cond_f
    if-le v5, v11, :cond_10

    add-int/lit8 v9, v5, -0x2

    invoke-virtual {v3, v9}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-ne v12, v6, :cond_10

    sub-int/2addr v5, v8

    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v10, :cond_10

    invoke-virtual {v3, v7, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    :cond_10
    :goto_6
    and-int/lit8 v2, p3, 0x2

    if-nez v2, :cond_11

    const-wide/16 v4, 0x0

    :goto_7
    move-object v0, p0

    goto :goto_8

    :cond_11
    int-to-float v2, v4

    mul-float v0, v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    int-to-long v5, v0

    mul-long v5, v5, v13

    int-to-long v7, v4

    div-long v4, v5, v7

    goto :goto_7

    :goto_8
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/util/FileSizeFormatter$BytesResult;

    invoke-direct {v1, v3, v0, v4, v5}, Lcom/miui/gallery/util/FileSizeFormatter$BytesResult;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    return-object v1
.end method

.method public static formatShortFileSize(Landroid/content/Context;J)Ljava/lang/String;
    .locals 3

    if-nez p0, :cond_0

    const-string p0, ""

    return-object p0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/16 v1, 0x9

    invoke-static {v0, p1, p2, v1}, Lcom/miui/gallery/util/FileSizeFormatter;->formatBytes(Landroid/content/res/Resources;JI)Lcom/miui/gallery/util/FileSizeFormatter$BytesResult;

    move-result-object p1

    const p2, 0x7f1003a9

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p1, Lcom/miui/gallery/util/FileSizeFormatter$BytesResult;->value:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object p1, p1, Lcom/miui/gallery/util/FileSizeFormatter$BytesResult;->units:Ljava/lang/String;

    aput-object p1, v0, v1

    invoke-virtual {p0, p2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/miui/gallery/util/FileSizeFormatter;->bidiWrap(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static localeFromContext(Landroid/content/Context;)Ljava/util/Locale;
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Configuration;->getLocales()Landroid/os/LocaleList;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    return-object p0
.end method
