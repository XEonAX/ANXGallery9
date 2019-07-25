.class Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;
.super Landroid/widget/CursorAdapter;
.source "InputFaceNameFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MergeNameAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field private CONTECT_HEADER_VIEW:I

.field private NORMAL_VIEW:I

.field private mContactsInfo:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;

.field private mInflater:Landroid/view/LayoutInflater;

.field final synthetic this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;Landroid/content/Context;)V
    .locals 3

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Landroid/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;)V

    const/4 v1, 0x0

    iput v1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->CONTECT_HEADER_VIEW:I

    const/4 v1, 0x1

    iput v1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->NORMAL_VIEW:I

    iput-object v0, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->mInflater:Landroid/view/LayoutInflater;

    new-instance v1, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;

    iget-object v2, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-direct {v1, v2, v0}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;-><init>(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$1;)V

    iput-object v1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->mContactsInfo:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->mInflater:Landroid/view/LayoutInflater;

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$1000(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;)Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo;->access$900(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$GetContactsInfo;)V

    return-void
.end method

.method private bindHeaderView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 0

    const p2, 0x7f0900e3

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$1300(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {p2, p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$2300(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;Landroid/view/View;)V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {p2, p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$2400(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;Landroid/view/View;)V

    :goto_0
    return-void
.end method

.method private getItemViewTypeByCursor(Landroid/database/Cursor;)I
    .locals 1

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->getPhoneNumber(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "contact"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->CONTECT_HEADER_VIEW:I

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->NORMAL_VIEW:I

    :goto_0
    return p1
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 6

    const v0, 0x7f0902d5

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->CONTECT_HEADER_VIEW:I

    if-ne v0, v1, :cond_0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->bindHeaderView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V

    return-void

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->mContactsInfo:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;

    sget-object v0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$Phone;->CONTACT_ID:Ljava/lang/String;

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;->_id:Ljava/lang/String;

    iget-object p2, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->mContactsInfo:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;

    invoke-static {p3}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->getPhoneNumber(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;->phoneNumber:Ljava/lang/String;

    iget-object p2, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->mContactsInfo:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;

    sget-object v0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$Phone;->DISPLAY_NAME:Ljava/lang/String;

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;->displayName:Ljava/lang/String;

    iget-object p2, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->mContactsInfo:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;

    invoke-static {p3}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->getCoverPath(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;->coverPath:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter$ViewHolder;

    if-nez p2, :cond_1

    new-instance p2, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter$ViewHolder;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter$ViewHolder;-><init>(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$1;)V

    const v0, 0x7f0901ea

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p2, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter$ViewHolder;->name:Landroid/widget/TextView;

    const v0, 0x7f09013a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p2, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter$ViewHolder;->avartarImageView:Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    :cond_1
    const v0, 0x7f0901ad

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result p3

    if-nez p3, :cond_2

    iget-object p3, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {p3, p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$2300(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;Landroid/view/View;)V

    goto :goto_0

    :cond_2
    iget-object p3, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {p3, p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$2400(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;Landroid/view/View;)V

    :goto_0
    iget-object p1, p2, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter$ViewHolder;->name:Landroid/widget/TextView;

    iget-object p3, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->mContactsInfo:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;

    iget-object p3, p3, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;->displayName:Ljava/lang/String;

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->mContactsInfo:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;

    iget-object p1, p1, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;->phoneNumber:Ljava/lang/String;

    const-string p3, "face"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    iget-object p3, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->mContactsInfo:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;

    iget-object p3, p3, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;->displayName:Ljava/lang/String;

    invoke-static {p1, p3}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$2500(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;Ljava/lang/String;)Lcom/miui/gallery/model/DisplayFolderItem;

    move-result-object p1

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    sget-object p3, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    iget-object v1, p1, Lcom/miui/gallery/model/DisplayFolderItem;->thumbnailPath:Ljava/lang/String;

    invoke-virtual {p3, v1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p2, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter$ViewHolder;->avartarImageView:Landroid/widget/ImageView;

    sget-object v3, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->sDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    const/4 v4, 0x0

    check-cast p1, Lcom/miui/gallery/ui/renameface/FaceDisplayFolderItem;

    iget-object v5, p1, Lcom/miui/gallery/ui/renameface/FaceDisplayFolderItem;->mFacePosRelative:Landroid/graphics/RectF;

    invoke-virtual/range {v0 .. v5}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;)V

    goto :goto_1

    :cond_3
    iget-object p1, p2, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter$ViewHolder;->avartarImageView:Landroid/widget/ImageView;

    const p3, 0x7f0700d7

    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->mContactsInfo:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;

    iget-object p1, p1, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;->coverPath:Ljava/lang/String;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$2600(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object p3, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->mContactsInfo:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;

    iget-object p3, p3, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$ContactsInfo;->coverPath:Ljava/lang/String;

    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    invoke-static {p1, p3}, Lcom/miui/gallery/util/BitmapUtils;->safeDecodeBitmap(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_4

    iget-object p2, p2, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter$ViewHolder;->avartarImageView:Landroid/widget/ImageView;

    new-instance p3, Lcom/nostra13/universalimageloader/core/display/CircleBitmapDisplayer$CircleDrawable;

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0500b1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060278

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    int-to-float v1, v1

    invoke-direct {p3, p1, v0, v1}, Lcom/nostra13/universalimageloader/core/display/CircleBitmapDisplayer$CircleDrawable;-><init>(Landroid/graphics/Bitmap;Ljava/lang/Integer;F)V

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_4
    :goto_1
    return-void
.end method

.method public getItemViewType(I)I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->getItemViewTypeByCursor(Landroid/database/Cursor;)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public getViewTypeCount()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->getItemViewTypeByCursor(Landroid/database/Cursor;)I

    move-result p1

    iget p2, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->CONTECT_HEADER_VIEW:I

    const v0, 0x7f0902d5

    const/4 v1, 0x0

    if-ne p1, p2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->mInflater:Landroid/view/LayoutInflater;

    const p2, 0x7f0b009f

    invoke-virtual {p1, p2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iget p2, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->CONTECT_HEADER_VIEW:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->mInflater:Landroid/view/LayoutInflater;

    const p2, 0x7f0b00a1

    invoke-virtual {p1, p2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iget p2, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$MergeNameAdapter;->NORMAL_VIEW:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :goto_0
    return-object p1
.end method
