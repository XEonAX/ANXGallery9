.class public Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "PeopleFaceMergeDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;,
        Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;,
        Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PageChangeListener;,
        Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeopleSelectListener;
    }
.end annotation


# instance fields
.field private mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/model/DisplayFolderItem;",
            ">;"
        }
    .end annotation
.end field

.field private mLoader:Lcom/miui/gallery/ui/renameface/FolderItemsLoader;

.field private mPagerAdapter:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;

.field private mPagerIndicator:Lcom/miui/gallery/widget/PagerIndicator;

.field private mPeopleSelectListener:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeopleSelectListener;

.field private mViewPager:Lcom/miui/gallery/widget/ViewPager;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)Lcom/miui/gallery/ui/renameface/FolderItemsLoader;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mLoader:Lcom/miui/gallery/ui/renameface/FolderItemsLoader;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mPagerAdapter:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)Lcom/miui/gallery/widget/PagerIndicator;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mPagerIndicator:Lcom/miui/gallery/widget/PagerIndicator;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mItems:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeopleSelectListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mPeopleSelectListener:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeopleSelectListener;

    return-object p0
.end method

.method private initPagerLoader(Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;)V
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    new-array v1, v1, [J

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->getBucketId()J

    move-result-wide v3

    aput-wide v3, v1, v2

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    new-instance p1, Lcom/miui/gallery/ui/renameface/FaceFolderItemsLoader;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$1;

    invoke-direct {v3, p0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$1;-><init>(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)V

    invoke-direct {p1, v2, v0, v3, v1}, Lcom/miui/gallery/ui/renameface/FaceFolderItemsLoader;-><init>(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/ui/renameface/FolderItemsLoader$LoaderUpdatedItems;[J)V

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mLoader:Lcom/miui/gallery/ui/renameface/FolderItemsLoader;

    return-void
.end method

.method private setCancelButtonClickListener(Landroid/widget/Button;Landroid/app/Dialog;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$2;

    invoke-direct {v0, p0, p2}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$2;-><init>(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;Landroid/app/Dialog;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mLoader:Lcom/miui/gallery/ui/renameface/FolderItemsLoader;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/renameface/FolderItemsLoader;->cancel()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "merge_action_from_album"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mItems:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mItems:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/ui/renameface/FaceDisplayFolderItem;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/miui/gallery/ui/renameface/FaceDisplayFolderItem;-><init>(Z)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;-><init>(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mPagerAdapter:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->initPagerLoader(Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    const/4 v0, 0x0

    const v1, 0x7f0b00e4

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v1, 0x7f090207

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/widget/PagerIndicator;

    iput-object v1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mPagerIndicator:Lcom/miui/gallery/widget/PagerIndicator;

    const v1, 0x7f090206

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/widget/ViewPager;

    iput-object v1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mViewPager:Lcom/miui/gallery/widget/ViewPager;

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mViewPager:Lcom/miui/gallery/widget/ViewPager;

    iget-object v2, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mPagerAdapter:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/widget/ViewPager;->setAdapter(Lcom/miui/gallery/widget/PagerAdapter;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mViewPager:Lcom/miui/gallery/widget/ViewPager;

    new-instance v2, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PageChangeListener;

    invoke-direct {v2, p0, v0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PageChangeListener;-><init>(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$1;)V

    invoke-virtual {v1, v2}, Lcom/miui/gallery/widget/ViewPager;->setOnPageChangeListener(Lcom/miui/gallery/widget/ViewPager$OnPageChangeListener;)V

    const v0, 0x7f090070

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v1, 0x7f090045

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "people_face_Merge_title"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Landroid/app/Dialog;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->setCancelButtonClickListener(Landroid/widget/Button;Landroid/app/Dialog;)V

    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x50

    invoke-virtual {p1, v0}, Landroid/view/Window;->setGravity(I)V

    const/4 v0, -0x1

    const/4 v2, -0x2

    invoke-virtual {p1, v0, v2}, Landroid/view/Window;->setLayout(II)V

    return-object v1
.end method

.method public setPeopleSelectListener(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeopleSelectListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->mPeopleSelectListener:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeopleSelectListener;

    return-void
.end method
