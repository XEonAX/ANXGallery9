.class public Lcom/miui/gallery/picker/PickFaceAlbumActivity;
.super Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;
.source "PickFaceAlbumActivity.java"


# instance fields
.field private mParseTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;-><init>()V

    new-instance v0, Lcom/miui/gallery/picker/PickFaceAlbumActivity$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/picker/PickFaceAlbumActivity$1;-><init>(Lcom/miui/gallery/picker/PickFaceAlbumActivity;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->mParseTask:Landroid/os/AsyncTask;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/picker/PickFaceAlbumActivity;)Landroid/content/Intent;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->parseResult()Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private parseResult()Landroid/content/Intent;
    .locals 9

    const-string v0, "\',\'"

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_PICKER:Landroid/net/Uri;

    const-string v3, "sha1"

    const/4 v7, 0x0

    invoke-static {v2, v3, v7}, Lcom/miui/gallery/util/UriUtil;->appendGroupBy(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->PICKABLE_PROJECTION:[Ljava/lang/String;

    const-string v4, "sha1 IN (\'%s\') AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v0, v6, v8

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "INSTR(\"\'%s\'\", sha1)"

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v8

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const/4 v5, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-nez v0, :cond_0

    return-object v7

    :cond_0
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const-string v3, "pick-result-data"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v1
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    if-nez p1, :cond_0

    return-void

    :cond_0
    const p1, 0x7f0b0113

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f090034

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/picker/PickFaceAlbumFragment;

    iput-object p1, p0, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->mAlbumDetailFragment:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    iget-object p1, p0, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->mAlbumDetailFragment:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->mItemStateListener:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$ItemStateListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->setItemStateListener(Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$ItemStateListener;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->mAlbumDetailFragment:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->setSelectionCloudNotContainUnique()V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "album_name"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->setTitle(Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method

.method protected onDone()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "pick_face_direct"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "need_pick_face_id"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->iterator()Ljava/util/Iterator;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v2, "picked_face_id"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v0, -0x1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->setResult(ILandroid/content/Intent;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->finish()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/picker/PickFaceAlbumActivity;->mParseTask:Landroid/os/AsyncTask;

    new-array v1, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    :cond_2
    invoke-super {p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->onDone()V

    :goto_0
    return-void
.end method
