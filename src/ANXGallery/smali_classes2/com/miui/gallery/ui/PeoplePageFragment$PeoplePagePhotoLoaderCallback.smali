.class Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;
.super Ljava/lang/Object;
.source "PeoplePageFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PeoplePageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PeoplePagePhotoLoaderCallback"
.end annotation


# instance fields
.field private mChangeToVisibleFuture:Lcom/miui/gallery/threadpool/Future;

.field mIsManualLoad:Landroid/util/SparseBooleanArray;

.field private mLastLoadVisibilityUndefinedIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mLoaderCreateTime:Landroid/util/SparseLongArray;

.field final synthetic this$0:Lcom/miui/gallery/ui/PeoplePageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PeoplePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mLastLoadVisibilityUndefinedIds:Ljava/util/ArrayList;

    new-instance p1, Landroid/util/SparseLongArray;

    invoke-direct {p1}, Landroid/util/SparseLongArray;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mLoaderCreateTime:Landroid/util/SparseLongArray;

    new-instance p1, Landroid/util/SparseBooleanArray;

    invoke-direct {p1}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mIsManualLoad:Landroid/util/SparseBooleanArray;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PeoplePageFragment;Lcom/miui/gallery/ui/PeoplePageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment;)V

    return-void
.end method

.method static synthetic access$2300(Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mLastLoadVisibilityUndefinedIds:Ljava/util/ArrayList;

    return-object p0
.end method

.method private changeUndefinedToVisible(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mChangeToVisibleFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mChangeToVisibleFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mChangeToVisibleFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback$2;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mChangeToVisibleFuture:Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private doResetFooterAfterReload(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$400(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;->NOT_DISTINGUISH:Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    if-ne v0, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$1800(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$2100(Lcom/miui/gallery/ui/PeoplePageFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->removeFooterView(Landroid/view/View;)Z

    return-void

    :cond_0
    if-eqz p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$1800(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$2100(Lcom/miui/gallery/ui/PeoplePageFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->addFooterView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$400(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;->DISPLAY_PARTIAL_PEOPLE:Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v0, 0x7f100382

    invoke-virtual {p1, v0}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v0, 0x7f1002c4

    invoke-virtual {p1, v0}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$2100(Lcom/miui/gallery/ui/PeoplePageFragment;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09028c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private getVisibilityTypeUndefinedIds(Landroid/database/Cursor;)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_1

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    :cond_0
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getVisibilityType(Landroid/database/Cursor;)I

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getPeopleLocalId(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private initMarkMyselfHelper()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$700(Lcom/miui/gallery/ui/PeoplePageFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$2200(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    new-instance v1, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-direct {v1, v2}, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;-><init>(Landroid/app/Fragment;)V

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$2202(Lcom/miui/gallery/ui/PeoplePageFragment;Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;)Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$2200(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->onStart()Z

    move-result v0

    return v0
.end method

.method private initialSetGroupToastDialog(Landroid/database/Cursor;)V
    .locals 4

    if-eqz p1, :cond_3

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->seeIfHasNamedPeople(Landroid/database/Cursor;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v0, 0x7f100669

    invoke-virtual {p1, v0}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x7f100667

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v0, 0x7f100668

    invoke-virtual {p1, v0}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x7f100666

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    new-instance v1, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback$1;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;)V

    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-boolean v2, v2, Lcom/miui/gallery/ui/PeoplePageFragment;->mHaveShownSetGroupToastDialog:Z

    if-nez v2, :cond_2

    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object v3, v3, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const v2, 0x7f10040d

    invoke-virtual {p1, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iput-boolean v0, p1, Lcom/miui/gallery/ui/PeoplePageFragment;->mHaveShownSetGroupToastDialog:Z

    :cond_2
    return-void

    :cond_3
    :goto_1
    return-void
.end method

.method private loaderId2Name(I)Ljava/lang/String;
    .locals 0

    packed-switch p1, :pswitch_data_0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_0
    const-string p1, "people_page_photos"

    return-object p1

    :pswitch_1
    const-string p1, "people_page_snapshot"

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private seeIfHasNamedPeople(Landroid/database/Cursor;)Z
    .locals 2

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getPeopleName(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_1
    return v0

    :cond_2
    return v0
.end method

.method private shouldShowSetGroupToastDialog()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$700(Lcom/miui/gallery/ui/PeoplePageFragment;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$2200(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$2200(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->isSuggestionDialogVisible()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-boolean v0, v0, Lcom/miui/gallery/ui/PeoplePageFragment;->mHaveShownSetGroupToastDialog:Z

    if-nez v0, :cond_1

    const-string v0, "has_toast_how_to_set_group"

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method private statLoadTime(Ljava/lang/String;JI)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "loader"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "costs"

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "count"

    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "people"

    const-string p2, "people_load_time"

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private wrapCursorByDisplayMode(Landroid/database/Cursor;Ljava/util/ArrayList;Ljava/util/HashMap;)Landroid/database/Cursor;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/HashMap;",
            ")",
            "Landroid/database/Cursor;"
        }
    .end annotation

    if-eqz p1, :cond_8

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_4

    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v4

    if-nez v4, :cond_4

    const/16 v4, 0x12

    if-gt v1, v4, :cond_4

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getRelationType(Landroid/database/Cursor;)I

    move-result v5

    invoke-static {v5}, Lcom/miui/gallery/model/PeopleContactInfo;->isUserDefineRelation(I)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getRelationText(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    invoke-virtual {p3, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    invoke-static {v5}, Lcom/miui/gallery/model/PeopleContactInfo;->isUnKnownRelation(I)Z

    move-result v5

    if-eqz v5, :cond_2

    add-int/lit8 v2, v2, 0x1

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getPeopleName(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    add-int/lit8 v1, v1, 0x1

    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    if-lt v3, v4, :cond_3

    if-lez v1, :cond_3

    rem-int/lit8 v4, v2, 0x3

    if-nez v4, :cond_3

    goto :goto_2

    :cond_3
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    :cond_4
    :goto_2
    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p2, v3}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$2002(Lcom/miui/gallery/ui/PeoplePageFragment;I)I

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p2

    if-ne v3, p2, :cond_5

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    sget-object p3, Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;->NOT_DISTINGUISH:Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    invoke-static {p2, p3}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$402(Lcom/miui/gallery/ui/PeoplePageFragment;Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;)Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    return-object p1

    :cond_5
    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$400(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    move-result-object p2

    sget-object p3, Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;->DISPLAY_PARTIAL_PEOPLE:Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    if-ne p2, p3, :cond_7

    new-instance p2, Landroid/database/MatrixCursor;

    sget-object p3, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    invoke-direct {p2, p3}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_3
    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result p3

    if-nez p3, :cond_6

    if-ge v0, v3, :cond_6

    invoke-static {p2, p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->add2MatrixCursor(Landroid/database/MatrixCursor;Landroid/database/Cursor;)V

    add-int/lit8 v0, v0, 0x1

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_3

    :cond_6
    return-object p2

    :cond_7
    return-object p1

    :cond_8
    :goto_4
    return-object p1
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 3

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mIsManualLoad:Landroid/util/SparseBooleanArray;

    const/4 v0, 0x1

    invoke-virtual {p2, p1, v0}, Landroid/util/SparseBooleanArray;->put(IZ)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mLoaderCreateTime:Landroid/util/SparseLongArray;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p2, p1, v1, v2}, Landroid/util/SparseLongArray;->put(IJ)V

    new-instance p2, Landroid/content/CursorLoader;

    iget-object v1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, v1}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    if-ne p1, v0, :cond_0

    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PEOPLE_SNAPSHOT_URI:Landroid/net/Uri;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p1, Lcom/miui/gallery/util/face/PeopleItem;->COMPAT_PROJECTION:[Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PERSONS_URI:Landroid/net/Uri;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p1, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    :goto_0
    return-object p2
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 7

    if-nez p2, :cond_0

    const-string p1, "PeoplePageFragment"

    const-string p2, "empty load result"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->initMarkMyselfHelper()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-boolean v2, v2, Lcom/miui/gallery/ui/PeoplePageFragment;->mFirstLoadFinish:Z

    if-eqz v2, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->shouldShowSetGroupToastDialog()Z

    move-result v2

    if-eqz v2, :cond_1

    move-object v2, p2

    check-cast v2, Landroid/database/Cursor;

    invoke-direct {p0, v2}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->initialSetGroupToastDialog(Landroid/database/Cursor;)V

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/miui/gallery/ui/PeoplePageFragment;->mFirstLoadFinish:Z

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    move-object v5, p2

    check-cast v5, Landroid/database/Cursor;

    invoke-direct {p0, v5, v2, v4}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->wrapCursorByDisplayMode(Landroid/database/Cursor;Ljava/util/ArrayList;Ljava/util/HashMap;)Landroid/database/Cursor;

    move-result-object v6

    invoke-static {v2}, Lcom/miui/gallery/model/PeopleContactInfo$UserDefineRelation;->setUserDefineRelations(Ljava/util/ArrayList;)V

    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$600(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/adapter/PeoplePageAdapter;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->setUserDefineRelationMap(Ljava/util/HashMap;)V

    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$600(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/adapter/PeoplePageAdapter;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->changeCursor(Landroid/database/Cursor;)V

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    const/4 v2, 0x2

    if-ne p1, v2, :cond_7

    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PeoplePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v2

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$1300(Lcom/miui/gallery/ui/PeoplePageFragment;)V

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$1400(Lcom/miui/gallery/ui/PeoplePageFragment;)Lio/reactivex/subjects/PublishSubject;

    move-result-object v2

    invoke-static {v6}, Lcom/miui/gallery/provider/PeopleFaceSnapshotHelper;->cursor2Entities(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v6

    invoke-virtual {v2, v6}, Lio/reactivex/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    if-eqz p2, :cond_4

    invoke-interface {v5}, Landroid/database/Cursor;->getCount()I

    move-result p2

    if-nez p2, :cond_3

    goto :goto_0

    :cond_3
    const/4 p2, 0x0

    goto :goto_1

    :cond_4
    :goto_0
    const/4 p2, 0x1

    :goto_1
    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$1600(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;

    move-result-object v2

    iget-object v6, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v6}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$1500(Lcom/miui/gallery/ui/PeoplePageFragment;)Landroid/view/ViewStub;

    move-result-object v6

    invoke-static {v2, v6, p2}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->access$1700(Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;Landroid/view/ViewStub;Z)Landroid/view/View;

    move-result-object v2

    iget-object v6, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v6}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$1800(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    move-result-object v6

    invoke-virtual {v6, v2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setEmptyView(Landroid/view/View;)V

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->doResetFooterAfterReload(Z)V

    invoke-direct {p0, v5}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->getVisibilityTypeUndefinedIds(Landroid/database/Cursor;)Ljava/util/ArrayList;

    move-result-object p2

    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mLastLoadVisibilityUndefinedIds:Ljava/util/ArrayList;

    monitor-enter v2

    :try_start_0
    iget-object v6, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mLastLoadVisibilityUndefinedIds:Ljava/util/ArrayList;

    invoke-virtual {v6, p2}, Ljava/util/ArrayList;->containsAll(Ljava/util/Collection;)Z

    move-result v6

    if-eqz v6, :cond_6

    iget-object v6, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mLastLoadVisibilityUndefinedIds:Ljava/util/ArrayList;

    invoke-virtual {p2, v6}, Ljava/util/ArrayList;->containsAll(Ljava/util/Collection;)Z

    move-result v6

    if-nez v6, :cond_5

    goto :goto_2

    :cond_5
    const/4 v4, 0x0

    :cond_6
    :goto_2
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_8

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->changeUndefinedToVisible(Ljava/util/ArrayList;)V

    goto :goto_3

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_7
    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$1900(Lcom/miui/gallery/ui/PeoplePageFragment;)V

    :cond_8
    :goto_3
    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mIsManualLoad:Landroid/util/SparseBooleanArray;

    invoke-virtual {p2, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result p2

    if-eqz p2, :cond_9

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mIsManualLoad:Landroid/util/SparseBooleanArray;

    invoke-virtual {p2, p1, v3}, Landroid/util/SparseBooleanArray;->put(IZ)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->mLoaderCreateTime:Landroid/util/SparseLongArray;

    invoke-virtual {p2, p1}, Landroid/util/SparseLongArray;->get(I)J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-string p2, "PeoplePageFragment"

    const-string v2, "loader : %s, people count : %d, costs %d"

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->loaderId2Name(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5}, Landroid/database/Cursor;->getCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {p2, v2, v3, v4, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->loaderId2Name(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v5}, Landroid/database/Cursor;->getCount()I

    move-result p2

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->statLoadTime(Ljava/lang/String;JI)V

    :cond_9
    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
