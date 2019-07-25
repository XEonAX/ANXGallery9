.class public Lcom/miui/gallery/picker/PickGalleryActivity;
.super Lcom/miui/gallery/picker/PickerActivity;
.source "PickGalleryActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/picker/PickGalleryActivity$MediaScanJob;,
        Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;,
        Lcom/miui/gallery/picker/PickGalleryActivity$OriginUrlRequestProgressListener;,
        Lcom/miui/gallery/picker/PickGalleryActivity$ParseTask;
    }
.end annotation


# instance fields
.field private mCancelConfirmListener:Landroid/content/DialogInterface$OnCancelListener;

.field private mCancelDownloadListener:Landroid/content/DialogInterface$OnClickListener;

.field private mCloseType:I

.field private mContinueDownloadListener:Landroid/content/DialogInterface$OnClickListener;

.field private mCurrentPagePosition:I

.field private mDownloadListener:Landroid/content/DialogInterface$OnClickListener;

.field private mDownloadPendings:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;",
            ">;"
        }
    .end annotation
.end field

.field private mDownloadProgressDialog:Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

.field private mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

.field private mOriginRequestPendings:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginUrlRequestTask;",
            ">;"
        }
    .end annotation
.end field

.field private mOriginRequestProgressDialog:Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

.field private mOriginUrlRequestor:Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

.field private mParseTask:Lcom/miui/gallery/picker/PickGalleryActivity$ParseTask;

.field private mPickIntent:Landroid/content/Intent;

.field private mResults:[Landroid/net/Uri;

.field private mSha1s:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickerActivity;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mCurrentPagePosition:I

    new-instance v0, Lcom/miui/gallery/picker/PickGalleryActivity$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/picker/PickGalleryActivity$2;-><init>(Lcom/miui/gallery/picker/PickGalleryActivity;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    new-instance v0, Lcom/miui/gallery/picker/PickGalleryActivity$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/picker/PickGalleryActivity$3;-><init>(Lcom/miui/gallery/picker/PickGalleryActivity;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mCancelDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    new-instance v0, Lcom/miui/gallery/picker/PickGalleryActivity$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/picker/PickGalleryActivity$4;-><init>(Lcom/miui/gallery/picker/PickGalleryActivity;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mContinueDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    new-instance v0, Lcom/miui/gallery/picker/PickGalleryActivity$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/picker/PickGalleryActivity$5;-><init>(Lcom/miui/gallery/picker/PickGalleryActivity;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mCancelConfirmListener:Landroid/content/DialogInterface$OnCancelListener;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/picker/PickGalleryActivity;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mCurrentPagePosition:I

    return p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/picker/PickGalleryActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->parseResult()V

    return-void
.end method

.method static synthetic access$102(Lcom/miui/gallery/picker/PickGalleryActivity;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mCurrentPagePosition:I

    return p1
.end method

.method static synthetic access$1100(Lcom/miui/gallery/picker/PickGalleryActivity;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->showConfirmDialog(Z)V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/picker/PickGalleryActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->startDownload()V

    return-void
.end method

.method static synthetic access$1400(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mOriginRequestProgressDialog:Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    return-object p0
.end method

.method static synthetic access$1402(Lcom/miui/gallery/picker/PickGalleryActivity;Lcom/miui/gallery/picker/uri/PrepareProgressDialog;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mOriginRequestProgressDialog:Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    return-object p1
.end method

.method static synthetic access$1500(Lcom/miui/gallery/picker/PickGalleryActivity;Ljava/util/ArrayList;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->parseOriginUrlResult(Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/miui/gallery/picker/PickGalleryActivity;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mOriginRequestPendings:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/OriginUrlRequestor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mOriginUrlRequestor:Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    return-object p0
.end method

.method static synthetic access$1702(Lcom/miui/gallery/picker/PickGalleryActivity;Lcom/miui/gallery/picker/uri/OriginUrlRequestor;)Lcom/miui/gallery/picker/uri/OriginUrlRequestor;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mOriginUrlRequestor:Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    return-object p1
.end method

.method static synthetic access$1900(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/Downloader;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    return-object p0
.end method

.method static synthetic access$1902(Lcom/miui/gallery/picker/PickGalleryActivity;Lcom/miui/gallery/picker/uri/Downloader;)Lcom/miui/gallery/picker/uri/Downloader;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    return-object p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/picker/PickGalleryActivity;I)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->getPageName(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2000(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloadProgressDialog:Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    return-object p0
.end method

.method static synthetic access$2002(Lcom/miui/gallery/picker/PickGalleryActivity;Lcom/miui/gallery/picker/uri/PrepareProgressDialog;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloadProgressDialog:Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    return-object p1
.end method

.method static synthetic access$302(Lcom/miui/gallery/picker/PickGalleryActivity;Lcom/miui/gallery/picker/PickGalleryActivity$ParseTask;)Lcom/miui/gallery/picker/PickGalleryActivity$ParseTask;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mParseTask:Lcom/miui/gallery/picker/PickGalleryActivity$ParseTask;

    return-object p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/picker/PickGalleryActivity;)Landroid/content/Intent;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getResultIntent()Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/picker/PickGalleryActivity;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/picker/PickGalleryActivity;->statBestImageCount(II)V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/picker/PickGalleryActivity;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->doCompleteOperation(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/picker/PickGalleryActivity;Landroid/database/Cursor;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->prepareResult(Landroid/database/Cursor;)V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/gallery/picker/PickGalleryActivity;)[Landroid/net/Uri;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/picker/PickGalleryActivity;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloadPendings:Ljava/util/ArrayList;

    return-object p0
.end method

.method private dispatchPermissionChecked([Ljava/lang/String;[I)V
    .locals 1

    if-eqz p1, :cond_2

    array-length p2, p1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p2

    const-string v0, "PickHomePageFragment"

    invoke-virtual {p2, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/picker/PickHomePageFragment;

    if-eqz p2, :cond_1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/picker/PickHomePageFragment;->onPermissionsChecked()V

    :cond_1
    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method private doCompleteOperation(Landroid/content/Intent;)V
    .locals 7

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->isPickIntentMode()Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    iget v2, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mCloseType:I

    const/4 v3, 0x3

    const/4 v4, 0x1

    if-ne v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const/16 v3, 0x2a

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v5

    const-string v6, "gallery.i.mi.com"

    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    const-string v6, "start_activity_for_result"

    invoke-virtual {v5, v6, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v6, "extra_intent"

    invoke-virtual {v5, v6, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p1, "request_code"

    if-eqz v2, :cond_1

    const/16 v1, 0x2a

    :cond_1
    invoke-virtual {v5, p1, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-static {p0, v0, v5}, Lcom/miui/gallery/util/ActionURIHandler;->handleUri(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V

    goto :goto_1

    :cond_2
    if-eqz v2, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mPickIntent:Landroid/content/Intent;

    invoke-virtual {p0, p1, v3}, Lcom/miui/gallery/picker/PickGalleryActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_1

    :cond_3
    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->startActivity(Landroid/content/Intent;)V

    :goto_1
    iget p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mCloseType:I

    if-ne p1, v4, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->finish()V

    goto :goto_2

    :cond_4
    invoke-virtual {p0, v1, p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->finish()V

    :cond_5
    :goto_2
    return-void
.end method

.method private getPageName(I)Ljava/lang/String;
    .locals 1

    if-nez p1, :cond_0

    const-string p1, "home"

    return-object p1

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    const-string p1, "album"

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private getResultIntent()Landroid/content/Intent;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->isPickIntentMode()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mPickIntent:Landroid/content/Intent;

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    :goto_0
    return-object v0
.end method

.method private isPickIntentMode()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mPickIntent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private parseOriginUrlResult(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getResultIntent()Landroid/content/Intent;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;

    invoke-virtual {v3}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->toJson()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const-string p1, "pick-result-origin-download-info"

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string p1, "pick-result-data"

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-direct {p0, v0}, Lcom/miui/gallery/picker/PickGalleryActivity;->doCompleteOperation(Landroid/content/Intent;)V

    return-void
.end method

.method private parseResult()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    array-length v0, v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->finish()V

    return-void

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    iget-object v4, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    array-length v4, v4

    if-ge v3, v4, :cond_2

    iget-object v4, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    aget-object v4, v4, v3

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    aget-object v4, v4, v3

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v4, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mSha1s:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    iget-object v3, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    array-length v3, v3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-eq v3, v4, :cond_3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Landroid/net/Uri;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/net/Uri;

    iput-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mSha1s:[Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    array-length v0, v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->finish()V

    return-void

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->getResultType()Lcom/miui/gallery/picker/helper/Picker$ResultType;

    move-result-object v0

    const-string v1, "PickGalleryActivity"

    const-string v3, "parse raw results[%s] for %s"

    iget-object v4, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    invoke-static {v1, v3, v4, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v1, Lcom/miui/gallery/picker/helper/Picker$ResultType;->OPEN_URI:Lcom/miui/gallery/picker/helper/Picker$ResultType;

    if-ne v0, v1, :cond_4

    const/4 v1, 0x0

    :goto_1
    iget-object v3, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    array-length v3, v3

    if-ge v1, v3, :cond_4

    iget-object v3, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    iget-object v4, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/provider/GalleryOpenProvider;->translateToContent(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    aput-object v4, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v1

    invoke-interface {v1}, Lcom/miui/gallery/picker/helper/Picker;->getImageType()Lcom/miui/gallery/picker/helper/Picker$ImageType;

    move-result-object v1

    sget-object v3, Lcom/miui/gallery/picker/helper/Picker$ImageType;->ORIGIN_OR_DOWNLOAD_INFO:Lcom/miui/gallery/picker/helper/Picker$ImageType;

    if-ne v1, v3, :cond_5

    new-instance v0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mOriginRequestPendings:Ljava/util/ArrayList;

    new-instance v2, Lcom/miui/gallery/picker/PickGalleryActivity$OriginUrlRequestProgressListener;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/picker/PickGalleryActivity$OriginUrlRequestProgressListener;-><init>(Lcom/miui/gallery/picker/PickGalleryActivity;Lcom/miui/gallery/picker/PickGalleryActivity$1;)V

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;-><init>(Ljava/util/ArrayList;Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mOriginUrlRequestor:Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mOriginUrlRequestor:Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    iget-object v2, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mSha1s:[Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->start([Landroid/net/Uri;[Ljava/lang/String;)V

    return-void

    :cond_5
    invoke-direct {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getResultIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v3

    invoke-interface {v3}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object v3

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v4

    invoke-interface {v4}, Lcom/miui/gallery/picker/helper/Picker;->getMode()Lcom/miui/gallery/picker/helper/Picker$Mode;

    move-result-object v4

    sget-object v5, Lcom/miui/gallery/picker/helper/Picker$Mode;->MULTIPLE:Lcom/miui/gallery/picker/helper/Picker$Mode;

    const/4 v6, 0x1

    if-eq v4, v5, :cond_8

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v4

    invoke-interface {v4}, Lcom/miui/gallery/picker/helper/Picker;->getMode()Lcom/miui/gallery/picker/helper/Picker$Mode;

    move-result-object v4

    sget-object v5, Lcom/miui/gallery/picker/helper/Picker$Mode;->UNLIMITED:Lcom/miui/gallery/picker/helper/Picker$Mode;

    if-ne v4, v5, :cond_6

    goto :goto_2

    :cond_6
    sget-object v3, Lcom/miui/gallery/picker/helper/Picker$ResultType;->OPEN_URI:Lcom/miui/gallery/picker/helper/Picker$ResultType;

    if-ne v0, v3, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    aget-object v0, v0, v2

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    goto/16 :goto_5

    :cond_7
    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    aget-object v0, v0, v2

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/picker/PickGalleryActivity;->parseSingle(Landroid/content/Intent;Ljava/lang/String;)V

    goto/16 :goto_5

    :cond_8
    :goto_2
    sget-object v0, Lcom/miui/gallery/picker/helper/Picker$MediaType;->IMAGE:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    if-ne v3, v0, :cond_9

    new-instance v0, Landroid/content/ClipData;

    const-string v3, "data"

    const-string v4, "image/*"

    const-string v5, "text/uri-list"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    new-instance v5, Landroid/content/ClipData$Item;

    iget-object v7, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    aget-object v2, v7, v2

    invoke-direct {v5, v2}, Landroid/content/ClipData$Item;-><init>(Landroid/net/Uri;)V

    invoke-direct {v0, v3, v4, v5}, Landroid/content/ClipData;-><init>(Ljava/lang/CharSequence;[Ljava/lang/String;Landroid/content/ClipData$Item;)V

    goto :goto_3

    :cond_9
    sget-object v0, Lcom/miui/gallery/picker/helper/Picker$MediaType;->ALL:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    if-ne v3, v0, :cond_a

    new-instance v0, Landroid/content/ClipData;

    const-string v3, "data"

    const-string v4, "image/*"

    const-string v5, "video/*"

    const-string v7, "text/uri-list"

    filled-new-array {v4, v5, v7}, [Ljava/lang/String;

    move-result-object v4

    new-instance v5, Landroid/content/ClipData$Item;

    iget-object v7, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    aget-object v2, v7, v2

    invoke-direct {v5, v2}, Landroid/content/ClipData$Item;-><init>(Landroid/net/Uri;)V

    invoke-direct {v0, v3, v4, v5}, Landroid/content/ClipData;-><init>(Ljava/lang/CharSequence;[Ljava/lang/String;Landroid/content/ClipData$Item;)V

    goto :goto_3

    :cond_a
    new-instance v0, Landroid/content/ClipData;

    const-string v3, "data"

    const-string v4, "video/*"

    const-string v5, "text/uri-list"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    new-instance v5, Landroid/content/ClipData$Item;

    iget-object v7, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    aget-object v2, v7, v2

    invoke-direct {v5, v2}, Landroid/content/ClipData$Item;-><init>(Landroid/net/Uri;)V

    invoke-direct {v0, v3, v4, v5}, Landroid/content/ClipData;-><init>(Ljava/lang/CharSequence;[Ljava/lang/String;Landroid/content/ClipData$Item;)V

    :goto_3
    const/4 v2, 0x1

    :goto_4
    iget-object v3, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    array-length v3, v3

    if-ge v2, v3, :cond_b

    new-instance v3, Landroid/content/ClipData$Item;

    iget-object v4, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    aget-object v4, v4, v2

    invoke-direct {v3, v4}, Landroid/content/ClipData$Item;-><init>(Landroid/net/Uri;)V

    invoke-virtual {v0, v3}, Landroid/content/ClipData;->addItem(Landroid/content/ClipData$Item;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_b
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setClipData(Landroid/content/ClipData;)V

    const-string v0, "pick-result-data"

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    :goto_5
    invoke-virtual {v1, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-direct {p0, v1}, Lcom/miui/gallery/picker/PickGalleryActivity;->doCompleteOperation(Landroid/content/Intent;)V

    return-void
.end method

.method private parseSingle(Landroid/content/Intent;Ljava/lang/String;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->getResultType()Lcom/miui/gallery/picker/helper/Picker$ResultType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/picker/helper/Picker$ResultType;->LEGACY_MEDIA:Lcom/miui/gallery/picker/helper/Picker$ResultType;

    if-ne v0, v1, :cond_0

    invoke-direct {p0, p2}, Lcom/miui/gallery/picker/PickGalleryActivity;->queryMediaUri(Ljava/lang/String;)Landroid/util/Pair;

    move-result-object p2

    if-eqz p2, :cond_2

    iget-object v0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Landroid/net/Uri;

    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p2}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v1, "*/*"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_0

    :cond_1
    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    :cond_2
    :goto_0
    return-void
.end method

.method private prepareResult(Landroid/database/Cursor;)V
    .locals 14

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    new-array v1, v0, [Landroid/net/Uri;

    iput-object v1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    new-array v1, v0, [Ljava/lang/String;

    iput-object v1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mSha1s:[Ljava/lang/String;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloadPendings:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mOriginRequestPendings:Ljava/util/ArrayList;

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mSha1s:[Ljava/lang/String;

    const/4 v5, 0x1

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v3

    const/4 v4, 0x4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v5

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-wide v6, v11

    invoke-virtual/range {v5 .. v10}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->isBestImage(JZZLjava/util/List;)Z

    move-result v5

    if-eqz v5, :cond_0

    add-int/lit8 v2, v2, 0x1

    :cond_0
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    invoke-static {v5}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    aput-object v5, v4, v3

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v4

    invoke-interface {v4}, Lcom/miui/gallery/picker/helper/Picker;->getImageType()Lcom/miui/gallery/picker/helper/Picker$ImageType;

    move-result-object v4

    sget-object v5, Lcom/miui/gallery/picker/helper/Picker$ImageType;->ORIGIN:Lcom/miui/gallery/picker/helper/Picker$ImageType;

    if-ne v4, v5, :cond_3

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v4

    if-eqz v4, :cond_2

    sget-object v4, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    goto :goto_1

    :cond_2
    sget-object v4, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    :goto_1
    iget-object v5, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloadPendings:Ljava/util/ArrayList;

    new-instance v6, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;

    invoke-static {v11, v12}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object v7

    const/4 v8, 0x6

    invoke-interface {p1, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    invoke-direct {v6, v7, v4, v8, v3}, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;-><init>(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;II)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    sget-object v5, Lcom/miui/gallery/picker/helper/Picker$ImageType;->ORIGIN_OR_DOWNLOAD_INFO:Lcom/miui/gallery/picker/helper/Picker$ImageType;

    if-ne v4, v5, :cond_4

    iget-object v10, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mOriginRequestPendings:Ljava/util/ArrayList;

    new-instance v13, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginUrlRequestTask;

    invoke-static {v11, v12}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object v6

    const/4 v4, 0x7

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    const/16 v4, 0x8

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    const/4 v4, 0x5

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    move-object v4, v13

    move v5, v3

    invoke-direct/range {v4 .. v9}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginUrlRequestTask;-><init>(ILandroid/net/Uri;III)V

    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4
    const/4 v4, 0x3

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_5

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_5

    iget-object v4, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    invoke-static {v5}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    aput-object v5, v4, v3

    goto/16 :goto_0

    :cond_5
    iget-object v4, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloadPendings:Ljava/util/ArrayList;

    new-instance v5, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;

    invoke-static {v11, v12}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object v6

    sget-object v7, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-direct {v5, v6, v7, v1, v3}, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;-><init>(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;II)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_6
    invoke-direct {p0, v0, v2}, Lcom/miui/gallery/picker/PickGalleryActivity;->statBestImageCount(II)V

    return-void
.end method

.method private queryMediaUri(Ljava/lang/String;)Landroid/util/Pair;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Landroid/util/Pair<",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object v0

    sget-object v2, Lcom/miui/gallery/picker/helper/Picker$MediaType;->IMAGE:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ne v0, v2, :cond_0

    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v2, "vnd.android.cursor.dir/image"

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v7, "_id"

    filled-new-array {v7}, [Ljava/lang/String;

    move-result-object v7

    const-string v8, "_data=?"

    new-array v9, v3, [Ljava/lang/String;

    aput-object p1, v9, v4

    const/4 v10, 0x0

    invoke-virtual/range {v5 .. v10}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    :goto_0
    move-object v1, p1

    goto :goto_1

    :cond_0
    sget-object v0, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v2, "vnd.android.cursor.dir/video"

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v7, "_id"

    filled-new-array {v7}, [Ljava/lang/String;

    move-result-object v7

    const-string v8, "_data=?"

    new-array v9, v3, [Ljava/lang/String;

    aput-object p1, v9, v4

    const/4 v10, 0x0

    invoke-virtual/range {v5 .. v10}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    goto :goto_0

    :goto_1
    if-eqz v1, :cond_1

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    if-eqz v1, :cond_2

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_2
    new-instance p1, Landroid/util/Pair;

    invoke-direct {p1, v0, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p1

    :catchall_0
    move-exception p1

    if-eqz v1, :cond_3

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_3
    throw p1

    :cond_4
    return-object v1
.end method

.method private sendStatistics()V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getCallingPackage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v0, "unknown"

    :cond_0
    const-string v1, "picker"

    const-string v2, "open_picker"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "best_image"

    const-string v1, "best_image_count"

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getBestImageCount(Z)I

    move-result v2

    int-to-long v2, v2

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method

.method private setupTabFragments()V
    .locals 12

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mActionBar:Lmiui/app/ActionBar;

    const-string v1, "PickHomePageFragment"

    iget-object v2, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mActionBar:Lmiui/app/ActionBar;

    invoke-virtual {v2}, Lmiui/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v2

    const v3, 0x7f100414

    invoke-virtual {v2, v3}, Landroid/app/ActionBar$Tab;->setText(I)Landroid/app/ActionBar$Tab;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/picker/PickHomePageFragment;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lmiui/app/ActionBar;->addFragmentTab(Ljava/lang/String;Landroid/app/ActionBar$Tab;Ljava/lang/Class;Landroid/os/Bundle;Z)I

    iget-object v6, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mActionBar:Lmiui/app/ActionBar;

    const-string v7, "PickAlbumPageFragment"

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mActionBar:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v0

    const v1, 0x7f100042

    invoke-virtual {v0, v1}, Landroid/app/ActionBar$Tab;->setText(I)Landroid/app/ActionBar$Tab;

    move-result-object v8

    const-class v9, Lcom/miui/gallery/picker/PickAlbumPageFragment;

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v6 .. v11}, Lmiui/app/ActionBar;->addFragmentTab(Ljava/lang/String;Landroid/app/ActionBar$Tab;Ljava/lang/Class;Landroid/os/Bundle;Z)I

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mActionBar:Lmiui/app/ActionBar;

    new-instance v1, Lcom/miui/gallery/picker/PickGalleryActivity$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/picker/PickGalleryActivity$1;-><init>(Lcom/miui/gallery/picker/PickGalleryActivity;)V

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->addOnFragmentViewPagerChangeListener(Lmiui/app/ActionBar$FragmentViewPagerChangeListener;)V

    return-void
.end method

.method private showConfirmDialog(Z)V
    .locals 4

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "download_file_count"

    iget-object v2, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "local_file_count"

    iget-object v2, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    const/4 v3, 0x0

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    array-length v2, v2

    :goto_0
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;

    iget v2, v2, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;->mSize:I

    add-int/2addr v3, v2

    goto :goto_1

    :cond_1
    const-string v1, "download_file_size"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "retry_mode"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    new-instance p1, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;

    invoke-direct {p1}, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;-><init>()V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "confirm_dialog"

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private startDownload()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/Downloader;->cancel()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/Downloader;->destroy()V

    :cond_0
    new-instance v0, Lcom/miui/gallery/picker/uri/Downloader;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloadPendings:Ljava/util/ArrayList;

    new-instance v2, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;-><init>(Lcom/miui/gallery/picker/PickGalleryActivity;Lcom/miui/gallery/picker/PickGalleryActivity$1;)V

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/picker/uri/Downloader;-><init>(Ljava/util/ArrayList;Lcom/miui/gallery/picker/uri/Downloader$DownloadListener;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/Downloader;->start()V

    return-void
.end method

.method private statBestImageCount(II)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "count"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "best_image_count"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "picker"

    const-string p2, "pick_result"

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method protected hasCustomContentView()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/picker/PickerActivity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 p3, 0x2a

    if-ne p1, p3, :cond_0

    const/4 p1, -0x1

    if-ne p2, p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->finish()V

    :cond_0
    return-void
.end method

.method public onAttachFragment(Landroid/app/Fragment;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickerActivity;->onAttachFragment(Landroid/app/Fragment;)V

    instance-of v0, p1, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;->setPositiveListener(Landroid/content/DialogInterface$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mCancelDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;->setNegativeListener(Landroid/content/DialogInterface$OnClickListener;)V

    goto :goto_0

    :cond_0
    instance-of v0, p1, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mCancelConfirmListener:Landroid/content/DialogInterface$OnCancelListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->setCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    goto :goto_0

    :cond_1
    instance-of v0, p1, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;

    if-eqz v0, :cond_2

    check-cast p1, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mCancelDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;->setCancelListener(Landroid/content/DialogInterface$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mContinueDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;->setContinueListener(Landroid/content/DialogInterface$OnClickListener;)V

    :cond_2
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickerActivity;->onCreate(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->sendStatistics()V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lmiui/app/ActionBar;->setFragmentViewPagerMode(Landroid/content/Context;Landroid/app/FragmentManager;)V

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->setupTabFragments()V

    if-eqz p1, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v0, "confirm_dialog"

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "prepare_progress_dialog"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "cancel_dialog"

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v1

    if-nez p1, :cond_1

    if-nez v0, :cond_1

    if-eqz v1, :cond_5

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    if-eqz p1, :cond_2

    invoke-virtual {v2, p1}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {v2, v0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    :cond_3
    if-eqz v1, :cond_4

    invoke-virtual {v2, v1}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    :cond_4
    invoke-virtual {v2}, Landroid/app/FragmentTransaction;->commit()I

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_5
    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "pick_intent"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    iput-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mPickIntent:Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "pick_close_type"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mCloseType:I

    invoke-static {p0}, Lcom/miui/gallery/ui/ImageSelectionTipFragment;->showImageSelectionTipDialogIfNecessary(Landroid/app/Activity;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/picker/PickerActivity;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/Downloader;->cancel()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/Downloader;->destroy()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloadPendings:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iput-object v1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mResults:[Landroid/net/Uri;

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mSha1s:[Ljava/lang/String;

    if-eqz v0, :cond_3

    iput-object v1, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mSha1s:[Ljava/lang/String;

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mOriginUrlRequestor:Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mOriginUrlRequestor:Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->cancel()V

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mOriginRequestPendings:Ljava/util/ArrayList;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mOriginRequestPendings:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_5
    return-void
.end method

.method protected onDone()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mParseTask:Lcom/miui/gallery/picker/PickGalleryActivity$ParseTask;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/picker/PickGalleryActivity$ParseTask;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/picker/PickGalleryActivity$ParseTask;-><init>(Lcom/miui/gallery/picker/PickGalleryActivity;Lcom/miui/gallery/picker/helper/Picker;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mParseTask:Lcom/miui/gallery/picker/PickGalleryActivity$ParseTask;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mParseTask:Lcom/miui/gallery/picker/PickGalleryActivity$ParseTask;

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/picker/PickGalleryActivity$ParseTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    :cond_0
    const-string v0, "PickGalleryActivity"

    const-string v1, "parse task is running, skip"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/picker/PickerActivity;->onPause()V

    iget v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mCurrentPagePosition:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getPageName(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageEnd(Landroid/app/Activity;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/Downloader;->pause()V

    :cond_0
    return-void
.end method

.method public onPermissionsChecked([Ljava/lang/String;[I)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/picker/PickerActivity;->onPermissionsChecked([Ljava/lang/String;[I)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickGalleryActivity;->isCrossUserPick()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/picker/PickGalleryActivity$MediaScanJob;

    const/4 v0, 0x0

    invoke-direct {p2, v0}, Lcom/miui/gallery/picker/PickGalleryActivity$MediaScanJob;-><init>(Lcom/miui/gallery/picker/PickGalleryActivity$1;)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/picker/PickGalleryActivity;->dispatchPermissionChecked([Ljava/lang/String;[I)V

    :goto_0
    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/picker/PickerActivity;->onResume()V

    iget v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mCurrentPagePosition:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getPageName(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageStart(Landroid/app/Activity;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/Downloader;->resume()V

    :cond_0
    return-void
.end method
