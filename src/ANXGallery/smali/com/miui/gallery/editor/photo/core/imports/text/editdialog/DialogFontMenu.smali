.class Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;
.super Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;
.source "DialogFontMenu.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu<",
        "Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;",
        "Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mCurrentTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

.field private mFontDownloadManager:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;

.field private mFontRequest:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontResourceRequest;

.field private mInitializeData:Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

.field private mRecyclerView:Lcom/miui/gallery/ui/SingleChoiceRecyclerView;

.field private mTextStyles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;",
            ">;"
        }
    .end annotation
.end field

.field private mTypeFaceAdapter:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

.field private mTypeFaceInited:Z

.field private mWholeView:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;)V
    .locals 2

    const v0, 0x7f1006d5

    const v1, 0x7f0702ac

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;II)V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTypeFaceInited:Z

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mListener:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTextStyles:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTypeFaceInited:Z

    return p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mInitializeData:Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTypeFaceAdapter:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mCurrentTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    return-object p0
.end method

.method static synthetic access$502(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mCurrentTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    return-object p1
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->updateSelectedItemPosition(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;Landroid/content/Context;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->downloadResource(Landroid/content/Context;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;I)V

    return-void
.end method

.method private downloadResource(Landroid/content/Context;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mFontDownloadManager:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mFontDownloadManager:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mFontDownloadManager:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1;

    invoke-direct {v1, p0, p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;I)V

    invoke-virtual {v0, p1, p2, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->downloadFontResource(Landroid/content/Context;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;)V

    return-void
.end method

.method private isEquals(Landroid/graphics/Typeface;Landroid/graphics/Typeface;)Z
    .locals 0

    if-nez p1, :cond_0

    if-eqz p2, :cond_1

    :cond_0
    if-eqz p1, :cond_2

    invoke-virtual {p1, p2}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    :cond_1
    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private loadResourceData()V
    .locals 4

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/TextTools;->isZhCNLanguage()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTextStyles:Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/TextTools;->checkResourceExist(Ljava/util/List;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTypeFaceAdapter:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;->notifyDataSetChanged()V

    return-void

    :cond_0
    const-string v0, "DialogFontMenu"

    const-string v1, "loadResourceData start."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontResourceRequest;

    invoke-direct {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontResourceRequest;-><init>()V

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mFontRequest:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontResourceRequest;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mFontRequest:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontResourceRequest;

    new-instance v3, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;

    invoke-direct {v3, p0, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;J)V

    invoke-virtual {v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontResourceRequest;->execute(Lcom/miui/gallery/net/base/ResponseListener;)V

    return-void
.end method

.method private updateSelectedItemPosition(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTypeFaceAdapter:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;->getSelectedItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTypeFaceAdapter:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;->setSelectedItemPosition(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTypeFaceAdapter:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;->clearLastSelectedPostion()V

    :cond_0
    return-void
.end method


# virtual methods
.method initSubMenuView(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .locals 3

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFontConfig;->init(Landroid/content/Context;)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b016e

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mWholeView:Landroid/view/ViewGroup;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mWholeView:Landroid/view/ViewGroup;

    const v0, 0x7f0902e0

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/ui/SingleChoiceRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mRecyclerView:Lcom/miui/gallery/ui/SingleChoiceRecyclerView;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTextStyles:Ljava/util/List;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTextStyles:Ljava/util/List;

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getLocalTextStyle()Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance p2, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTextStyles:Ljava/util/List;

    invoke-direct {p2, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTypeFaceAdapter:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mRecyclerView:Lcom/miui/gallery/ui/SingleChoiceRecyclerView;

    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/ui/SingleChoiceRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mRecyclerView:Lcom/miui/gallery/ui/SingleChoiceRecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTypeFaceAdapter:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/SingleChoiceRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTypeFaceAdapter:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

    new-instance p2, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;

    invoke-direct {p2, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;->setItemSelectChangeListener(Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$ItemSelectChangeListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->loadResourceData()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mWholeView:Landroid/view/ViewGroup;

    return-object p1
.end method

.method public initializeData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mInitializeData:Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTypeFaceInited:Z

    if-eqz v0, :cond_5

    if-nez p1, :cond_0

    goto :goto_2

    :cond_0
    iget-object v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    if-nez v0, :cond_1

    sget-object p1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    goto :goto_0

    :cond_1
    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getTypeFace()Landroid/graphics/Typeface;

    move-result-object p1

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTypeFaceAdapter:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

    if-nez v0, :cond_2

    return-void

    :cond_2
    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTextStyles:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTextStyles:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getTypeFace()Landroid/graphics/Typeface;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->isEquals(Landroid/graphics/Typeface;Landroid/graphics/Typeface;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->updateSelectedItemPosition(I)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTypeFaceAdapter:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;->notifyDataSetChanged()V

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    return-void

    :cond_5
    :goto_2
    return-void
.end method

.method public bridge synthetic initializeData(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->initializeData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V

    return-void
.end method

.method public notifyItemChanged(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTypeFaceAdapter:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTypeFaceAdapter:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public release()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mFontRequest:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontResourceRequest;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mFontRequest:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontResourceRequest;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontResourceRequest;->cancel()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mFontDownloadManager:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mFontDownloadManager:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->cancelAll()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTextStyles:Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mTextStyles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    if-nez v1, :cond_3

    return-void

    :cond_3
    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->isDownloading()Z

    move-result v2

    if-eqz v2, :cond_2

    const/16 v2, 0x14

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->setState(I)V

    goto :goto_0

    :cond_4
    return-void
.end method
