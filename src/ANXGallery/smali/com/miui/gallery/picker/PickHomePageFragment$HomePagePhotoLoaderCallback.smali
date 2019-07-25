.class Lcom/miui/gallery/picker/PickHomePageFragment$HomePagePhotoLoaderCallback;
.super Ljava/lang/Object;
.source "PickHomePageFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickHomePageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HomePagePhotoLoaderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickHomePageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/picker/PickHomePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickHomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickHomePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/picker/PickHomePageFragment;Lcom/miui/gallery/picker/PickHomePageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickHomePageFragment$HomePagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/picker/PickHomePageFragment;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 3

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickHomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickHomePageFragment;

    iget-object p2, p2, Lcom/miui/gallery/picker/PickHomePageFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    iget-object p2, p0, Lcom/miui/gallery/picker/PickHomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickHomePageFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/picker/PickHomePageFragment;->getUri()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p2, Lcom/miui/gallery/picker/PickerHomePageAdapter;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    const-string p2, "alias_sort_time DESC "

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSortOrder(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/picker/PickHomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickHomePageFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/picker/PickHomePageFragment;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object p2

    invoke-interface {p2}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/picker/helper/Picker$MediaType;->ALL:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    if-eq p2, v0, :cond_0

    const-string p2, "alias_show_in_homepage=1 AND serverType=?"

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p2, "alias_show_in_homepage=1"

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    :goto_0
    iget-object p2, p0, Lcom/miui/gallery/picker/PickHomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickHomePageFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/picker/PickHomePageFragment;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object p2

    invoke-interface {p2}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/picker/helper/Picker$MediaType;->IMAGE:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p2, v0, :cond_1

    new-array p2, v2, [Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, p2, v1

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSelectionArgs([Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/picker/PickHomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickHomePageFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/picker/PickHomePageFragment;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object p2

    invoke-interface {p2}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/picker/helper/Picker$MediaType;->VIDEO:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    if-ne p2, v0, :cond_2

    new-array p2, v2, [Ljava/lang/String;

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, p2, v1

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSelectionArgs([Ljava/lang/String;)V

    :cond_2
    :goto_1
    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/picker/PickHomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickHomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickHomePageFragment;->access$000(Lcom/miui/gallery/picker/PickHomePageFragment;)Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
