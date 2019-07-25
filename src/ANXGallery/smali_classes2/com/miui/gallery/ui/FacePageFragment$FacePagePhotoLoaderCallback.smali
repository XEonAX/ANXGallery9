.class Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;
.super Ljava/lang/Object;
.source "FacePageFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/FacePageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FacePagePhotoLoaderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/FacePageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/FacePageFragment;Lcom/miui/gallery/ui/FacePageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 2

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->ONE_PERSON_URI:Landroid/net/Uri;

    invoke-virtual {p2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p2

    const-string v0, "generate_headers"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p2, Lcom/miui/gallery/adapter/FacePageAdapter;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/FacePageFragment;->access$100(Lcom/miui/gallery/ui/FacePageFragment;)[Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSelectionArgs([Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/FacePageFragment;->access$200(Lcom/miui/gallery/ui/FacePageFragment;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSortOrder(Ljava/lang/String;)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$000(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/adapter/FacePageAdapter;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/FacePageAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$1100(Lcom/miui/gallery/ui/FacePageFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$1200(Lcom/miui/gallery/ui/FacePageFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$1300(Lcom/miui/gallery/ui/FacePageFragment;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$1500(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/FacePageFragment;->access$1400(Lcom/miui/gallery/ui/FacePageFragment;)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->addFooterView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/FacePageFragment;->access$1302(Lcom/miui/gallery/ui/FacePageFragment;Z)Z

    :cond_0
    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
