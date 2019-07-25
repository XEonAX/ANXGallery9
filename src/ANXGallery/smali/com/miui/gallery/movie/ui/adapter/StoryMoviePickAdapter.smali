.class public Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;
.super Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated;
.source "StoryMoviePickAdapter.java"

# interfaces
.implements Lcom/miui/gallery/adapter/CheckableAdapter;
.implements Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;


# static fields
.field public static final PROJECTION:[Ljava/lang/String;


# instance fields
.field private mPicker:Lcom/miui/gallery/picker/helper/Picker;

.field private mPickerItemCheckedListener:Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->PROJECTION:[Ljava/lang/String;

    sput-object v0, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/picker/helper/Picker;)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;->SCENE_IN_CHECK_MODE:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    iput-object p2, p0, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    new-instance p1, Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-direct {p1, p2}, Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;-><init>(Lcom/miui/gallery/picker/helper/Picker;)V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->mPickerItemCheckedListener:Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;

    return-void
.end method

.method private getSyncState(Landroid/database/Cursor;)I
    .locals 1

    const/16 v0, 0x10

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getSyncStateInternal(I)I

    move-result p1

    return p1
.end method


# virtual methods
.method protected doBindData(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 2

    check-cast p1, Lcom/miui/gallery/ui/HomePageGridItem;

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getDownloadUri(I)Landroid/net/Uri;

    move-result-object p2

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getClearThumbFilePath(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {p1, v0, p2, v1}, Lcom/miui/gallery/ui/HomePageGridItem;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->isFavorite(I)Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/HomePageGridItem;->bindFavoriteIndicator(Z)V

    invoke-direct {p0, p3}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getSyncState(Landroid/database/Cursor;)I

    move-result p2

    const/4 v0, 0x0

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iget-object p3, p0, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->mShowScene:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    invoke-virtual {p1, v0, v1, p2, p3}, Lcom/miui/gallery/ui/HomePageGridItem;->bindSyncIndicator(JILcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    return-void
.end method

.method public getCheckableView(Landroid/view/View;)Landroid/view/View;
    .locals 0

    check-cast p1, Lcom/miui/gallery/ui/HomePageGridItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/HomePageGridItem;->getCheckBox()Landroid/widget/CheckBox;

    move-result-object p1

    return-object p1
.end method

.method public getClearThumbFilePath(I)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x11

    const/16 v1, 0xf

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getMicroPath(Landroid/database/Cursor;II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getCountForHeader(I)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getDividerView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getDownloadUri(I)Landroid/net/Uri;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x10

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getDownloadUri(Landroid/database/Cursor;II)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getItemKey(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLocalPath(I)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x11

    const/16 v1, 0xf

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getMicroPath(Landroid/database/Cursor;II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMimeType(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getNumHeaders()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getOriginFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getSha1(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xf

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getThumbFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public isFavorite(I)Z
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x12

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b008f

    const/4 v0, 0x0

    invoke-virtual {p1, p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public shouldDrawDivider()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
