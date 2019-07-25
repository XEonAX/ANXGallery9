.class public Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;
.super Lcom/miui/gallery/adapter/AlbumListAdapterBase;
.source "AutoBackupChooserAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/AutoBackupChooserAdapter$OnAutoBackupStateChangedListener;
    }
.end annotation


# static fields
.field private static final COLUMN_INDEX_ALBUM_SIZE:I

.field private static final PROJECTION_WITH_SIZE:[Ljava/lang/String;


# instance fields
.field private final mListener:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter$OnAutoBackupStateChangedListener;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    sget-object v0, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->PROJECTION:[Ljava/lang/String;

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->PROJECTION_WITH_SIZE:[Ljava/lang/String;

    const/4 v0, 0x0

    :goto_0
    sget-object v1, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->PROJECTION:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    sget-object v1, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->PROJECTION_WITH_SIZE:[Ljava/lang/String;

    sget-object v2, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->PROJECTION:[Ljava/lang/String;

    aget-object v2, v2, v0

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->PROJECTION:[Ljava/lang/String;

    array-length v0, v0

    sput v0, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->COLUMN_INDEX_ALBUM_SIZE:I

    sget-object v0, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->PROJECTION_WITH_SIZE:[Ljava/lang/String;

    sget v1, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->COLUMN_INDEX_ALBUM_SIZE:I

    const-string v2, "size"

    aput-object v2, v0, v1

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/adapter/AutoBackupChooserAdapter$OnAutoBackupStateChangedListener;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/AlbumListAdapterBase;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->mListener:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter$OnAutoBackupStateChangedListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;)Lcom/miui/gallery/adapter/AutoBackupChooserAdapter$OnAutoBackupStateChangedListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->mListener:Lcom/miui/gallery/adapter/AutoBackupChooserAdapter$OnAutoBackupStateChangedListener;

    return-object p0
.end method

.method private getAlbumSize(Landroid/database/Cursor;)J
    .locals 2

    sget v0, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->COLUMN_INDEX_ALBUM_SIZE:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 4

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result p2

    check-cast p1, Lcom/miui/gallery/ui/AutoBackupChooserItem;

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->getAlbumName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p3}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->getAlbumCount(Landroid/database/Cursor;)I

    move-result v1

    invoke-direct {p0, p3}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->getAlbumSize(Landroid/database/Cursor;)J

    move-result-wide v2

    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/miui/gallery/ui/AutoBackupChooserItem;->bindCommonInfo(Ljava/lang/String;IJ)V

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->getDownloadUri(I)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->mDisplayImageOption:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {p1, v0, v1, v2}, Lcom/miui/gallery/ui/AutoBackupChooserItem;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    invoke-static {p3}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->isBabyAlbum(Landroid/database/Cursor;)Z

    move-result v0

    invoke-virtual {p0, p3}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->isOwnerShareAlbum(Landroid/database/Cursor;)Z

    move-result v1

    invoke-virtual {p0, p3}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->isCameraAlbum(Landroid/database/Cursor;)Z

    move-result v2

    invoke-static {p3}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->isAutoUploadedAlbum(Landroid/database/Cursor;)Z

    move-result p3

    if-nez v0, :cond_0

    if-nez v1, :cond_0

    if-eqz v2, :cond_1

    :cond_0
    if-nez p3, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    new-instance v1, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter$1;

    invoke-direct {v1, p0, p2}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter$1;-><init>(Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;I)V

    invoke-virtual {p1, v1, v0, p3}, Lcom/miui/gallery/ui/AutoBackupChooserItem;->bindCheckBox(Landroid/widget/CompoundButton$OnCheckedChangeListener;ZZ)V

    return-void
.end method

.method public getAutoBackupUiState(Landroid/view/View;)Z
    .locals 0

    check-cast p1, Lcom/miui/gallery/ui/AutoBackupChooserItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AutoBackupChooserItem;->getCheckBoxCheckedState()Z

    move-result p1

    return p1
.end method

.method public getProjection()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->PROJECTION_WITH_SIZE:[Ljava/lang/String;

    return-object v0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b0021

    const/4 v0, 0x0

    invoke-virtual {p1, p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public reverseAutoBackupUiState(Landroid/view/View;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/ui/AutoBackupChooserItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AutoBackupChooserItem;->reverseCheckBoxCheckedState()V

    return-void
.end method
