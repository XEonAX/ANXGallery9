.class public Lcom/miui/gallery/ui/AutoBackupChooserItem;
.super Landroid/widget/RelativeLayout;
.source "AutoBackupChooserItem.java"


# instance fields
.field private mAlbumCover:Landroid/widget/ImageView;

.field private mAlbumName:Landroid/widget/TextView;

.field private mAlbumPhotoCountAndSize:Landroid/widget/TextView;

.field private mCheckBox:Lmiui/widget/SlidingButton;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public bindCheckBox(Landroid/widget/CompoundButton$OnCheckedChangeListener;ZZ)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/AutoBackupChooserItem;->mCheckBox:Lmiui/widget/SlidingButton;

    invoke-virtual {v0, p1}, Lmiui/widget/SlidingButton;->setOnPerformCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AutoBackupChooserItem;->mCheckBox:Lmiui/widget/SlidingButton;

    invoke-virtual {p1, p2}, Lmiui/widget/SlidingButton;->setEnabled(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AutoBackupChooserItem;->mCheckBox:Lmiui/widget/SlidingButton;

    invoke-virtual {p1, p3}, Lmiui/widget/SlidingButton;->setChecked(Z)V

    return-void
.end method

.method public bindCommonInfo(Ljava/lang/String;IJ)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/AutoBackupChooserItem;->mAlbumName:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AutoBackupChooserItem;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AutoBackupChooserItem;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p3, p4}, Lcom/miui/gallery/util/FormatUtil;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p3

    const/4 p4, 0x1

    aput-object p3, v0, p4

    const p3, 0x7f0e0009

    invoke-virtual {p1, p3, p2, v0}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/AutoBackupChooserItem;->mAlbumPhotoCountAndSize:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 6

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    iget-object v3, p0, Lcom/miui/gallery/ui/AutoBackupChooserItem;->mAlbumCover:Landroid/widget/ImageView;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v5, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-object v0, p1

    move-object v1, p2

    move-object v4, p3

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    return-void
.end method

.method public getCheckBoxCheckedState()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/AutoBackupChooserItem;->mCheckBox:Lmiui/widget/SlidingButton;

    invoke-virtual {v0}, Lmiui/widget/SlidingButton;->isChecked()Z

    move-result v0

    return v0
.end method

.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    const v0, 0x7f09003a

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AutoBackupChooserItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/AutoBackupChooserItem;->mAlbumName:Landroid/widget/TextView;

    const v0, 0x7f090041

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AutoBackupChooserItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/AutoBackupChooserItem;->mAlbumPhotoCountAndSize:Landroid/widget/TextView;

    const v0, 0x7f09002b

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AutoBackupChooserItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/ui/AutoBackupChooserItem;->mAlbumCover:Landroid/widget/ImageView;

    const v0, 0x7f09007b

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AutoBackupChooserItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lmiui/widget/SlidingButton;

    iput-object v0, p0, Lcom/miui/gallery/ui/AutoBackupChooserItem;->mCheckBox:Lmiui/widget/SlidingButton;

    return-void
.end method

.method public reverseCheckBoxCheckedState()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/AutoBackupChooserItem;->mCheckBox:Lmiui/widget/SlidingButton;

    iget-object v1, p0, Lcom/miui/gallery/ui/AutoBackupChooserItem;->mCheckBox:Lmiui/widget/SlidingButton;

    invoke-virtual {v1}, Lmiui/widget/SlidingButton;->isChecked()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Lmiui/widget/SlidingButton;->setChecked(Z)V

    return-void
.end method
