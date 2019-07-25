.class Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;
.super Ljava/lang/Object;
.source "IgnorePeoplePageFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/IgnorePeoplePageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IgnorePeoplePageLoaderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;-><init>(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 0

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->IGNORE_PERSONS_URI:Landroid/net/Uri;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p2, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 1

    check-cast p2, Landroid/database/Cursor;

    if-eqz p2, :cond_0

    invoke-interface {p2}, Landroid/database/Cursor;->getCount()I

    move-result p1

    if-nez p1, :cond_2

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->access$800(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    iget-object v0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->access$900(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)Landroid/view/ViewStub;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->access$802(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Landroid/view/View;)Landroid/view/View;

    iget-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->access$800(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f090054

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->access$800(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0900ae

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const v0, 0x7f1004bc

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->access$1000(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)Landroid/widget/GridView;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->access$800(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/GridView;->setEmptyView(Landroid/view/View;)V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;->this$0:Lcom/miui/gallery/ui/IgnorePeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->access$1100(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
