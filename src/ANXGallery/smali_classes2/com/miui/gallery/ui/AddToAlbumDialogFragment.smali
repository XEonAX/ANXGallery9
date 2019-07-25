.class public Lcom/miui/gallery/ui/AddToAlbumDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "AddToAlbumDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;,
        Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;
    }
.end annotation


# static fields
.field public static final PROJECTION:[Ljava/lang/String;


# instance fields
.field private mCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/app/LoaderManager$LoaderCallbacks<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation
.end field

.field private mCreatePlaceHolder:[Ljava/lang/Object;

.field private mDialog:Lmiui/app/AlertDialog;

.field private mListAdapter:Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;

.field private mListener:Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;

.field private mOnAlbumCreatedListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

.field private mSecretPlaceHolder:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0xd

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id AS _id"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "cover_id"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "cover_path"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string v1, "cover_sha1"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const-string v1, "cover_sync_state"

    const/4 v2, 0x4

    aput-object v1, v0, v2

    const-string v1, "name"

    const/4 v2, 0x5

    aput-object v1, v0, v2

    const-string v1, "media_count"

    const/4 v2, 0x6

    aput-object v1, v0, v2

    const-string v1, "1 AS TYPE"

    const/4 v2, 0x7

    aput-object v1, v0, v2

    const-string v1, "baby_info"

    const/16 v2, 0x8

    aput-object v1, v0, v2

    const-string v1, "sortBy"

    const/16 v2, 0x9

    aput-object v1, v0, v2

    const-string v1, "serverId"

    const/16 v2, 0xa

    aput-object v1, v0, v2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/miui/gallery/provider/InternalContract$Cloud;->ALIAS_ALBUM_CLASSIFICATION:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " AS "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "classification"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xb

    aput-object v1, v0, v2

    const-string v1, "cover_size"

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sput-object v0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$1;-><init>(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    new-instance v0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$3;-><init>(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mOnAlbumCreatedListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Landroid/net/Uri;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getLoadUri()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getSelection()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;JZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->onAlbumSelected(JZ)V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->showCopyOrMove()Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)[Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mCreatePlaceHolder:[Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->showSecretAlbum()Z

    move-result p0

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)[Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mSecretPlaceHolder:[Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mListAdapter:Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mListener:Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->recordCopyMoveAction(Z)V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mOnAlbumCreatedListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

    return-object p0
.end method

.method private getLoadUri()Landroid/net/Uri;
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "join_share"

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "show_share_album"

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    return-object v0
.end method

.method private getSelection()Ljava/lang/String;
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    const-string v2, "show_system_album"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v1, "show_system_album"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    :cond_0
    const-string v2, "show_immutable_album"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    sget-object v2, Lcom/miui/gallery/provider/InternalContract$Cloud;->ALIAS_NON_SYSTEM_ALBUM:Ljava/lang/String;

    const-string v3, "immutable = 0"

    invoke-direct {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->isOnlyShowLocal()Z

    move-result v4

    if-eqz v4, :cond_2

    const-string v4, " AND (media_count>0)"

    goto :goto_1

    :cond_2
    const-string v4, ""

    :goto_1
    if-nez v1, :cond_3

    if-nez v0, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_3
    if-nez v1, :cond_4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_4
    if-nez v0, :cond_5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_5
    const/4 v0, 0x0

    return-object v0
.end method

.method private isOnlyShowLocal()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;->isOnlyShowLocalPhoto()Z

    move-result v0

    return v0
.end method

.method private onAlbumSelected(JZ)V
    .locals 2

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    invoke-static {p1, p2}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p3, "AddToAlbumDialogFragment"

    const-string v1, "Is other shared album, do copy operation for default"

    invoke-static {p3, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p3, 0x0

    :cond_0
    if-eqz p3, :cond_1

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->showCopyOrMoveDialog(J)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->dismissSafely()V

    iget-object p3, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mListener:Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;

    if-eqz p3, :cond_2

    iget-object p3, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mListener:Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;

    invoke-interface {p3, p1, p2, v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;->onAlbumSelected(JZ)V

    :cond_2
    :goto_0
    return-void
.end method

.method private recordCopyMoveAction(Z)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "move"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "from"

    const-string v1, "AddToAlbumDialogFragment"

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "organize_photos"

    const-string v1, "move_or_copy"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private showCopyOrMove()Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "show_copy_or_move"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private showCopyOrMoveDialog(J)V
    .locals 2

    new-instance v0, Lcom/miui/gallery/ui/CopyOrMoveDialog;

    invoke-direct {v0}, Lcom/miui/gallery/ui/CopyOrMoveDialog;-><init>()V

    new-instance v1, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$2;-><init>(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;J)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/CopyOrMoveDialog;->setOnOperationSelectedListener(Lcom/miui/gallery/ui/CopyOrMoveDialog$OnOperationSelectedListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string p2, "CopyOrMoveDialog"

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/ui/CopyOrMoveDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->dismissSafely()V

    return-void
.end method

.method private showSecretAlbum()Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "show_add_secret"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    const/4 v2, 0x1

    invoke-virtual {p1, v2, v0, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    const/4 v2, 0x2

    invoke-virtual {p1, v2, v0, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 20

    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCreate(Landroid/os/Bundle;)V

    const/16 v1, 0xd

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v2, v5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v6, 0x1

    aput-object v4, v2, v6

    const/4 v4, 0x2

    const/4 v7, 0x0

    aput-object v7, v2, v4

    const/4 v8, 0x3

    aput-object v7, v2, v8

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/4 v10, 0x4

    aput-object v9, v2, v10

    const v9, 0x7f1002e2

    invoke-virtual {v0, v9}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/4 v11, 0x5

    aput-object v9, v2, v11

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/4 v12, 0x6

    aput-object v9, v2, v12

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/4 v13, 0x7

    aput-object v9, v2, v13

    const/16 v9, 0x8

    aput-object v7, v2, v9

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/16 v15, 0x9

    aput-object v14, v2, v15

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/16 v16, 0xa

    aput-object v14, v2, v16

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/16 v17, 0xb

    aput-object v14, v2, v17

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/16 v18, 0xc

    aput-object v14, v2, v18

    iput-object v2, v0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mCreatePlaceHolder:[Ljava/lang/Object;

    new-array v1, v1, [Ljava/lang/Object;

    const-wide/16 v18, -0x3e8

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v6

    aput-object v7, v1, v4

    aput-object v7, v1, v8

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v10

    const v2, 0x7f100646

    invoke-virtual {v0, v2}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v11

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v12

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v13

    aput-object v7, v1, v9

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v15

    const-wide/16 v6, 0x3e8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v16

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v17

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0xc

    aput-object v2, v1, v3

    iput-object v1, v0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mSecretPlaceHolder:[Ljava/lang/Object;

    new-instance v1, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;-><init>(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;Landroid/content/Context;)V

    iput-object v1, v0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mListAdapter:Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 3

    new-instance p1, Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mListAdapter:Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lmiui/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    const v2, 0x7f100007

    invoke-virtual {v0, v2}, Lmiui/app/AlertDialog$Builder;->setTitle(I)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v2, 0x1040000

    invoke-virtual {v0, v2, v1}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p1}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    iget-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mListAdapter:Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mListAdapter:Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onDestroy()V

    return-void
.end method

.method public setOnAlbumSelectedListener(Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->mListener:Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;

    return-void
.end method
