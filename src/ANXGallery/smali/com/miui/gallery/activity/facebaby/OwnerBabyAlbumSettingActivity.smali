.class public Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;
.super Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;
.source "OwnerBabyAlbumSettingActivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private mBabyFaceChanged:Z

.field private mCoverFaceId:Ljava/lang/String;

.field private mDatelistener:Lmiui/app/DatePickerDialog$OnDateSetListener;

.field private mNeedSaveBabyFace:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;-><init>()V

    new-instance v0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$5;-><init>(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;)V

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mDatelistener:Lmiui/app/DatePickerDialog$OnDateSetListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mCoverFaceId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->loadAndSetBabyFace(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;Ljava/lang/String;Landroid/app/AlertDialog;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->validateInputTextAndUpdateButtonState(Ljava/lang/String;Landroid/app/AlertDialog;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->loadBabyFace(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V

    return-void
.end method

.method private createOrBrowse()Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabyAlbumLocalId:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private loadAndSetBabyFace(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mCoverFaceBitmap:Landroid/graphics/Bitmap;

    if-nez p1, :cond_0

    const/4 p1, 0x1

    new-array p1, p1, [Landroid/graphics/RectF;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mPeopleId:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/FaceManager;->queryCoverImageOfOnePerson(Ljava/lang/String;[Landroid/graphics/RectF;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$4;

    invoke-direct {v2, p0, v0, p1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$4;-><init>(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;Ljava/lang/String;[Landroid/graphics/RectF;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mFace:Landroid/widget/ImageView;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mFace:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mCoverFaceBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private loadBabyFace(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mCoverFaceId:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    new-array p1, p1, [Landroid/graphics/RectF;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mCoverFaceId:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->getFaceByFaceId(Ljava/lang/String;[Landroid/graphics/RectF;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$10;

    invoke-direct {v2, p0, v0, p1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$10;-><init>(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;Ljava/lang/String;[Landroid/graphics/RectF;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method private refreshBabyFace()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$9;

    invoke-direct {v1, p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$9;-><init>(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method public static saveInfo2Db(Lcom/miui/gallery/cloud/baby/BabyInfo;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;)V
    .locals 5

    const/4 p2, 0x0

    const/4 v0, 0x1

    if-nez p4, :cond_1

    new-instance p4, Landroid/content/ContentValues;

    invoke-direct {p4}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "babyInfoJson"

    if-nez p0, :cond_0

    const-string p0, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/baby/BabyInfo;->toJSON()Ljava/lang/String;

    move-result-object p0

    :goto_0
    invoke-virtual {p4, v1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "peopleId"

    invoke-virtual {p4, p0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "_id = ?"

    new-array p1, v0, [Ljava/lang/String;

    aput-object p3, p1, p2

    sget-object p2, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {p2, p4, p0, p1}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_2

    :cond_1
    const/16 v1, 0x42

    invoke-static {v1}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->transformToEditedColumnsElement(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "update %s set %s=%s, %s=%s, %s=\'%s\', %s=coalesce(replace(%s, \'%s\', \'\') || \'%s\', \'%s\') where %s=%s"

    const/16 v3, 0xe

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "cloud"

    aput-object v4, v3, p2

    const-string p2, "thumbnailInfo"

    aput-object p2, v3, v0

    const/4 p2, 0x2

    invoke-virtual {p4}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Landroid/database/DatabaseUtils;->sqlEscapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    aput-object p4, v3, p2

    const/4 p2, 0x3

    const-string p4, "babyInfoJson"

    aput-object p4, v3, p2

    const/4 p2, 0x4

    if-nez p0, :cond_2

    const-string p0, ""

    goto :goto_1

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/baby/BabyInfo;->toJSON()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/database/DatabaseUtils;->sqlEscapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_1
    aput-object p0, v3, p2

    const/4 p0, 0x5

    const-string p2, "peopleId"

    aput-object p2, v3, p0

    const/4 p0, 0x6

    aput-object p1, v3, p0

    const/4 p0, 0x7

    const-string p1, "editedColumns"

    aput-object p1, v3, p0

    const/16 p0, 0x8

    const-string p1, "editedColumns"

    aput-object p1, v3, p0

    const/16 p0, 0x9

    aput-object v1, v3, p0

    const/16 p0, 0xa

    aput-object v1, v3, p0

    const/16 p0, 0xb

    aput-object v1, v3, p0

    const/16 p0, 0xc

    const-string p1, "_id"

    aput-object p1, v3, p0

    const/16 p0, 0xd

    aput-object p3, v3, p0

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/util/GalleryUtils;->safeExec(Ljava/lang/String;)Z

    :goto_2
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    return-void
.end method

.method private validateInputTextAndUpdateButtonState(Ljava/lang/String;Landroid/app/AlertDialog;)Ljava/lang/String;
    .locals 1

    invoke-static {p0, p1}, Lcom/miui/gallery/cloud/CreateGroupItem;->checkFileNameValid(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, -0x1

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    invoke-virtual {p2, v0}, Landroid/widget/Button;->setEnabled(Z)V

    return-object p1
.end method


# virtual methods
.method protected getIntentToAutoUploadPage()Landroid/content/Intent;
    .locals 3

    invoke-super {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->getIntentToAutoUploadPage()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "allow_to_reassociate"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-object v0
.end method

.method protected getPreferenceResourceId()I
    .locals 1

    const v0, 0x7f140005

    return v0
.end method

.method protected justSaveInfo2DbByJson()V
    .locals 6

    iget-boolean v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mHaveSaveBabyInfo:Z

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->createOrBrowse()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->babyInfoChanged()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mNeedSaveBabyFace:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mPeopleId:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->toBabyInfo(Ljava/lang/String;I)Lcom/miui/gallery/cloud/baby/BabyInfo;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mPeopleId:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mFaceAlbumLocalId:Ljava/lang/Long;

    iget-object v4, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabyAlbumLocalId:Ljava/lang/Long;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    invoke-static {v0, v2, v3, v4, v5}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->saveInfo2Db(Lcom/miui/gallery/cloud/baby/BabyInfo;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;)V

    iput-boolean v1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mHaveSaveBabyInfo:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mNeedSaveBabyFace:Z

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    const/4 v0, -0x1

    if-eqz p1, :cond_3

    const/16 v1, 0x1f

    if-eq p1, v1, :cond_0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    :cond_0
    if-ne p2, v0, :cond_4

    if-eqz p3, :cond_4

    const-string p1, "picked_face_id"

    invoke-virtual {p3, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mCoverFaceId:Ljava/lang/String;

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->createOrBrowse()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    if-nez p1, :cond_1

    new-instance p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    iget-object p2, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabyAlbumLocalId:Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide p2

    iget-boolean v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mIsOtherShareAlbum:Z

    const/4 v1, 0x0

    invoke-direct {p1, p2, p3, v0, v1}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;-><init>(JZLjava/lang/String;)V

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    iget-object p2, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mCoverFaceId:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->setFaceId(Ljava/lang/String;)Z

    :cond_2
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabyFaceChanged:Z

    iput-boolean p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mNeedSaveBabyFace:Z

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->refreshBabyFace()V

    goto :goto_0

    :cond_3
    if-ne p2, v0, :cond_4

    if-eqz p3, :cond_4

    const-string p1, "baby-info"

    invoke-virtual {p3, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/cloud/baby/BabyInfo;

    iget-boolean p1, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mAutoupdate:Z

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mIsAutoupdate:Ljava/lang/Boolean;

    :cond_4
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "faceAlbumLocalId"

    const-wide/16 v1, -0x1

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mFaceAlbumLocalId:Ljava/lang/Long;

    const-string v0, "faceAlbumServerId"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "faceAlbumServerId"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mPeopleId:Ljava/lang/String;

    :cond_0
    const-string v0, "faceAlbumCoverFaceServerId"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mCoverFaceId:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabyNicknamePre:Landroid/preference/Preference;

    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabySexPre:Landroid/preference/Preference;

    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mRelationPre:Landroid/preference/Preference;

    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    const v0, 0x7f090132

    invoke-virtual {p0, v0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->createOrBrowse()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const-string v1, "birthday"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBirthday:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBirthday:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->getBirthYearMonthDay(Ljava/lang/String;)V

    const-string v1, "name"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mNickName:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mNickName:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    const p1, 0x7f100394

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mNickName:Ljava/lang/String;

    :cond_1
    new-instance p1, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$1;-><init>(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mFace:Landroid/widget/ImageView;

    new-instance v0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$2;-><init>(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->createOrBrowse()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->setCoverFaceAndBirthdayForCreateBaby()V

    :cond_2
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->onBackPressed()V

    :goto_0
    invoke-super {p0, p1}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->onPause()V

    const-string v0, "album_baby_share_owner_setting"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageEnd(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabySexPre:Landroid/preference/Preference;

    if-ne p1, v0, :cond_0

    check-cast p2, Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mSex:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabySexPre:Landroid/preference/Preference;

    check-cast p1, Landroid/preference/ListPreference;

    iget-object p2, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mSex:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabySexPre:Landroid/preference/Preference;

    iget-object p2, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabySexPre:Landroid/preference/Preference;

    check-cast p2, Landroid/preference/ListPreference;

    invoke-virtual {p2}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mRelationPre:Landroid/preference/Preference;

    if-ne p1, v0, :cond_1

    check-cast p2, Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mRelation:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mRelationPre:Landroid/preference/Preference;

    check-cast p1, Landroid/preference/ListPreference;

    iget-object p2, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mRelation:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mRelationPre:Landroid/preference/Preference;

    check-cast p1, Landroid/preference/ListPreference;

    invoke-virtual {p1}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mRelationText:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mRelationPre:Landroid/preference/Preference;

    iget-object p2, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mRelationText:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 8

    const-string v0, "baby_birthday"

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBirthdayYear:I

    const/4 p2, 0x1

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBirthdayMonth:I

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBirthdayDay:I

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBirthdayYear:I

    iget v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBirthdayMonth:I

    iget v1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBirthdayDay:I

    move v5, p1

    move v7, v1

    goto :goto_1

    :cond_1
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->getCurrentYearMonthDay(J)[I

    move-result-object p1

    const/4 v0, 0x0

    aget v0, p1, v0

    aget v1, p1, p2

    const/4 v2, 0x2

    aget p1, p1, v2

    move v7, p1

    move v5, v0

    move v0, v1

    :goto_1
    new-instance p1, Lmiui/app/DatePickerDialog;

    iget-object v4, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mDatelistener:Lmiui/app/DatePickerDialog$OnDateSetListener;

    add-int/lit8 v6, v0, -0x1

    move-object v2, p1

    move-object v3, p0

    invoke-direct/range {v2 .. v7}, Lmiui/app/DatePickerDialog;-><init>(Landroid/content/Context;Lmiui/app/DatePickerDialog$OnDateSetListener;III)V

    invoke-virtual {p1}, Lmiui/app/DatePickerDialog;->show()V

    return p2

    :cond_2
    const-string v0, "baby_name"

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mNickName:Ljava/lang/String;

    invoke-virtual {p0, v0, p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->rename(Ljava/lang/String;Landroid/app/Activity;)V

    :cond_3
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result p1

    return p1
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->onResume()V

    const-string v0, "album_baby_share_owner_setting"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageStart(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method public rename(Ljava/lang/String;Landroid/app/Activity;)V
    .locals 4

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f100431

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    const/4 v2, 0x0

    const v3, 0x7f0b002c

    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v3, 0x7f0900c0

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    invoke-virtual {v3, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3}, Landroid/widget/EditText;->selectAll()V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    new-instance p1, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$6;

    invoke-direct {p1, p0, v3, p2}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$6;-><init>(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;Landroid/widget/EditText;Landroid/app/Activity;)V

    const v1, 0x104000a

    invoke-virtual {v0, v1, p1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const/high16 p1, 0x1040000

    invoke-virtual {v0, p1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$7;

    invoke-direct {v0, p0, v3, p1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$7;-><init>(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;Landroid/widget/EditText;Landroid/app/AlertDialog;)V

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    new-instance v0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$8;

    invoke-direct {v0, p0, v3, p1, p2}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$8;-><init>(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;Landroid/widget/EditText;Landroid/app/AlertDialog;Landroid/app/Activity;)V

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 p2, 0x5

    invoke-virtual {p1, p2}, Landroid/view/Window;->setSoftInputMode(I)V

    return-void
.end method

.method protected saveBabyInfo()V
    .locals 5

    invoke-direct {p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->createOrBrowse()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->babyInfoChanged()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabyFaceChanged:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mPeopleId:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->toBabyInfo(Ljava/lang/String;I)Lcom/miui/gallery/cloud/baby/BabyInfo;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string v3, "baby-info"

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v0, "name"

    iget-object v3, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mNickName:Ljava/lang/String;

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "babyAlbumLocalId"

    iget-object v3, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabyAlbumLocalId:Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v2, v0, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v0, "baby-people-id"

    iget-object v3, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mPeopleId:Ljava/lang/String;

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "faceAlbumLocalId"

    iget-object v3, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mFaceAlbumLocalId:Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v2, v0, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    if-eqz v0, :cond_1

    const-string v0, "thumbnail_info_of_baby"

    iget-object v3, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    invoke-virtual {v3}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    invoke-virtual {v1, v2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const/16 v0, 0xc

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->setResult(ILandroid/content/Intent;)V

    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method protected setCoverFaceAndBirthdayForCreateBaby()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity$3;-><init>(Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method protected setPreferencesValue()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/activity/facebaby/BabyAlbumSettingActivityBase;->setPreferencesValue()V

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabyNicknamePre:Landroid/preference/Preference;

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mNickName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mChooseDate:Landroid/preference/Preference;

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBirthday:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabySexPre:Landroid/preference/Preference;

    check-cast v0, Landroid/preference/ListPreference;

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mSex:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabySexPre:Landroid/preference/Preference;

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mBabySexPre:Landroid/preference/Preference;

    check-cast v1, Landroid/preference/ListPreference;

    invoke-virtual {v1}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mRelationPre:Landroid/preference/Preference;

    check-cast v0, Landroid/preference/ListPreference;

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mRelation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mRelationPre:Landroid/preference/Preference;

    check-cast v0, Landroid/preference/ListPreference;

    invoke-virtual {v0}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mRelationText:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mRelationPre:Landroid/preference/Preference;

    iget-object v1, p0, Lcom/miui/gallery/activity/facebaby/OwnerBabyAlbumSettingActivity;->mRelationText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method
