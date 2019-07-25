.class public Lcom/miui/gallery/util/IntentUtil;
.super Ljava/lang/Object;
.source "IntentUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/IntentUtil$SupportMeituEditor;,
        Lcom/miui/gallery/util/IntentUtil$SupportMeituCollage;,
        Lcom/miui/gallery/util/IntentUtil$SupportNewVideoPlayer;
    }
.end annotation


# static fields
.field private static final CONTACT_PHOTO_CLASS:[Ljava/lang/String;

.field private static final CONTACT_PHOTO_PACKAGE:[Ljava/lang/String;

.field private static final DEVICE_SUPPORT_MEITU_XX_EDITOR:[Ljava/lang/String;

.field private static final PLAY_VIDEO_CLASS:[Ljava/lang/String;

.field private static final PLAY_VIDEO_PACKAGE:[Ljava/lang/String;

.field private static final SUPPORT_MEITU_COLLAGE:Lcom/miui/gallery/util/IntentUtil$SupportMeituCollage;

.field private static final SUPPORT_MEITU_EDITOR:Lcom/miui/gallery/util/IntentUtil$SupportMeituEditor;

.field private static final SUPPORT_NEW_VIDEO_PLAYER:Lcom/miui/gallery/util/IntentUtil$SupportNewVideoPlayer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "com.jeejen.family.miui"

    const-string v1, "com.android.contacts"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/IntentUtil;->CONTACT_PHOTO_PACKAGE:[Ljava/lang/String;

    const-string v0, "com.jeejen.contact.ui.AttachPhotoActivity"

    const-string v1, "com.android.contacts.activities.AttachPhotoActivity"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/IntentUtil;->CONTACT_PHOTO_CLASS:[Ljava/lang/String;

    const-string v0, "com.miui.videoplayer"

    const-string v1, "com.miui.video"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/IntentUtil;->PLAY_VIDEO_PACKAGE:[Ljava/lang/String;

    const-string v0, "com.miui.videoplayer.VideoPlayerActivity"

    const-string v1, "com.miui.videoplayer.VideoPlayerActivity"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/IntentUtil;->PLAY_VIDEO_CLASS:[Ljava/lang/String;

    const-string v0, "vela"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/IntentUtil;->DEVICE_SUPPORT_MEITU_XX_EDITOR:[Ljava/lang/String;

    new-instance v0, Lcom/miui/gallery/util/IntentUtil$SupportMeituCollage;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/util/IntentUtil$SupportMeituCollage;-><init>(Lcom/miui/gallery/util/IntentUtil$1;)V

    sput-object v0, Lcom/miui/gallery/util/IntentUtil;->SUPPORT_MEITU_COLLAGE:Lcom/miui/gallery/util/IntentUtil$SupportMeituCollage;

    new-instance v0, Lcom/miui/gallery/util/IntentUtil$SupportMeituEditor;

    invoke-direct {v0, v1}, Lcom/miui/gallery/util/IntentUtil$SupportMeituEditor;-><init>(Lcom/miui/gallery/util/IntentUtil$1;)V

    sput-object v0, Lcom/miui/gallery/util/IntentUtil;->SUPPORT_MEITU_EDITOR:Lcom/miui/gallery/util/IntentUtil$SupportMeituEditor;

    new-instance v0, Lcom/miui/gallery/util/IntentUtil$SupportNewVideoPlayer;

    invoke-direct {v0, v1}, Lcom/miui/gallery/util/IntentUtil$SupportNewVideoPlayer;-><init>(Lcom/miui/gallery/util/IntentUtil$1;)V

    sput-object v0, Lcom/miui/gallery/util/IntentUtil;->SUPPORT_NEW_VIDEO_PLAYER:Lcom/miui/gallery/util/IntentUtil$SupportNewVideoPlayer;

    return-void
.end method

.method static synthetic access$300()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->isDeviceSupportMeituXX()Z

    move-result v0

    return v0
.end method

.method static synthetic access$400()V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->recordUriGenerateError()V

    return-void
.end method

.method static synthetic access$500(Landroid/app/Activity;Landroid/content/Intent;[Landroid/net/Uri;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/IntentUtil;->dispatchImageUrisInternalIntent(Landroid/app/Activity;Landroid/content/Intent;[Landroid/net/Uri;)V

    return-void
.end method

.method public static checkCreationCondition(Landroid/app/Activity;I)Z
    .locals 0

    packed-switch p1, :pswitch_data_0

    const/4 p0, 0x0

    return p0

    :pswitch_0
    invoke-static {}, Lcom/miui/gallery/util/PrintInstallHelper;->getInstance()Lcom/miui/gallery/util/PrintInstallHelper;

    move-result-object p0

    invoke-virtual {p0}, Lcom/miui/gallery/util/PrintInstallHelper;->ensurePrintFucntionAvailable()Z

    move-result p0

    return p0

    :pswitch_1
    invoke-static {}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->getInstance()Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->checkAbleOrDownload(Landroid/app/Activity;)Z

    move-result p0

    return p0

    :pswitch_2
    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static createShortCutForBabyAlbum(Landroid/content/Context;ZJLjava/lang/String;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    new-instance v5, Landroid/content/Intent;

    const-string v0, "com.miui.gallery.action.VIEW_SHARED_BABY_ALBUM"

    invoke-direct {v5, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "album_id"

    invoke-virtual {v5, v0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v0, "album_name"

    invoke-virtual {v5, v0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "other_share_album"

    invoke-virtual {v5, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "people_id"

    invoke-virtual {v5, p1, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "thumbnail_info_of_baby"

    invoke-virtual {v5, p1, p7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "baby_info"

    invoke-virtual {v5, p1, p8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "baby_sharer_info"

    invoke-virtual {v5, p1, p9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    move-object p1, p6

    :goto_0
    const v4, 0x7f070037

    move-object v0, p0

    move-object v1, p1

    move-object v2, p4

    move-object v3, p5

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/util/ShortcutUtil;->createShortcut(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;ILandroid/content/Intent;)V

    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x1a

    if-ge p0, p2, :cond_1

    move-object p1, p4

    :cond_1
    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$Baby;->recordBabyAlbumHasShortcut(Ljava/lang/String;)V

    return-void
.end method

.method private static dispatchImageUrisInternalIntent(Landroid/app/Activity;Landroid/content/Intent;[Landroid/net/Uri;)V
    .locals 5

    array-length v0, p2

    if-nez v0, :cond_0

    const-string p0, "IntentUtil"

    const-string p1, "No result Uris to dispatch!"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v0, ""

    invoke-static {p0, v0}, Lcom/miui/gallery/provider/GalleryOpenProvider;->needReturnContentUri(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    array-length v2, p2

    if-ge v0, v2, :cond_1

    aget-object v2, p2, v0

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/provider/GalleryOpenProvider;->translateToContent(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    aput-object v2, p2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    new-instance v0, Landroid/content/ClipData;

    const-string v2, "data"

    const-string v3, "image/*"

    const-string v4, "text/uri-list"

    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    new-instance v4, Landroid/content/ClipData$Item;

    aget-object v1, p2, v1

    invoke-direct {v4, v1}, Landroid/content/ClipData$Item;-><init>(Landroid/net/Uri;)V

    invoke-direct {v0, v2, v3, v4}, Landroid/content/ClipData;-><init>(Ljava/lang/CharSequence;[Ljava/lang/String;Landroid/content/ClipData$Item;)V

    const/4 v1, 0x1

    const/4 v2, 0x1

    :goto_1
    array-length v3, p2

    if-ge v2, v3, :cond_2

    new-instance v3, Landroid/content/ClipData$Item;

    aget-object v4, p2, v2

    invoke-direct {v3, v4}, Landroid/content/ClipData$Item;-><init>(Landroid/net/Uri;)V

    invoke-virtual {v0, v3}, Landroid/content/ClipData;->addItem(Landroid/content/ClipData$Item;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setClipData(Landroid/content/ClipData;)V

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    :try_start_0
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p0

    const-string p1, "IntentUtil"

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2
    return-void
.end method

.method public static doCreation(Landroid/app/Activity;ILjava/util/List;Lcom/miui/gallery/picker/helper/Picker$ImageType;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "I",
            "Ljava/util/List<",
            "Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;",
            ">;",
            "Lcom/miui/gallery/picker/helper/Picker$ImageType;",
            ")V"
        }
    .end annotation

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "IntentUtil"

    const-string p1, "No selected Item!"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v0, Lcom/miui/gallery/picker/uri/UriGenerator;

    new-instance v1, Lcom/miui/gallery/util/IntentUtil$2;

    invoke-direct {v1, p1, p0}, Lcom/miui/gallery/util/IntentUtil$2;-><init>(ILandroid/app/Activity;)V

    invoke-direct {v0, p0, p2, p3, v1}, Lcom/miui/gallery/picker/uri/UriGenerator;-><init>(Landroid/app/Activity;Ljava/util/List;Lcom/miui/gallery/picker/helper/Picker$ImageType;Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;)V

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->generate()V

    return-void
.end method

.method private static ensureMimeType(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static enterGallerySetting(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/miui/gallery/activity/GallerySettingsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static enterPrivateAlbum(Landroid/content/Context;)V
    .locals 4

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.action.VIEW_ALBUM_DETAIL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "album_id"

    const-wide/16 v2, -0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v1, "album_name"

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f100646

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "album_server_id"

    const-wide/16 v2, 0x3e8

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "album_unwriteable"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static getCallingPackage(Landroid/app/Activity;)Ljava/lang/String;
    .locals 3

    invoke-virtual {p0}, Landroid/app/Activity;->getCallingPackage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->getCallingActivity()Landroid/content/ComponentName;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v0

    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x16

    if-lt v1, v2, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->getReferrer()Landroid/net/Uri;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method public static getCollageMaxImageSize()I
    .locals 1

    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->isSupportMeituCollage()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x9

    goto :goto_0

    :cond_0
    const/4 v0, 0x6

    :goto_0
    return v0
.end method

.method public static gotoAppDetailTraffic(Landroid/content/Context;)Z
    .locals 4

    new-instance v0, Landroid/content/Intent;

    const-string v1, "miui.intent.action.NETWORKASSISTANT_APP_DETAIL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "package_name"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "title_type"

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "sort_type"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    const-string p0, "IntentUtil"

    const-string v0, "can\'t go to traffic page"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v3
.end method

.method public static gotoBugreport(Landroid/content/Context;)Z
    .locals 4

    const/4 v0, 0x1

    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "miui.intent.action.BUGREPORT"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "packageName"

    const-string v3, "com.miui.gallery"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    const-string v1, "IntentUtil"

    const-string v2, "can\'t go to bug report app"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_1
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "android.intent.category.BROWSABLE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "http://www.miui.com"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return v0

    :catch_1
    const-string p0, "IntentUtil"

    const-string v0, "can\'t go to www.miui.com"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static gotoBurstPhotoActivity(Landroid/app/Activity;Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;JLjava/lang/String;)V
    .locals 5

    new-instance p2, Landroid/content/Intent;

    const-class v0, Lcom/miui/gallery/activity/BurstPhotoActivity;

    invoke-direct {p2, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "remove_duplicate_items"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    const-string v2, "photo_data"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v2, "album_id"

    invoke-virtual {v0, v2, p3, p4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string p3, "photo_selection"

    invoke-virtual {v0, p3, p5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p3, "photo_order_by"

    const-string p4, "alias_sort_time desc "

    invoke-virtual {v0, p3, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p3, "unford_burst"

    invoke-virtual {v0, p3, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p3, "extra_custom_transition"

    invoke-virtual {p2, p3, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {p2, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p3

    iget p3, p3, Landroid/content/res/Configuration;->orientation:I

    const/4 p4, 0x0

    if-ne p3, v3, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p3

    invoke-static {p3}, Lcom/miui/gallery/compat/view/WindowCompat;->supportActivityTransitions(Landroid/view/Window;)Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getPageItem()Lcom/miui/gallery/ui/PhotoPageItem;

    move-result-object p3

    if-eqz p3, :cond_0

    new-array p5, v3, [Landroid/support/v4/util/Pair;

    const/4 v0, 0x0

    const v1, 0x7f1000ce

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p3, v1}, Landroid/support/v4/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/support/v4/util/Pair;

    move-result-object p3

    aput-object p3, p5, v0

    invoke-static {p0, p5}, Landroid/support/v4/app/ActivityOptionsCompat;->makeSceneTransitionAnimation(Landroid/app/Activity;[Landroid/support/v4/util/Pair;)Landroid/support/v4/app/ActivityOptionsCompat;

    move-result-object p3

    const-string p5, "has_transition"

    invoke-virtual {p2, p5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    goto :goto_0

    :cond_0
    move-object p3, p4

    :goto_0
    if-nez p3, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p3}, Landroid/support/v4/app/ActivityOptionsCompat;->toBundle()Landroid/os/Bundle;

    move-result-object p4

    :goto_1
    const/16 p3, 0x34

    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/app/Activity;->startActivityFromFragment(Landroid/app/Fragment;Landroid/content/Intent;ILandroid/os/Bundle;)V

    return-void
.end method

.method public static gotoDailyAlbumDetailPage(Landroid/app/Activity;I)V
    .locals 4

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.action.VIEW_ALBUM_DETAIL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "daily_album"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "daily_album_date"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "album_name"

    invoke-static {p1}, Lcom/miui/gallery/util/GalleryDateUtils;->format(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/miui/gallery/util/GalleryDateUtils;->formatRelativeDate(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "album_unwriteable"

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "album_id"

    const-wide/32 v1, 0x7ffffffb

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string p1, "album_server_id"

    const-wide/32 v1, -0x7ffffffb

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static gotoDeepClean(Landroid/content/Context;)V
    .locals 2

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "miui.intent.action.GARBAGE_DEEPCLEAN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, "IntentUtil"

    const-string v0, "can\'t goto deep clean page"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public static gotoMiCloudVipPage(Landroid/content/Context;)V
    .locals 4

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.miui.cloudservice"

    const-string v3, "com.miui.cloudservice.ui.MiCloudHybridActivity"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const-string v1, "com.miui.sdk.hybrid.extra.URL"

    const-string v2, "https://i.mi.com/vip?source=miui_gallery&ext=miui_gallery"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "IntentUtil"

    const-string v1, "can\'t goto micloud vip page"

    invoke-static {v0, v1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static gotoOperationCard(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.action.VIEW_WEB_OPERATION_STORY"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "url"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static gotoPhotoDetailPage(Landroid/app/Activity;Lcom/miui/gallery/model/BaseDataItem;Z)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/miui/gallery/activity/PhotoDetailActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "photo_detail_target"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    const-string p1, "StartActivityWhenLocked"

    invoke-virtual {v1, p1, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const/16 p1, 0x26

    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private static gotoPhotoPage(Landroid/app/Activity;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;JLjava/lang/String;IZLjava/lang/String;Ljava/util/ArrayList;ZZ)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Landroid/view/ViewGroup;",
            "Landroid/net/Uri;",
            "II",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/model/ImageLoadParams;",
            "J",
            "Ljava/lang/String;",
            "IZ",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/util/photoview/ItemViewInfo;",
            ">;ZZ)V"
        }
    .end annotation

    move-object v0, p0

    move-object v1, p1

    move-object v2, p6

    move-object/from16 v3, p8

    move-object/from16 v4, p15

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getPreviewPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v5

    new-instance v6, Lcom/miui/gallery/util/IntentUtil$1;

    invoke-direct {v6, p0}, Lcom/miui/gallery/util/IntentUtil$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v5, v6}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    const-string v6, "photo_data"

    move-object v7, p2

    invoke-virtual {v5, v6, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v6, "photo_init_position"

    move v7, p3

    invoke-virtual {v5, v6, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v6, "photo_count"

    move v7, p4

    invoke-virtual {v5, v6, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string v6, "photo_selection"

    move-object v7, p5

    invoke-virtual {v5, v6, p5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz v2, :cond_1

    const-string v6, "photo_selection_args"

    invoke-virtual {v5, v6, p6}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    :cond_1
    invoke-static/range {p7 .. p7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "photo_order_by"

    move-object/from16 v6, p7

    invoke-virtual {v5, v2, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    if-eqz v3, :cond_3

    const-string v2, "photo_transition_data"

    invoke-virtual {v5, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_3
    const-string v2, "from_gallery"

    const/4 v6, 0x1

    invoke-virtual {v5, v2, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    if-eqz v1, :cond_4

    invoke-static {}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getInstance()Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->setItemViewParent(Landroid/view/ViewGroup;)V

    goto :goto_0

    :cond_4
    if-eqz v4, :cond_5

    invoke-virtual/range {p15 .. p15}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_5

    invoke-static {}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getInstance()Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->setAppointedItemViewInfos(Ljava/util/List;)V

    :cond_5
    :goto_0
    invoke-static/range {p11 .. p11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "album_name"

    move-object/from16 v2, p11

    invoke-virtual {v5, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    const-string v1, "album_id"

    move-wide/from16 v7, p9

    invoke-virtual {v5, v1, v7, v8}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v1, "support_operation_mask"

    move/from16 v2, p12

    invoke-virtual {v5, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "from_recommend_face_page"

    move/from16 v2, p13

    invoke-virtual {v5, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "recommend_face_id"

    move-object/from16 v2, p14

    invoke-virtual {v5, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "photo_enter_transit"

    invoke-virtual {v5, v1, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "photo_preview_mode"

    move/from16 v2, p16

    invoke-virtual {v5, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    if-eqz p17, :cond_7

    const-string v1, "unford_burst"

    invoke-virtual {v5, v1, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_7
    invoke-static {}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getInstance()Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->setArguments(Landroid/os/Bundle;)V

    if-eqz v3, :cond_9

    new-instance v1, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    sget-object v2, Lcom/miui/gallery/Config$ThumbConfig;->THUMBNAIL_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->syncLoadFromThumbCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v1

    invoke-virtual/range {p8 .. p8}, Lcom/miui/gallery/model/ImageLoadParams;->getFileLength()J

    move-result-wide v4

    const-wide/16 v7, 0x0

    cmp-long v2, v4, v7

    if-lez v2, :cond_8

    invoke-virtual {v1, v6}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v2

    invoke-virtual/range {p8 .. p8}, Lcom/miui/gallery/model/ImageLoadParams;->getFileLength()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->fileLength(J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    :cond_8
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/miui/gallery/model/ImageLoadParams;->setDisplayImageOptions(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    invoke-static {p0, v3}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->preLoad(Landroid/content/Context;Lcom/miui/gallery/model/ImageLoadParams;)V

    :cond_9
    return-void
.end method

.method public static gotoPhotoPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;JLjava/lang/String;IZ)V
    .locals 18

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-wide/from16 v9, p9

    move-object/from16 v11, p11

    move/from16 v12, p12

    move/from16 v17, p13

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-static/range {v0 .. v17}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPage(Landroid/app/Activity;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;JLjava/lang/String;IZLjava/lang/String;Ljava/util/ArrayList;ZZ)V

    return-void
.end method

.method public static gotoPhotoPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;JZ)V
    .locals 18

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-wide/from16 v9, p9

    move/from16 v17, p11

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v11, 0x0

    const/4 v12, -0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-static/range {v0 .. v17}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPage(Landroid/app/Activity;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;JLjava/lang/String;IZLjava/lang/String;Ljava/util/ArrayList;ZZ)V

    return-void
.end method

.method public static gotoPhotoPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;Ljava/lang/String;Z)V
    .locals 18

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v11, p9

    move/from16 v17, p10

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-wide/16 v9, -0x1

    const/4 v12, -0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-static/range {v0 .. v17}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPage(Landroid/app/Activity;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;JLjava/lang/String;IZLjava/lang/String;Ljava/util/ArrayList;ZZ)V

    return-void
.end method

.method public static gotoPhotoPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;Ljava/lang/String;ZLjava/lang/String;Ljava/util/ArrayList;Z)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/ui/BaseMediaFragment;",
            "Landroid/view/ViewGroup;",
            "Landroid/net/Uri;",
            "II",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/model/ImageLoadParams;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/util/photoview/ItemViewInfo;",
            ">;Z)V"
        }
    .end annotation

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v11, p9

    move/from16 v13, p10

    move-object/from16 v14, p11

    move-object/from16 v15, p12

    move/from16 v17, p13

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-wide/16 v9, -0x1

    const/4 v12, -0x1

    const/16 v16, 0x0

    invoke-static/range {v0 .. v17}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPage(Landroid/app/Activity;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;JLjava/lang/String;IZLjava/lang/String;Ljava/util/ArrayList;ZZ)V

    return-void
.end method

.method public static gotoPhotoPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;Z)V
    .locals 18

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move/from16 v17, p9

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-wide/16 v9, -0x1

    const/4 v11, 0x0

    const/4 v12, -0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-static/range {v0 .. v17}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPage(Landroid/app/Activity;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;JLjava/lang/String;IZLjava/lang/String;Ljava/util/ArrayList;ZZ)V

    return-void
.end method

.method public static gotoPhotoPageFromPicker(Landroid/app/Activity;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;Ljava/util/ArrayList;Z)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/model/ImageLoadParams;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/util/photoview/ItemViewInfo;",
            ">;Z)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v15, p6

    move/from16 v17, p7

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    const-wide/16 v9, -0x1

    const/4 v11, 0x0

    const/4 v12, -0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x1

    invoke-static/range {v0 .. v17}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPage(Landroid/app/Activity;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;JLjava/lang/String;IZLjava/lang/String;Ljava/util/ArrayList;ZZ)V

    return-void
.end method

.method public static gotoPreviewSelectPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;[J[I)V
    .locals 12

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    invoke-static/range {v0 .. v11}, Lcom/miui/gallery/util/IntentUtil;->gotoPreviewSelectPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;[J[ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static gotoPreviewSelectPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;[J[ILjava/lang/String;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/miui/gallery/activity/PhotoPreviewSelectActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "photo_init_position"

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "photo_count"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "photo_selection"

    invoke-virtual {v0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    if-eqz p5, :cond_1

    const-string p1, "photo_selection_args"

    invoke-virtual {v0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    :cond_1
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    const-string p1, "photo_order_by"

    invoke-virtual {v0, p1, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_2
    if-eqz p7, :cond_3

    const-string p1, "photo_transition_data"

    invoke-virtual {v0, p1, p7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :cond_3
    if-eqz p8, :cond_4

    const-string p1, "photo_preview_selected_ids"

    invoke-virtual {v0, p1, p8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[J)Landroid/content/Intent;

    :cond_4
    if-eqz p9, :cond_5

    const-string p1, "photo_preview_selected_positions"

    invoke-virtual {v0, p1, p9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    :cond_5
    if-eqz p10, :cond_6

    const-string p1, "assistant_target_package"

    invoke-virtual {v0, p1, p10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_6
    if-eqz p11, :cond_7

    const-string p1, "assistant_target_class"

    invoke-virtual {v0, p1, p11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_7
    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/BaseMediaFragment;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static gotoPrivacyPolicy(Landroid/app/Activity;)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/agreement/cta/CtaAgreement$Licence;->getPrivacyIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static gotoSettings(Landroid/content/Context;)Z
    .locals 2

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    const-string p0, "IntentUtil"

    const-string v0, "can\'t go to settings page"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static gotoStoryAlbum(Landroid/app/Activity;J)V
    .locals 2

    if-eqz p0, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/miui/gallery/card/ui/detail/StoryAlbumActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "card_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public static gotoTrashBin(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.action.VIEW_WEB_DEVICE_ID"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "url"

    invoke-static {}, Lcom/miui/gallery/request/HostManager;->getTrashBinUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string v0, "from"

    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "trash_bin"

    const-string v0, "enter_trash_bin_page"

    invoke-static {p1, v0, p0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static gotoTurnOnSyncSwitch(Landroid/content/Context;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.xiaomi.action.MICLOUD_MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/miui/gallery/activity/CloudSettingsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "com.miui.gallery.cloud.provider.SYNC_SETTINGS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :goto_0
    return-void
.end method

.method public static guideToLoginXiaomiAccount(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/miui/gallery/activity/CloudGuideWelcomeActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    if-eqz p1, :cond_0

    invoke-virtual {v0, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    :cond_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static guideToLoginXiaomiAccount(Landroid/content/Context;Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;)V
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "cloud_guide_source"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    invoke-static {p0, v0}, Lcom/miui/gallery/util/IntentUtil;->guideToLoginXiaomiAccount(Landroid/content/Context;Landroid/os/Bundle;)V

    return-void
.end method

.method private static isDeviceSupportMeituXX()Z
    .locals 6

    sget-object v0, Lcom/miui/gallery/util/IntentUtil;->DEVICE_SUPPORT_MEITU_XX_EDITOR:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    sget-object v5, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method public static isSpeechInputSupported()Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isInternational()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isPad()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.xiaomi.mibrain.action.RECOGNIZE_SPEECH"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.xiaomi.mibrain.speech"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isIntentSupported(Landroid/content/Intent;)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static isSupportMeituCollage()Z
    .locals 2

    sget-object v0, Lcom/miui/gallery/util/IntentUtil;->SUPPORT_MEITU_COLLAGE:Lcom/miui/gallery/util/IntentUtil$SupportMeituCollage;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/IntentUtil$SupportMeituCollage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static isSupportMeituEditor()Z
    .locals 2

    sget-object v0, Lcom/miui/gallery/util/IntentUtil;->SUPPORT_MEITU_EDITOR:Lcom/miui/gallery/util/IntentUtil$SupportMeituEditor;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/IntentUtil$SupportMeituEditor;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static isSupportNewVideoPlayer()Z
    .locals 2

    sget-object v0, Lcom/miui/gallery/util/IntentUtil;->SUPPORT_NEW_VIDEO_PLAYER:Lcom/miui/gallery/util/IntentUtil$SupportNewVideoPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/IntentUtil$SupportNewVideoPlayer;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static jumpToExplore(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "miui.intent.action.OPEN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    sget-boolean v1, Lcom/miui/os/Rom;->IS_INTERNATIONAL:Z

    if-eqz v1, :cond_0

    const-string v1, "com.mi.android.globalFileexplorer"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    :cond_0
    const-string v1, "com.android.fileexplorer"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    :goto_0
    const-string v1, "explorer_path"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1
    return-void
.end method

.method static synthetic lambda$startPhotoMovie$6()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f100564

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return-void
.end method

.method public static pickFace(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;IZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;IZ)V"
        }
    .end annotation

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.action.PICK_FACE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "server_id_of_album"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "local_id_of_album"

    invoke-virtual {v0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "album_name"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "pick_face_direct"

    const/4 p2, 0x1

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "need_pick_face_id"

    invoke-virtual {v0, p1, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    if-eqz p4, :cond_0

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_0

    const-string p1, "pick_face_ids_in"

    const-string p2, ","

    invoke-static {p2, p4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    const-string p1, "pick-upper-bound"

    invoke-virtual {v0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "picker_result_set"

    const/4 p2, 0x0

    invoke-static {p2}, Lcom/miui/gallery/picker/PickerActivity;->copyPicker(Lcom/miui/gallery/picker/helper/Picker;)Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const/16 p1, 0x1f

    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public static pickPeople(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.action.PICK_PEOPLE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "pick_people"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "pick_people_candidate_name"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/16 p1, 0xe

    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public static playVideo(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;ZZIZLandroid/os/Bundle;)Z
    .locals 6

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-static {p1, p2}, Lcom/miui/gallery/util/IntentUtil;->ensureMimeType(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v1, "*/*"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p2, "video/*"

    :cond_0
    const/4 v1, 0x0

    :try_start_0
    const-string v2, "IntentUtil"

    const-string v3, "showGalleryWhenLocked: %s, requestOrientation: %d"

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v2, 0x1

    if-eqz p6, :cond_1

    invoke-static {v0, p1, p2, v2}, Lcom/miui/gallery/util/IntentUtil;->setDataAndType(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_1
    const-string v3, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->needReturnContentUri()Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v3, 0x0

    invoke-static {v0, p1, v3, v1}, Lcom/miui/gallery/util/IntentUtil;->setDataAndType(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_2
    invoke-static {v0, p1, p2}, Lcom/miui/gallery/util/IntentUtil;->setDataAndType(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;)V

    :goto_0
    const-string v3, "com.miui.videoplayer.GALLERY_VIDEO_PLAY"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    if-eqz p3, :cond_3

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isIntentSupported(Landroid/content/Intent;)Z

    move-result p3

    if-nez p3, :cond_4

    :cond_3
    const-string p3, "com.miui.videoplayer.LOCAL_VIDEO_PLAY"

    invoke-virtual {v0, p3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    :cond_4
    const-string p3, "StartActivityWhenLocked"

    invoke-virtual {v0, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p3, "com.miui.video.extra.play_video_request_orientation"

    invoke-virtual {v0, p3, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p3, "com.miui.video.extra.is_secret"

    invoke-virtual {v0, p3, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {v0, p7}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    instance-of p3, p0, Landroid/app/Activity;

    if-eqz p3, :cond_5

    move-object p3, p0

    check-cast p3, Landroid/app/Activity;

    invoke-virtual {p3}, Landroid/app/Activity;->getCallingPackage()Ljava/lang/String;

    move-result-object p4

    const-string p5, "IntentUtil"

    const-string p6, "play video extra calling package: %s"

    invoke-static {p5, p6, p4}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string p5, "miui_video_extra_calling_package"

    invoke-virtual {v0, p5, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/16 p4, 0x2d

    invoke-virtual {p3, v0, p4}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_1

    :cond_5
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    return v2

    :catch_0
    const p1, 0x7f100779

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_2

    :catch_1
    const-string p3, "IntentUtil"

    const-string p4, "local video player not found!"

    invoke-static {p3, p4}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const-string p3, "android.intent.action.VIEW"

    invoke-virtual {v0, p3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {v0, p1, p2}, Lcom/miui/gallery/util/IntentUtil;->setDataAndType(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :goto_2
    return v1
.end method

.method private static recordUriGenerateError()V
    .locals 2

    const-string v0, "IntentUtil"

    const-string v1, "checkedItem Uri generate error"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "creation"

    const-string v1, "checked_item_uri_error"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static removeAllShortCutForBabyAlbums(Landroid/content/Context;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Baby;->getBabyAlbumsHasShortcut()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/miui/gallery/util/IntentUtil;->removeShortCutForBabyAlbumByName(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/miui/gallery/preference/GalleryPreferences$Baby;->removeBabyAlbumShortcut(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static removeShortCutForBabyAlbumByName(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.home.launcher.action.UNINSTALL_SHORTCUT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "ro.miui.product.home"

    const-string v2, "com.miui.home"

    invoke-static {v1, v2}, Lcom/android/internal/SystemPropertiesCompat;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-ge v1, v2, :cond_0

    const-string v1, "android.intent.extra.shortcut.NAME"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    :cond_0
    const-string v1, "shortcut_id"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :goto_0
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v1, "android.intent.extra.shortcut.INTENT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method private static setDataAndType(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->needReturnContentUri()Z

    move-result v0

    invoke-static {p0, p1, p2, v0}, Lcom/miui/gallery/util/IntentUtil;->setDataAndType(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;Z)V

    return-void
.end method

.method private static setDataAndType(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;Z)V
    .locals 2

    const-string v0, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p3, :cond_0

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/provider/GalleryOpenProvider;->translateToContent(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    :goto_0
    return-void
.end method

.method public static showOnMap(Landroid/content/Context;DD)Z
    .locals 7

    const/4 v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_0
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "http://maps.google.com/maps?f=q&q=(%f,%f)"

    new-array v5, v0, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Landroid/content/ComponentName;

    const-string v5, "com.google.android.apps.maps"

    const-string v6, "com.google.android.maps.MapsActivity"

    invoke-direct {v4, v5, v6}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v5, Landroid/content/Intent;

    const-string v6, "android.intent.action.VIEW"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v5, v6, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v5, v4}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    const/4 v1, 0x0

    goto :goto_1

    :catch_1
    move-exception v3

    :try_start_1
    const-string v4, "IntentUtil"

    const-string v5, "GMM activity not found!"

    invoke-static {v4, v5, v3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "geo:%f,%f"

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    aput-object p1, v0, v2

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    aput-object p1, v0, v1

    invoke-static {v3, v4, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Landroid/content/Intent;

    const-string p3, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p2, p3, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_1

    :catch_2
    move-exception p0

    const-string p1, "IntentUtil"

    const-string p2, "GEO activity not found!"

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :goto_1
    return v1
.end method

.method public static startAdvancedRefocusAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Activity;Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 2

    const-string v0, "com.miui.extraphoto.action.VIEW_ADVANCED_REFOCUS"

    const/16 v1, 0x2c

    invoke-static {p0, p1, p2, v0, v1}, Lcom/miui/gallery/util/IntentUtil;->startExtraPhotoActivity(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Activity;Lcom/miui/gallery/ui/PhotoPageFragment;Ljava/lang/String;I)V

    return-void
.end method

.method public static startCameraActivity(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.media.action.STILL_IMAGE_CAMERA"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x14000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static startCloudMainPage(Landroid/content/Context;)Z
    .locals 2

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.xiaomi.action.MICLOUD_MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    const-string p0, "IntentUtil"

    const-string v0, "cloud main page start fail"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static startCollagePicker(Landroid/content/Context;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "image/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "pick_close_type"

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "com.miui.gallery"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Common;->URI_COLLAGE_FROM_PICKER:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string v2, "pick_intent"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v1, "pick-upper-bound"

    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->getCollageMaxImageSize()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private static startDualActionInternal(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Fragment;ZLjava/lang/String;)V
    .locals 2

    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p3, "com.miui.extraphoto"

    invoke-virtual {v0, p3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    new-instance p3, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p3

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getMimeType()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p3, p0}, Lcom/miui/gallery/util/IntentUtil;->setDataAndType(Landroid/content/Intent;Landroid/net/Uri;Ljava/lang/String;)V

    new-instance p0, Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    const-string p3, "StartActivityWhenLocked"

    invoke-virtual {p0, p3, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v0, p0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const/16 p0, 0x25

    :try_start_0
    invoke-virtual {p1, v0, p0}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "IntentUtil"

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void

    :cond_2
    :goto_1
    return-void
.end method

.method public static startEditAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Activity;Lcom/miui/gallery/ui/PhotoPageFragment;)Z
    .locals 1

    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lcom/miui/gallery/util/IntentUtil;->startEditAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Activity;Lcom/miui/gallery/ui/PhotoPageFragment;Z)Z

    move-result p0

    return p0
.end method

.method public static startEditAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Activity;Lcom/miui/gallery/ui/PhotoPageFragment;Z)Z
    .locals 10

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "allow_use_on_offline_global"

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->allowUseOnOfflineGlobal()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_0

    const p0, 0x7f10070a

    invoke-static {p1, p0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return v4

    :cond_0
    :try_start_0
    const-string p3, "com.miui.gallery.video.editor.activity.VideoEditorActivity"

    invoke-static {p3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p3

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p3

    invoke-virtual {p3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p3

    const-string v1, "extra_screen_brightness"

    iget p3, p3, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    instance-of p3, p1, Lcom/miui/gallery/util/BrightnessProvider;

    if-eqz p3, :cond_1

    move-object p3, p1

    check-cast p3, Lcom/miui/gallery/util/BrightnessProvider;

    const-string v1, "photo-brightness-manual"

    invoke-interface {p3}, Lcom/miui/gallery/util/BrightnessProvider;->getManualBrightness()F

    move-result v4

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    const-string v1, "photo-brightness-auto"

    invoke-interface {p3}, Lcom/miui/gallery/util/BrightnessProvider;->getAutoBrightness()F

    move-result p3

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p3

    invoke-virtual {p3}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    :cond_1
    :goto_0
    new-instance p3, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p3

    const-string v1, "video/*"

    invoke-virtual {v0, p3, v1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    goto/16 :goto_2

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getContentUriForExternal()Landroid/net/Uri;

    move-result-object v1

    if-nez v1, :cond_3

    const p0, 0x7f100511

    invoke-static {p1, p0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return v4

    :cond_3
    const-class v1, Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getContentUriForExternal()Landroid/net/Uri;

    move-result-object v1

    const-string v5, "image/*"

    invoke-virtual {v0, v1, v5}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    const-string v5, "extra_screen_brightness"

    iget v1, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {v0, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    instance-of v1, p1, Lcom/miui/gallery/util/BrightnessProvider;

    if-eqz v1, :cond_4

    move-object v1, p1

    check-cast v1, Lcom/miui/gallery/util/BrightnessProvider;

    const-string v5, "photo-brightness-manual"

    invoke-interface {v1}, Lcom/miui/gallery/util/BrightnessProvider;->getManualBrightness()F

    move-result v6

    invoke-virtual {v0, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    const-string v5, "photo-brightness-auto"

    invoke-interface {v1}, Lcom/miui/gallery/util/BrightnessProvider;->getAutoBrightness()F

    move-result v1

    invoke-virtual {v0, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    :cond_4
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_5

    const-string v5, "skip_interception"

    invoke-virtual {v1, v5, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    goto :goto_1

    :cond_5
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->getPhotoView()Landroid/widget/ImageView;

    move-result-object v6

    if-eqz v6, :cond_6

    invoke-virtual {v6}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    instance-of v8, v7, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v8, :cond_6

    check-cast v7, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getContentUriForExternal()Landroid/net/Uri;

    move-result-object v8

    invoke-virtual {v8}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/nostra13/universalimageloader/utils/MemoryCacheUtils;->generatePreviewPhotoKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v9

    invoke-virtual {v7}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v7

    invoke-virtual {v9, v8, v7}, Lcom/nostra13/universalimageloader/core/ImageLoader;->referenceToMemoryCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    const-string v7, "IntentUtil"

    const-string v9, "cache preview: %s"

    invoke-static {v7, v9, v8}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_6
    if-eqz p3, :cond_9

    if-nez v1, :cond_9

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p3

    invoke-static {p3}, Lcom/miui/gallery/compat/view/WindowCompat;->supportActivityTransitions(Landroid/view/Window;)Z

    move-result p3

    if-eqz p3, :cond_9

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p3

    iget p3, p3, Landroid/content/res/Configuration;->orientation:I

    if-ne p3, v3, :cond_9

    if-eqz v6, :cond_9

    invoke-virtual {p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->getView()Landroid/view/View;

    move-result-object p3

    const v1, 0x7f09021c

    invoke-virtual {p3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    if-eqz p3, :cond_8

    invoke-virtual {v6}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-nez v1, :cond_7

    return v4

    :cond_7
    new-array v7, v3, [Landroid/support/v4/util/Pair;

    const v8, 0x7f10055b

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {p3, v5}, Landroid/support/v4/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/support/v4/util/Pair;

    move-result-object p3

    aput-object p3, v7, v4

    invoke-static {p1, v7}, Landroid/support/v4/app/ActivityOptionsCompat;->makeSceneTransitionAnimation(Landroid/app/Activity;[Landroid/support/v4/util/Pair;)Landroid/support/v4/app/ActivityOptionsCompat;

    move-result-object p3

    const-string v4, "extra_custom_transition"

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v4, "extra_image_width"

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v4, "extra_image_height"

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    invoke-virtual {v0, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {v6}, Landroid/widget/ImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    const/16 v4, 0x9

    new-array v4, v4, [F

    invoke-virtual {v1, v4}, Landroid/graphics/Matrix;->getValues([F)V

    const-string v1, "extra_image_matrix"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[F)Landroid/content/Intent;

    goto :goto_3

    :cond_8
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "photo view not found"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_9
    :goto_2
    move-object p3, v2

    :goto_3
    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result v1

    if-eqz v1, :cond_a

    const-string v1, "extra_is_secret"

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result v4

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "extra_secret_key"

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getSecretKey()[B

    move-result-object v4

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    const-string v1, "photo_secret_id"

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v4

    invoke-virtual {v0, v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    :cond_a
    if-nez p3, :cond_b

    goto :goto_4

    :cond_b
    invoke-virtual {p3}, Landroid/support/v4/app/ActivityOptionsCompat;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    :goto_4
    const/16 p0, 0x1e

    if-eqz p2, :cond_c

    invoke-virtual {p1, p2, v0, p0, v2}, Landroid/app/Activity;->startActivityFromFragment(Landroid/app/Fragment;Landroid/content/Intent;ILandroid/os/Bundle;)V

    goto :goto_5

    :cond_c
    invoke-virtual {p1, v0, p0, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    :goto_5
    const-string p0, "IntentUtil"

    const-string p1, "startEditor"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v3
.end method

.method public static startExtraPhotoActivity(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Activity;Lcom/miui/gallery/ui/PhotoPageFragment;Ljava/lang/String;I)V
    .locals 7

    invoke-virtual {p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09021c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->getPhotoView()Landroid/widget/ImageView;

    move-result-object v1

    const/16 v2, 0x9

    new-array v2, v2, [F

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    invoke-virtual {v1}, Landroid/widget/ImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->getValues([F)V

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p3, "com.miui.extraphoto"

    invoke-virtual {v1, p3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p3

    invoke-virtual {p3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p3

    const-string v6, "extra_screen_brightness"

    iget p3, p3, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {v1, v6, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    const-string p3, "extra_path"

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p3, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 p0, 0x0

    if-lez v5, :cond_1

    if-lez v4, :cond_1

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p3

    iget p3, p3, Landroid/content/res/Configuration;->orientation:I

    const/4 v6, 0x1

    if-ne p3, v6, :cond_1

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p3

    invoke-static {p3}, Lcom/miui/gallery/compat/view/WindowCompat;->supportActivityTransitions(Landroid/view/Window;)Z

    move-result p3

    if-eqz p3, :cond_1

    const-string p3, "extra_preview_image_width"

    invoke-virtual {v1, p3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p3, "extra_preview_image_height"

    invoke-virtual {v1, p3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p3, "extra_preview_image_matrix"

    invoke-virtual {v1, p3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[F)Landroid/content/Intent;

    const-string p3, "extra_has_transition"

    invoke-virtual {v1, p3, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/4 p3, 0x2

    new-array p3, p3, [Landroid/support/v4/util/Pair;

    const-string v2, "tag_transition_view"

    invoke-static {v0, v2}, Landroid/support/v4/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/support/v4/util/Pair;

    move-result-object v2

    aput-object v2, p3, v3

    const-string v2, "tag_transition_view_menu"

    invoke-static {v0, v2}, Landroid/support/v4/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/support/v4/util/Pair;

    move-result-object v0

    aput-object v0, p3, v6

    invoke-static {p1, p3}, Landroid/support/v4/app/ActivityOptionsCompat;->makeSceneTransitionAnimation(Landroid/app/Activity;[Landroid/support/v4/util/Pair;)Landroid/support/v4/app/ActivityOptionsCompat;

    move-result-object p3

    goto :goto_1

    :cond_1
    move-object p3, p0

    :goto_1
    if-nez p3, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {p3}, Landroid/support/v4/app/ActivityOptionsCompat;->toBundle()Landroid/os/Bundle;

    move-result-object p0

    :goto_2
    if-eqz p2, :cond_3

    :try_start_0
    invoke-virtual {p1, p2, v1, p4, p0}, Landroid/app/Activity;->startActivityFromFragment(Landroid/app/Fragment;Landroid/content/Intent;ILandroid/os/Bundle;)V

    goto :goto_4

    :catch_0
    move-exception p0

    goto :goto_3

    :cond_3
    invoke-virtual {p1, v1, p4, p0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :goto_3
    const-string p1, "IntentUtil"

    const-string p2, "start extra photo activity error\n"

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_4
    return-void
.end method

.method public static startFancyColorAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Fragment;Z)V
    .locals 1

    const-string v0, "com.miui.extraphoto.action.FANCY_COLOR"

    invoke-static {p0, p1, p2, v0}, Lcom/miui/gallery/util/IntentUtil;->startDualActionInternal(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Fragment;ZLjava/lang/String;)V

    return-void
.end method

.method public static startFreeViewAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Fragment;Z)V
    .locals 1

    const-string v0, "com.miui.extraphoto.action.VIEW_3D"

    invoke-static {p0, p1, p2, v0}, Lcom/miui/gallery/util/IntentUtil;->startDualActionInternal(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Fragment;ZLjava/lang/String;)V

    return-void
.end method

.method public static startMeituCollageAction(Landroid/app/Activity;Ljava/util/List;I)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;I)Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p0, :cond_6

    if-nez p1, :cond_0

    goto/16 :goto_3

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/Uri;

    const-string v4, "file"

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/provider/GalleryOpenProvider;->translateToContent(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    :cond_2
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v4, "com.miui.gallery.open"

    invoke-virtual {v2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string v4, "com.mt.mtxx.mtxx"

    invoke-virtual {p0, v4, v2, v3}, Landroid/app/Activity;->grantUriPermission(Ljava/lang/String;Landroid/net/Uri;I)V

    goto :goto_0

    :cond_3
    new-instance p1, Landroid/content/Intent;

    const-string v2, "com.xiaomi.intent.action.PUZZLE"

    invoke-direct {p1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "meitu_edit_result_path"

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getCreativeDirectory()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "edit_from_xiaomi_album"

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v2, "extra_key_out_puzzle_image_info"

    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    const-string v1, "image/*"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "com.mt.mtxx.mtxx"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isIntentSupported(Landroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_5

    if-lez p2, :cond_4

    :try_start_0
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_1

    :catch_0
    move-exception p0

    goto :goto_2

    :cond_4
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    return v3

    :goto_2
    const-string p1, "IntentUtil"

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v0

    :cond_5
    return v0

    :cond_6
    :goto_3
    return v0
.end method

.method public static startMeituEditAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Activity;Lcom/miui/gallery/ui/PhotoPageFragment;)Z
    .locals 6

    const/4 v0, 0x0

    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getContentUriForExternal()Landroid/net/Uri;

    move-result-object v1

    if-nez v1, :cond_1

    return v0

    :cond_1
    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1}, Lcom/miui/gallery/provider/GalleryOpenProvider;->translateToContent(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    new-instance v3, Landroid/content/Intent;

    const-string v4, "com.xiaomi.intent.action.BEAUTY"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v4, "image/*"

    invoke-virtual {v3, v1, v4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v5, "edit_from_xiaomi_album"

    invoke-virtual {v3, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v5, "meitu_edit_result_path"

    invoke-virtual {v3, v5, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "android.intent.extra.STREAM"

    invoke-virtual {v3, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v2, "com.mt.mtxx.mtxx"

    invoke-virtual {v3, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {v3}, Lcom/miui/gallery/util/MiscUtil;->isIntentSupported(Landroid/content/Intent;)Z

    move-result v2

    if-eqz v2, :cond_2

    :try_start_0
    const-string v2, "com.mt.mtxx.mtxx"

    invoke-virtual {p1, v2, v1, v4}, Landroid/app/Activity;->grantUriPermission(Ljava/lang/String;Landroid/net/Uri;I)V

    const/16 v1, 0x33

    invoke-virtual {p1, v3, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v4

    :catch_0
    move-exception v1

    const-string v2, "IntentUtil"

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {p0, p1, p2, v0}, Lcom/miui/gallery/util/IntentUtil;->startEditAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Activity;Lcom/miui/gallery/ui/PhotoPageFragment;Z)Z

    return v4

    :cond_2
    return v0

    :cond_3
    :goto_0
    return v0
.end method

.method public static startMotionPhotoAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Activity;Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 2

    const-string v0, "com.miui.extraphoto.action.MOTION_PHOTO_REPICK"

    const/16 v1, 0x32

    invoke-static {p0, p1, p2, v0, v1}, Lcom/miui/gallery/util/IntentUtil;->startExtraPhotoActivity(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Activity;Lcom/miui/gallery/ui/PhotoPageFragment;Ljava/lang/String;I)V

    return-void
.end method

.method public static startPhotoMovie(Landroid/app/Activity;Ljava/util/List;JILjava/lang/String;Ljava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/model/MediaInfo;",
            ">;JI",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->getInstance()Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/util/-$$Lambda$IntentUtil$X7d-X8rxVk66BcSwSLu5gb_B86c;->INSTANCE:Lcom/miui/gallery/util/-$$Lambda$IntentUtil$X7d-X8rxVk66BcSwSLu5gb_B86c;

    invoke-virtual {v0, p0, v1}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->checkAbleOrDownload(Landroid/app/Activity;Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object v3, v1

    const/4 v2, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v0, v4, :cond_3

    const/16 v4, 0x14

    if-ge v2, v4, :cond_3

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_1

    goto :goto_2

    :cond_1
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/card/model/MediaInfo;

    invoke-virtual {v4}, Lcom/miui/gallery/card/model/MediaInfo;->getUri()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/provider/GalleryOpenProvider;->translateToContent(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/card/model/MediaInfo;

    invoke-virtual {v5}, Lcom/miui/gallery/card/model/MediaInfo;->getSha1()Ljava/lang/String;

    move-result-object v5

    if-nez v3, :cond_2

    new-instance v3, Landroid/content/ClipData;

    const-string v6, "data"

    const-string v7, "image/*"

    const-string v8, "text/uri-list"

    filled-new-array {v7, v8}, [Ljava/lang/String;

    move-result-object v7

    new-instance v8, Landroid/content/ClipData$Item;

    invoke-direct {v8, v5, v1, v4}, Landroid/content/ClipData$Item;-><init>(Ljava/lang/CharSequence;Landroid/content/Intent;Landroid/net/Uri;)V

    invoke-direct {v3, v6, v7, v8}, Landroid/content/ClipData;-><init>(Ljava/lang/CharSequence;[Ljava/lang/String;Landroid/content/ClipData$Item;)V

    goto :goto_1

    :cond_2
    new-instance v6, Landroid/content/ClipData$Item;

    invoke-direct {v6, v5, v1, v4}, Landroid/content/ClipData$Item;-><init>(Ljava/lang/CharSequence;Landroid/content/Intent;Landroid/net/Uri;)V

    invoke-virtual {v3, v6}, Landroid/content/ClipData;->addItem(Landroid/content/ClipData$Item;)V

    :goto_1
    add-int/lit8 v2, v2, 0x1

    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v0, "movie_extra_preview_mode"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v0, "card_id"

    invoke-virtual {p1, v0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string p2, "card_title"

    invoke-virtual {p1, p2, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "card_sub_title"

    invoke-virtual {p1, p2, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "movie_extra_template"

    invoke-virtual {p1, p2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p1, v3}, Landroid/content/Intent;->setClipData(Landroid/content/ClipData;)V

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :cond_4
    return-void
.end method

.method public static startRefocusAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Fragment;Z)V
    .locals 1

    const-string v0, "com.miui.extraphoto.action.VIEW_REFOCUS"

    invoke-static {p0, p1, p2, v0}, Lcom/miui/gallery/util/IntentUtil;->startDualActionInternal(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Fragment;ZLjava/lang/String;)V

    return-void
.end method

.method public static startSpeechInput(Landroid/app/Activity;IZLjava/util/ArrayList;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "IZ",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.xiaomi.mibrain.action.RECOGNIZE_SPEECH"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.xiaomi.mibrain.speech"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "miref"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "appId"

    const-string v2, "2882303761517492012"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "appToken"

    const-string v2, "527730249789"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "client_id"

    const-string v2, "2882303761517492012"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "api_key"

    const-string v2, "NwRthN_W6eI4dvXX47gZIlZdwBoDMT5t2Xu-7uciaqw"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "sign_secret"

    const-string v2, "wyRVnz7UEHQqNcwYAvANxiXBL25taWWPsSQGHbWIcNcEVYrU72NO0MBZjkqXuOk-iOXXiAnrMlZo78sJDhFreg"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "needNlp"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {p3}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p2, "suggestedSpeechTexts"

    invoke-virtual {v0, p2, p3}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    :cond_0
    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    const-string p0, "IntentUtil"

    const-string p1, "Start speech input error"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method
