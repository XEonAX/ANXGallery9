.class Lcom/miui/gallery/data/CityDatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "CityDatabaseHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;,
        Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRect;,
        Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary;,
        Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundaryColumn;
    }
.end annotation


# static fields
.field private static final PROJECTION:[Ljava/lang/String;

.field public static final sCityBoundaryColumns:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/provider/GalleryDBHelper$TableColumn;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mSqliteDatabase:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "*"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/data/CityDatabaseHelper;->PROJECTION:[Ljava/lang/String;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/miui/gallery/data/CityDatabaseHelper;->sCityBoundaryColumns:Ljava/util/ArrayList;

    sget-object v0, Lcom/miui/gallery/data/CityDatabaseHelper;->sCityBoundaryColumns:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundaryColumn;

    const-string v2, "cityid"

    const-string v3, "text"

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundaryColumn;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/CityDatabaseHelper;->sCityBoundaryColumns:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundaryColumn;

    const-string v2, "boundary"

    const-string v3, "blob"

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundaryColumn;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/CityDatabaseHelper;->sCityBoundaryColumns:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundaryColumn;

    const-string v2, "rect"

    const-string v3, "blob"

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundaryColumn;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    invoke-direct {p0}, Lcom/miui/gallery/data/CityDatabaseHelper;->openDB()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/data/CityDatabaseHelper;->mSqliteDatabase:Landroid/database/sqlite/SQLiteDatabase;

    return-void
.end method

.method static synthetic lambda$queryCityBoundary$14(Landroid/database/Cursor;)Ljava/util/concurrent/ConcurrentMap;
    .locals 5

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    if-nez p0, :cond_0

    const-string p0, "CityDatabaseHelper"

    const-string v1, "queryCityBoundary fails, the returned cursor is null"

    invoke-static {p0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_0
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/data/CityDatabaseUtils$PolygonHelper;->parseFromByteArray([B)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary$Boundary;

    new-instance v3, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v2, v4}, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary;-><init>(Ljava/lang/String;[Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary$Boundary;Lcom/miui/gallery/data/CityDatabaseHelper$1;)V

    invoke-interface {v0, v1, v3}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private openDB()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/data/CityDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method


# virtual methods
.method public isDbOpened()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/CityDatabaseHelper;->mSqliteDatabase:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/data/CityDatabaseHelper;->mSqliteDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public loadCityBoundRects()Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;
    .locals 8

    invoke-virtual {p0}, Lcom/miui/gallery/data/CityDatabaseHelper;->isDbOpened()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/data/CityDatabaseHelper;->mSqliteDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "cityBoundary"

    const-string v0, "cityid"

    const-string v3, "rect"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    new-instance v7, Lcom/miui/gallery/data/CityDatabaseHelper$1;

    invoke-direct {v7, p0}, Lcom/miui/gallery/data/CityDatabaseHelper$1;-><init>(Lcom/miui/gallery/data/CityDatabaseHelper;)V

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;

    return-object v0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    const-string p1, "CityDatabaseHelper"

    const-string v0, "should not create: city.db is a readonly database"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    const-string p1, "CityDatabaseHelper"

    const-string p2, "should not downgrade: city.db is a readonly database"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    const-string p1, "CityDatabaseHelper"

    const-string p2, "should not upgrade: city.db is a readonly database"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public queryCityBoundary(Ljava/util/ArrayList;)Ljava/util/concurrent/ConcurrentMap;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/data/CityDatabaseHelper;->isDbOpened()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cityid IN("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    if-lez v1, :cond_1

    const/16 v2, 0x2c

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const/16 p1, 0x29

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/data/CityDatabaseHelper;->mSqliteDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "cityBoundary"

    sget-object v3, Lcom/miui/gallery/data/CityDatabaseHelper;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    sget-object v7, Lcom/miui/gallery/data/-$$Lambda$CityDatabaseHelper$FBSWI_388QHj4Sb-gxOIUoEUY2g;->INSTANCE:Lcom/miui/gallery/data/-$$Lambda$CityDatabaseHelper$FBSWI_388QHj4Sb-gxOIUoEUY2g;

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ConcurrentMap;

    return-object p1

    :cond_3
    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method
