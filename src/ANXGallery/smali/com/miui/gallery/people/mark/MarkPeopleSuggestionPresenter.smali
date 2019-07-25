.class public Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;
.super Ljava/lang/Object;
.source "MarkPeopleSuggestionPresenter.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mMarkInfo:Landroid/os/Bundle;

.field private mModel:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;

.field private mPeopleSuggestion:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/people/model/People;",
            ">;"
        }
    .end annotation
.end field

.field private mStopped:Z

.field private mView:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;Landroid/os/Bundle;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mStopped:Z

    iput-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mView:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;

    iput-object p3, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mModel:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;

    iput-object p4, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mMarkInfo:Landroid/os/Bundle;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;)Landroid/os/Bundle;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mMarkInfo:Landroid/os/Bundle;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;)Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mModel:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;ZZ)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->setMarkResult(ZZ)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mStopped:Z

    return p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mPeopleSuggestion:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;)Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mView:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;

    return-object p0
.end method

.method private getMaxFaceCount(Ljava/util/ArrayList;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/people/model/People;",
            ">;)I"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/people/model/People;

    invoke-virtual {v1}, Lcom/miui/gallery/people/model/People;->getFaceCount()I

    move-result v1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_0

    :cond_0
    return v0
.end method

.method private setMarkResult(ZZ)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mModel:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mMarkInfo:Landroid/os/Bundle;

    invoke-interface {v0, v1, p1}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;->setMarkResult(Landroid/os/Bundle;Z)V

    if-eqz p2, :cond_1

    if-eqz p1, :cond_0

    const-string p1, "mark_myself_load_more_mark"

    goto :goto_0

    :cond_0
    const-string p1, "mark_myself_load_more_close"

    goto :goto_0

    :cond_1
    if-eqz p1, :cond_2

    const-string p1, "mark_myself_dialog_mark"

    goto :goto_0

    :cond_2
    const-string p1, "mark_myself_dialog_close"

    :goto_0
    const/4 v0, 0x0

    if-nez p2, :cond_7

    iget-object p2, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mPeopleSuggestion:Ljava/util/ArrayList;

    if-eqz p2, :cond_7

    new-instance v0, Ljava/util/HashMap;

    const/4 p2, 0x2

    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(I)V

    const-string p2, "PeopleCount"

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mPeopleSuggestion:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mPeopleSuggestion:Ljava/util/ArrayList;

    invoke-direct {p0, p2}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->getMaxFaceCount(Ljava/util/ArrayList;)I

    move-result p2

    const/4 v1, 0x5

    if-gt p2, v1, :cond_3

    const-string p2, "1-5"

    goto :goto_1

    :cond_3
    const/16 v1, 0xa

    if-gt p2, v1, :cond_4

    const-string p2, "6-10"

    goto :goto_1

    :cond_4
    const/16 v1, 0x32

    if-gt p2, v1, :cond_5

    const-string p2, "11-50"

    goto :goto_1

    :cond_5
    const/16 v1, 0x64

    if-gt p2, v1, :cond_6

    const-string p2, "51-100"

    goto :goto_1

    :cond_6
    const-string p2, ">100"

    :goto_1
    const-string v1, "MaxFaceCount"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    const-string p2, "people_mark"

    invoke-static {p2, p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public ignoreSuggestion()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mView:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;

    invoke-interface {v0}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;->isSuggestionDialogVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mView:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;

    invoke-interface {v0}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;->dismissSuggestionDialog()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mView:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mContext:Landroid/content/Context;

    const v2, 0x7f10066b

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mContext:Landroid/content/Context;

    const v3, 0x7f100469

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;->showInfoDialog(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->setMarkResult(ZZ)V

    const-string v0, "people_mark"

    const-string v1, "mark_myself_dialog_close"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public loadMore()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mView:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;

    invoke-interface {v0}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;->isSuggestionDialogVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mView:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;

    invoke-interface {v0}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;->dismissSuggestionDialog()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mPeopleSuggestion:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mPeopleSuggestion:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mMarkInfo:Landroid/os/Bundle;

    const-string v2, "option_suggestion_limit"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    if-ge v0, v1, :cond_1

    const-string v0, "people_mark"

    const-string v1, "mark_myself_dialog_close"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mView:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mMarkInfo:Landroid/os/Bundle;

    invoke-static {v1}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract;->buildMarkUriForMarkInfo(Landroid/os/Bundle;)Landroid/net/Uri;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;->goToActivity(Landroid/net/Uri;)V

    const-string v0, "people_mark"

    const-string v1, "mark_myself_dialog_load_more"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public markPeople(Lcom/miui/gallery/people/model/People;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mView:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;

    invoke-interface {v0}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;->dismissSuggestionDialog()V

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mModel:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mMarkInfo:Landroid/os/Bundle;

    new-instance v3, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter$2;

    invoke-direct {v3, p0}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter$2;-><init>(Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;)V

    invoke-interface {v0, v1, p1, v2, v3}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;->markPeople(Landroid/content/Context;Lcom/miui/gallery/people/model/People;Landroid/os/Bundle;Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$MarkPeopleCallback;)V

    return-void
.end method

.method public setLoadMoreMarkResult(Z)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->setMarkResult(ZZ)V

    return-void
.end method

.method public start()V
    .locals 4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mStopped:Z

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mModel:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mMarkInfo:Landroid/os/Bundle;

    invoke-interface {v0, v1}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;->needMark(Landroid/os/Bundle;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mView:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;

    invoke-interface {v0}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;->isSuggestionDialogVisible()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mView:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;

    invoke-interface {v0}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$View;->isSuggestionDialogVisible()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mModel:Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;

    iget-object v1, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mMarkInfo:Landroid/os/Bundle;

    new-instance v3, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter$1;

    invoke-direct {v3, p0}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter$1;-><init>(Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;)V

    invoke-interface {v0, v1, v2, v3}, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$Model;->loadMarkSuggestion(Landroid/content/Context;Landroid/os/Bundle;Lcom/miui/gallery/people/mark/MarkPeopleSuggestionContract$LoadMarkSuggestionCallback;)V

    :cond_2
    return-void
.end method

.method public stop()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleSuggestionPresenter;->mStopped:Z

    return-void
.end method
