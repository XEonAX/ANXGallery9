.class public Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;
.super Ljava/lang/Object;
.source "MarkMyselfViewHelper.java"

# interfaces
.implements Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;


# instance fields
.field private mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

.field private mFragment:Landroid/app/Fragment;

.field private mLoadMoreClickListener:Landroid/content/DialogInterface$OnClickListener;

.field private mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

.field private mMarkMyselfModel:Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;

.field private mMarkMyselfOptions:Landroid/os/Bundle;

.field private mMarkMyselfPresenter:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;

.field private mPeopleSelectListener:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$OnPeopleSelectListener;


# direct methods
.method public constructor <init>(Landroid/app/Fragment;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfPresenter:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfModel:Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfOptions:Landroid/os/Bundle;

    new-instance v0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper$1;-><init>(Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;)V

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mLoadMoreClickListener:Landroid/content/DialogInterface$OnClickListener;

    new-instance v0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper$2;-><init>(Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;)V

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    new-instance v0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper$3;-><init>(Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;)V

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mPeopleSelectListener:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$OnPeopleSelectListener;

    iput-object p1, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mFragment:Landroid/app/Fragment;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;)Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfPresenter:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;

    return-object p0
.end method


# virtual methods
.method public dismissSuggestionDialog()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->dismissAllowingStateLoss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    :cond_0
    return-void
.end method

.method public goToActivity(Landroid/net/Uri;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/util/ActionURIHandler;->handleUri(Landroid/app/Activity;Landroid/net/Uri;)V

    :cond_0
    return-void
.end method

.method public isSuggestionDialogVisible()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onStart()Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v0}, Landroid/app/Fragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v2, "MarkMyself"

    invoke-virtual {v0, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfOptions:Landroid/os/Bundle;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract;->buildMarkInfoForMarkMyself(Landroid/content/Context;)Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfOptions:Landroid/os/Bundle;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfModel:Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;

    if-nez v0, :cond_2

    new-instance v0, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;

    invoke-direct {v0}, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfModel:Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfModel:Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;

    iget-object v2, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfOptions:Landroid/os/Bundle;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;->needMark(Landroid/os/Bundle;)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfModel:Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;

    iget-object v3, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfOptions:Landroid/os/Bundle;

    invoke-direct {v0, v1, p0, v2, v3}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;-><init>(Landroid/content/Context;Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfPresenter:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfPresenter:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;

    invoke-virtual {v0}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->start()V

    const/4 v0, 0x1

    return v0

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->isSuggestionDialogVisible()Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;

    iget-object v2, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v2}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfModel:Lcom/miui/gallery/people/mark/MarkMyselfSuggestionModel;

    iget-object v4, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfOptions:Landroid/os/Bundle;

    invoke-direct {v0, v2, p0, v3, v4}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;-><init>(Landroid/content/Context;Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;Landroid/os/Bundle;)V

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfPresenter:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfPresenter:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;

    invoke-virtual {v0}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->start()V

    :cond_4
    return v1
.end method

.method public onStop()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfPresenter:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfPresenter:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;

    invoke-virtual {v0}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->stop()V

    :cond_0
    return-void
.end method

.method public setLoadMoreMarkResult(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkMyselfPresenter:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->setLoadMoreMarkResult(Z)V

    return-void
.end method

.method public showInfoDialog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p2, p1}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/app/AlertDialog;

    :cond_0
    return-void
.end method

.method public showMarkResult(ZLjava/lang/String;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public showSuggestionDialog(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/people/model/People;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v0}, Landroid/app/Fragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    if-nez v0, :cond_1

    new-instance v0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->setTitle(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mLoadMoreClickListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->setLoadMoreButton(Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    const/4 p2, 0x1

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->setCancelButton(ZLandroid/content/DialogInterface$OnCancelListener;)V

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    iget-object p2, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mPeopleSelectListener:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$OnPeopleSelectListener;

    invoke-virtual {p1, p3, p2}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->setPeopleList(Ljava/util/ArrayList;Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$OnPeopleSelectListener;)V

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->isAdded()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mMarkDialogFragment:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    iget-object p2, p0, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {p2}, Landroid/app/Fragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p2

    const-string p3, "MarkMyself"

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    :cond_2
    return-void
.end method
