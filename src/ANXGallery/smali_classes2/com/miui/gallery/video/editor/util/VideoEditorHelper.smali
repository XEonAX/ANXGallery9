.class public Lcom/miui/gallery/video/editor/util/VideoEditorHelper;
.super Ljava/lang/Object;
.source "VideoEditorHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;
    }
.end annotation


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mContext:Landroid/content/Context;

.field private mCurrentEditType:I

.field private mCurrentMenuFragment:Lcom/miui/gallery/video/editor/ui/MenuFragment;

.field private mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

.field private mEffectContainerId:I

.field private mFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

.field private mFragmentManager:Landroid/app/FragmentManager;

.field private mLastTag:Ljava/lang/String;

.field private mNavgatorDataMap:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/Integer;",
            "Lcom/miui/gallery/video/editor/model/MenuFragmentData;",
            ">;"
        }
    .end annotation
.end field

.field private mNavigatorDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/video/editor/model/MenuFragmentData;",
            ">;"
        }
    .end annotation
.end field

.field private mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

.field private mVideoSaveManager:Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;

.field private mVideoSaving:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mNavigatorDataList:Ljava/util/List;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mActivity:Landroid/app/Activity;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragmentManager:Landroid/app/FragmentManager;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->getVideoEditor()Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/VideoEditor;->getDisplayWrapper()Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->getEffectMenuContainerId()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mEffectContainerId:I

    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mNavgatorDataMap:Ljava/util/LinkedHashMap;

    if-nez p1, :cond_0

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mNavgatorDataMap:Ljava/util/LinkedHashMap;

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->initNavgatorData()V

    :cond_0
    new-instance p1, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;

    invoke-direct {p1, p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;-><init>(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)V

    iput-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoSaveManager:Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->initListener()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)Lcom/miui/gallery/video/editor/widget/DisplayWrapper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)Lcom/miui/gallery/video/editor/ui/MenuFragment;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentMenuFragment:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoSaveManager:Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mActivity:Landroid/app/Activity;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->isNavEditMenu()Z

    move-result p0

    return p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->onMenuFragCancel()V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->onVideoSaved(Ljava/lang/String;)V

    return-void
.end method

.method private initListener()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    new-instance v1, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$1;-><init>(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->setAudioVoiceListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private initNavgatorData()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mNavgatorDataMap:Ljava/util/LinkedHashMap;

    const/16 v1, 0x10

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/video/editor/model/MenuFragmentData;

    const-class v4, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5, v5, v1}, Lcom/miui/gallery/video/editor/model/MenuFragmentData;-><init>(Ljava/lang/Class;III)V

    invoke-virtual {v0, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mNavgatorDataMap:Ljava/util/LinkedHashMap;

    const/16 v1, 0x11

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/video/editor/model/MenuFragmentData;

    const-class v4, Lcom/miui/gallery/video/editor/ui/SmartEffectFragment;

    const v5, 0x7f07031d

    const v6, 0x7f100745

    invoke-direct {v3, v4, v5, v6, v1}, Lcom/miui/gallery/video/editor/model/MenuFragmentData;-><init>(Ljava/lang/Class;III)V

    invoke-virtual {v0, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mNavgatorDataMap:Ljava/util/LinkedHashMap;

    const/16 v1, 0x12

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/video/editor/model/MenuFragmentData;

    const-class v4, Lcom/miui/gallery/video/editor/ui/TrimFragment;

    const v5, 0x7f070320

    const v6, 0x7f100773

    invoke-direct {v3, v4, v5, v6, v1}, Lcom/miui/gallery/video/editor/model/MenuFragmentData;-><init>(Ljava/lang/Class;III)V

    invoke-virtual {v0, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mNavgatorDataMap:Ljava/util/LinkedHashMap;

    const/16 v1, 0x13

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/video/editor/model/MenuFragmentData;

    const-class v4, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    const v5, 0x7f070319

    const v6, 0x7f100730

    invoke-direct {v3, v4, v5, v6, v1}, Lcom/miui/gallery/video/editor/model/MenuFragmentData;-><init>(Ljava/lang/Class;III)V

    invoke-virtual {v0, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mNavgatorDataMap:Ljava/util/LinkedHashMap;

    const/16 v1, 0x14

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/video/editor/model/MenuFragmentData;

    const-class v4, Lcom/miui/gallery/video/editor/ui/AudioFragment;

    const v5, 0x7f07031b

    const v6, 0x7f10070f

    invoke-direct {v3, v4, v5, v6, v1}, Lcom/miui/gallery/video/editor/model/MenuFragmentData;-><init>(Ljava/lang/Class;III)V

    invoke-virtual {v0, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mNavgatorDataMap:Ljava/util/LinkedHashMap;

    const/16 v1, 0x15

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/video/editor/model/MenuFragmentData;

    const-class v4, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    const v5, 0x7f07031f

    const v6, 0x7f100778

    invoke-direct {v3, v4, v5, v6, v1}, Lcom/miui/gallery/video/editor/model/MenuFragmentData;-><init>(Ljava/lang/Class;III)V

    invoke-virtual {v0, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mNavgatorDataMap:Ljava/util/LinkedHashMap;

    const/16 v1, 0x16

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/video/editor/model/MenuFragmentData;

    const/4 v4, 0x0

    const v5, 0x7f07031a

    const v6, 0x7f10074a

    invoke-direct {v3, v4, v5, v6, v1}, Lcom/miui/gallery/video/editor/model/MenuFragmentData;-><init>(Ljava/lang/Class;III)V

    invoke-virtual {v0, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private isAudioEditMenu()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentEditType:I

    const v1, 0x7f09032c

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isNavEditMenu()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentEditType:I

    const v1, 0x7f090334

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isTrimEditMenu()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentEditType:I

    const v1, 0x7f09033e

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private makeMenuFragmentTag(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v1, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private onMenuFragCancel()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentMenuFragment:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentMenuFragment:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->doCancel()Z

    :cond_0
    return-void
.end method

.method private onVideoSaved(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/provider/GalleryOpenProvider;->translateToContent(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const/4 v1, -0x1

    invoke-virtual {p1, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->setVideoSaving(Z)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->exit()V

    return-void
.end method


# virtual methods
.method public changeEditMenu(Lcom/miui/gallery/video/editor/model/MenuFragmentData;)V
    .locals 5

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/model/MenuFragmentData;->getTag()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/model/MenuFragmentData;->isModuleMore()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/VideoEditor;->toThirdEditor(Landroid/content/Context;)V

    return-void

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragmentManager:Landroid/app/FragmentManager;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mLastTag:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->makeMenuFragmentTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/video/editor/ui/MenuFragment;

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragmentManager:Landroid/app/FragmentManager;

    iget v2, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mEffectContainerId:I

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/video/editor/ui/MenuFragment;

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragmentManager:Landroid/app/FragmentManager;

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->makeMenuFragmentTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/video/editor/ui/MenuFragment;

    if-eqz v2, :cond_3

    invoke-virtual {v2, v1}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v1, 0x0

    :cond_3
    iget-object v3, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragmentManager:Landroid/app/FragmentManager;

    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v3

    if-eqz v2, :cond_4

    invoke-virtual {v3, v2}, Landroid/app/FragmentTransaction;->attach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    iput-object v2, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentMenuFragment:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/model/MenuFragmentData;->getMenu()Ljava/lang/Class;

    move-result-object p1

    if-eqz p1, :cond_5

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/video/editor/ui/MenuFragment;

    iget v2, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mEffectContainerId:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->makeMenuFragmentTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, p1, v4}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentMenuFragment:Lcom/miui/gallery/video/editor/ui/MenuFragment;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const-string v2, "VideoEditorHelper"

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentMenuFragment:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->updateLastFragment(Lcom/miui/gallery/video/editor/ui/MenuFragment;)V

    if-eqz v1, :cond_6

    invoke-virtual {v3, v1}, Landroid/app/FragmentTransaction;->detach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    :cond_6
    invoke-virtual {v3}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    iput-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mLastTag:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentMenuFragment:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->getEffectId()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentEditType:I

    return-void
.end method

.method public getNavigatorData(I)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/video/editor/model/MenuFragmentData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mNavigatorDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mNavgatorDataMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/video/editor/model/MenuFragmentData;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/model/MenuFragmentData;->isNavModule()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/miui/gallery/video/editor/manager/SmartVideoJudgeManager;->isAvailable()Z

    move-result v2

    if-eqz v2, :cond_2

    const/16 v2, 0x78

    if-gt p1, v2, :cond_2

    const/4 v2, 0x1

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    const-string v3, "VideoEditorHelper"

    const-string v4, "smartVideoAvailable: %s"

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget v3, v1, Lcom/miui/gallery/video/editor/model/MenuFragmentData;->module:I

    const/16 v4, 0x11

    if-ne v3, v4, :cond_3

    if-eqz v2, :cond_0

    :cond_3
    iget-object v2, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mNavigatorDataList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mNavigatorDataList:Ljava/util/List;

    return-object p1
.end method

.method public isWaterMarkEditMenu()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentEditType:I

    const v1, 0x7f090341

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onBackPressed()Z
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->isInit()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    return v1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->hasEdit()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->isNavEditMenu()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->onMenuFragCancel()V

    return v1

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragmentManager:Landroid/app/FragmentManager;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    const v3, 0x7f10070c

    invoke-virtual {v0, v3}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    const v4, 0x7f10070b

    invoke-virtual {v0, v4}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    const v5, 0x7f100720

    invoke-virtual {v0, v5}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    const v6, 0x7f10074c

    invoke-virtual {v0, v6}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$3;

    invoke-direct {v7, p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$3;-><init>(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)V

    invoke-static/range {v2 .. v7}, Lcom/miui/gallery/ui/ConfirmDialog;->showConfirmDialog(Landroid/app/FragmentManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V

    goto :goto_0

    :cond_3
    const-string v0, "video_editor"

    const-string v2, "cancel"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->isNavEditMenu()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->exit()V

    goto :goto_0

    :cond_4
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->isTrimEditMenu()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->onMenuFragCancel()V

    goto :goto_0

    :cond_5
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->showNavEditMenu()V

    :goto_0
    return v1
.end method

.method public onCancel()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->onBackPressed()Z

    return-void
.end method

.method public onDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoSaveManager:Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoSaveManager:Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;->onDestroy()V

    :cond_0
    return-void
.end method

.method public onPlayButtonClicked()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentMenuFragment:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentMenuFragment:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->onPlayButtonClicked()V

    :cond_0
    return-void
.end method

.method public onSave()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoSaving:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "VideoEditorHelper"

    const-string v1, "start save video\uff01"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->getData()Landroid/net/Uri;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->setVideoSaving(Z)V

    iget-object v1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/miui/gallery/video/editor/util/FileHelper;->generateOutputFilePath(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$2;

    invoke-direct {v2, p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$2;-><init>(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)V

    iget-object v3, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-virtual {v3}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    invoke-static {v1, v0, v2, v3}, Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog;->startEncode(Lcom/miui/gallery/video/editor/VideoEditor;Ljava/lang/String;Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog$OnCompletedListener;Landroid/app/FragmentManager;)V

    return-void

    :cond_1
    :goto_0
    const-string v0, "VideoEditorHelper"

    const-string v1, "the video is saving:  %s "

    iget-boolean v2, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoSaving:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public onVideoLoadCompleted()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentMenuFragment:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mCurrentMenuFragment:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->onVideoLoadCompleted()V

    :cond_0
    return-void
.end method

.method public setVideoSaving(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoSaving:Z

    return-void
.end method

.method public showNavEditMenu()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mNavgatorDataMap:Ljava/util/LinkedHashMap;

    const/16 v1, 0x10

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/model/MenuFragmentData;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->changeEditMenu(Lcom/miui/gallery/video/editor/model/MenuFragmentData;)V

    return-void
.end method

.method public updateAudioVoiceView(Z)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->isAudioEditMenu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->showAudioVoice(Z)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    xor-int/2addr p1, v1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->setAudioVoiceSelected(Z)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->showAudioVoice(Z)V

    :goto_0
    return-void
.end method

.method public updateAutoTrimView()V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->isTrimEditMenu()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v2}, Lcom/miui/gallery/video/editor/VideoEditor;->isSupportAutoTrim()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->showAutoTrimBtn(Z)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->showAutoTrimBtn(Z)V

    :goto_0
    return-void
.end method

.method public updatePlayView()V
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoSaving:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->showPlayBtn(Z)V

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->isWaterMarkEditMenu()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->showPlayBtn(Z)V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->getState()I

    move-result v0

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq v0, v2, :cond_5

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->isTrimEditMenu()Z

    move-result v2

    if-eqz v2, :cond_4

    const/4 v2, 0x3

    if-eq v0, v2, :cond_3

    const/16 v2, 0xc8

    if-ne v0, v2, :cond_4

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {v0, v3}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->showPlayBtn(Z)V

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->showPlayBtn(Z)V

    goto :goto_1

    :cond_5
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->mDisplayWrapperView:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {v0, v3}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->showPlayBtn(Z)V

    :goto_1
    return-void
.end method
