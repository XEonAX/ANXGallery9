.class public Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;
.super Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;
.source "FaceAlbumRenameHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$FaceOperationTask;,
        Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;
    }
.end annotation


# instance fields
.field private mConfirmListener:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;

.field private mFacePathsToBeMoved:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mFaceSets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;",
            ">;"
        }
    .end annotation
.end field

.field private mIsFaceSetsMergeOperation:Z

.field private mIsFacesMoveOperation:Z

.field private mIsRelationSetted:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;-><init>(Landroid/app/Activity;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;Z)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;-><init>(Landroid/app/Activity;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mIsFaceSetsMergeOperation:Z

    iput-object p3, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mConfirmListener:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;

    iput-boolean p4, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mIsRelationSetted:Z

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/util/ArrayList;Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;",
            ">;",
            "Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v0}, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;-><init>(Landroid/app/Activity;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mIsFaceSetsMergeOperation:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mIsFaceSetsMergeOperation:Z

    iput-object p2, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSets:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mConfirmListener:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;

    iget-object p2, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSets:Ljava/util/ArrayList;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSets:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ne p2, v0, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSets:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    invoke-virtual {p2}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->hasName()Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSets:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->showInputFolderNameDialog(Z)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->onClick(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;Ljava/lang/String;Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItem;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->moveFacesTo(Ljava/lang/String;Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItem;)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;Ljava/lang/String;Lcom/miui/gallery/model/PeopleContactInfo;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->rename(Ljava/lang/String;Lcom/miui/gallery/model/PeopleContactInfo;)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mergeLotsPeopleTo(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSets:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;)Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mConfirmListener:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;

    return-object p0
.end method

.method private dialogToast(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$FaceOperationTask;Ljava/lang/CharSequence;)V
    .locals 2

    new-instance v0, Lmiui/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v1, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$6;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$6;-><init>(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$FaceOperationTask;)V

    const p1, 0x104000a

    invoke-virtual {v0, p1, v1}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Lmiui/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lmiui/app/AlertDialog$Builder;->show()Lmiui/app/AlertDialog;

    return-void
.end method

.method public static getDisplayFolderItem(Ljava/util/ArrayList;Ljava/lang/String;)Lcom/miui/gallery/model/DisplayFolderItem;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/model/DisplayFolderItem;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/miui/gallery/model/DisplayFolderItem;"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/model/DisplayFolderItem;

    iget-object v2, v1, Lcom/miui/gallery/model/DisplayFolderItem;->name:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    return-object v1

    :cond_2
    return-object v0
.end method

.method private getMessage(ILjava/lang/String;)Ljava/lang/CharSequence;
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-le p1, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mActivity:Landroid/app/Activity;

    const v2, 0x7f1002d2

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p2, v1, v0

    invoke-virtual {p1, v2, v1}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mActivity:Landroid/app/Activity;

    const v2, 0x7f1002d1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p2, v1, v0

    invoke-virtual {p1, v2, v1}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method private mergeLotsPeopleTo(Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$8;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$8;-><init>(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mConfirmListener:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;

    const/4 v1, 0x1

    invoke-interface {v0, p1, v1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;->onConfirm(Ljava/lang/String;Z)V

    return-void
.end method

.method private moveFacesTo(Ljava/lang/String;Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItem;)V
    .locals 0

    return-void
.end method

.method private onClick(Lcom/miui/gallery/model/PeopleContactInfo;)V
    .locals 6

    iget-object v0, p1, Lcom/miui/gallery/model/PeopleContactInfo;->name:Ljava/lang/String;

    iget-boolean v1, p1, Lcom/miui/gallery/model/PeopleContactInfo;->isRepeatName:Z

    iget-object v2, p1, Lcom/miui/gallery/model/PeopleContactInfo;->localGroupId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    iget-boolean v4, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mIsFacesMoveOperation:Z

    const/4 v5, 0x1

    if-eqz v4, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFacePathsToBeMoved:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-eqz v1, :cond_0

    new-instance p1, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItemImpl;

    invoke-direct {p1, p0, v0, v2}, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItemImpl;-><init>(Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;

    invoke-direct {p1, v3}, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;-><init>(Ljava/lang/String;)V

    :goto_0
    new-instance v0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$2;

    invoke-direct {v0, p0, v3, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$2;-><init>(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;Ljava/lang/String;Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItem;)V

    goto :goto_2

    :cond_1
    iget-boolean v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mIsFaceSetsMergeOperation:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSets:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v0, v5, :cond_2

    if-nez v1, :cond_2

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSets:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-instance v0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$4;

    invoke-direct {v0, p0, v3}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$4;-><init>(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;Ljava/lang/String;)V

    goto :goto_2

    :cond_3
    :goto_1
    new-instance v0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$3;

    invoke-direct {v0, p0, v3, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$3;-><init>(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;Ljava/lang/String;Lcom/miui/gallery/model/PeopleContactInfo;)V

    :goto_2
    if-eqz v1, :cond_4

    invoke-direct {p0, v5, v3}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->getMessage(ILjava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->dialogToast(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$FaceOperationTask;Ljava/lang/CharSequence;)V

    goto :goto_3

    :cond_4
    invoke-interface {v0}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$FaceOperationTask;->run()V

    :goto_3
    return-void
.end method

.method private onClick(Ljava/lang/String;Z)V
    .locals 2

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-instance v1, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$5;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$5;-><init>(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;Ljava/lang/String;)V

    if-eqz p2, :cond_0

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->getMessage(ILjava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-direct {p0, v1, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->dialogToast(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$FaceOperationTask;Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    invoke-interface {v1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$FaceOperationTask;->run()V

    :goto_0
    return-void
.end method

.method private rename(Ljava/lang/String;Lcom/miui/gallery/model/PeopleContactInfo;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$7;-><init>(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;Ljava/lang/String;Lcom/miui/gallery/model/PeopleContactInfo;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private showInputFolderNameDialog(Z)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->showInputFolderNameDialog(ZZ)V

    return-void
.end method

.method private showInputFolderNameDialog(ZZ)V
    .locals 1

    if-eqz p1, :cond_0

    const/16 p1, 0x13

    goto :goto_0

    :cond_0
    const/16 p1, 0x10

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_1
    const-string v0, ""

    :goto_1
    invoke-virtual {p0, p1, v0, p2}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->showInputFolderNameDialog(ILjava/lang/String;Z)V

    return-void
.end method


# virtual methods
.method public finishWhenGetContact(Lcom/miui/gallery/model/PeopleContactInfo;)V
    .locals 2

    if-eqz p1, :cond_1

    iget-object v0, p1, Lcom/miui/gallery/model/PeopleContactInfo;->name:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mActivity:Landroid/app/Activity;

    iget-object v1, p1, Lcom/miui/gallery/model/PeopleContactInfo;->name:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/miui/gallery/cloud/CreateGroupItem;->checkFileNameValid(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mActivity:Landroid/app/Activity;

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->onClick(Lcom/miui/gallery/model/PeopleContactInfo;)V

    :cond_1
    return-void
.end method

.method public show()V
    .locals 5

    iget-boolean v0, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mIsFaceSetsMergeOperation:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iget-boolean v1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mIsRelationSetted:Z

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->showInputFolderNameDialog(ZZ)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "merge_action_from_album"

    iget-object v3, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mFaceSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v2, "people_face_Merge_title"

    iget-object v3, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mActivity:Landroid/app/Activity;

    const v4, 0x7f100471

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "PeopleFaceMergeDialogFragment"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    new-instance v1, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$1;

    invoke-direct {v1, p0, v0}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$1;-><init>(Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->setPeopleSelectListener(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeopleSelectListener;)V

    :goto_0
    return-void
.end method
