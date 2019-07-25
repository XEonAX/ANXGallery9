.class Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;
.super Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;
.source "BackupDetailFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BackupDetailFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BackupDetailAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;
    }
.end annotation


# static fields
.field private static final COLUMN_INDEX_ALBUM_ID:I

.field public static PROJECTION:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    sget-object v0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->PROJECTION_INTERNAL:[Ljava/lang/String;

    array-length v0, v0

    sput v0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->COLUMN_INDEX_ALBUM_ID:I

    sget-object v0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->PROJECTION_INTERNAL:[Ljava/lang/String;

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->PROJECTION:[Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->PROJECTION_INTERNAL:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->PROJECTION:[Ljava/lang/String;

    sget-object v2, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->PROJECTION_INTERNAL:[Ljava/lang/String;

    array-length v2, v2

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sget-object v0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->PROJECTION:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->PROJECTION_INTERNAL:[Ljava/lang/String;

    array-length v1, v1

    const-string v2, "localGroupId"

    aput-object v2, v0, v1

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;I)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;Landroid/database/Cursor;)I
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getSyncState(Landroid/database/Cursor;)I

    move-result p0

    return p0
.end method

.method private isSecretItem(Landroid/database/Cursor;)Z
    .locals 4

    sget v0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->COLUMN_INDEX_ALBUM_ID:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    const-wide/16 v2, -0x3e8

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private mergeSyncState(II)I
    .locals 1

    const/4 v0, 0x2

    packed-switch p2, :pswitch_data_0

    return p1

    :pswitch_0
    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    move p1, p2

    :cond_0
    return p1

    :pswitch_1
    if-eq p1, v0, :cond_1

    move p1, p2

    :cond_1
    return p1

    :pswitch_2
    return p2

    :pswitch_3
    if-lt p1, p2, :cond_2

    const v0, 0x7fffffff

    if-ne p1, v0, :cond_3

    :cond_2
    move p1, p2

    :cond_3
    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public classifyCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 11

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_5

    sget-object v1, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->PROJECTION:[Ljava/lang/String;

    array-length v2, v1

    new-array v3, v2, [Ljava/lang/Object;

    new-instance v4, Landroid/database/MatrixCursor;

    invoke-direct {v4, v1}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    const/4 v1, 0x0

    const v5, 0x7fffffff

    const/4 v6, 0x0

    const/4 v7, 0x0

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->isSecretItem(Landroid/database/Cursor;)Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getSyncState(Landroid/database/Cursor;)I

    move-result v8

    invoke-direct {p0, v5, v8}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->mergeSyncState(II)I

    move-result v5

    if-nez v8, :cond_1

    add-int/lit8 v6, v6, 0x1

    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_2
    const/4 v8, 0x0

    :goto_0
    if-ge v8, v2, :cond_3

    invoke-interface {p1, v8}, Landroid/database/Cursor;->getType(I)I

    move-result v9

    packed-switch v9, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-interface {p1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v3, v8

    goto :goto_1

    :pswitch_1
    invoke-interface {p1, v8}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    aput-object v9, v3, v8

    goto :goto_1

    :pswitch_2
    invoke-interface {p1, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v3, v8

    goto :goto_1

    :pswitch_3
    aput-object v0, v3, v8

    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_3
    invoke-virtual {v4, v3}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    :goto_2
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v8

    if-nez v8, :cond_0

    if-lez v7, :cond_4

    const-wide/16 v8, -0x3e8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    aput-object p1, v3, v1

    const/16 p1, 0x8

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, p1

    const/16 p1, 0xb

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, p1

    const/16 p1, 0xc

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, p1

    invoke-virtual {v4, v3}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    :cond_4
    move-object v0, v4

    :cond_5
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public doBindData(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 5

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getItemId(I)J

    move-result-wide v0

    const-wide/16 v2, -0x3e8

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->bindView(Landroid/content/Context;Landroid/database/Cursor;)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->doBindData(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V

    :goto_0
    return-void
.end method

.method public getItemViewType(I)I
    .locals 4

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getItemId(I)J

    move-result-wide v0

    const-wide/16 v2, -0x3e8

    cmp-long p1, v2, v0

    if-nez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getSecretCount()I
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToLast()Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    const-wide/16 v4, -0x3e8

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    sget v1, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->COLUMN_INDEX_ALBUM_ID:I

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    return v0

    :cond_0
    return v1
.end method

.method public getViewTypeCount()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    invoke-interface {p2}, Landroid/database/Cursor;->getPosition()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getItemViewType(I)I

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b0030

    const/4 v0, 0x0

    invoke-virtual {p1, p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;-><init>(Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;Landroid/view/View;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-object p1
.end method

.method public supportFoldBurstItems()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
