.class public Lcom/miui/gallery/util/ActionURIHandler;
.super Ljava/lang/Object;
.source "ActionURIHandler.java"


# static fields
.field protected static final sURIMatcher:Landroid/content/UriMatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/miui/gallery/util/ActionURIHandler;->sURIMatcher:Landroid/content/UriMatcher;

    sget-object v0, Lcom/miui/gallery/util/ActionURIHandler;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gallery.i.mi.com"

    const-string v2, "people"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/util/ActionURIHandler;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gallery.i.mi.com"

    const-string v2, "album"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/util/ActionURIHandler;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gallery.i.mi.com"

    const-string v2, "trash_bin"

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/util/ActionURIHandler;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gallery.i.mi.com"

    const-string v2, "secret_album"

    const/4 v3, 0x4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/util/ActionURIHandler;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gallery.i.mi.com"

    const-string v2, "peoples"

    const/4 v3, 0x5

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/util/ActionURIHandler;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gallery.i.mi.com"

    const-string v2, "result"

    const/4 v3, 0x6

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/util/ActionURIHandler;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gallery.i.mi.com"

    const-string v2, "search"

    const/4 v3, 0x7

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/util/ActionURIHandler;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gallery.i.mi.com"

    const-string v2, "cloud_guide"

    const/16 v3, 0x8

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/util/ActionURIHandler;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gallery.i.mi.com"

    const-string v2, "sync_switch"

    const/16 v3, 0x9

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/util/ActionURIHandler;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gallery.i.mi.com"

    const-string v2, "photo_movie"

    const/16 v3, 0xa

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/util/ActionURIHandler;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gallery.i.mi.com"

    const-string v2, "collage"

    const/16 v3, 0xb

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/util/ActionURIHandler;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gallery.i.mi.com"

    const-string v2, "card_action"

    const/16 v3, 0xc

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/util/ActionURIHandler;->sURIMatcher:Landroid/content/UriMatcher;

    const-string v1, "gallery.i.mi.com"

    const-string v2, "collage_from_picker"

    const/16 v3, 0xd

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method private static buildIntent(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)Landroid/content/Intent;
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    if-eqz p2, :cond_0

    invoke-virtual {v0, p2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    :cond_0
    return-object v0
.end method

.method public static handleUri(Landroid/app/Activity;Landroid/net/Uri;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/util/ActionURIHandler;->handleUri(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V

    return-void
.end method

.method public static handleUri(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 5

    if-eqz p0, :cond_8

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_8

    if-nez p1, :cond_0

    goto/16 :goto_1

    :cond_0
    sget-object v0, Lcom/miui/gallery/util/ActionURIHandler;->sURIMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    const-string v1, "query"

    invoke-virtual {p1, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p2}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->buildSearchEventParams(Landroid/os/Bundle;)Ljava/util/Map;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/ActionURIHandler;->openDirectly(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V

    goto/16 :goto_0

    :pswitch_0
    if-eqz p2, :cond_7

    const-string p1, "extra_intent"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/content/Intent;

    const-string v0, "start_activity_for_result"

    invoke-virtual {p2, v0, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const-string v1, "request_code"

    const/4 v2, -0x1

    invoke-virtual {p2, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p2

    if-eqz p1, :cond_7

    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->isSupportMeituCollage()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "pick-result-data"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {p0, v1, p2}, Lcom/miui/gallery/util/IntentUtil;->startMeituCollageAction(Landroid/app/Activity;Ljava/util/List;I)Z

    move-result v3

    :cond_1
    if-nez v3, :cond_7

    const-class v1, Lcom/miui/gallery/collage/CollageActivity;

    invoke-virtual {p1, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    if-eqz v0, :cond_2

    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    :cond_2
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    :pswitch_1
    const-string v0, "actionType"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "album"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    if-eqz p2, :cond_3

    const-string p1, "card_id"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide p1

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/IntentUtil;->gotoStoryAlbum(Landroid/app/Activity;J)V

    goto/16 :goto_0

    :cond_3
    const-string p0, "ActionURIHandler"

    const-string p1, "go to strory album ,invalid extra"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_4
    const-string v0, "operation"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string p1, "card_url"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/miui/gallery/util/IntentUtil;->gotoOperationCard(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_5
    const-string p0, "ActionURIHandler"

    const-string p2, "type %s can not delivery"

    invoke-static {p0, p2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    :pswitch_2
    invoke-static {p0}, Lcom/miui/gallery/util/IntentUtil;->startCollagePicker(Landroid/content/Context;)V

    goto/16 :goto_0

    :pswitch_3
    invoke-static {p0}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->startPicker(Landroid/content/Context;)V

    goto/16 :goto_0

    :pswitch_4
    invoke-static {p0}, Lcom/miui/gallery/util/IntentUtil;->gotoTurnOnSyncSwitch(Landroid/content/Context;)V

    goto/16 :goto_0

    :pswitch_5
    sget-object p1, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->URL:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    invoke-static {p0, p1}, Lcom/miui/gallery/util/IntentUtil;->guideToLoginXiaomiAccount(Landroid/content/Context;Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;)V

    goto/16 :goto_0

    :pswitch_6
    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/ActionURIHandler;->openDirectly(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V

    goto/16 :goto_0

    :pswitch_7
    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/ActionURIHandler;->openDirectly(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V

    goto/16 :goto_0

    :pswitch_8
    const-string v0, "markMode"

    invoke-virtual {p1, v0, v3}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_6

    const/16 v0, 0x29

    invoke-static {p0, p1, p2, v0}, Lcom/miui/gallery/util/ActionURIHandler;->startActivityForResult(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;I)V

    if-eqz v2, :cond_7

    const-string p0, "url"

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v2, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "suggestion_open_mark_page"

    invoke-static {v4, p0, v2}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :cond_6
    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/ActionURIHandler;->openDirectly(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V

    if-eqz v2, :cond_7

    const-string p0, "url"

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v2, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "client_jump_to_people_list_page"

    invoke-static {v4, p0, v2}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :pswitch_9
    invoke-static {p0}, Lcom/miui/gallery/ui/JumpDialogFragment;->enterPrivateAlbum(Landroid/app/Activity;)V

    if-eqz v2, :cond_7

    const-string p0, "client_jump_to_secret_album"

    invoke-static {v4, p0, v2}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :pswitch_a
    const-string p1, "Search"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/IntentUtil;->gotoTrashBin(Landroid/content/Context;Ljava/lang/String;)V

    if-eqz v2, :cond_7

    const-string p0, "client_jump_to_trash_bin"

    invoke-static {v4, p0, v2}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :pswitch_b
    invoke-static {p0, p1}, Lcom/miui/gallery/ui/JumpDialogFragment;->showAlbumPage(Landroid/app/Activity;Landroid/net/Uri;)V

    if-eqz v2, :cond_7

    const-string p0, "screenshotAppName"

    invoke-virtual {p1, p0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p2, "Uri"

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v2, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "queryText"

    invoke-interface {v2, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "client_jump_to_album_page"

    invoke-static {v4, p0, v2}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :pswitch_c
    const-string p2, "serverId"

    invoke-virtual {p1, p2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/miui/gallery/ui/JumpDialogFragment;->showPeoplePage(Landroid/app/Activity;Ljava/lang/String;)V

    if-eqz v2, :cond_7

    const-string p0, "serverIds"

    invoke-interface {v2, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "queryText"

    invoke-interface {v2, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "client_jump_to_people_page"

    invoke-static {v4, p0, v2}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_7
    :goto_0
    return-void

    :cond_8
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static openDirectly(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 3

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    :try_start_0
    const-string v1, "start_activity_for_result"

    invoke-virtual {p2, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const-string v1, "start_activity_for_result"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    const-string v1, "request_code"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    const-string v2, "request_code"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/ActionURIHandler;->buildIntent(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object p2

    if-eqz v0, :cond_1

    invoke-virtual {p0, p2, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_2

    :cond_1
    invoke-virtual {p0, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :goto_1
    const-string p2, "ActionURIHandler"

    const-string v0, "openDirectly %s occur error.\n"

    invoke-static {p2, v0, p1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_2
    return-void
.end method

.method private static startActivityForResult(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;I)V
    .locals 0

    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/ActionURIHandler;->buildIntent(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object p2

    invoke-virtual {p0, p2, p3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p2, "ActionURIHandler"

    const-string p3, "openDirectly %s occur error.\n"

    invoke-static {p2, p3, p1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
