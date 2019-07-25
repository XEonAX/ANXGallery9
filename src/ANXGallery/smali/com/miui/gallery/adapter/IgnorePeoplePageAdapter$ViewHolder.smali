.class Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;
.super Lcom/miui/gallery/ui/FaceDisplayItemPreferFromThumbnailSource;
.source "IgnorePeoplePageAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewHolder"
.end annotation


# instance fields
.field private mFacePosition:Landroid/graphics/RectF;

.field private mThumbnail:Ljava/lang/String;

.field final synthetic this$0:Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;Landroid/content/Context;Landroid/util/AttributeSet;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;->this$0:Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;

    invoke-direct {p0, p2, p3}, Lcom/miui/gallery/ui/FaceDisplayItemPreferFromThumbnailSource;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p1, 0x7f09010d

    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;->mCover:Landroid/widget/ImageView;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;->mThumbnail:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;->mFacePosition:Landroid/graphics/RectF;

    return-object p0
.end method


# virtual methods
.method public bindData(Landroid/database/Cursor;)V
    .locals 4

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getPeopleLocalId(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getPeopleServerId(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getPeopleName(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;->mCover:Landroid/widget/ImageView;

    new-instance v3, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder$1;

    invoke-direct {v3, p0, v0, v1, p1}, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder$1;-><init>(Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Landroid/graphics/RectF;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    invoke-super/range {p0 .. p5}, Lcom/miui/gallery/ui/FaceDisplayItemPreferFromThumbnailSource;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Landroid/graphics/RectF;Lcom/miui/gallery/sdk/download/DownloadType;)V

    iput-object p1, p0, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;->mThumbnail:Ljava/lang/String;

    iput-object p4, p0, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;->mFacePosition:Landroid/graphics/RectF;

    return-void
.end method
