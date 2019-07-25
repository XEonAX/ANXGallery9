.class Lcom/miui/gallery/ui/RecommendFacePageFragment$FaceRecommendPhotoLoaderCallback;
.super Ljava/lang/Object;
.source "RecommendFacePageFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/RecommendFacePageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FaceRecommendPhotoLoaderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/RecommendFacePageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/RecommendFacePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment$FaceRecommendPhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecommendFacePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/RecommendFacePageFragment;Lcom/miui/gallery/ui/RecommendFacePageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/RecommendFacePageFragment$FaceRecommendPhotoLoaderCallback;-><init>(Lcom/miui/gallery/ui/RecommendFacePageFragment;)V

    return-void
.end method

.method private getOrderBy()Ljava/lang/String;
    .locals 1

    const-string v0, "dateTaken DESC "

    return-object v0
.end method

.method private getUri()Landroid/net/Uri;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->RECOMMEND_FACES_OF_ONE_PERSON_URI:Landroid/net/Uri;

    return-object v0
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 2

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment$FaceRecommendPhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecommendFacePageFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/RecommendFacePageFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/RecommendFacePageFragment$FaceRecommendPhotoLoaderCallback;->getUri()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p2, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment$FaceRecommendPhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecommendFacePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/RecommendFacePageFragment;->access$100(Lcom/miui/gallery/ui/RecommendFacePageFragment;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, p2, v1

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSelectionArgs([Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/RecommendFacePageFragment$FaceRecommendPhotoLoaderCallback;->getOrderBy()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSortOrder(Ljava/lang/String;)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment$FaceRecommendPhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecommendFacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/RecommendFacePageFragment;->access$200(Lcom/miui/gallery/ui/RecommendFacePageFragment;)Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment$FaceRecommendPhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecommendFacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/RecommendFacePageFragment;->access$300(Lcom/miui/gallery/ui/RecommendFacePageFragment;)Lcom/miui/gallery/widget/PagerGridLayout;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment$FaceRecommendPhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecommendFacePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/RecommendFacePageFragment;->access$200(Lcom/miui/gallery/ui/RecommendFacePageFragment;)Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/PagerGridLayout;->setAdapter(Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
