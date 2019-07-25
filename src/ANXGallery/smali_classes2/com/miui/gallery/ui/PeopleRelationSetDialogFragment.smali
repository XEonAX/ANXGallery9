.class public Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "PeopleRelationSetDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;
    }
.end annotation


# instance fields
.field private mRelationNameItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mRelationSelectedListener:Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;

.field private mRelationValueItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->mRelationNameItems:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->mRelationValueItems:Ljava/util/ArrayList;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->mRelationValueItems:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;)Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->mRelationSelectedListener:Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;

    return-object p0
.end method

.method static synthetic access$200(Landroid/app/Activity;Landroid/os/Bundle;Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->doCreateDialog(Landroid/app/Activity;Landroid/os/Bundle;Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;)V

    return-void
.end method

.method public static createRelationSetDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ILcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$2;

    invoke-direct {v1, p3, p0, p1, p2}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$2;-><init>(ILandroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$3;

    invoke-direct {p1, p0, p4}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$3;-><init>(Landroid/app/Activity;Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;)V

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private static doCreateDialog(Landroid/app/Activity;Landroid/os/Bundle;Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;-><init>()V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {v0, p2}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->setRelationSelectedListener(Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string p1, "PeopleRelationSetDialogFragment"

    invoke-virtual {v0, p0, p1}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private getDefaultIndexOfDialog()I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "default_relation"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->mRelationValueItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method private initDialogAdapter()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->mRelationNameItems:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "relation_names"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->mRelationValueItems:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "relation_values"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->mRelationNameItems:Ljava/util/ArrayList;

    const v1, 0x7f1002f1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->mRelationValueItems:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->initDialogAdapter()V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 3

    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "people_relation_set_title"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    invoke-direct {p0}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->getDefaultIndexOfDialog()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->mRelationNameItems:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->mRelationNameItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/CharSequence;

    new-instance v2, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$1;-><init>(Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;)V

    invoke-virtual {p1, v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method public setRelationSelectedListener(Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->mRelationSelectedListener:Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;

    return-void
.end method
