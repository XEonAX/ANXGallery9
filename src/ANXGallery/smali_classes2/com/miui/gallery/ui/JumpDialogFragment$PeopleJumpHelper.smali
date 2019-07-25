.class Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;
.super Ljava/lang/Object;
.source "JumpDialogFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/JumpDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PeopleJumpHelper"
.end annotation


# instance fields
.field public final PROJECTION:[Ljava/lang/String;

.field private mFragment:Landroid/app/Fragment;

.field private mHandleIntentCallback:Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;

.field final synthetic this$0:Lcom/miui/gallery/ui/JumpDialogFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/JumpDialogFragment;Landroid/app/Fragment;)V
    .locals 11

    iput-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;->this$0:Lcom/miui/gallery/ui/JumpDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "_id"

    const-string v1, "peopleName"

    const-string v2, "relationType"

    const-string v3, "microthumbfile"

    const-string v4, "thumbnailFile"

    const-string v5, "localFile"

    const-string v6, "faceXScale"

    const-string v7, "faceYScale"

    const-string v8, "faceWScale"

    const-string v9, "faceHScale"

    const-string v10, "serverId"

    filled-new-array/range {v0 .. v10}, [Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;->PROJECTION:[Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;->mFragment:Landroid/app/Fragment;

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 3

    new-instance p1, Landroid/content/CursorLoader;

    iget-object v0, p0, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PEOPLE_COVER_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "serverId"

    const-string v2, "serverId"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 8

    const/4 p1, 0x0

    if-eqz p2, :cond_3

    check-cast p2, Landroid/database/Cursor;

    :try_start_0
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const/16 v1, 0xa

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p2, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "server_id_of_album"

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "local_id_of_album"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;->mFragment:Landroid/app/Fragment;

    const v2, 0x7f100503

    invoke-virtual {v1, v2}, Landroid/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    :cond_0
    const-string v2, "album_name"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "relationType"

    const/4 v2, 0x2

    invoke-interface {p2, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const/4 v1, 0x4

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x3

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    :cond_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v1, 0x5

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    :cond_2
    const-string v2, "face_album_cover"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "face_position_rect"

    new-instance v2, Landroid/graphics/RectF;

    const/4 v3, 0x6

    invoke-interface {p2, v3}, Landroid/database/Cursor;->getFloat(I)F

    move-result v4

    const/4 v5, 0x7

    invoke-interface {p2, v5}, Landroid/database/Cursor;->getFloat(I)F

    move-result v6

    invoke-interface {p2, v3}, Landroid/database/Cursor;->getFloat(I)F

    move-result v3

    const/16 v7, 0x8

    invoke-interface {p2, v7}, Landroid/database/Cursor;->getFloat(I)F

    move-result v7

    add-float/2addr v3, v7

    invoke-interface {p2, v5}, Landroid/database/Cursor;->getFloat(I)F

    move-result v5

    const/16 v7, 0x9

    invoke-interface {p2, v7}, Landroid/database/Cursor;->getFloat(I)F

    move-result v7

    add-float/2addr v5, v7

    invoke-direct {v2, v4, v6, v3, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const-class v0, Lcom/miui/gallery/activity/facebaby/FacePageActivity;

    invoke-virtual {v1, p1, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object p1, v1

    goto :goto_0

    :catch_0
    move-object p1, v1

    :catch_1
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    :cond_3
    :goto_0
    if-eqz p1, :cond_4

    iget-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;->mHandleIntentCallback:Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;

    invoke-interface {p2, p1}, Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;->onHandleIntent(Landroid/content/Intent;)V

    goto :goto_1

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;->mHandleIntentCallback:Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;

    iget-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {p2}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;->mFragment:Landroid/app/Fragment;

    const v1, 0x7f1004ff

    invoke-virtual {v0, v1}, Landroid/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;->onJumpFailed(Landroid/content/Context;Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method

.method public startLoading(Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;Ljava/lang/String;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;->mHandleIntentCallback:Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v0, "serverId"

    invoke-virtual {p1, v0, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {p2}, Landroid/app/Fragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p2

    const/4 v0, 0x1

    invoke-virtual {p2, v0, p1, p0}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method
