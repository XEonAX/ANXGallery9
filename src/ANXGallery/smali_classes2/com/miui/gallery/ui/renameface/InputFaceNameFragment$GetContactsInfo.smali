.class Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo;
.super Ljava/lang/Object;
.source "InputFaceNameFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GetContactsInfo"
.end annotation


# instance fields
.field context:Landroid/content/Context;

.field final synthetic this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo;->context:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo;->getSuggestionCursor(Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo;->getContactCursor()V

    return-void
.end method

.method private getContactCursor()V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo$1;-><init>(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo;)V

    new-instance v2, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo$2;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo$2;-><init>(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo;)V

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private getSuggestionCursor(Ljava/lang/String;)Landroid/database/Cursor;
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$2000(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$1900(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;)Z

    move-result v0

    const/4 v7, 0x0

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_FILTER_URI:Landroid/net/Uri;

    const/16 v2, 0x2f

    const/16 v3, 0x20

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->sqlEscapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    :goto_0
    move-object v2, p1

    goto :goto_1

    :cond_0
    sget-object p1, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    goto :goto_0

    :cond_1
    move-object v2, v7

    :goto_1
    if-nez v2, :cond_2

    return-object v7

    :cond_2
    :try_start_0
    sget-object v3, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->sProjection:[Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v6, " display_name COLLATE LOCALIZED "

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    const-string v0, "InputFaceNameFragment"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v7
.end method
