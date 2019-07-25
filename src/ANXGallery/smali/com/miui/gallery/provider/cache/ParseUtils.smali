.class Lcom/miui/gallery/provider/cache/ParseUtils;
.super Ljava/lang/Object;
.source "ParseUtils.java"


# direct methods
.method public static getBlob(Landroid/database/Cursor;I)[B
    .locals 1

    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object p0

    return-object p0
.end method

.method public static getChar(Landroid/database/Cursor;I)Ljava/lang/Character;
    .locals 2

    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    return-object v1

    :cond_1
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-static {p0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p0

    return-object p0
.end method

.method public static getInt(Landroid/database/Cursor;I)Ljava/lang/Integer;
    .locals 1

    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static getLong(Landroid/database/Cursor;I)Ljava/lang/Long;
    .locals 1

    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public static getString(Landroid/database/Cursor;I)Ljava/lang/String;
    .locals 1

    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static putBlob(Landroid/database/CursorWindow;[BII)Z
    .locals 0

    if-nez p1, :cond_0

    invoke-virtual {p0, p2, p3}, Landroid/database/CursorWindow;->putNull(II)Z

    move-result p0

    return p0

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Landroid/database/CursorWindow;->putBlob([BII)Z

    move-result p0

    return p0
.end method

.method public static putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z
    .locals 2

    if-nez p1, :cond_0

    invoke-virtual {p0, p2, p3}, Landroid/database/CursorWindow;->putNull(II)Z

    move-result p0

    return p0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1, p2, p3}, Landroid/database/CursorWindow;->putLong(JII)Z

    move-result p0

    return p0
.end method

.method public static putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z
    .locals 0

    if-nez p1, :cond_0

    invoke-virtual {p0, p2, p3}, Landroid/database/CursorWindow;->putNull(II)Z

    move-result p0

    return p0

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Landroid/database/CursorWindow;->putString(Ljava/lang/String;II)Z

    move-result p0

    return p0
.end method
