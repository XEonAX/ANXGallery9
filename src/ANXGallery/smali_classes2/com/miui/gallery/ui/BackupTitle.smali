.class public Lcom/miui/gallery/ui/BackupTitle;
.super Landroid/widget/LinearLayout;
.source "BackupTitle.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/BackupTitle$TitleData;,
        Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;,
        Lcom/miui/gallery/ui/BackupTitle$TitleItemData;,
        Lcom/miui/gallery/ui/BackupTitle$SlimDeviceSpaceListener;,
        Lcom/miui/gallery/ui/BackupTitle$ExpanseCloudSpaceListener;,
        Lcom/miui/gallery/ui/BackupTitle$SetCTAListener;,
        Lcom/miui/gallery/ui/BackupTitle$SetNetworkListener;,
        Lcom/miui/gallery/ui/BackupTitle$OpenSyncSwitchListener;,
        Lcom/miui/gallery/ui/BackupTitle$LoginAccountListener;,
        Lcom/miui/gallery/ui/BackupTitle$ResumeSyncListener;,
        Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;,
        Lcom/miui/gallery/ui/BackupTitle$PauseSyncListener;,
        Lcom/miui/gallery/ui/BackupTitle$StopSyncListener;,
        Lcom/miui/gallery/ui/BackupTitle$BaseClickListener;,
        Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;
    }
.end annotation


# instance fields
.field private mCurSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

.field private mCurSyncType:Lcom/miui/gallery/cloud/base/SyncType;

.field private mDirtyContainer:Landroid/view/View;

.field private mDirtyCountText:Landroid/widget/TextView;

.field private mItemsContainer:Landroid/view/ViewGroup;

.field private mMenuItemClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

.field private mMenuItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;",
            ">;"
        }
    .end annotation
.end field

.field private mSyncingIconAnim:Landroid/view/animation/Animation;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BackupTitle;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/ui/BackupTitle;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lcom/miui/gallery/ui/BackupTitle$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/BackupTitle$1;-><init>(Lcom/miui/gallery/ui/BackupTitle;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/BackupTitle;->mMenuItemClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    sget-object p1, Lcom/miui/gallery/cloud/base/SyncType;->UNKNOW:Lcom/miui/gallery/cloud/base/SyncType;

    iput-object p1, p0, Lcom/miui/gallery/ui/BackupTitle;->mCurSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    sget-object p1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->UNAVAILABLE:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    iput-object p1, p0, Lcom/miui/gallery/ui/BackupTitle;->mCurSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/BackupTitle;I)Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BackupTitle;->findPauseItem(I)Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/ui/BackupTitle;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BackupTitle;->tryStatSyncStateCorrect(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/cloud/base/SyncType;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BackupTitle;->requestSync(Lcom/miui/gallery/cloud/base/SyncType;)V

    return-void
.end method

.method private addDirtyItem(Lcom/miui/gallery/ui/BackupTitle$TitleData;Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V
    .locals 3

    sget-object v0, Lcom/miui/gallery/ui/BackupTitle$2;->$SwitchMap$com$miui$gallery$cloud$syncstate$SyncStatus:[I

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getDirtyCount()[I

    move-result-object p2

    aget v0, p2, v1

    iput v0, p1, Lcom/miui/gallery/ui/BackupTitle$TitleData;->mDirtyPhoto:I

    const/4 v0, 0x1

    aget v2, p2, v0

    iput v2, p1, Lcom/miui/gallery/ui/BackupTitle$TitleData;->mDirtyVideo:I

    aget v2, p2, v1

    aget p2, p2, v0

    add-int/2addr v2, p2

    if-lez v2, :cond_0

    goto :goto_0

    :pswitch_0
    iput-boolean v1, p1, Lcom/miui/gallery/ui/BackupTitle$TitleData;->mShowDirty:Z

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p1, Lcom/miui/gallery/ui/BackupTitle$TitleData;->mShowDirty:Z

    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private addOperationItem(Lcom/miui/gallery/ui/BackupTitle$TitleData;Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V
    .locals 0

    return-void
.end method

.method private addSyncItem(Lcom/miui/gallery/ui/BackupTitle$TitleData;Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V
    .locals 13

    new-instance v0, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/ui/BackupTitle$1;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getDirtyCount()[I

    move-result-object v2

    const/4 v3, 0x0

    aget v4, v2, v3

    const/4 v5, 0x1

    aget v2, v2, v5

    add-int/2addr v4, v2

    const-string v2, "BackupTitle"

    const-string v6, "refresh status: %s"

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object v7

    invoke-static {v2, v6, v7}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object v2

    sget-object v6, Lcom/miui/gallery/ui/BackupTitle$2;->$SwitchMap$com$miui$gallery$cloud$syncstate$SyncStatus:[I

    invoke-virtual {v2}, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->ordinal()I

    move-result v7

    aget v6, v6, v7

    const v7, 0x7f07003c

    const v8, 0x7f070040

    const/4 v9, 0x2

    const v10, 0x7f07003d

    const v11, 0x7f10009f

    const v12, 0x7f0701a7

    packed-switch v6, :pswitch_data_0

    goto/16 :goto_2

    :pswitch_0
    invoke-virtual {v0, v10}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setIconRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v6

    const v7, 0x7f0e000e

    new-array v8, v5, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v3

    invoke-virtual {v1, v7, v4, v8}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v4

    const v6, 0x7f10009e

    new-array v7, v9, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getMaxImageSizeLimit()J

    move-result-wide v9

    invoke-static {v8, v9, v10}, Lcom/miui/gallery/util/FileSizeFormatter;->formatShortFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getMaxVideoSizeLimit()J

    move-result-wide v8

    invoke-static {v3, v8, v9}, Lcom/miui/gallery/util/FileSizeFormatter;->formatShortFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v7, v5

    invoke-virtual {v1, v6, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setDesc(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    goto/16 :goto_2

    :pswitch_1
    const v4, 0x7f070039

    invoke-virtual {v0, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setIconRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v4

    const v6, 0x7f100093

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v4

    const v6, 0x7f100092

    new-array v7, v9, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getCloudSpaceTotalSize()J

    move-result-wide v9

    invoke-static {v8, v9, v10}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getQuantityStringWithUnit(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getCloudSpaceRemainingSize()J

    move-result-wide v8

    invoke-static {v3, v8, v9}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getQuantityStringWithUnit(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v7, v5

    invoke-virtual {v1, v6, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setDesc(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f100091

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnTxt(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-virtual {v1, v12}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnBgRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/BackupTitle;->genClickListener(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getCloudSpaceTotalSize()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-lez v1, :cond_7

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getCloudSpaceRemainingSize()J

    move-result-wide v3

    long-to-float v1, v3

    const/high16 v3, 0x3f800000    # 1.0f

    mul-float v1, v1, v3

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getCloudSpaceTotalSize()J

    move-result-wide v4

    long-to-float v4, v4

    div-float/2addr v1, v4

    sub-float/2addr v3, v1

    invoke-virtual {v0, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setProgress(F)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    goto/16 :goto_2

    :pswitch_2
    const v3, 0x7f07003b

    invoke-virtual {v0, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setIconRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f10009b

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f10009a

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setDesc(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f100099

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnTxt(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-virtual {v1, v12}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnBgRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/BackupTitle;->genClickListener(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    goto/16 :goto_2

    :pswitch_3
    const v3, 0x7f070038

    invoke-virtual {v0, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setIconRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f10008f

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f10008e

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setDesc(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    invoke-virtual {v1, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnTxt(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-virtual {v1, v12}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnBgRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/BackupTitle;->genClickListener(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    goto/16 :goto_2

    :pswitch_4
    invoke-virtual {v0, v7}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setIconRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000a7

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000a6

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setDesc(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000a5

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnTxt(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-virtual {v1, v12}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnBgRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/BackupTitle;->genClickListener(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    goto/16 :goto_2

    :pswitch_5
    invoke-virtual {v0, v7}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setIconRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000a4

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000a3

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setDesc(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000a2

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnTxt(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-virtual {v1, v12}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnBgRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/BackupTitle;->genClickListener(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    goto/16 :goto_2

    :pswitch_6
    const v3, 0x7f07003a

    invoke-virtual {v0, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setIconRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f100096

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f100095

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setDesc(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f100094

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnTxt(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-virtual {v1, v12}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnBgRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/BackupTitle;->genClickListener(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    goto/16 :goto_2

    :pswitch_7
    const v3, 0x7f07003e

    invoke-virtual {v0, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setIconRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000b7

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000b6

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setDesc(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000b5

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnTxt(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-virtual {v1, v12}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnBgRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/BackupTitle;->genClickListener(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    goto/16 :goto_2

    :pswitch_8
    invoke-virtual {v0, v10}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setIconRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000a1

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000a0

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setDesc(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    invoke-virtual {v1, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnTxt(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-virtual {v1, v12}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnBgRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/BackupTitle;->genClickListener(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    goto/16 :goto_2

    :pswitch_9
    invoke-virtual {v0, v10}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setIconRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000b4

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000b3

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setDesc(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000b2

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnTxt(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-virtual {v1, v12}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnBgRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v1

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/BackupTitle;->genClickListener(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    goto/16 :goto_2

    :pswitch_a
    invoke-virtual {v0, v8}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setIconRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v6

    const v7, 0x7f0e000f

    new-array v8, v5, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v3

    invoke-virtual {v1, v7, v4, v8}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setDesc(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v4

    invoke-virtual {v1, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnTxt(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v4

    invoke-virtual {v4, v12}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnBgRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v4

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/BackupTitle;->genClickListener(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Landroid/view/View$OnClickListener;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    const v4, 0x7f1000ac

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {p2, v6}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getResumeInterval(Landroid/content/Context;)J

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/miui/gallery/util/FormatUtil;->formatHourMinutes(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-virtual {v1, v4, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    goto/16 :goto_2

    :pswitch_b
    const v3, 0x7f07003f

    invoke-virtual {v0, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setIconRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000bc

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v3

    const v4, 0x7f1000bb

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setDesc(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    goto/16 :goto_2

    :pswitch_c
    const v6, 0x7f1000ad

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    invoke-virtual {v1, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnTxt(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    :pswitch_d
    if-nez v4, :cond_0

    const v6, 0x7f1006cb

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    :cond_0
    :pswitch_e
    invoke-virtual {v0, v8}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setIconRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    move-result-object v6

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/BackupTitle;->genClickListener(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Landroid/view/View$OnClickListener;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v6

    sget-object v7, Lcom/miui/gallery/cloud/base/SyncType;->GPRS_FORCE:Lcom/miui/gallery/cloud/base/SyncType;

    if-ne v6, v7, :cond_2

    iget-object v7, v0, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mTitle:Ljava/lang/CharSequence;

    if-nez v7, :cond_1

    const v7, 0x7f1000bd

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    :cond_1
    if-lez v4, :cond_4

    const v7, 0x7f0e0010

    new-array v8, v9, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getDirtySize()J

    move-result-wide v9

    invoke-static {v3, v9, v10}, Lcom/miui/gallery/util/FormatUtil;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v8, v5

    invoke-virtual {v1, v7, v4, v8}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setDesc(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    goto :goto_0

    :cond_2
    iget-object v7, v0, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mTitle:Ljava/lang/CharSequence;

    if-nez v7, :cond_3

    const v7, 0x7f1000be

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    :cond_3
    if-lez v4, :cond_4

    const v7, 0x7f0e0011

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v3

    invoke-virtual {v1, v7, v4, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setDesc(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    :cond_4
    :goto_0
    iget-object v3, v0, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mBtnTxt:Ljava/lang/CharSequence;

    if-nez v3, :cond_6

    invoke-virtual {v6}, Lcom/miui/gallery/cloud/base/SyncType;->isForce()Z

    move-result v3

    if-eqz v3, :cond_5

    const v3, 0x7f1000ae

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnTxt(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    goto :goto_1

    :cond_5
    const v3, 0x7f1000ab

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnTxt(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    :cond_6
    :goto_1
    invoke-virtual {v0, v12}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setBtnBgRes(I)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNC_PENDING:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-eq v2, v1, :cond_7

    invoke-direct {p0}, Lcom/miui/gallery/ui/BackupTitle;->getSyncingAnim()Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->setIconAnim(Landroid/view/animation/Animation;)Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    :cond_7
    :goto_2
    sget-object v1, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->UNAVAILABLE:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-eq v2, v1, :cond_8

    iget-object p1, p1, Lcom/miui/gallery/ui/BackupTitle$TitleData;->mItems:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_8
    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/BackupTitle;->tryStatSyncStateError(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_c
        :pswitch_e
        :pswitch_d
        :pswitch_d
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_7
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

.method private findPauseItem(I)Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mMenuItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;

    invoke-static {v1}, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;->access$000(Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;)I

    move-result v2

    if-ne v2, p1, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private genClickListener(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Landroid/view/View$OnClickListener;
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/ui/BackupTitle$2;->$SwitchMap$com$miui$gallery$cloud$syncstate$SyncStatus:[I

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->ordinal()I

    move-result v0

    aget v0, v1, v0

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    return-object v1

    :pswitch_1
    new-instance p1, Lcom/miui/gallery/ui/BackupTitle$ExpanseCloudSpaceListener;

    invoke-direct {p1, p0, v1}, Lcom/miui/gallery/ui/BackupTitle$ExpanseCloudSpaceListener;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/ui/BackupTitle$1;)V

    return-object p1

    :pswitch_2
    new-instance p1, Lcom/miui/gallery/ui/BackupTitle$SlimDeviceSpaceListener;

    invoke-direct {p1, p0, v1}, Lcom/miui/gallery/ui/BackupTitle$SlimDeviceSpaceListener;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/ui/BackupTitle$1;)V

    return-object p1

    :pswitch_3
    new-instance p1, Lcom/miui/gallery/ui/BackupTitle$SetNetworkListener;

    invoke-direct {p1, p0, v1}, Lcom/miui/gallery/ui/BackupTitle$SetNetworkListener;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/ui/BackupTitle$1;)V

    return-object p1

    :pswitch_4
    new-instance p1, Lcom/miui/gallery/ui/BackupTitle$SetCTAListener;

    invoke-direct {p1, p0, v1}, Lcom/miui/gallery/ui/BackupTitle$SetCTAListener;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/ui/BackupTitle$1;)V

    return-object p1

    :pswitch_5
    new-instance p1, Lcom/miui/gallery/ui/BackupTitle$OpenSyncSwitchListener;

    invoke-direct {p1, p0, v1}, Lcom/miui/gallery/ui/BackupTitle$OpenSyncSwitchListener;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/ui/BackupTitle$1;)V

    return-object p1

    :pswitch_6
    new-instance p1, Lcom/miui/gallery/ui/BackupTitle$LoginAccountListener;

    invoke-direct {p1, p0, v1}, Lcom/miui/gallery/ui/BackupTitle$LoginAccountListener;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/ui/BackupTitle$1;)V

    return-object p1

    :pswitch_7
    new-instance v0, Lcom/miui/gallery/ui/BackupTitle$ResumeSyncListener;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BackupTitle;->getImmediateSyncType(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/ui/BackupTitle$ResumeSyncListener;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/cloud/base/SyncType;)V

    return-object v0

    :pswitch_8
    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncType;->isForce()Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Lcom/miui/gallery/ui/BackupTitle$StopSyncListener;

    invoke-direct {p1, p0, v1}, Lcom/miui/gallery/ui/BackupTitle$StopSyncListener;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/ui/BackupTitle$1;)V

    return-object p1

    :cond_0
    new-instance p1, Lcom/miui/gallery/ui/BackupTitle$PauseSyncListener;

    invoke-direct {p1, p0, v1}, Lcom/miui/gallery/ui/BackupTitle$PauseSyncListener;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/ui/BackupTitle$1;)V

    return-object p1

    :pswitch_9
    new-instance v0, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BackupTitle;->getImmediateSyncType(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/ui/BackupTitle$SyncImmediateListener;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/cloud/base/SyncType;)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_8
        :pswitch_9
        :pswitch_0
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_9
        :pswitch_9
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private genTitleData(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Lcom/miui/gallery/ui/BackupTitle$TitleData;
    .locals 2

    new-instance v0, Lcom/miui/gallery/ui/BackupTitle$TitleData;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleData;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/ui/BackupTitle$1;)V

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/ui/BackupTitle;->addSyncItem(Lcom/miui/gallery/ui/BackupTitle$TitleData;Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/ui/BackupTitle;->addOperationItem(Lcom/miui/gallery/ui/BackupTitle$TitleData;Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/ui/BackupTitle;->addDirtyItem(Lcom/miui/gallery/ui/BackupTitle$TitleData;Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V

    return-object v0
.end method

.method private getImmediateSyncType(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Lcom/miui/gallery/cloud/base/SyncType;
    .locals 1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->NO_WIFI:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-ne p1, v0, :cond_0

    sget-object p1, Lcom/miui/gallery/cloud/base/SyncType;->GPRS_FORCE:Lcom/miui/gallery/cloud/base/SyncType;

    return-object p1

    :cond_0
    sget-object p1, Lcom/miui/gallery/cloud/base/SyncType;->POWER_FORCE:Lcom/miui/gallery/cloud/base/SyncType;

    return-object p1
.end method

.method private getPauseMenuItems()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mMenuItems:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mMenuItems:Ljava/util/List;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020004

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    aget v4, v0, v3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0e000d

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v2

    invoke-virtual {v5, v6, v4, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/miui/gallery/ui/BackupTitle;->mMenuItems:Ljava/util/List;

    new-instance v7, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;

    invoke-direct {v7, p0, v5, v4}, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;-><init>(Lcom/miui/gallery/ui/BackupTitle;Ljava/lang/String;I)V

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mMenuItems:Ljava/util/List;

    return-object v0
.end method

.method private getSyncingAnim()Landroid/view/animation/Animation;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mSyncingIconAnim:Landroid/view/animation/Animation;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f01000e

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mSyncingIconAnim:Landroid/view/animation/Animation;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mSyncingIconAnim:Landroid/view/animation/Animation;

    return-object v0
.end method

.method private getView(Lcom/miui/gallery/ui/BackupTitle$TitleItemData;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    const/4 v0, 0x0

    if-nez p2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v1, 0x7f0b0032

    invoke-virtual {p2, v1, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;

    const/4 v1, 0x0

    invoke-direct {p3, p0, v1}, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;-><init>(Lcom/miui/gallery/ui/BackupTitle;Lcom/miui/gallery/ui/BackupTitle$1;)V

    const v1, 0x7f09016a

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mIcon:Landroid/widget/ImageView;

    const v1, 0x7f090232

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/widget/ColorRingProgress;

    iput-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mProgress:Lcom/miui/gallery/widget/ColorRingProgress;

    const v1, 0x7f0902fa

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mTitle:Landroid/widget/TextView;

    const v1, 0x7f0902c3

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mDesc:Landroid/widget/TextView;

    const v1, 0x7f0902de

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mTextContainer:Landroid/view/View;

    const v1, 0x7f09006c

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mBtn:Landroid/widget/TextView;

    invoke-virtual {p2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;

    iget-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mIcon:Landroid/widget/ImageView;

    iget v2, p1, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mIconRes:I

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mTitle:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mTextContainer:Landroid/view/View;

    iget-object v2, p1, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mTitleClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p1, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mTitleClickListener:Landroid/view/View$OnClickListener;

    if-eqz v1, :cond_1

    iget-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mTitle:Landroid/widget/TextView;

    const v2, 0x7f070041

    invoke-virtual {v1, v0, v0, v2, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    goto :goto_0

    :cond_1
    iget-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    :goto_0
    iget-object v1, p1, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mDesc:Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/16 v2, 0x8

    if-eqz v1, :cond_2

    iget-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mDesc:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    :cond_2
    iget-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mDesc:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mDesc:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mDesc:Ljava/lang/CharSequence;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_1
    iget-object v1, p1, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mBtnTxt:Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mBtn:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2

    :cond_3
    iget-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mBtn:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mBtn:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mBtnTxt:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mBtn:Landroid/widget/TextView;

    iget v2, p1, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mBtnBgRes:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackgroundResource(I)V

    iget-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mBtn:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mBtnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_2
    iget v1, p1, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mProgress:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_4

    iget-object v1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mProgress:Lcom/miui/gallery/widget/ColorRingProgress;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/widget/ColorRingProgress;->setVisibility(I)V

    iget-object v0, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mProgress:Lcom/miui/gallery/widget/ColorRingProgress;

    iget v1, p1, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mProgress:F

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/ColorRingProgress;->setProgress(F)V

    goto :goto_3

    :cond_4
    iget-object v0, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mProgress:Lcom/miui/gallery/widget/ColorRingProgress;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/ColorRingProgress;->setVisibility(I)V

    :goto_3
    iget-object v0, p1, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mIconAnim:Landroid/view/animation/Animation;

    if-eqz v0, :cond_6

    iget-object v0, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mIcon:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroid/view/animation/Animation;->hasStarted()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual {v0}, Landroid/view/animation/Animation;->hasEnded()Z

    move-result v0

    if-eqz v0, :cond_7

    :cond_5
    const-string v0, "BackupTitle"

    const-string v1, "startAnimation"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p3, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mIcon:Landroid/widget/ImageView;

    iget-object p1, p1, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;->mIconAnim:Landroid/view/animation/Animation;

    invoke-virtual {p3, p1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_4

    :cond_6
    iget-object p1, p3, Lcom/miui/gallery/ui/BackupTitle$TitleItemViewHolder;->mIcon:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->clearAnimation()V

    const-string p1, "BackupTitle"

    const-string p3, "clearAnimation"

    invoke-static {p1, p3}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    :goto_4
    return-object p2
.end method

.method private isNormalSyncStatus(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNC_PENDING:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-eq p1, v0, :cond_1

    sget-object v0, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNCING:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-eq p1, v0, :cond_1

    sget-object v0, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNCING_METADATA:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-eq p1, v0, :cond_1

    sget-object v0, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNC_META_PENDING:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-eq p1, v0, :cond_1

    sget-object v0, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->SYNCED:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private requestSync(Lcom/miui/gallery/cloud/base/SyncType;)V
    .locals 2

    new-instance v0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setDelayUpload(Z)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setManual(Z)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    return-void
.end method

.method private tryStatSyncStateCorrect(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mCurSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mCurSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mCurSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/BackupTitle;->isNormalSyncStatus(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "error_correct"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/miui/gallery/ui/BackupTitle;->mCurSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {v3}, Lcom/miui/gallery/cloud/base/SyncType;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/miui/gallery/ui/BackupTitle;->mCurSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    invoke-virtual {v3}, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "Sync"

    const-string v1, "sync_state_error_correct"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    return-void
.end method

.method private tryStatSyncStateError(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V
    .locals 5

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncStatus()Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/BackupTitle;->isNormalSyncStatus(Lcom/miui/gallery/cloud/syncstate/SyncStatus;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/BackupTitle;->mCurSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v2

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/BackupTitle;->mCurSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    if-eq v1, v0, :cond_1

    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "error_state"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miui/gallery/cloud/base/SyncType;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStatus;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "Sync"

    const-string v3, "sync_state_error"

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/BackupTitle;->mCurSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    iput-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mCurSyncStatus:Lcom/miui/gallery/cloud/syncstate/SyncStatus;

    return-void
.end method


# virtual methods
.method protected onCreateContextMenu(Landroid/view/ContextMenu;)V
    .locals 5

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onCreateContextMenu(Landroid/view/ContextMenu;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/BackupTitle;->getPauseMenuItems()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;

    invoke-static {v3}, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;->access$000(Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;)I

    move-result v4

    invoke-static {v3}, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;->access$300(Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v1, v4, v2, v3}, Landroid/view/ContextMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/ui/BackupTitle;->mMenuItemClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    const v0, 0x7f090185

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/BackupTitle;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mItemsContainer:Landroid/view/ViewGroup;

    const v0, 0x7f0900d6

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/BackupTitle;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mDirtyContainer:Landroid/view/View;

    const v0, 0x7f0900d7

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/BackupTitle;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mDirtyCountText:Landroid/widget/TextView;

    return-void
.end method

.method public refreshSyncState(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V
    .locals 8

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BackupTitle;->genTitleData(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)Lcom/miui/gallery/ui/BackupTitle$TitleData;

    move-result-object p1

    iget-object v0, p1, Lcom/miui/gallery/ui/BackupTitle$TitleData;->mItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/BackupTitle;->mItemsContainer:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    move v2, v0

    :goto_0
    if-ge v2, v1, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/ui/BackupTitle;->mItemsContainer:Landroid/view/ViewGroup;

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->removeViewAt(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v0, :cond_2

    iget-object v3, p0, Lcom/miui/gallery/ui/BackupTitle;->mItemsContainer:Landroid/view/ViewGroup;

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    iget-object v4, p1, Lcom/miui/gallery/ui/BackupTitle$TitleData;->mItems:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/ui/BackupTitle$TitleItemData;

    iget-object v5, p0, Lcom/miui/gallery/ui/BackupTitle;->mItemsContainer:Landroid/view/ViewGroup;

    invoke-direct {p0, v4, v3, v5}, Lcom/miui/gallery/ui/BackupTitle;->getView(Lcom/miui/gallery/ui/BackupTitle$TitleItemData;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    if-eq v4, v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/ui/BackupTitle;->mItemsContainer:Landroid/view/ViewGroup;

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    iget-boolean v0, p1, Lcom/miui/gallery/ui/BackupTitle$TitleData;->mShowDirty:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mDirtyContainer:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupTitle;->mDirtyCountText:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupTitle;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f10009c

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    const-string v6, "%d"

    new-array v4, v4, [Ljava/lang/Object;

    iget v7, p1, Lcom/miui/gallery/ui/BackupTitle$TitleData;->mDirtyPhoto:I

    iget p1, p1, Lcom/miui/gallery/ui/BackupTitle$TitleData;->mDirtyVideo:I

    add-int/2addr v7, p1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v1

    invoke-static {v6, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v5, v1

    invoke-virtual {v2, v3, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/ui/BackupTitle;->mDirtyContainer:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_2
    return-void
.end method
